const session = require('express-session');

exports.logout = async function (req, res) {
    res.render('login', {
        layout: false,
    });
};
