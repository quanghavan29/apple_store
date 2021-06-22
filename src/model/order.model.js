const dbconfig = require('../dbconfig/db.config');
// add ordered
exports.add = async function(order) {
    return await dbconfig.add('ordered', order);
}

// get order id of last inserted
exports.getOrderIdLastInserted  = async function() {
    const result = await dbconfig.select('SELECT order_id as order_id FROM ordered ' +
            'order by order_id desc LIMIT 1 ');
    return result[0].order_id;
}

// get all ordered by user
exports.getAllByUser = async function(phone) {
    return await dbconfig.select('SELECT distinct * FROM ordered o ' +
        'join item i on o.order_id = i.order_id ' +
        'join users u on u.user_id = o.user_id ' +
        'join product_detail pd on i.product_detail_id = pd.product_detail_id ' +
        'join product p on p.product_id = pd.product_id ' +
        'where phone = \'' + phone + '\' ' +
        'group by o.order_id');
}