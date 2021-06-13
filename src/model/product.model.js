const dbconfig = require('../dbconfig/db.config');

// Find all product => return home page
exports.findAll = async function() {
    return await dbconfig.select('SELECT distinct * FROM product p ' +
        'join product_detail pd on p.product_id = pd.product_id ' +
        'join specifications spec on pd.specifications_id = spec.specifications_id ' +
        'group by p.product_id');
}

// Find product detail by color and version => return product detail page
exports.findProductDetail = async function(product_id, version, color) {
    return await dbconfig.select('SELECT * FROM product p ' +
        'join product_detail pd on p.product_id = pd.product_id ' +
        'join specifications spec on pd.specifications_id = spec.specifications_id ' +
        'where p.product_id = \'' + product_id + '\' and pd.color = \'' + color + '\' and pd.version = \'' + version + '\'');
}

// Find all version of product by product id => return product detail page
exports.findAllVersion = async function(product_id) {
    return await dbconfig.select('SELECT distinct pd.product_detail_id, pd.version, pd.color, pd.product_id ' + 
        'FROM product_detail pd ' +
        'where pd.product_id = \'' + product_id + '\'' +
        'group by pd.version ' +
        'order by convert(pd.version, decimal) DESC');
}

// Find all product by product id (distinct by color) => return product detail page
exports.findProductById = async function(product_id) {
    return await dbconfig.select('SELECT distinct pd.product_detail_id, pd.image_intro, pd.color, pd.version, pd.product_id ' +
        'FROM product_detail pd ' +
        'where pd.product_id = \'' + product_id + '\'' +
        'group by pd.image_intro');
}

exports.count = async function() {
    const result = await dbconfig.select('SELECT COUNT(*) AS total FROM product');
    return result[0].total;
}