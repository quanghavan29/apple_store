const session = require('express-session');

exports.profile = async function (req, res) {
    let userSession = session.userSession || null;
    res.render('profile', {
        layout: false,
        userSession: userSession,
    });
};
