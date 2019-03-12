<cfquery name="gennav" datasource="#application.dsource#">
	SELECT distinct genrename,genres.genreid from genres
    inner join genrestobooks on genres.genreid = genrestobooks.genreid
 </cfquery>
 
 

 

 <ul class="nav nav-stacked">
 	<cfoutput query="gennav">
		<li>
        	<a href="#cgi.SCRIPT_NAME#?p=details&genre=#genreid#">#genrename#</a>
        </li>
     </cfoutput>
  </ul>
  