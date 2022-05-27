<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%

    request.setCharacterEncoding("utf-8");
    String code = request.getParameter("code");
    String name = request.getParameter("name");
    String dept = request.getParameter("dept");
    String phone = request.getParameter("phone");


    String url_mysql = "jdbc:mysql://localhost/education?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
    String id_mysql="root";
    String pw_mysql="qwer1234";

    PreparedStatement ps = null;

    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
        Statement stmt_mysql = conn_mysql.createStatement();

        String act1 = "update student set sname = ?, sdept= ?, sphone= ?";
        String act2 = "where scode = ?";

        ps = conn_mysql.prepareStatement(act1+act2);
        ps.setString(1, name);
        ps.setString(2, dept);
        ps.setString(3, phone);
        ps.setString(4, code);

        ps.executeUpdate();
        conn_mysql.close();
%>
    {"result":"OK"}

<%
    }catch(Exception e){
%>
    {"result":"ERROR"}
<%
    }
%>