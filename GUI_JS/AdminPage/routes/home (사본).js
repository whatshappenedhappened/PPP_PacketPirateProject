var express = require('express');
var router = express.Router();

// require maria.js 
const maria = require('../database/connect/maria');

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

// DB INSERT, DELETE
router.post('/setting', function(req, res){
//setting.ejs에서 form태그의 post방식으로 데이터를 받는다.
	
    const Ins_domain = req.body.Ins_domain;	//request 객체의 body객체의 title값.
    const Ins_sql = 'INSERT INTO tb_domains (domain_name) VALUES(?)';
    const Del_domain = req.body.Del_domain;	//request 객체의 body객체의 title값.
    const Del_sql = 'DELETE FROM tb_domains WHERE domain_name = ?';
    var domain = "";
    var sql = "";
    var output = "";
    if (typeof(Ins_domain) == "undefined") {
    	domain = Del_domain;
    	sql = Del_sql;
    	output = domain + " 삭제 성공";
    } else if (typeof(Del_domain) == "undefined") {
    	domain = Ins_domain;
    	sql = Ins_sql;
    	output = domain + " 추가 성공";
    	}
    //VALUES의 물음표는 query함수의 두번째 인자.
	maria.query(sql, domain, function(err, result, fields){
	//인자로 sql문, Value, 함수 전달.
		if(err) {
			console.log(err+""); //에러가 있다면, 보안을 위해 콘솔에 err로그를 찍는다.
			res.send("<script>alert('등록되어 있는 도메인입니다.'); history.back();</script>");
		}else{
			console.log(output);//데이터가 db에 잘 저장 되었다면, 콘솔에 성공이라 찍는다.
			res.send("<script>alert('" + output + "'); history.back();</script>");
			//setting 페이지 새로고침
		}
	});
});

router.get('/log', function(req, res){
	maria.query('SELECT * FROM tb_packet_log ORDER BY created_at DESC LIMIT 20', function(err, rows, fields) {
		if(!err) {
			//res.send(rows); // responses send rows
			res.render("home/log", { log_data: rows });
		} else {
	    		console.log("err : " + err);
	    		res.send(err);  // response send err
	  	}
	});
});

module.exports = router;
