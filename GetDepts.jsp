<%@ page import="java.sql.*,  java.util.*, com.*,  com.google.gson.*" language="java"  %>

<%	 
  	
//Class.forName("oracle.jdbc.driver.OracleDriver");
//   Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","HR","HR");
// String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	  String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";  
	 
	// String DB_URL = "jdbc:mysql://localhost:3308/test";
	 String DB_URL = "jdbc:oracle:thin:@localhost:1521:XE";   //,"HR","HR";
	 String USER = "HR";
	 String PASS = "HR";
	  
	 Connection conn = null;
	 Statement stmt = null;
	 ResultSet rs=null;
		
	try
	{
    Class.forName("oracle.jdbc.driver.OracleDriver");	
	
    conn = DriverManager.getConnection(DB_URL,USER,PASS);	
	stmt = conn.createStatement();	
	// Step1
	rs = stmt.executeQuery("select * from Dept");	
	ArrayList<Dept>  deptList = new ArrayList<Dept>();
				
	while (rs.next()) 
	{	 // Step2
		Dept obj = new Dept();	 
		obj.setDeptno( rs.getInt(1));
		obj.setDname( rs.getString(2) );
		obj.setLoc(rs.getString(3) );		
		
		deptList.add(obj); 
	}
		 
	// Step3
	 Gson  gsonObj = new Gson();
	 String jsonData= gsonObj.toJson(deptList); 
	
response.setContentType("application/json");
response.setCharacterEncoding("UTF-8");
	
	response.getWriter().write(jsonData);  
}
 catch(Exception e)
 {
    e.printStackTrace();
 } 
 finally
 {
	   stmt.close();
	   conn.close();
 } 
 %> 
 
 
 
 
 
 
 
 
 
 