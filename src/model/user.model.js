const dbconfig = require('../dbconfig/db.config');

// get user by email
exports.getUserByEmail = async function(email) {
    return await dbconfig.select('SELECT * FROM users u ' +
        'where u.email = \'' + email + '\'');
}

// add new user
exports.addNewUser = async function(user) {
    return await dbconfig.add('users', user);
}