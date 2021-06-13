const Product = require('../model/product.model');

exports.home = async function (req, res) {
    const products = await Product.findAll();
    for (const p of products) {
        if (p.sale != 0) {
            p.isSale = true;
        }
        p.old_price = parseInt(p.price / 1000) + '.' + p.price % 1000;
        p.real_price = parseInt(Math.ceil((p.price - (p.price * p.sale / 100))) / 1000) + '.' + Math.ceil((p.price - (p.price * p.sale / 100))) % 1000;
    }
    console.log(products);
    res.render('home', {
        products: products,
    });
}