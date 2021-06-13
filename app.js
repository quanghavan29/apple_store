const express = require('express');
const exphbs  = require('express-handlebars');

const app = express();
app.use(express.static('assets'));
app.engine('handlebars', exphbs());
app.set('view engine', 'handlebars');

// call router: home router
const homeRouter = require('./src/routes/home.router');
app.use('/home', homeRouter);

// call router: home router
const productRouter = require('./src/routes/product.router');
app.use('/product-detail', productRouter);

app.listen(3000, () => {
    console.log('http://localhost:3000/home');
})