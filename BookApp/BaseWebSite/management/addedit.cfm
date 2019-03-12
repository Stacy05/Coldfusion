
   <cfparam name="qterm" default="" />
<cftry>
<script>
	function togglenewisbnform(){
		if(document.getElementById('newisbn13area').style.display=='none'){
			document.getElementById('newisbn13area').style.display='inline';
		}
		else{
			document.getElementById('newisbn13area').style.display='none'
		}
	}
</script>

	<cfoutput>
    	<!---A Function that processes all the form submissions --->
    	#preprocess()#
        
        <!--- The Main Form to edit Book Data --->
		<div id="main" class="col-lg-9 col-lg-push-3">
        	#mainEditForm()#
		</div>
        <!--- The Side Nav that lists our books and we can use to search for the book to edit --->
		<div id="leftgutter" class="col-lg-3 col-lg-pull-9">
        	#sidenav()#
		</div>
    </cfoutput>
    <cfcatch type="any">
    	There Was an Error
        <cfdump var="#cfcatch#">
    </cfcatch>
</cftry>





<cffunction name="sidenav" access="private">
	<cfoutput>
		<form action="#cgi.SCRIPT_NAME#?tool=addedit" method="post" class="form-inline">
        	<div class="form-group">
            	<input type="text" class="form-control" id="qterm" name="qterm" value="#qterm#">
                <button type="submit" class="btn btn-xs btn-primary">Search</button>
			</div>
       </form>
</cfoutput>

    
	<cfif qterm neq ''>
		<cfquery name="allbooks" datasource="#application.dsource#">
    		select * from books where title like '%#qterm#%'
	    </cfquery>
         <cfelse>
    	<cfquery name="allbooks" datasource="#application.dsource#">
    		select top 5 * from books
	    </cfquery>
	</cfif>
    
	<div class="panel">
    	Book List
    </div>
    <cfoutput>
    	<cfif isdefined('allbooks')>
	    	<ul class="nav nav-stacked">
    	    	<cfloop query="allbooks">
	    	    	<li role="presentation">
            	    	<a href="#cgi.SCRIPT_NAME#?book=#isbn13#&tool=addedit&qterm=#qterm#">#title#</a>
                	</li>
	    		</cfloop>
    	    </ul>
		<cfelse>
        	No Search Term Entered (Try "NEW" to get a sample book)
        </cfif>
	</cfoutput>
</cffunction>

<cffunction name="mainEditForm" access="private">
	<cfif isdefined('url.book')>
		<cfquery name="bookinfo" datasource="#application.dsource#">
	    	select * from books where isbn13='#url.book#'
    	</cfquery>
        
        <cfquery name="allpublishers" datasource="#application.dsource#">
        	select * from publishers order by name
        </cfquery>
        
        	<cfquery name="allgenres" datasource="#application.dsource#">
            	select * from genres order by genrename
            </cfquery>
            
            <cfquery name="bookgenres" datasource="#application.dsource#">
            	select * from genrestobooks where isbn13='#url.book#'
            </cfquery>
        
        
        <cfif trim(bookinfo.isbn13[1]) neq ''>
        	<cfset isbnfield="none">
            <cfset isbndisp="inline">
            <cfset req=''>
            
           <cfelse>
           	<cfset isbnfield="inline">
            <cfset isbndisp="none">
			<cfset req="required">
         </cfif>
            

        <cfoutput>
	        <form action="#cgi.SCRIPT_NAME#?tool=addedit&book=#url.book#" method="post" enctype="multipart/form-data" >
        	    <input type="hidden" id="isbn13" name="isbn13" value="#bookinfo.isbn13[1]#" />
                <input type="hidden" name="qterm" value="#qterm#" />
			
            <div class="form-group" style="height: 30px;">
            	       <label for="ISBN13" class="col-sm-2 control-label">ISBN13:</label>
                <div class="col-sm-10">
     
            	 <span id="newisbn13area" style="display:#isbnfield#;">
             			<input type="text" id="isbn13" name="newisbn13" value="#bookinfo.isbn13[1]#" class="form-control" placeholder="Put the ISBN13 code here" #req# pattern=".{13}" title="Please Enter 13 Characters Only. No Dashes Necessary"/>			
               </span>
               <span style="diplay:#isbndisp#;">
               	#bookinfo.isbn13[1]#
                <button type="button" onclick="togglenewisbnform()" class="btn btn-warning btn-xs">Edit ISBN</button>
                </span>
                </div>
               </div>
                
            	<br/>
                <div class="form-group">
					<label for="title" class="col-lg-3 control-label">Title</label>
					<div class="col-lg-9">                    
	        	    	<input type="text" name="title" value="#bookinfo.title[1]#" class="form-control" placeholder="Title" required />
					</div>
                </div>
                
            <div class="form-group">
				<label for="year" class="col-lg-3 control-label">Year</label>
                <div class="col-lg-9">
                	<input type="text" name="year" value="#bookinfo.year[1]#" class="form-control" placeholder="year" required maxlength="5"/>
				</div>
            </div>
           
                
                 <div class="form-group">
                	<label for="weight" class="col-lg-3 control-label">Weight</label>
                	<div class="col-lg-9">
                    	 	<input type="text" name="weight" value="#bookinfo.weight[1]#" class="form-control" placeholder="weight" required maxlength="5"/>
                    </div>
                </div>
                
                <div class="form-group">
					<label for="cover image" class="col-lg-3 control-label">Cover Image</label>
					<div class="col-sm-10">                    	<input type="file" name="uploadimage" /><br/>
	                    <input type="hidden" name="coverimage" value="#bookinfo.coverimage[1]#" />
                        
						<img src="/sbaro18062/basewebsite/images/31.jpg" width="200" />
        	        </div>
            	</div>
                <div class="form-group" >
					<label for="publisher" class="col-lg-3 control-label">Publisher</label>
					<div class="col-sm-10">                    
                    	<select name="publisher" id="publisher">
                        	<option value=""></option>
       
							<cfloop query="allpublishers">
                            	<cfset sel=''>
                                <cfif trim(bookinfo.publisher[1]) eq trim(id)>
                                	<cfset sel='selected="selected"'>
                                </cfif>
                        		<option value="#id#" #sel#>#name#</option>
    	                    </cfloop>
        				</select>
        	        </div>
            	</div>
                <div class="form-group">
					<label for="descripion" class="col-lg-3 control-label">Description</label>
					<div class="col-lg-9">                    
                    	<textarea name="description" id="bookdesc">
                        	#bookinfo.description[1]#
                        </textarea>
                        <script>
							CKEDITOR.replace('bookdesc');
						</script>
        	        </div>
                    </div>
                    
                    <div class="form-group">
                    	<label for="genres" class="col-lg-3 control-label">Genres:</label>
                        <div class="col-lg-9">                     
							<cfloop query="allgenres">
                            	<input id="genre#genreid#" type="checkbox" name="genre" value="#genreid#"> #genrename#<br/>
                            
                            </cfloop>

						</div>
					</div>
                    <cfloop query="bookgenres">
                    	<script>document.getElementById('genre#genreid#').checked=true;</script>
                    </cfloop>
                    
				<div class="form-group">
                	<label class="col-sm-2 control-label">&nbsp;</label>
                    <div class="col-sm-10">
		            	<input type="submit">
                    </div>
				</div>
	        </form>
    	</cfoutput>    
	<cfelse>
    	Choose a Book from the left panel
    </cfif>

</cffunction>



<cffunction name="preprocess" access="private">

	<cfif isdefined('form.uploadimage') and trim(form.uploadimage) neq ''>
    	<cffile action="upload" filefield="uploadimage" destination="#expandpath('/')#sbaro18062\basewebsite\images\" nameconflict="makeunique" />
        <cfset form.coverimage="#cffile.SERVERFILE#" />
    </cfif>


	<cfif isdefined('form.isbn13')>
		<cfquery name="putin" datasource="#application.dsource#">
	    	if not exists(select * from books where isbn13='#form.isbn13#')
            insert into books (isbn13,title) values ('#form.isbn13#','#form.title#');            
            update books 
            set title='#form.title#',
            	year='#form.year#',
                weight='#form.weight#',
                coverimage='#form.coverimage#',
                publisher='#form.publisher#',
            	description='#form.description#'
                where 
                isbn13='#form.isbn13#'
    	</cfquery>
	</cfif>
    
    <cfif isdefined('form.genre')>
    	<cfquery name="delme" datasource="#application.dsource#">
        	delete from genrestobooks where isbn13='#form.isbn13#'
        </cfquery>
        <cfoutput>
        	<cfloop list="#form.genre#" index="i">
            	<cfquery name="putingenres" datasource="#application.dsource#">
                	   insert into genrestobooks 
                (genreid, isbn13 ) values ('#i#', '#form.isbn13#')
             
                </cfquery>
               </cfloop>
              </cfoutput>
            </cfif>               
</cffunction> 