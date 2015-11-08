<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login</title>
 
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap-theme.min.css">
 	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <!-- librerías opcionales que activan el soporte de HTML5 para IE8 -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <style type="text/css">
	    body {
		    margin: 5px;
		    background: #A6A6A6
		}
		/* Tab Navigation */
		.nav-tabs {
		    margin: 0;
		    padding: 0;
		    border: 0;    
		}
		.nav-tabs > li > a {
		    background: #DADADA;
		    border-radius: 0;
		    box-shadow: inset 0 -8px 7px -9px rgba(0,0,0,.4),-2px -2px 5px -2px rgba(0,0,0,.4);
		}
		.nav-tabs > li.active > a,
		.nav-tabs > li.active > a:hover {
		    background: #F5F5F5;
		    box-shadow: inset 0 0 0 0 rgba(0,0,0,.4),-2px -3px 5px -2px rgba(0,0,0,.4);
		}
		
		/* Tab Content */
		.tab-pane {
		    background: #F5F5F5;
		    box-shadow: 0 0 4px rgba(0,0,0,.4);
		    border-radius: 0;
		    text-align: center;
		    padding: 10px;
		}
		
		li{
			width: 14%;
		}
		
		a{
			height: 62px;
			overflow: hidden;
		}
		
		.test{}
    
    </style>
    
  </head>
  <body>
  
  	<div class="container">
	    
	    <!-- Nav tabs -->
	    <ul class="nav nav-tabs" role="tablist">
	      <li class="test active">
	          <a href="#home" onclick="getTab(this);" role="tab" data-toggle="tab">
	              <icon class="fa fa-home"></icon> Registro Metadatos
	          </a>
	      </li>
	      <li class="test">
	      	<a href="#profile" onclick="getTab(this);" role="tab" data-toggle="tab">
	          <i class="fa fa-user"></i> Informacion Estacion
	          </a>
	      </li>
	      <li class="test">
	          <a href="#messages" onclick="getTab(this);" role="tab" data-toggle="tab">
	              <i class="fa fa-envelope"></i> Ubicacion Estacion
	          </a>
	      </li>
	      <li class="test">
	          <a href="#settings" onclick="getTab(this);" role="tab" data-toggle="tab">
	              <i class="fa fa-cog"></i> Informacion Observador
	          </a>
	      </li>
	      <li class="test">
	          <a href="#settings1" onclick="getTab(this);" role="tab" data-toggle="tab">
	              <i class="fa fa-cog"></i> Información de los Instrumentos/Sensores
	          </a>
	      </li>
	      <li class="test">
	          <a href="#settings2" onclick="getTab(this);" role="tab" data-toggle="tab">
	              <i class="fa fa-cog"></i> Informacion de la Instalación/Montaje de los Instrumentos de la Estación
	          </a>
	      </li>
	      <li class="test">
	          <a href="#settings3" onclick="getTab(this);" role="tab" data-toggle="tab">
	              <i class="fa fa-cog"></i> Mapa
	          </a>
	      </li>
	    </ul>
	    
	    <!-- Tab panes -->
	    <div class="tab-content">
	      <div class="tab-pane fade active in" id="home">
	          <h2>Registro de Metadatos</h2>
	          <img src="https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTOEm34AVpTVEWIfT_gdL2ga_uuzvx0WmkDI4Ob2YE5NEgYuI4S" alt="Cats"/>
	      </div>
	      <div class="tab-pane fade" id="profile">
	          <h2>Informacion General de la Estacion</h2>
	          <img src="http://lorempixel.com/400/400/cats/2" alt="Cats"/>
	      </div>
	      <div class="tab-pane fade" id="messages">
	          <h2>Información de la Ubicación de la Estación</h2>
	          <img src="https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTOEm34AVpTVEWIfT_gdL2ga_uuzvx0WmkDI4Ob2YE5NEgYuI4S" alt="Cats"/>
	      </div>
	      <div class="tab-pane fade" id="settings">
	          <h2>Información del Observador (incluye capacitación)</h2>
	          <img src="http://lorempixel.com/400/400/cats/4" alt="Cats"/>
	      </div>
	      <div class="tab-pane fade" id="settings1">
	          <h2> Información de los Instrumentos/Sensores</h2>
	          <img src="http://lorempixel.com/400/400/cats/4" alt="Cats"/>
	      </div>
	      <div class="tab-pane fade" id="settings2">
	          <h2>Informacion de la Instalación/Montaje de los Instrumentos de l Estación</h2>
	          <img src="https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTOEm34AVpTVEWIfT_gdL2ga_uuzvx0WmkDI4Ob2YE5NEgYuI4S" alt="Cats"/>
	      </div>
	      <div class="tab-pane fade" id="settings3">
	          <h2>Mapa</h2>
	          <img src="http://lorempixel.com/400/400/cats/4" alt="Cats"/>
	      </div>
	    </div>
	    
	</div>
  
    <script src="http://code.jquery.com/jquery.js"></script>
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
	<script>
	
		$(document).ready(function() {   		
			initVariables();
	    	initComponentes();
		});
		
		function  initVariables(){
			
		}
		
		
		function initComponentes(){
			
		}
		
		function getTab(){
			setTimeout(function(){
				$("li.active").width("auto");
				
				total=$("div.container").width();
				restar=$("li.active").width();
				restante=total-restar;
				uno=restante/6;
				
	// 			alert(total);
	// 			alert(restar);
	// 			alert(restante);
	// 			alert(uno);
				$("li").width(uno+"px");
				$("li.active").width("auto");
			}, 50);
		}
	
	</script>
  </body>
</html>