<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Management</title>

<link href="/sbaro18062/includes/bootstrap/css/bootstrap.css" rel="stylesheet" />
<link href="/sbaro18062/includes/css/redo.css" rel="stylesheet" />
<script src="/sbaro18062/includes/js/jQuery/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="/sbaro18062/includes/bootstrap/js/bootstrap.js" type="text/javascript"></script>
<script src="/sbaro18062/basewebsite/includes/ckeditor/ckeditor.js" type="text/javascript"></script>
</head>

<cfif not isdefined('session.isadmin') or (isdefined('session.isadmin') and not session.isadmin)>
	You are not authorized for this page. You will be forwarded in <span id="countdown">5</span> seconds. 
    <script>
		var count=5;
			setInterval(function(){
				if(count>0){
					document.getElementById('countdown').innerHTML=count;
				}
				else{
					window.location='../'
				}
				count=count-1;
			}, 1000);
	 </script>
   <cfabort>
 </cfif>


<cfparam name="tool" default="addedit" />
<body>
	<div id="wrapper" class="container">
    
    <div id="maincontent" class="row">
	<div id="navarea" class="row">
 		<cfinclude template="/sbaro18062/basewebsite/header.cfm"/>
 	  	<cfinclude template="/sbaro18062/basewebsite/horizontalnav.cfm"/>
    	<cfinclude template="managementmenu.cfm" />
    </div>
    <div id="mainarea">
		<cfinclude template="#tool#.cfm">
	</div>
	<div id="rightside" class="col-sm-2 col-lg-2">
            
     </div>
     </div>
     <cfinclude template="/sbaro18062/basewebsite/footer.cfm"/>
</div>
	
	
</body>
</html>
