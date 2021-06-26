var nodemailer = require('nodemailer');

exports.sendMailVerify = function (email, code) {
    var transporter = nodemailer.createTransport({
        service: 'gmail',
        auth: {
            user: 'coosi29@gmail.com', // generated ethereal user
            pass: 'tmamqsenrskdfzvt', // generated ethereal password
        },
    });

    var mailOptions = {
        from: 'coosi29@gmail.com',
        to: email,
        subject: 'Shop Phone - Xác thực Email Của Bạn',
        text: code + ' là mã xác nhận dùng để đăng nhập lịch sử mua hàng của bạn tại ShopPhone.42web.io !'
    };

    transporter.sendMail(mailOptions, function (error, info) {
        if (error) {
            console.log(error);
        } else {
            console.log('Email sent: ' + info.response);
        }
    });
}