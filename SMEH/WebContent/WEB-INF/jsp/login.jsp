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
    
    	@import url(http://fonts.googleapis.com/css?family=Roboto:400);
		body {
		  background-color:#fff;
		  -webkit-font-smoothing: antialiased;
		  font: normal 14px Roboto,arial,sans-serif;
		}
		
		.container {
		    padding: 25px;
		    position: fixed;
		}
		
		.form-login {
		    background-color: #EDEDED;
		    padding-top: 10px;
		    padding-bottom: 20px;
		    padding-left: 20px;
		    padding-right: 20px;
		    border-radius: 15px;
		    border-color:#d2d2d2;
		    border-width: 5px;
		    box-shadow:0 1px 0 #cfcfcf;
		}
		
		h4 { 
		 border:0 solid #fff; 
		 border-bottom-width:1px;
		 padding-bottom:10px;
		 text-align: center;
		}
		
		.form-control {
		    border-radius: 10px;
		}
		
		.wrapper {
		    text-align: center;
		}
		    	
    
    </style>
    
  </head>
  <body>
    <div class="container">
	    <div class="row">
	        <div class="col-md-offset-5 col-md-3">
	            <div class="form-login">
	            <h4>Sistema de Mantenimiento Metadata</h4>
	            <input type="text" id="userName" class="form-control input-sm chat-input" placeholder="Usuario" />
	            </br>
	            <input type="password" id="userPassword" class="form-control input-sm chat-input" placeholder="Clave" />
	            </br>
	            <div class="wrapper">
	            <span class="group-btn">     
	            	<button type="button" class="btn btn-primary btn-md" id="btnLogin">Ingresar <i class="fa fa-sign-in"></i></button>
	            </span>
	            </div>
	            </div>
	        
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
		
		var btnLogin;
		
		function  initVariables(){

			btnLogin=$("#btnLogin");
		}
		
		
		function initComponentes(){
			btnLogin.bind("click",function(event) {
				$form=$(document.createElement('form')).css({display:'none'}).attr("method","POST").attr("action","/SMEH/iniciarSesion");
				$input=$(document.createElement('input')).attr('name','usu').val($("#userName").val());
				$input2=$(document.createElement('input')).attr('name','pass').val($("#userPassword").val());
				$form.append($input).append($input2);
				$("body").append($form);
				$form.submit();
	   	  	});
		}
	
	</script>
  </body>
</html>