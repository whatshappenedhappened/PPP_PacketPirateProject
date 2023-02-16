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
