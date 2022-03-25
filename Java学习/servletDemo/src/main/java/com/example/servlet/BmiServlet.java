package com.example.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "BmiServlet", value = "/BmiServlet")
public class BmiServlet extends HttpServlet {
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
        String height = request.getParameter("height");
        String weight = request.getParameter("weight");
        System.out.println("Servlet:"+username);
        System.out.println("Servlet:"+height);
        System.out.println("Servlet:"+weight);
        boolean flag = true;

        double bmi = 0;
        try {
            double h = Double.parseDouble(height);
            double w = Double.parseDouble(weight);

            bmi = w/h/h;
        } catch (NumberFormatException e) {
            flag = false;
            e.printStackTrace();
        }
        //获取流之前设置响应类型
        response.setContentType("text/html;charset = utf-8");
        //网页输出
        PrintWriter pw = response.getWriter();
        pw.println("<html>");
        pw.println("<body>");
        if(flag){
            pw.println("<h1>"+username+"的BMI:"+bmi+"</h1>");
        }else{
            pw.println("<h1>"+"输入有错误"+"</h1>");
        }

        pw.println("</body>");
        pw.println("</html>");

        pw.close();

    }
}
