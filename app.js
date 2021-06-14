const express = require('express');
const session = require('express-session');
const exphbs = require('express-handlebars');

const app = express();
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

// const Category = require('./src/model/category.model');
// // res local
// app.use(async function (req, res, next) {
//     // get all phones from category in database
//     const categories = await Category.findAll();
//     res.locals.categories = categories; // save categories on locals

//     next();
// });

// call router: home router
const homeRouter = require('./src/routes/home.router');
app.use('/home', homeRouter);

// call router: product router
const productRouter = require('./src/routes/product.router');
app.use('/product-detail', productRouter);

// call router: fillter router
const fillterRouter = require('./src/routes/fillter.router');
app.use('/fillter', fillterRouter);

app.listen(3000, () => {
    console.log('http://localhost:3000/home');
})