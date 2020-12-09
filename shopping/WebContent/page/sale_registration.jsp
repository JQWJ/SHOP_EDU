<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<h3>판매 등록</h3>

<%
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            Connection conn = DriverManager.getConnection
                                ("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
            
            Statement stmt = conn.createStatement();
           
			%>

<form action="action/sale_insert.jsp" method="post" name="action_form">
<table border="1">
	<tr>
		<td>판매한 상품</td>
		<td>
			<select name="product_id">
				<option value="0">값을 선택해주세요</option>
				<%
					String query = "SELECT PRODUCT_ID, NAME FROM PRODUCT ";
					ResultSet rs = stmt.executeQuery(query);
					
					while (rs.next()) {
						%> <option value="<%=rs.getInt(1) %>"> <%=rs.getString(2) %> <%
					}
				%>
			</select>
		</td>
	</tr>
	<tr>
		<td>수량</td>
		<td><input type="number" name="amount"></td>
	</tr>
	<tr>
		<td>판매 날짜</td>
		<td><input type="date" name="purchase_date"></td>
	</tr>
	<tr>
		<td>
			<input type="radio" name="gender" value="male"><a>남</a>
			<input type="radio" name="gender" value="female"><a>여</a>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" value="등록하기" onclick="submit_form()">
			<input type="button" value="다시쓰기" onclick="reset_form()">
		</td>
	</tr>
</table>
</form>

<script>
	function submit_form() {
		if(document.action_form.amount.value === "") {
			alert("수량을 입력해 주세요");
			return;
		} 
			
		if(document.action_form.purchase_date.value === "") {
			alert("날짜를 입력해주세요");
			return;
		}
		
		if(document.action_form.product_id.selectedIndex <= 0) {
			document.action_form.product_id.focus();
			alert("판매 상품을 선택하여 주세요");
			return;
		}
		
		alert("등록을 하겠씁니다!");
		document.action_form.submit();
	}
</script>

<script>
	function reset_form() {
		document.action_form.reset();
	}
</script>
            
<%
            stmt.close();
            conn.close();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
%>
