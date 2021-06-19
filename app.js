const express = require('express');
const session = require('express-session');
const exphbs = require('express-handlebars');
const bodyParser = require('body-parser');

const app = express();
app.use(bodyParser.urlencoded({ extended: true }))
app.set('trust proxy', 1) // trust first proxy
app.use(session({
    secret: 'keyboard cat',
    resave: false,
    saveUninitialized: true,
    // cookie: { secure: true }
}))
app.use(express.static('assets'));
app.engine('handlebars', exphbs());
app.set('view engine', 'handlebars');

// res local
app.use(async function (req, res, next) {
    // get all phones from category in database
    let cart_list = req.session.cart_list || [];
    let isCartEmpty = cart_list.length === 0;
    res.locals.isCartEmpty = isCartEmpty;

    next();
});

// call router: home router
const homeRouter = require('./src/routes/home.router');
app.use('/home', homeRouter);

// call router: product router
const productRouter = require('./src/routes/product.router');
app.use('/product-detail', productRouter);

// call router: fillter router
const fillterRouter = require('./src/routes/fillter.router');
app.use('/fillter', fillterRouter);

// call router: cart router
const cartRouter = require('./src/routes/cart.router');
app.use('/cart', cartRouter);

// call router: detele cart item router
const deteleCartItemRouter = require('./src/routes/deleteCartItem.router');
app.use('/detele-cart-item', deteleCartItemRouter);

app.listen(8000, () => {
    console.log('http://localhost:8000/home');
})