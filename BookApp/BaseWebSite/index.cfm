<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>SB Books and Apps</title>
<link href="/sbaro18062/basewebsite/includes/bootstrap/css/bootstrap.css" rel="stylesheet" />
<link href="/sbaro18062/basewebsite/includes/css/redo.css" rel="stylesheet" />
<script src="/sbaro18062/basewebsite/includes/js/jQuery/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="/sbaro18062/basewebsite/includes/bootstrap/js/bootstrap.js" type="text/javascript"></script>
<script src="/sbaro18062/basewebsite/includes/ckeditor/ckeditor.js" type="text/javascript"></script>
</head>


<cfparam name="p" default="carousel" />
<cfinclude template="stateinfo.cfm" />

<body>
	<div id="wrapper" class="container">
    <!-- start of pieces -->
	  
 
      <cfinclude template="/sbaro18062/basewebsite/header.cfm"/>
 	  <cfinclude template="/sbaro18062/basewebsite/horizontalnav.cfm"/>
 
        
         
	    <div id="maincontent" class="row">
			<div id="center" class="col-sm-7 col-lg-7 col-md-7 col-sm-push-3">
		
        		 <cfinclude template="/sbaro18062/basewebsite/#p#.cfm"/>
                                
            </div>
                                
        
			
            <div id="leftgutter" class="col-sm-3 col-lg-3 col-md-3 col-sm-pull-7">
      
            	 <cfinclude template="/sbaro18062/basewebsite/genrenav.cfm"/>

            </div>
			<div id="rightside" class="col-sm-2 col-lg-2">
            
            </div>
        </div>
    	<cfinclude template="/sbaro18062/basewebsite/footer.cfm"/>
        
        <!-- End of Pieces -->
	</div>
</body>
</html>

