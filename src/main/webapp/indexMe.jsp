 <!DOCTYPE html>  
<html>  
<head>  
<meta charset="ISO-8859-1">  
<title>Insert title here</title>  
<style>
    body {
    background-image: url("Penguins.jpg");
}
#col{
    background-color: silver;
}
  </style>
</head> 
<body>  
<form action="RegisterServlet" method="post" align="center">  
    <h1>Registration process</h1> 
<table id="col" cellspacing=20 cellpading=20 align="center"> 
<tr><td>Name*</td><td><input type="text" name="name"/></td></tr>

<tr><td>Password:</td><td><input type="password" name="password"/></td></tr>  
<tr><td>Email:</td><td><input type="email" name="email"/></td></tr>  
<tr><td>Phone Number:</td><td><input type="text" name="phone_no"/></td></tr>  
<tr><td>Place:</td><td>  
<select name="place" style="width:150px">  
<option>India</option>  
<option>USA</option>  
<option>UK</option>  
<option>Other</option>  
</select>  
</td></tr>  

<tr><td  colspan="2" align="center"><input type="submit" value="Register"/></td></tr>


  
<tr><td colspan="2"><a href="RegisterViewServlet">view Registration</a></td></tr> 

</form> 
<form action="loginMe.jsp" align="center"> 
    <td align="center"><input type="submit" value="login"/></td></tr></form>
</table>  
<br/>  
 
  
</body>  
</html> 

<!-----<form align="center">
<form class="form-horizondal" role="form">
    <div class="form-group">
        <lable for="id" class="col-sm-2 control-label">id</lable>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="idno" placeholder="enter idno">
        </div>
        <div class="form-group">
        <lable for="name" class="col-sm-2 control-label">name</lable>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="name" placeholder="enter your name">
        </div>
        <div class="form-group">
        <lable for="password" class="col-sm-2 control-label">password</lable>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="password" placeholder="enter password">
        </div>
        <div class="form-group">
        <lable for="email" class="col-sm-2 control-label">email</lable>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="email" placeholder="enter your mailid">
        </div>
        <div class="form-group">
        <select><lable for="country" class="col-sm-2 control-label">country</lable>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="country" placeholder="enter country">
        </div>
        </div>
<button type="submit" class="btn-btn-default">submit</button>
</form>
</form>------------>
