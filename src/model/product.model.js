const dbconfig = require('../dbconfig/db.config');

exports.findAll = async function() {
    return await dbconfig.select('SELECT distinct * FROM product p ' +
    'join product_detail pd on p.product_id = pd.product_id ' +
    'join specifications spec on pd.specifications_id = spec.specifications_id ' +
    'group by p.product_id');
}

exports.count = async function() {
    const result = await dbconfig.select('SELECT COUNT(*) AS total FROM product');
    return result[0].total;
}