const session = require('express-session');

// add product to cart 
exports.cart = async function (req, res) {
    let cart_list = req.session.cart_list || [];
    res.render('cart', {
        layout: false,
        cartEmpty: cart_list.length === 0,
    });
}

exports.addToCart = async function (req, res) {
    let cart_list = req.session.cart_list || [];
    let item = req.body;

    cart_list = [1, 2];
    req.session.cart_list = cart_list;

    res.render('cart', {
        layout: false,
        cart_list: cart_list,
        cartEmpty: cart_list.length === 0,
    });
}