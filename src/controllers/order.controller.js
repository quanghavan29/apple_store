const session = require('express-session');
const Order = require('../model/order.model');
const Item = require('../model/item.model');
const validation = require('../validation/validation');
const User = require('../model/user.model');

exports.get = async function (req, res) {
    let userSession = session.userSession;
    let orders = await Order.getAllByUser(userSession.email);

    for (order of orders) {
        order.total_amount = validation.formatPrice(order.total_amount);
        order.order_date = validation.formatDate(order.order_date);
        order.isPending = order.status === 'pending';
        order.isSuccess = order.status === 'success';
        let dataRow = await Item.countItemIOrder(order.order_id);
        order.totalItem = dataRow;
        order.isOnlyOneItem = order.totalItem === 1;
    }

    res.render('order', {
        layout: false,
        orders: orders,
        userSession: userSession,
    });
};

exports.post = async function (req, res) {

    const user = {
        "full_name": req.body.full_name,
        "email": req.body.email,
        "phone": req.body.phone,
        "address": req.body.address,
    }

    const dataRow = await User.getUserByEmail(user.email);
    let UserByEmail = dataRow[0];
    if (!UserByEmail) {
        //if email does not exist => add new user
        await User.addNewUser(user);
    }

    let cart_list = req.session.cart_list || [];
    let total_amount_ordered = 0;
    cart_list.forEach(item => {
        total_amount_ordered += Math.ceil(((item.price * item.order_quantity) - (item.price * item.order_quantity * item.sale / 100)));
    });
    //get current date
    let today = new Date();
    // add order
    let order = {
        "order_date": today,
        "status": 'pending',
        "total_amount": total_amount_ordered,
        "email": user.email,
        "address": user.address,
        "phone": user.phone,
        "full_name": user.full_name,
    }
    await Order.add(order);
    // get order id of last inserted
    let orderId = await Order.getOrderIdLastInserted();

    // add item in order
    cart_list.forEach(item => {
        let newItem = {
            "product_detail_id": item.product_detail_id,
            "quantity": item.order_quantity,
            "order_id": orderId,
        }
        Item.add(newItem);
    });
    req.session.cart_list = null;
    session.userSession = user;
    res.redirect('order');
}