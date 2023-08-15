<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="javax.activation.*" %>

<html>
<head>
<title>mail app</title>
<style>*{font-size:50px;}</style>
</head>

<body> <center>
  <h1>newletter app</h1>
<form>
  <input type="email" name="email" placeholder="enter your email" required/>
 <br/><br/>   
<input type="submit" value="sub" name="btnsub"/><br/><br/>
  <input type="submit" value="unsub" name="btnunsub"/><br/><br/>
</form>

<%
   if(request.getParameter("btnsub")!=null)
   {
     String email=request.getParameter("email");
     
    try{

      DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
      String url="jdbc:mysql://localhost:3306/email_6jan23";
      Connection con=DriverManager.getConnection(url,"root","abc456");
      String sql="insert into sub values(?)";
      PreparedStatement pst=con.prepareStatement(sql);
      pst.setString(1,email);
      pst.executeUpdate();

      out.println("thank u for sub.");

  {
    Properties p =System.getProperties();
    p.put("mail.smtp.host","smtp.gmail.com");
    p.put("mail.smtp.port",587);
    p.put("mail.smtp.auth",true);
    p.put("mail.smtp.starttls.enable",true);

//aapna un and pw ka authentication 
 
Session ms=Session.getInstance(p,new Authenticator(){
public PasswordAuthentication getPasswordAuthentication(){

   String un="tester.parag.6jan23@gmail.com";
   String pw="ikhbbzfqxawiqneg";
   return new PasswordAuthentication(un,pw);
}

});
try{
//mail ko draft karke bhejo

 MimeMessage msg=new MimeMessage(ms);
String subject="newsletter application " ;
 msg.setSubject(subject);
String txt="ty for subcription";
 msg.setText(txt);
msg.setFrom(new InternetAddress("tester.parag.6jan23@gmail.com"));
msg.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
 Transport.send(msg);
} catch(Exception e)
 { out.println("issue " +e);}
 
  }
   
       con.close();
 }catch(SQLException es)
  {out.println("issue "+ es + "u already subs");}
    }



  else   if(request.getParameter("btnunsub")!=null)
   {
     String email=request.getParameter("email");
     
    try{

      DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
      String url="jdbc:mysql://localhost:3306/email_6jan23";
      Connection con=DriverManager.getConnection(url,"root","abc456");
      String sql="delete from sub where email=?";
      PreparedStatement pst=con.prepareStatement(sql);
      pst.setString(1,email);
     long ans= pst.executeUpdate();
      
     if(ans==1){
      out.println("u have been unsub.");}
     else
         out.println("u have not sub yet");

    
  {
    Properties p =System.getProperties();
    p.put("mail.smtp.host","smtp.gmail.com");
    p.put("mail.smtp.port",587);
    p.put("mail.smtp.auth",true);
    p.put("mail.smtp.starttls.enable",true);

//aapna un and pw ka authentication 
 
Session ms=Session.getInstance(p,new Authenticator(){
public PasswordAuthentication getPasswordAuthentication(){

   String un="tester.parag.6jan23@gmail.com";
   String pw="ikhbbzfqxawiqneg";
   return new PasswordAuthentication(un,pw);
}

});
try{
//mail ko draft karke bhejo

 MimeMessage msg=new MimeMessage(ms);
String subject="newsletter application " ;
 msg.setSubject(subject);
String txt="sorry for disappointing hopw we meet again";
 msg.setText(txt);
msg.setFrom(new InternetAddress("tester.parag.6jan23@gmail.com"));
msg.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
 Transport.send(msg);
} catch(Exception e)
 { out.println("issue " +e);}
 
  }

       con.close();
 }catch(SQLException es)
  {out.println("issue "+ es + "u already subs");}
    }
      

%>

</center>
</body>


</html>




