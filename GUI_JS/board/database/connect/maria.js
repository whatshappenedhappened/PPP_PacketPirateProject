const maria = require('mysql');

const conn = maria.createConnection({
    host:'localhost',
    port:3306,
    user:'root',
    password:'1234',
    database:'project_db'
});

module.exports = conn;
