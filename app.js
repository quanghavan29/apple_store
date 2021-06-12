var express = require('express');
var exphbs  = require('express-handlebars');

var app = express();
app.use(express.static('assets'));
app.engine('handlebars', exphbs());
app.set('view engine', 'handlebars');

app.get('/', function (req, res) {
    const list = [1, 2, 3, 4, 5];
    res.render('home', {
        list: list,
    });
});
 
app.listen(3000, () => {
    console.log('http://localhost:3000');
})