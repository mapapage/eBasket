<%@page import="javax.xml.parsers.DocumentBuilder"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@page import="java.util.*"%>
<%@page import="org.w3c.dom.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<jsp:useBean id="cafe" class="foo.calcQuantity" scope="application" />
<jsp:setProperty name="cafe" property="*"/>

<jsp:useBean id="sugar" class="foo.calcQuantity" scope="application"/>
<jsp:setProperty name="sugar" property="*"/>

<jsp:useBean id="water" class="foo.calcQuantity" scope="application"/>
<jsp:setProperty name="water" property="*"/>


<%!
  public boolean isTextNode(Node n){
  return n.getNodeName().equals("#text");
  }
  
  
%>


<%!
  Vector v = new Vector();
  String n;
%>

<%
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
  

%>

<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=utf-8" >
    <title>Online Shopping Basket</title>

<body>  
<h1><font color='purple'>&nbsp;&nbsp;Project 3</font></h1>
<h2><font color='purple'>Your e-Basket</font></h2>

<br>

<h4><font color='purple'>Enter the quantity of your items:</font></h4>


<form method=POST action="index.jsp">
<table border="2">
    
<tr>
<th>Item</th>
<th>Price</th>
<th>Quantity</th>
<th>Total</th>
</tr>
	
<tr>
<td>Cafe</td>
<td><%=(String)v.get(1) %> </td>
<td>
    <input type="text" name="qcafe" size="6" value="${cafe.qcafe}">
</td>
<td>${18.50 * cafe.qcafe}</td>
</tr>

<tr>
<td>Sugar</td>
<td><%=(String)v.get(3) %></td>
<td>
    <input type="text" name="qsugar" size="6" value="${sugar.qsugar}">
</td>

<td>${6.95 * sugar.qsugar}</td>
</tr>

<tr>
<td>Water</td>
<td><%=(String)v.get(5) %></td>
<td>
    <input type="text" name="qwater" size="6" value="${water.qwater}">
</td>

<td>${1.29 * water.qwater}</td>
</tr>

<tr>
<td>Total:</td>
<td></td>
<td></td>

<td>
    ${(18.50 * cafe.qcafe)+(6.95 * sugar.qsugar)+(1.29 * water.qwater)}
</td>
</tr>

</tbody>
</table>

<br>

<div>
<input type=submit name="Add" value="Add to basket">
</div>
</form>

<br>
<br>

<h3><font color='purple'>For more info download the code/report:</font></h3>

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


<br><br>


<h4><font color='purple'>..by Papageorgiou Marilena</font></h4>
<p><a href="http://github.com/mapapage/eBasket">My GitHub</a></p>

</body>
</html>
