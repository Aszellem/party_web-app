let id;


function kezdolap(){
    const url = 'http://localhost:3000/kezdolap/';
    const lista = document.getElementById("rendezvenyek");
    fetch(url)
        .then((response) => response.json())
        .then(json => {
            lista.innerHTML = "";
            json.forEach(f => {
                id=f.id;
                lista.innerHTML +=
                "<div class='card' id='"+id+"'>"+
                "<p><strong>" + f.rend_nev+"</strong></p>"+
                "<p>&#9201; " + f.idopont+"</p>"+
                "<p>&#127913; " + f.eloado_nev+"</p>"+
                "<p>&#128205 " + f.helyszin_nev+"</p>"+
                "<button type='button' class='button' id='button"+id+"' onClick='bovebben("+id+")' style='vertical-align:middle;'><span><strong>Bővebben</strong></span></button>"+
                "</div>"+
                "</div>";
            })
        })
        .catch(err => console.log(err));
}

function bovebben(id){
        const url='http://localhost:3000/kezdolap/'+id;
        const lista=document.getElementById("rendezvenyek");
        lista.innerHTML="";
        fetch(url)
            .then((response) => response.json())
            .then(json => {
                console.log(json),
                lista.innerHTML="";
                lista.innerHTML+=
                "<div class='card col-sm-4' >"+
                "<p><h2>"+json[0].rend_nev+"</h2></p>"+
                "<p>Időpont: "+json[0].idopont+"</p>"+
                "<p>Fellépők: "+json[0].eloado_nev+"</p>"+
                "<p>Helyszín: "+json[0].helyszin_nev+"</p>"+
                "<p>Kategória: "+json[0].kategoria+"</p>"+
                "<p id='leiras'>Esemény leírása: "+json[0].leiras+"</p>"+
                "<p>Ár: "+json[0].ar+"</p>"+
                "</div>";
        })
            .catch((err) => console.log(err));
}

kezdolap();

