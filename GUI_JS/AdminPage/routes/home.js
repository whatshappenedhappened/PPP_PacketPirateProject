var express = require('express');
var router = express.Router();
var passport = require('../config/passport');

// require maria.js 
const maria = require('../database/connect/maria');
//const maria_login = require('../database/connect/maria_login');

// Home
router.get('/', function(req, res){
  res.render('home/welcome');
});
router.get('/about', function(req, res){
  res.render('home/about');
});

router.get('/setting', function(req, res){
	maria.query('SELECT * FROM tb_domains', function(err, rows, fields) {
		if(!err) {
			//res.send(rows); // responses send rows
			res.render("home/setting", { log_data: rows });
		} else {
	    		console.log("err : " + err);
	    		res.send(err);  // response send err
	  	}
	});
});

router.post('/setting', function(req, res){
//setting.ejs에서 form태그의 post방식으로 데이터를 받는다.
    var domain = req.body.domain;	//request 객체의 body객체의 title값.
    var sql = 'INSERT INTO tb_domains (domain_name) VALUES(?)';
    //VALUES의 물음표는 query함수의 두번째 인자.
    maria.query(sql, domain, function(err, result, fields){
    //인자로 sql문, Value, 함수 전달.
        if(err) {
          console.log(err); //에러가 있다면, 보안을 위해 콘솔에 err로그를 찍고,
          res.status(500).send('Internal Server Error'); //사용자에게는 err로그를 보여주지 않는다.
        }
        console.log(domain+' 추가 성공');//데이터가 db에 잘 저장 되었다면, 콘솔에 성공이라 찍는다.
        res.redirect('/setting');
        //setting 페이지 새로고침
    });
});

router.get('/log', function(req, res){
	maria.query('SELECT * FROM tb_packet_log ORDER BY created_at DESC LIMIT 10', function(err, rows, fields) {
		if(!err) {
			//res.send(rows); // responses send rows
			res.render("home/log", { log_data: rows });
		} else {
	    		console.log("err : " + err);
	    		res.send(err);  // response send err
	  	}
	});
});
// DB INSERT
router.post 
// Login
router.get('/login', function (req,res) {
  var username = req.flash('username')[0];
  var errors = req.flash('errors')[0] || {};
  res.render('home/login', {
    username:username,
    errors:errors
  });
});

// Post Login
router.post('/login',
  function(req,res,next){
    var errors = {};
    var isValid = true;

    if(!req.body.username){
      isValid = false;
      errors.username = 'Username is required!';
    }
    if(!req.body.password){
      isValid = false;
      errors.password = 'Password is required!';
    }

    if(isValid){
      next();
    }
    else {
      req.flash('errors',errors);
      res.redirect('/login');
    }
  },
  passport.authenticate('local-login', {
    successRedirect : '/posts',
    failureRedirect : '/login'
  }
));

// Logout
router.get('/logout', function(req, res) {
  req.logout();
  res.redirect('/');
});

module.exports = router;
