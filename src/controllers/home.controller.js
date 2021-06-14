const Product = require('../model/product.model');
const Fillter = require('../model/fillter.model');

// return home page
exports.home = async function (req, res) {
    let product_id = req.query.product_id || '';
    const products = await Product.findAllByProductId(product_id);
    // get all fillters model
    let fillters = Fillter.fillters;
    // set isActive for fillter
    for (const f of fillters) {
        delete f.isActive;
        if (f.value === product_id) {
            f.isActive = true;
        }
    }

    console.log(fillters);
    // set sale, and format price for each product
    for (const p of products) {
        // if product has sale => isSale = true
        if (p.sale != 0) {
            p.isSale = true;
        }
        // format price
        if (parseInt(p.price % 1000) >= parseInt(100)) {
            p.old_price = parseInt(p.price / 1000) + '.' + p.price % 1000;
        } else {
            p.old_price = parseInt(p.price / 1000) + '.0' + p.price % 1000;
        }
        if (parseInt(Math.ceil((p.price - (p.price * p.sale / 100))) % 1000) >= parseInt(100)) {
            p.present_price = parseInt(Math.ceil((p.price - (p.price * p.sale / 100))) / 1000) + '.' + Math.ceil((p.price - (p.price * p.sale / 100))) % 1000;
        } else {
            p.present_price = parseInt(Math.ceil((p.price - (p.price * p.sale / 100))) / 1000) + '.0' + Math.ceil((p.price - (p.price * p.sale / 100))) % 1000;
        }
    }
    // console.log(products);
    res.render('home', {
        products: products,
        fillters: fillters,
        isEmpty: products.length === 0,
    });
}