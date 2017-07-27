<html>
    <head>
        <style>
body{
    background-color: #525252;
}
.container{
	height: 200px;
}
.centered-form{
	margin-top: 120px;
}
.jumbotron{
	height: 320px;
	widows: 200px;
}

.centered-form .panel{
	background: rgba(255, 255, 255, 0.8);
	box-shadow: rgba(0, 0, 0, 0.3) 20px 20px 20px;
}
</style>
<body>
<form action="Login" method="GET" align="center" >
<div class="container" collspace=20 collpadding=20>
	
        <div class="row centered-form">
        <div class="col-xs-24 col-sm-16 col-md-8 col-sm-offset-4 col-md-offset-8">
        	<div class="panel panel-default">
        		<div class="panel-heading">
			    		<h3 class="panel-title">Please login</h3>
			 			</div>
			 			<div class="panel-body">
			    		<form role="form">
			    			<div class="row">
			    				<div class="col-xs-12 col-sm-12 col-md-12">
			    					<div class="form-group">
                                        <table align="center" >
                                            
			               <tr><td>User Name</td><td><input type="text" name="name" id="name" class="form-control input-sm" placeholder="User Name"/></td></tr>
			    					</div>
			    				</div></div>
                                <div class="row">
			    				<div class="col-xs-12 col-sm-12 col-md-12">
			    					<div class="form-group">
			    						<tr><td>Password<td><input type="password" name="password" id="password" class="form-control input-sm" placeholder="Password"/></td></tr>
                                        
			    					</div>
			    				</div>
                                </div>
                                </table>
			    				<!--<div class="col-xs-6 col-sm-6 col-md-6">
			    					<div class="form-group">
			    						<input type="text" name="last_name" id="last_name" class="form-control input-sm" placeholder="Last Name">
			    					</div>
			    				</div> 
			    			

			    			<div class="form-group">
			    				<input type="email" name="email" id="email" class="form-control input-sm" placeholder="Email Address">
			    			</div> -->

			    			
			    				<!--<div class="col-xs-6 col-sm-6 col-md-6">
			    					<div class="form-group">
			    						<input type="password" name="password_confirmation" id="password_confirmation" class="form-control input-sm" placeholder="Confirm Password">
			    					</div>
			    				</div> -->
			    			
			    			<table align="center">
			    			<tr><td><input type="submit" value="submit" class="btn btn-info btn-block"></tr></td>
			    			</table>
							<a href="Login"></a>
			    		
			    		</form>
			    	</div>
	    		</div>
    		</div>
    	</div>
		</div>
    </div>
    </form>
</body>
    </head>
</html>