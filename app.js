const express = require("express");
const app = express();
app.use(express.json());
const mysql = require('mysql');
const cors=require('cors');
app.use(cors());

const pool = mysql.createPool({
    host: 'localhost',
    port: '3306',
    user: 'root',
    password: '',
    database: 'rendteszt'});

app.route("/kezdolap")
    .get(function(req,res){
        const q="SELECT r.rend_id AS id, r.rend_nev AS 'rend_nev', date_format(r.idopont, '%Y - %M - %d') AS 'idopont', h.helyszin_nev AS 'helyszin_nev', e.eloado_nev AS 'eloado_nev'"
        +" FROM helyszin AS h INNER JOIN"
             +" rendezveny AS r"
             +" ON h.helyszin_id = r.helyszin_id INNER JOIN"
             +" rend_eloado AS re"
             +" ON r.rend_id = re.rend_id INNER JOIN"
             +" eloado AS e"
             +" ON re.eloado_id = e.eloado_id"
             +" ORDER BY r.idopont DESC;";        
        pool.query(q, function(error,results){
            if(!error){
                res.send(results);
            }else{
                res.send(error);
            }
        })
    });

app.route("/kezdolap/:id")
    .get(function(req,res){
        const q="SELECT r.rend_id, r.rend_nev, date_format(r.idopont, '%Y %M %d') AS 'idopont', r.kategoria, r.korosztaly, r.leiras, r.ar, h.helyszin_nev, e.eloado_nev "+
        " FROM helyszin AS h JOIN"+
             " rendezveny AS r"+
             " ON h.helyszin_id = r.helyszin_id JOIN"+
             " rend_eloado AS re"+
             " ON r.rend_id = re.rend_id JOIN"+
             " eloado AS e"+
             " ON re.eloado_id = e.eloado_id"+
             " WHERE r.rend_id = ?";
        pool.query(q, [req.params.id],
            function(error, results){
            if(!error){
                res.send(results);
            }else{
                res.send(error);
            }
        })
    })



    

    

app.listen(3000, function(){
    console.log("Szerver - 3000 - elindítva")
})