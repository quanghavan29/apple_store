const session = require('express-session');
const User = require('../model/user.model');

exports.get = async function (req, res) {
    res.render('login', {
        layout: false,
    });
};

exports.post = async function (req, res) {
    let email = req.body.email;
    const dataRow = await User.getUserByEmail(email);
    const user = dataRow[0];
    if (!user) {
        res.render('login', {
            layout: false,
            notFoundEmail: "Email của bạn chưa đăng kí mua hàng bên hệ thống!",
        });
    } else {
        session.userSession = user;
        res.redirect('order');
    }
}
