<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<h3>카테고리별 매출현황 조회</h3>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
</head>
<body>
<h3>통합 매출 내역 조회</h3>
<table border=1>
	<tr>
		<td>카테고리 이름</td>
		<td>총 판매 금액</td>
		<td>판매 개수</td>
	</tr>
    <%
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            Connection conn = DriverManager.getConnection
                                ("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
            
            Statement stmt = conn.createStatement();
            String query = "SELECT " +
            	    	   "CATEGORY.NAME, SUM(SALE.SALE_PRICE), SUM(SALE.AMOUNT) " +
            	    	   "FROM " +
            	           "SALE, " +
            	           "PRODUCT, " +
            	           "CATEGORY " +
            	    	   "WHERE " +
            	        "SALE.PRODUCT_ID = PRODUCT.PRODUCT_ID AND " +
            	        "CATEGORY.CATEGORY_ID = PRODUCT.CATEGORY_ID " +
            	        "GROUP BY " +
            	        "CATEGORY.CATEGORY_ID, CATEGORY.NAME ";
            ResultSet rs = stmt.executeQuery(query);
            
            while (rs.next()) {
                %>
                	<tr>
                		<td><%=rs.getString(1) %></td>
                		<td><%=rs.getInt(2) %></td>
                		<td><%=rs.getInt(3) %></td>
                	</tr>
                <%
            }

            stmt.close();
            conn.close();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
%>
</table>
</body>
</html>