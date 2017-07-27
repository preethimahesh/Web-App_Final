# Used OOPS in Servlet class
# Flowchart
# index.jsp
*Created a web page using html where details are collected. Here we have used Hidden Concept, where fields are hidden from user which means using this concept multiple fields can be passed from the html page and that process is not visible to user*
```````
<body class=body>
    <div class="container">
    <form align="center" action="register"  method="POST">
    <form action="registration">
    <h1 style="color:#f00">Event Registration for Student<h1></br>
         Database Name:<select id="s1" name="section" onChange="SelectRedirect();">
                <option value="">-----</option>
                <option value="student">Student</option>
                <option value="employee">Employee</option>
                </select></br>
        First Name : <input type="text" name="firstname"/></br>
        Last Name : <input type="text" name="lastname"/></br>
        Email ID : <input type="email" name="email"/></br>
        Date : <input type="date" name="date"/></br>
        Time : <input type="time" name="time"/></br>
        Topic : <input type="text" name="topic"/></br>
        Location : <select name="location"></br>
            <option>Salem</option>
            <option>Coimbatore</option>
            <option>Mumbai</option>
            <option>Namakkal</option>
            <option>Erode</option>
            <option>Rasipuram</option>
            </select></br>
           <input type="submit" value="Register">
           </form>
           <input type="hidden" name="databasename" value="registration">
           <input type="hidden" name="field1" value="f_name">
           <input type="hidden" name="field2" value="l-name">
           <input type="hidden" name="field3" value="email">
           <input type="hidden" name="field4" value="date">
           <input type="hidden" name="field5" value="time">
           <input type="hidden" name="field6" value="topic">
           <input type="hidden" name="field7" value="location">
</body> 
</html>
```````
# Servlet class
*In Servlet class table name , List for field and List for values are passed as the parameter for a method like "Another.getQuery(table,field_name,value);". Here Another is the class name used to access the method getQuery inside that class*
```````
@WebServlet("/register")
public class Register extends HttpServlet
{
	public void doPost(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException, IOException
			{
				Register rg=new Register();
				response.setContentType("text/html");
				PrintWriter out = response.getWriter();
				
				String table=request.getParameter("databasename");

				String field1=request.getParameter("field1");
				String field2=request.getParameter("field2");
				String field3=request.getParameter("field3");
				String field4=request.getParameter("field4");
				String field5=request.getParameter("field5");
				String field6=request.getParameter("field6");
				String field7=request.getParameter("field7");

				List<String> field_name = new ArrayList<String>();
				field_name.add(field1);
				field_name.add(field2);
				field_name.add(field3);
				field_name.add(field4);
				field_name.add(field5);
				field_name.add(field6);
				field_name.add(field7);

				String firstname=request.getParameter("firstname");
				String lastname=request.getParameter("lastname");
				String email=request.getParameter("email");
				String date=request.getParameter("date");				
				String time=request.getParameter("time");
				String topic=request.getParameter("topic");
				String location=request.getParameter("location");

				List<String> value = new ArrayList<String>();
				value.add(firstname);
				value.add(lastname);
				value.add(email);
				value.add(date);
				value.add(time);
				value.add(topic);
				value.add(location);

		int i=0,j=0;
				String fieldname[]=new String[7];
				String fieldvalue[]=new String[7];
				  for (String name : field_name) {
					  fieldname[i]=name;
					  out.println(fieldname[i]);
					  i++;					  
				  }
				  for (String field_value : value) {
					   fieldvalue[j]=field_value;
					   out.println(fieldvalue[j]);
					  j++;					  
				  }

				try {
						Another.getQuery(table,field_name,value);
						out.println("Successful Updated");
				
					} 
					catch (Exception e) {
						out.println("Unsuccessful");
					}
}	
}
```````
#  Another.java class
*Here we have getQuery method where query is executed*
````````
class Another
{
        public static void getQuery(String table,List<String> field_name,List<String> value)
		throws SQLException
        {
	  			Connection connection = DBConnection.getDBConnection();
				int i=0,j=0;
				String fieldname[]=new String[7];
				String fieldvalue[]=new String[7];
				  for (String name : field_name) {
					  fieldname[i]=name;
					  i++;					  
				  }
				  for (String field_value : value) {
					   fieldvalue[j]=field_value;
					   j++;					  
				  }
				Statement statement = connection.createStatement();
				String query = "INSERT INTO `"+table+"`(`"+fieldname[0]+"`,`"+fieldname[1]+"`,`"+fieldname[2]+"`,`"+fieldname[3]+"`,`"+fieldname[4]+"`,`"+fieldname[5]+"`,`"+fieldname[6]+"`) VALUES (?,?,?,?,?,?,?)";
				String query1 = "INSERT INTO `registration`(`f_name`, `l-name`, `email`, `date`, `time`, `topic`, `location`) VALUES (?,?,?,?,?,?,?)";
				//The Second query is just for compare purpose
				System.out.println(query); 
				System.out.println(query1);

				PreparedStatement s1=connection.prepareStatement(query);
			

				s1.setString(1,fieldvalue[0]);
				s1.setString(2,fieldvalue[1]);
				s1.setString(3,fieldvalue[2]);
				s1.setString(4,fieldvalue[3]);
				s1.setString(5,fieldvalue[4]);
				s1.setString(6,fieldvalue[5]);
				s1.setString(7,fieldvalue[6]);
				s1.executeUpdate();
    }
    }
````````
# DBConnection
```````
public class DBConnection
 {
  static Connection conn = null;
  private DBConnection() {}
  public static Connection getDBConnection() 
{
    try
     {
       if (conn == null) 
       {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/company", "root", "");
      }    
    } 
   catch (Exception e)
    {        
      e.printStackTrace();
    }
 return conn;
}
}
````````