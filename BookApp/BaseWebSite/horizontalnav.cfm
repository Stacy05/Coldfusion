    	<div id="horizontalnav" class="row">
        	<nav class="navbar navbar-default">
            	<div class="container-fluid">
	            	<div class="navbar-header">
    		            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#readDeseNav">
				    	    <span class="sr-only">Toggle navigation</span>
			    	    	<span class="icon-bar"></span>
					        <span class="icon-bar"></span>
					        <span class="icon-bar"></span>
			    		</button>
		                <a class="navbar-brand" href="/sbaro18062/basewebsite">
                        	<img src="/sbaro18062/basewebsite/includes/classimages/sbBooks.png" style="margin-top: -5px;"/>
                        </a>
        			</div>
	                <div class="collapse navbar-collapse" id="readDeseNav">
    	            	<ul class="nav navbar-nav">
                        	<cfoutput>
                                    <li class="active"><a href="index.cfm">Home</a></li>
                                    <li><a href="/sbaro18062/basewebsite/index.cfm?p=content&con=6898179F-0FC6-19BB-7AD1FCBC714D90F1">Store Information</a></li>
                                    <li><a href="/sbaro18062/basewebsite/index.cfm?p=content&con=689817A0-BA6D-EC0D-C60BCE39F0226688">Locations</a></li>
                                    <li><a href="/sbaro18062/basewebsite/index.cfm?p=content&con=689817A1-D694-C9F7-FAFB47A848E4C279">Events</a></li>
                                  
                                    <li>
                                  <form class="navbar-form navbar-left" role="search" method="post" action="#cgi.SCRIPT_NAME#?p=details">
                                            <div class="form-group">
                                                <input type="text" class="form-control" placeholder="Search" name="searchme">
                                             </div>
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                  </form>
                                   </li>
                            </cfoutput>
    	        		</ul>
						<ul class="nav navbar-nav navbar-right">
                        <cfoutput>
                        
                        
                        
                        	<cfif session.isloggedin>
                               		 <li><a>Welcome #session.user.firstname#,</a></li>
                                
                                <cfif isdefined('session.isadmin') and session.isadmin>
                                	<li><a href="/sbaro18062/basewebsite/management">Management Page</a></li>
                                 	
                                </cfif>
                                	<li><a href="#cgi.SCRIPT_NAME#?p=logoff">Logoff</a></li>
                           	<cfelse>
                                	<li><a href="#cgi.SCRIPT_NAME#?p=login">Login</a></li>
                            </cfif>
                         </cfoutput>
                        </ul>
        	        </div>
            	</div>
            </nav>
       	</div>
        
        
        