
var qs = require('querystring');
        // join에서 submit 하면 여기에서 데이터를 db로 넘겨주자
        var body = '';
        request.on('data', function(data){
            body = body + data;
        });
        request.on('end', function(req){
            var post = qs.parse(body);
            const obj = JSON.parse(JSON.stringify(post)); 
            var keys = Object.keys(obj);
            // for (var i=0; i < keys.length; i++){
            //     console.log(obj[keys[i]]);
            // }

            
            var mysql = require('mysql');
            // 정보를 담은 파일
            const vals = require('./info/consts_daim.js');
            // 연결을 위한 정보 불러오기
            var con = mysql.createConnection({
                host: vals.DBHost, port:vals.DBPort,
                user: vals.DBUser, password: vals.DBPass,
                connectionLimit: 5, database: vals.DB
            });

            // 연결되었는지 확인
            con.connect(function(err){
                if (err) throw err;
                console.log("You are connected");
            });

            // 수행하고 싶은 작업(sql문) 
            var sql = 'INSERT INTO tb_user(user_name, user_department, user_id, user_pw, user_email) VALUES(?,?,?,?,?)';
            var params = [obj[keys[0]],obj[keys[1]],obj[keys[2]],obj[keys[4]],obj[keys[5]]]
            con.query(sql, params, function(err, rows, fields){
                if(err){
                    console.log(err);
                } else{
                    console.log(rows.name);
                }
            });

            con.end();


            // 전송 후 첫화면으로 돌아간다.
            response.writeHead(302, {Location : `/`});
            response.end();
           
        });
        
        var body = '';
        request.on('data', function(data){
            body = body + data;
        });

        request.on('end', function(req){
            var post = qs.parse(body);
            const obj = JSON.parse(JSON.stringify(post));
            var keys = Object.keys(obj);
        });
});
    app.listen(3000);
