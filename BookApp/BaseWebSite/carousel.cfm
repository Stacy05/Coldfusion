<cfquery name="allpics" datasource="#application.dsource#">
	select * from books where coverimage <> ''
 </cfquery>
                
 <legend>Today's Top Sellers</legend>
 	<div id="readDeseCarousel" class="carousel slide" data-ride="carousel">
  	<!-- Indicators -->
    <ol class="carousel-indicators">
    	<cfoutput query="allpics">
    					<li data-target="##readDeseCarousel" data-slide-to="#allpics.currentrow-1#" class="active" title="#title#"></li>
         </cfoutput>
    					
                        <li data-target="#readDeseCarousel" data-slide-to="#allpics.recordcount+1#" title="Store Hours"></li>
  					</ol>

  					<!-- Wrapper for slides -->
  					<div class="carousel-inner" role="listbox">
    					<cfoutput query="allpics">
                        <cfset act="">
                        <cfif currentrow eq 1>
                        	<cfset act="active">
                        </cfif>
                        
                            <div class="item #act#">
                                <img src="/sbaro18062/basewebsite/images/#coverimage#" alt="..." style="margin-left:auto; margin-right:auto;">
                                <div class="carousel-caption">
                                    <p>#title#</p>
                                </div>
                            </div>
                        </cfoutput>
                        
    		<div class="item" style="height: 480px;">
                        
           <h3 class="col-lg-offset-2">Store Hours</h3>
      						<table class="table table-hover table-striped" style=" width:65%; margin-left:auto;margin-right:auto;">
                            	<tbody>
                                	<tr>
	                                	<th>Day</th><th>Hours</th>
    								</tr>
                                    <tr>
                                    	<td>Monday</td><td>10am-6pm</td>
                                    </tr>
                                    <tr>
                                    	<td>Tuesday</td><td>10am-6pm</td>
                                    </tr>
                                    <tr>
                                    	<td>Wednesday</td><td>10am-6pm</td>
                                    </tr>
                                    <tr>
                                    	<td>Thursday</td><td>10am-6pm</td>
                                    </tr>
                                    <tr>
                                    	<td>Friday</td><td>10am-9pm</td>
                                    </tr>
                                    <tr>
                                    	<td>Saturday</td><td>10am-9pm</td>
                                    </tr>
                                    <tr>
                                    	<td>Sunday</td><td>Noon-6pm</td>
                                    </tr>
                                </tbody>
                            </table>
      						<div class="carousel-caption">
         						
      						</div>
    					</div>
  					</div>

  					<!-- Controls -->
  					<a class="left carousel-control" href="#readDeseCarousel" role="button" data-slide="prev">
    					<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    					<span class="sr-only">Previous</span>
  					</a>
  					<a class="right carousel-control" href="#readDeseCarousel" role="button" data-slide="next">
   						<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    					<span class="sr-only">Next</span>
  					</a>
				</div>