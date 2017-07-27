# Creating Web Based Project using Servlet
----------

# JSP Page

- indexMe.jsp
- loginMe.jsp
- logout.jsp


# Servlet Page

- Pojo.java 
- StudentDao.java 
- RegisterServlet.java
- RegisterViewServlet.java
- EditServlet.java
- EditServlet2.java
- DeleteServlet.java
- Login.java
- Logout.java
- Wel.java

# indexMe.jsp

This index file is visible to user, the user can fill the corresponding detail through this jsp page and this page will automatically send the details in servlet page(RegisterServlet.java) using form action concept.

```````
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
```````

# RegisterDetail.java
In this pojo class, there is only set and get function, It can only store and return the value.

```````
public class Pojo {  
private String name,password,email,phone_no,place;  
public String getName() {  
    return name;  
}  
public void setName(String name) {  
    this.name = name;  
}  
public String getPassword() {  
    return password;  
}  
public void setPassword(String password) {  
    this.password = password;  
}  
public String getEmail() {  
    return email;  
}  
public void setEmail(String email) {  
    this.email = email;  
}  
public String getPhoneno() {  
    return phone_no;  
}  
public void setPhoneno(String phone_no) {  
    this.phone_no = phone_no;  
}  
  public String getPlace() {  
    return place;  
}  
public void setPlace(String place) {  
    this.place = place;  
} 
}  
```````
#RegModificationProcess.java

This class having the Database Connection and Query for Create,Retrieve,Update,Delete.

```````
import java.util.*;  
import java.sql.*;  
  
public class StudentDao {  
  
    public static Connection getConnection(){  
        Connection con=null;  
        try{  
           Class.forName("com.mysql.jdbc.Driver");
            con =DriverManager.getConnection("jdbc:mysql://localhost:3306/servlet", "root", "");
 
        }catch(Exception e){System.out.println(e);}  
        return con;  
    }  
    public static int save(Pojo pojo){  
        int status=0;  
        try{  
            Connection con=StudentDao.getConnection();  
            PreparedStatement ps=con.prepareStatement(  
                         "insert into register(name,password,email,phone_no,place) values (?,?,?,?,?)");  
            ps.setString(1,pojo.getName());  
            ps.setString(2,pojo.getPassword());  
            ps.setString(3,pojo.getEmail());
            ps.setString(4,pojo.getPhoneno());  
            ps.setString(5,pojo.getPlace());  
              
            status=ps.executeUpdate();  
              
            con.close();  
        }catch(Exception ex){ System.out.println("Your Email ID is already used....!!!");}
        return status;  
    }  
     public static int login(String name,String password){  
        int status=0,userresult=0; 
        String dbname="",dbpass=""; 
        try{  
            Connection con=StudentDao.getConnection();
            PreparedStatement ps=con.prepareStatement("select name,password from register where name=?"); 
            ps.setString(1,name);
            ResultSet rs=ps.executeQuery();  
            int i=0;
            if (rs.next()) {
              dbname=rs.getString(1);  
                dbpass=rs.getString(2);  
            }   
        }

        catch(Exception e)
        {
           e.printStackTrace();
          
        }
        if((password.equals(dbpass))&&(name.equals(dbname)))
        {
                userresult=1;
                return userresult;
            }
            else
            {
                return userresult;
            }
    }
    public static int update(Pojo e){  
        int status=0;  
        try{  
            Connection con=StudentDao.getConnection();  
            PreparedStatement ps=con.prepareStatement(  
                         "update register set password=?,email=?,phone_no=?,place=? where name=?");  
            
            ps.setString(1,e.getPassword());  
            ps.setString(2,e.getEmail());  
             ps.setString(3,e.getPhoneno());  
            ps.setString(4,e.getPlace());  
            ps.setString(5,e.getName());  
              
            status=ps.executeUpdate();  
              
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return status;  
    }  
    public static int delete(String name){  
        int status=0;  
        try{  
            Connection con=StudentDao.getConnection();  
            PreparedStatement ps=con.prepareStatement("delete from register where name=?");  
            ps.setString(1,name);  
            status=ps.executeUpdate();  
              
            con.close();  
        }catch(Exception e){e.printStackTrace();}  
          
        return status;  
    }  
    public static Pojo getStudentName(String name){  
        Pojo pojo=new Pojo();  
          
        try{  
            Connection con=StudentDao.getConnection();  
            PreparedStatement ps=con.prepareStatement("select * from register where name=?");  
            ps.setString(1,name);  
            ResultSet rs=ps.executeQuery();  
            if(rs.next()){    
                pojo.setName(rs.getString(1));  
                pojo.setPassword(rs.getString(2));  
                pojo.setEmail(rs.getString(3)); 
                pojo.setPhoneno(rs.getString(4));  
                pojo.setPlace(rs.getString(5));  
            }  
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return pojo;  
    }  
    public static List<Pojo> getAllStudent(){  
        List<Pojo> list=new ArrayList<Pojo>();  
          
        try{  
            Connection con=StudentDao.getConnection();  
            PreparedStatement ps=con.prepareStatement("select * from register");  
            ResultSet rs=ps.executeQuery();  
            while(rs.next()){  
                Pojo pojo=new Pojo();  
                pojo.setName(rs.getString(1));    
                pojo.setPassword(rs.getString(2));  
                pojo.setEmail(rs.getString(3));
                pojo.setPhoneno(rs.getString(4));  
                pojo.setPlace(rs.getString(5));  
                list.add(pojo);  
            }  
            con.close();  
        }catch(Exception e){e.printStackTrace();}  
          
        return list;  
    }  
} 
```````
# ViewRegisterDetail.java
This servlet page get the request from the jsp page and store the user details in seperated String and send it to the POJO class.

```````
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String name=request.getParameter("name");
		//String newpassword=MD5Process.md5("password");
		String password=request.getParameter("password");
		String email=request.getParameter("email");
		String phone_no=request.getParameter("phone_no");
		String place=request.getParameter("place");
		out.println(password);
		Pojo pojo=new Pojo();

		pojo.setName(name);
		pojo.setPassword(password);
		pojo.setEmail(email);
		pojo.setPhoneno(phone_no);
		pojo.setPlace(place);
		
		int status=StudentDao.save(pojo);
		if(status>0){
			out.print("<p>Register Successfully!</p>");
			request.getRequestDispatcher("indexMe.jsp").include(request, response);
		}else{
			out.println("Unsuccessfully");
		}
		out.close();
	}

} 
```````
# ViewRegisterDetail.java
This servlet page is used to display all value in the database by using StudentDao.java page. StudentDao.java having Query for select all value from the table.

```````
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/RegisterViewServlet")
public class RegisterViewServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		out.println("<a href='index.jsp'>Add Student</a>");
		out.println("<h1>Student List</h1>");
		
		List<Pojo> list=StudentDao.getAllStudent();
		
		out.print("<table border='1' width='100%'");
		out.print("<tr><th>Name</th><th>Password</th><th>Email</th><th>PhoneNo</th><th>Place</th><th>Edit</th><th>Delete</th></tr>");
		for(Pojo pojo:list){
			out.print("</td><td>"+pojo.getName()+"</td><td>"+pojo.getPassword()+"</td><td>"+pojo.getEmail()+"</td><td>"+pojo.getPhoneno()+"</td><td>"+pojo.getPlace()+"</td><td><a href='EditServlet?name="+pojo.getName()+"'>edit</a></td><td><a href='DeleteServlet?name="+pojo.getName()+"'>delete</a></td></tr>");
		}
		out.print("</table>");
		
		out.close();
	}
}
```````
# EditRegisterDetail.java
This servlet page is used to edit the user information.This page will display the predefined value from the user.

```````
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		out.println("<h1>Update Employee</h1>");
		String name=request.getParameter("name");
		
		Pojo pojo=StudentDao.getStudentName(name);
		
		out.print("<form action='EditServlet2' method='post'>");
		out.print("<table>");
		out.print("<tr><td>Name:</td><td><input type='text' name='name' value='"+pojo.getName()+"'/></td></tr>");
		out.print("<tr><td>Password:</td><td><input type='password' name='password' value='"+pojo.getPassword()+"'/></td></tr>");
		out.print("<tr><td>Email:</td><td><input type='email' name='email' value='"+pojo.getEmail()+"'/></td></tr>");
		out.print("<tr><td>Phone No:</td><td><input type='number' name='phone_no' value='"+pojo.getPhoneno()+"'/></td></tr>");
		out.print("<tr><td>Place:</td><td>");
		out.print("<select name='place' style='width:150px'>");
		out.print("<option>Coimbatore</option>");
		out.print("<option>Erode</option>");
		out.print("<option>Salem</option>");
		out.print("<option>Namakkal</option>");
		out.print("</select>");
		out.print("</td></tr>");
		out.print("<tr><td><input type='submit' value='Edit &amp; Save '/></td></tr>");
		out.print("</table>");
		out.print("</form>");
		out.close();
}
}
```````
# UpdateEditedDetails.java
This servlet page is used to change/modify the value from the database by using StudentDao.java page. StudentDao.java having Query for edit the value from the table.

```````
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/EditServlet2")
public class EditServlet2 extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String name=request.getParameter("name");
		String password=request.getParameter("password");
		String email=request.getParameter("email");
		String phone_no=request.getParameter("phone_no");
		String place=request.getParameter("place");
		
		Pojo pojo=new Pojo();
		pojo.setName(name);
		pojo.setPassword(password);
		pojo.setEmail(email);
		pojo.setPhoneno(phone_no);
		pojo.setPlace(place);
		
		int status=StudentDao.update(pojo);
		if(status>0){
			response.sendRedirect("RegisterViewServlet");
		}else{
			out.println("Sorry! unable to update");
		}
		out.close();
	}
}
```````

# DeleteField.java
This servlet page is used to delete the particular records form the table by using StudentDao.java page. StudentDao.java having Query for delete the value from the table.

```````
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("name");
		StudentDao.delete(name);
		response.sendRedirect("RegisterViewServlet");
	}
}
```````
# login.jsp
This login file is used to get information from the user to start the session.Collection the information from the user and send to the servlet page through form action concept.
```````
<html>
<head>
  <title>Login</title>
  <link rel="stylesheet" type="text/css" href="bootstrap.min.css"> 
     <style>
      .container {
    max-width: 750px;
  }
  h1{
    color: red;
  }
  
      </style>
</head>
<body>
      <div class="container">
      <div class="header">
        <h1 align="center"><b><i>Login</i></b></h1>
        <ul class="nav nav-pills pull-right">
              <li class=""><a href="indexMe.jsp">Register</a></li>
            <li class="active" id="register"><a href="loginMe.jsp">Login</a></li>
        </ul>
      </div>
</div>
<form action="Login" method="post">
<center>
<table cellSpacing="8" cellPadding="8" border="30">
<tr><td>Name</td><td><input type="text" name="name" placeholder="Enter your username"/></td></tr> 
<tr><td>Password</td><td><input type="password" name="password" placeholder="Enter your Password"/></td></tr> 
</table>
<input type="submit" value="Login" class="btn btn-primary"/></br>
</center>
</form>
</body>
</html>
```````
# Login.java
This servlet page get the information from the user by using login.jsp page and check with the Database whether the user details is correct or not. If the user will give correct details, this page will start the session.
```````
import java.io.*;  
import javax.servlet.*;  
import javax.servlet.http.*;  
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.annotation.WebServlet;  
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/Login")
public class Login extends HttpServlet {  

public void doPost(HttpServletRequest request, HttpServletResponse response)  
        throws ServletException, IOException {  
            try{
    response.setContentType("text/html");
        PrintWriter out = response.getWriter();  
        String name = request.getParameter("name");
        String pass = request.getParameter("password");
        
        int result=StudentDao.login(name,pass);
        if(result==1)
        {
            HttpSession session = request.getSession();
            session.setAttribute("hello",name);
            response.sendRedirect("Wel");
           
            out.close();
        }

    else
    {  
        response.setContentType("text/html");
        out.println("Sorry UserName  Password Error!");  
       
        }  
    } 
   catch(Exception e){System.out.println(e);}  
  
}  
}
```````
#SessionHandled.java
This servlet page is used start the session and display the dashboard page,(i.e) Check the session page and directly call the action.And also give the privilege to the particular user.

```````
import java.io.*;  
import javax.servlet.*;  
import javax.servlet.http.*;  
  
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.annotation.WebServlet; 
import javax.servlet.http.HttpServletResponse;
@WebServlet("/Wel")
public class Wel extends HttpServlet {  
  
    public void doGet(HttpServletRequest request, HttpServletResponse response)  
        throws ServletException, IOException {  
            try{
       response.setContentType("text/html");  
    PrintWriter out = response.getWriter();  
      HttpSession session=request.getSession(false);    
   String name=(String)session.getAttribute("hello"); 
    out.print(name+"your page have been opened!! Enjoy your day");
    request.getRequestDispatcher("logout.jsp").include(request, response);

        } 
    catch(Exception e){System.out.println(e);}  
 }
  
}   
```````
# logout.jsp
This page is simple call the Logout servlet page.

```````
<html>
        <body>
            <form action="logout" align="right">
       <input type="submit" value="Logout"> 
        </body>
        </html>
```````
# Logout.java

This servlet page is simple here close the session by using  session.invalidate() function.

```````
import java.io.*;  
import javax.servlet.*;  
import javax.servlet.http.*;  
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.annotation.WebServlet;  
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/logout")
public class Logout extends HttpServlet {  

public void doGet(HttpServletRequest request, HttpServletResponse response)  
        throws ServletException, IOException {  
            try{
    response.setContentType("text/html");
        PrintWriter out = response.getWriter();  
         HttpSession session=request.getSession(false); 
        session.invalidate();
        out.println("Logout Successfully");
        request.getRequestDispatcher("index.jsp").include(request, response);
    } 
   catch(Exception e){System.out.println(e);}  
  
}  
}
```````