package com.example.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "FormServlet", value = "/FormServlet")
public class FormServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //通过request对象获取表单传来的值
        String username = request.getParameter("username");
        System.out.println("Servlet:"+username);

        //获取流之前设置响应类型
        response.setContentType("text/html;charset = utf-8");
        //网页输出
        PrintWriter pw = response.getWriter();
        pw.println("<html>");
        pw.println("<body>");
        pw.println("<h1>欢迎你"+username+"</h1>");
        pw.println("</body>");
        pw.println("</html>");

        pw.close();



    }
}
