<?
include ("blocks/connect");//ne conectam la DB
session_start();//pentru folosirea datelor intre fisiere asemanator ca cookie
$Email=$_SESSION["E"];
$User=$_SESSION["U"];
$Q = mysql_query("SELECT id,prenume FROM People WHERE paswd='$Email'");//luam datele dupa parola=email
$Q = mysql_fetch_row($Q);$g=$Q[0];$Q = $Q[1];//g=id     Q=prenume
$Grupa = mysql_query("SELECT name FROM grupa WHERE id_student='$g'");//aflam grupa
$Grupa = mysql_fetch_row($Grupa);$Grupa=$Grupa[0];
$Practica = mysql_fetch_row(mysql_query("SELECT corect, total FROM `practice` WHERE id_student='$g'"));
$_SESSION['ID']=$g;
?>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Testare CPP online</title>
    <meta name="description" content="CPP language proficiency QUIZ. You can also pass the official exam, offered by the teacher." />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="generator" content="Codeply">
   <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/css/bootstrap.min.css" />
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/styles2.css" />
    
  </head>
  <body >
    <br><br>
    <nav class="navbar navbar-fixed-top navbar-dark bg-primary">
    <button class="navbar-toggler hidden-sm-up pull-right" type="button" data-toggle="collapse" data-target="#collapsingNavbar">
        ☰
    </button>
    <a class="navbar-brand" href="#">Testare CPP Online</a>
    <div class="collapse navbar-toggleable-xs" id="collapsingNavbar">
        <ul class="nav navbar-nav pull-right"><!-- Meniu dreapta sus -->
            <li class="nav-item"><a class="nav-link"><?echo "$Grupa | $User $Q";?></a></li>
            <li class="nav-item"><a class="nav-link" href="index.php">LogOut</a></li>
        </ul>
    </div>
</nav>
<div class="container-fluid" id="main">
    <div class="row row-offcanvas row-offcanvas-left">
        <div class="col-md-3 col-lg-2 sidebar-offcanvas" id="sidebar" role="navigation">
            <div class="list-group"><!-- Meniu -->
                <a href="#about" class="list-group-item">Despre</a>
                <a href="#level" class="list-group-item">Niveluri</a>
                <a href="#statE" class="list-group-item">Statistica Examene</a>
                <a href="#statP" class="list-group-item">Statistica Practica</a>
            </div>
        </div>
        <!--/col-->

        <div class="col-md-9 col-lg-10 main">
            <h1 class="display-1 hidden-xs-down"><!-- Meniu Centru -->
                <button type="button" class="btn btn-success btn-lg" onclick="getQuiz('P')">Practica</button>
                <button type="button" class="btn btn-success btn-lg" onclick="getQuiz('E')">Examen</button>
            </h1>
            <div class="container col-lg-8 col-lg-offset-2" id="rs">
            </div>
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="card card-inverse card-success">
                        <div class="card-block bg-success"><!-- Frumusete in centru -->
                            <h6 class="text-uppercase">Answer in Total</h6>
                            <h1 class="display-1" id="Tindex"><?echo $Practica[1];?></h1>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="card card-inverse card-info">
                        <div class="card-block bg-info"><!-- Frumusete in centru -->
                            <h6 class="text-uppercase">answers corect</h6>
                            <h1 class="display-1" id="Cindex"><?echo $Practica[0];?></h1>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
            <h2 id="level">Niveluri</h2>
            <div class="card-deck-wrapper">
                <div class="card-deck">
                    <div class="card card-inverse card-success text-center">
                        
                        <div class="card-block" onclick="getQuiz('P1')">
                            <blockquote class="card-blockquote">
                                <p>Beginner level - we assume that you are familiar with the basics of the C++ language</p>
                                <footer>Do not hesitate, check the knowledge of the course</footer>
                            </blockquote>
                        </div>
                    </div>
                    <div class="card card-inverse card-info text-center">
                        
                        <div class="card-block" onclick="getQuiz('P2')">
                            <blockquote class="card-blockquote">
                                <p>Intermediate Level - we assume that you already have the beginner level and have known the language in more detail.</p>
                                <footer>Pass the test and receive a ball at the final evaluation. Do not hesitate</footer>
                            </blockquote>
                        </div>
                    </div>
                    <div class="card card-inverse card-warning text-center">
                        <div class="card-block" onclick="getQuiz('P3')">
                            <blockquote class="card-blockquote">
                                <p>Advanced Level - we assume that you are at the end of the course and you know the secrets of C++</p>
                                <footer>Guaranteed you will be appreciated by the teacher. Try the knowledge</footer>
                            </blockquote>
                        </div>
                    </div>
                </div>
            </div>
            <!--/row-->
            <hr>
            <!-- Statistica -->
            <h2 id="statE">STATITICS QUIZ</h2>
<? require ("functions/show");?><!-- Includem fisierul show din mapa functions -->
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>NAME</th>
                        <th>SURNAME</th>
                        <th>Note</th>
                    </tr>
                </thead>
                <tbody><!-- se apeleaza functia showStudentsMarks si prin ajax o sa se complecteze tabelul -->
                    <?showStudentsMarks($Grupa);?>
                </tbody>
            </table>
            <h2 id="statP">Statistica Practica</h2>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>name</th>
                        <th>surname</th>
                        <th>Correct</th>
                        <th>Total</th>
                        <th>Ratio</th>
                    </tr>
                </thead>
                <tbody>
                    <?showStudentsPractice($Grupa);?>
                </tbody>
            </table>
            <!-- About/Despre -->
            <h2 id="about">about</h2>
            <hr>
            <p>
            It is a 3-level test model (beginner, intermediate, advanced) in the field of programming, namely the C ++ language.
                 The questions are proposed by the teacher for exam preparation. Make up more
            <hr>
        </div>
        <!--/main col-->
    </div>
</div>

<footer class="container-fluid">
    <p class="text-right small"></p>
</footer>
<script>//functia ajax pentru primirea intrebarii | update | verificare
    function getQuiz(str) {
    xmlhttp = new XMLHttpRequest();// code for IE7+, Firefox, Chrome, Opera, Safari       
    xmlhttp.onreadystatechange = function() 
        {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                document.getElementById("rs").innerHTML = xmlhttp.responseText;            
        };
        xmlhttp.open("GET","blocks/test.php?type="+str,true);
        xmlhttp.send();
}

    function update(str) {
    xmlhttp = new XMLHttpRequest();// code for IE7+, Firefox, Chrome, Opera, Safari       
    xmlhttp.onreadystatechange = function() 
        {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                {
                    var x = xmlhttp.responseText;
                    console.log(x);
                    document.getElementById("rs").innerHTML=x;
                    document.getElementById("Tindex").innerHTML=x.slice(8,10); 
                    document.getElementById("Cindex").innerHTML=x.slice(11,13);
                }
        };
        xmlhttp.open("GET","blocks/test.php?v613="+str,true);
        xmlhttp.send();
}

function check(str) {
    xmlhttp = new XMLHttpRequest();// code for IE7+, Firefox, Chrome, Opera, Safari       
    xmlhttp.onreadystatechange = function() 
        {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200){
                var right = xmlhttp.responseText;
            var inputs = document.getElementsByName("ans");

            var parrent = document.getElementById("rs");
            var button = document.getElementsByName("submitAns");
            parrent.removeChild(button[0]);

            var h2 = document.createElement("h2");
            var new_line = document.createElement("br");
            var button_new = document.createElement("button");
            var button_new_text = document.createTextNode("Urmatoarea Intrebare");
            
            button_new.setAttribute("name","nextQuestion");
            button_new.setAttribute("class","btn btn-primary");

            for(i=0;i<3;i++)
                {
                    if(inputs[i].checked)
                        if(inputs[i].value===right)
                            {
                                var text_success = document.createTextNode("Ai raspuns corect");
                                h2.appendChild(text_success);
                                h2.setAttribute("class","text-success");
                                button_new.setAttribute("onclick","update('on')");
                            }
                        else
                            {
                                var text_fail = document.createTextNode("Ai raspuns gresit | Varianta corecta: "+right);
                                h2.appendChild(text_fail);
                                h2.setAttribute("class","text-danger");
                                button_new.setAttribute("onclick","update('off')");
                            }
                }
            parrent.appendChild(h2);
            button_new.appendChild(button_new_text);
            parrent.appendChild(button_new);
            }
        };
        xmlhttp.open("GET","blocks/test-check.php?id_q="+str,true);
        xmlhttp.send();
}
    </script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/tether/1.2.0/js/tether.min.js,//maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/js/bootstrap.min.js"></script>
  </body>
</html>