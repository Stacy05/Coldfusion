<cfparam name="searchme" default="" />
<cfparam name="genre" default="" />
<cfparam name="publisher" default="" />

	<cfif searchme neq '' or genre neq '' or publisher neq ''>
    	<cfif genre neq ''>
        
    		<cfquery name="bookinfo" datasource="#application.dsource#">
			select * from books
            inner join genrestobooks on books.isbn13=genrestobooks.isbn13
            inner join publishers on books.publisher=publishers.id
            where genreid='#genre#'
       		 </cfquery>
        
        	<cfelseif publisher neq ''>
            	<cfquery name="bookinfo" datasource="#application.dsource#">
                select * from books
                inner join publishers on books.publisher=publisher.id
                where publishers.id like '%#publisher#%'
                </cfquery>
             <cfelse>
             	<cfquery name="bookinfo" datasource="#application.dsource#">
                select * from books
                inner join publishers on books.publisher=publishers.id
                where title like '%#searchme#%' or isbn13 like '%#searchme#%'
                </cfquery>
              </cfif>
		
        	<cfif bookinfo.recordcount eq 0>
            	Sorry, we did not find any results for you. Please try again.
              <cfelseif bookinfo.recordcount gt 1>
              	We found this stuff:
                	<ol>
                    	<cfoutput query="bookinfo">
                        	<li><a href="#cgi.SCRIPT_NAME#?p=details&searchme=#isbn13#">
                            	#title#
                                </a>
                            </li>
                        </cfoutput>
                     </ol>
    <cfelseif bookinfo.recordcount eq 1>
    	<cfoutput>
        <!-- Use follow along img to test, MUST UPDATE -->
        	<img src="/sbaro18062/basewebsite/images/#bookinfo.COVERIMAGE[1]#" style="float: left; width: 200px;   margin: 0 15px 8px 0;
" />
            Title: #bookinfo.title[1]#<br/>
            Publisher: #bookinfo.name[1]#<br/>
           	Year: #bookinfo.year[1]#<br/>
            Weight: #bookinfo.weight[1]#<br/>
            Binding: #bookinfo.binding[1]#<br/>
            Description: #bookinfo.description[1]#<br/>
        </cfoutput>
    </cfif>
    
    <cfelse>
    Please submit a search phrase.
    </cfif>
    
