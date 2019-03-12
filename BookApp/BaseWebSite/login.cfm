
   <cfparam name="AccountMessage" default="" />
<cfparam name="loginmessage" default="" />
<cfset preprocess()>
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

<div class="col-lg-6">
	<legend>New Account</legend>
    <cfoutput>
    	<div id="newaccountmessage">#accountmessage#</div>
	    <form action="#cgi.SCRIPT_NAME#?p=login" method="post" class="form-inline">
        	<input type="hidden" name="newpersonid" />
			<div class="form-group">
				<label for="firstname" class="col-sm-5 control-label">First Name</label>
				<div class="col-sm-5">                    
                   	<input type="text" name="firstname" required>
       	        </div>
			</div>
            <div class="form-group">
				<label for="lastname" class="col-sm-5 control-label">Last Name</label>
				<div class="col-sm-5">                    
                   	<input type="text" name="lastname" required>
       	        </div>
			</div>
            <div class="form-group">
				<label for="email" class="col-sm-5 control-label">Email</label>
				<div class="col-sm-5">                    
                   	<input type="email" name="email" required>
       	        </div>
			</div>
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
                	<button id="newaccountbutton" class="btn btn-warning" type="button" onclick="validateNewAccount()">Make Account</button>
					<input type="submit" id="submitnewaccountform" style="display:none" />
                </div>
			</div>
        </form>
	</cfoutput>
</div>
<div class="col-lg-6">
	<cfoutput>
		<legend>Login</legend>
		<form action="#cgi.SCRIPT_NAME#?p=login" method="post">
		    <div class="form-group">
				<label for="loginemail" class="col-sm-5 control-label">Email</label>
				<div class="col-sm-5">                    
               		<input type="text" name="loginemail" required>
	       	    </div>
			</div>
        	<div class="form-group">
				<label for="title" class="col-sm-5 control-label">Password</label>
				<div class="col-sm-5">                    
    	           	<input type="password" name="loginpass" required>
       		    </div>
			</div>
    	    <div class="form-group">
	    		<label class="col-sm-2 control-label">
                &nbsp;
                </label>
            	<div class="col-sm-10">
					<input type="submit" value="login" class="btn btn-primary" />
    	        </div>
			</div>
            <div class="form-group">
            	<label class="col-sm-2 control-label">&nbsp;</label>
                <div class="col-sm-10">
                	<a href="#cgi.SCRIPT_NAME#?p=forgot">Forgot&nbsp;Password</a>
                </div>
             </div>

	    </form>
	</cfoutput>
</div>


<cffunction name="preprocess" access="private">
	<cfif isdefined('form.newpersonid')>
		<cfset newid=createuuid()>
    	<cfquery name="getmail" datasource="#application.dsource#">
	    	select * from people where email='#form.email#'
		</cfquery>
		<cfif getmail.recordcount eq 0>
      		<cfquery name="putin" datasource="#application.dsource#">
				insert into people (personid,firstname,lastname,email,isAdmin)
                values 				 ( '#newid#','#form.firstname#','#form.lastname#','#form.email#', '0')
            </cfquery>
            <cfquery name="putinpassword" datasource="#application.dsource#">
            	insert into passwords (personid,passwords)
                values ('#newid#','#hash(form.password,"SHA-256")#')
            </cfquery>
            New User Made. Please Log in.
        <cfelse>
        	<cfset accountmessage="That email account is already registered, please login.">
        </cfif>
    </cfif>
    
    <cfif isdefined('form.loginemail')>
    	<cfquery name="handle" datasource="#application.dsource#">
        	SELECT * FROM PEOPLE 
            
            INNER JOIN passwords on passwords.personid=people.personid
            
            WHERE email='#form.loginemail#' AND passwords='#hash(form.loginpass,"SHA-256")#'
         </cfquery>
   			<cfdump var='#handle#'>
       
     </cfif>
</cffunction> 