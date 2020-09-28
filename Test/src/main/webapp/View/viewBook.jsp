<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 9/26/2020
  Time: 11:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Danh sách những khách hàng đăng kí lái thử </title>
</head>
<body>
<center><h2>Danh sách những người đăng kí lái thử</h2>
    <form action="/Admin?action=back" method="post">
        <button type="submit" class="btn btn-dark">Back</button>
    </form>
</center>

<center>
    <table border="1" cellpadding="5">
        <caption><h3>Lịch người dùng đã đặt</h3></caption>
        <tr>
            <th>TÊN KHÁCH HÀNG</th>
            <th>SỐ ĐIỆN THOẠI</th>
            <th>EMAIL</th>
            <th>NGÀY ĐẶT</th>
            <th>MÃ XE</th>
            <th>TÊN XE</th>
        </tr>
        <c:forEach var="book" items="${list}">
            <tr>
                <td><c:out value="${book.name}"/></td>
                <td><c:out value="${book.phone}"/></td>
                <td><c:out value="${book.email}"/></td>
                <td><c:out value="${book.date}"/></td>
                <td><c:out value="${book.car_id}"/></td>
                <td><c:out value="${book.car_name}"/></td>
            </tr>
        </c:forEach>
    </table>
</center>

</body>
</html>