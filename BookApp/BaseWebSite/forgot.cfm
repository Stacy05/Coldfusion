<cfif isdefined('form.lastname')>
	<cfoutput>#newpassform()#</cfoutput>
<cfelseif isdefined('form.password')>
    <cfoutput>
    	<cfquery name="putin" datasource="#application.dsource#">
        	if not exists(select * from passwords where personid='#form.personid#')
            insert into passwords (personid) values ('#form.personid#');
            update passwords 
    	    set passwords='#hash(form.password,"SHA-256")#'
        	WHERE personid='#form.personid#'
		</cfquery>            
    </cfoutput>
	<cflocation url="/sbaro18062/basewebsite/index.cfm?p=login" />
<cfelse>
	<cfset authform()>
 </cfif>

<cffunction name="newpassform">
    <cfquery name="person" datasource="#application.dsource#">
    	select * from people where lastname='#form.lastname#' and email='#form.email#'
    </cfquery>
    
    <cfif person.recordcount gt 0>

		<script>
            function validateNewAccount(){
                origpw=document.getElementById('newaccountpassword').value;
                confpw=document.getElementById('newaccountpasswordconfirm').value;
                if(origpw == confpw && origpw != '' && confpw != ''){
                    document.getElementById('submitnewaccountform').click();
                    document.getElementById('newaccountmessage').innerHTML="";
                }
                else{
                    document.getElementById('newaccountmessage').innerHTML="The passwords do not match, please resubmit.";		
                }
            }
        </script>
            
    	<cfoutput>
        <div id="newaccountmessage"></div>
        <form action="#cgi.SCRIPT_NAME#?p=forgot" method="post">
        	    
                  <input type="text" name="personid" value="#person.personid[1]#" />
        	 <div class="form-group">
				<label for="password" class="col-sm-5 control-label">Password</label>
				<div class="col-sm-5">                    
                   	<input id="newaccountpassword" type="password" name="password" required>
       	        </div>
			</div>
            <div class="form-group">
				<label for="confirmpassword" class="col-sm-5 control-label">Confirm Password</label>
				<div class="col-sm-5">                    
                   	<input id="newaccountpasswordconfirm" type="password" name="password2" required>
       	        </div>
			</div>
            <div class="form-group">
	            <label class="col-sm-5 control-label">&nbsp;</label>
                <div class="col-sm-5">
                	<button id="newaccountbutton" class="btn btn-warning" type="button" onclick="validateNewAccount()">Reset Password </button>
					<input type="submit" id="submitnewaccountform" style="display:none" />
                </div>
			</div>
        </form>
        </cfoutput>
    <cfelse>
    	Incorrect last name and email combination
    </cfif>
</cffunction>

<cffunction name="authform">
	<cfoutput>	
    	<div>
        	Please fill in your last and email address as they are onfile. 
        </div>
    	<form action="#cgi.SCRIPT_NAME#?p=forgot" method="post">
  
		    <div class="form-group">
				<label for="lastname" class="col-sm-5 control-label">Last Name</label>
				<div class="col-sm-5">                    
               		<input type="text" name="lastname" required>
	       	    </div>
			</div>
        	<div class="form-group">
				<label for="email" class="col-sm-5 control-label">Email Address</label>
				<div class="col-sm-5">                    
    	           	<input type="text" name="email" required>
       		    </div>
			</div>
    	    <div class="form-group">
	    		<label class="col-sm-2 control-label">&nbsp;</label>
            	<div class="col-sm-10">
					<input type="submit" value="login" class="btn btn-primary" />
    	        </div>
			</div>
		</form>
	</cfoutput>
</cffunction> 