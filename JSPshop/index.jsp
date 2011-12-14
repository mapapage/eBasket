
<%@page import="javax.servlet.http.Cookie"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.*"%>

<%@page import="org.w3c.dom.*, javax.xml.parsers.*" %>
<%!
  public boolean isTextNode(Node n){
  return n.getNodeName().equals("#text");
  }
  
  
%>


<%

  Vector v = new Vector();
  String n;

  DocumentBuilderFactory docFactory = 
  DocumentBuilderFactory.newInstance();
  DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
  Document doc = docBuilder.parse("http://texwww.inf.uth.gr:8080/~mapapage/items.xml");
  
  Element  element = doc.getDocumentElement(); 
  NodeList personNodes = element.getChildNodes(); 
  for (int i=0; i<personNodes.getLength(); i++){
    Node emp = personNodes.item(i); 
    if (isTextNode(emp)) continue;
    NodeList NameDOBCity = emp.getChildNodes(); 
  
    for (int j=0; j<NameDOBCity.getLength(); j++ ){
        Node node = NameDOBCity.item(j);
        String s = node.getNodeName();  
        if ( isTextNode(node)) 
        continue;
 
      n=node.getFirstChild().getNodeValue();
      v.add(n);
    } 
    
}
  


  
 int qq_cafe,qq_sugar,qq_water;

             
 String q_cafe = request.getParameter("Cafe");
 String q_sugar = request.getParameter("Sugar") ;
 String q_water =  request.getParameter("Water") ;
 
 
if (q_cafe == null) qq_cafe = 0;
else qq_cafe = Integer.parseInt(q_cafe);
if (q_sugar == null ) qq_sugar = 0;
else qq_sugar = Integer.parseInt(q_sugar); 
if (q_water == null) qq_water = 0;
else qq_water = Integer.parseInt(q_water); 
 
 if(qq_cafe != 0)
  {
    Cookie cookie1 = new Cookie ("Cafeq", Integer.toString(qq_cafe));
      cookie1.setMaxAge(20);
    response.addCookie(cookie1);
 

    
  }
 
if(qq_sugar != 0)
  {
   Cookie cookie2 = new Cookie ("Sugarq", Integer.toString(qq_sugar));
    cookie2.setMaxAge(20);
    response.addCookie(cookie2);
   
    
  }
 
 if(qq_water != 0)
   {
    Cookie cookie3 = new Cookie ("Waterq", Integer.toString(qq_water));
      cookie3.setMaxAge(20);
    response.addCookie(cookie3);
  
   
   }
 
 Cookie[] cookies = request.getCookies();
 
if (cookies != null){
for (int i=0; i<cookies.length; i++) 
   {
       //out.println(cookies[i].getName()+" : "+cookies[i].getValue()+"<br/>");
         if(cookies[i].getName().equals("Cafeq") && qq_cafe==0){ qq_cafe= Integer.parseInt(cookies[i].getValue());}
         if(cookies[i].getName().equals("Sugarq") && qq_sugar==0){qq_sugar= Integer.parseInt(cookies[i].getValue());}
         if(cookies[i].getName().equals("Waterq") && qq_water==0){qq_water= Integer.parseInt(cookies[i].getValue());}

    }}


int array[] = new int[3];

double cost[] = new double[3];

double p_cafe = 18.5;
double p_sugar = 6.95;
double p_water = 1.29;


array[0] = qq_cafe;
array[1] = qq_sugar;
array[2] = qq_water;
  
double total = p_cafe*qq_cafe + p_sugar*qq_sugar + p_water*qq_water;
  
cost[0] = p_cafe*qq_cafe;
cost[1] = p_sugar*qq_sugar;
cost[2] = p_water*qq_water;
 
 
    

  

%>

<html>
  <head><title>Online Shopping Basket</title></head>
  <body>  
  <h1><font color='green'>Project 3</font></h1>
  <h2><font color='green'>Your e-Basket</font></h2>
  

  
  Enter the quantity of your items:
  <form method="get" action="index.jsp">
    
  <table border="2">
    
  <tr>
  <th>Name</th>
  <th>Price</th>
  <th>Quantity</th>
  <th>Total</th>
  </tr>
 
  <tr>
  <%
    int cnt = 0;
    int item = 0;
    int it = 0;
 
    String current_item;
    ListIterator iter = v.listIterator();
    
    for (int i=0;i<v.size();i++){
        if (cnt == 2){
    %>
    
    <td> <input type="text" name="<%=(String)v.get(i-2)%>" value="<%= array[item] %>"  /> </td>
    <%}
        
          if (cnt == 2){
    %>
    
    <td>  <%=cost[it]%> </td>
    <%}
        
      
   
            
           else{
         
           %>
           <td> <%= (String)v.get(i)%> </td>
           <%}
           
    
    
    if (cnt == 2){
        cnt=0;
        item ++;
        it++;
       
        %>
    </tr>
    <tr>
       <% 
    }
           else cnt++;
       }
  %>

    </tr>
    
    
  </table>
  
<br>
  
   <div>
    <input type="submit" value="Add to basket" />
  </div>
  
  </form>

  Your total is <%=total%>
  
  <br>
  
  
<h3><font color='green'>For more info download the code/report:</font></h3>


<form method="get" action="http://texwww.inf.uth.gr:8080/~mapapage/report.pdf">
    
<div>
<input type="submit" value="Report" onclick="repServlet" />
</div>

</form>


<form method="get" action="http://texwww.inf.uth.gr:8080/~mapapage/myCode.tar">
    
<div>
<input type="submit" value="SourceCode" onclick="SrcServlet" />
</div>

</form>

<br>

<h4><font color='green'>..by Papageorgiou Marilena</font></h4>
<p><a href="http://github.com/mapapage/eBasket">My GitHub</a></p>


  </body>
</html> 


 























