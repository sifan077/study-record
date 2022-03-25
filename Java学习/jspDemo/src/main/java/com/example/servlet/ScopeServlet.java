package com.example.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ScopeServlet", value = "/scope")
public class ScopeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("requestScope", "bbb");
        //转发

        req.getRequestDispatcher("09-内置对象/09-内置对象.jsp").forward(req, resp);

        req.getSession().setAttribute("sessionScope","ccc");
        
        req.getServletContext().setAttribute("servletContextScope","ddd");

        resp.sendRedirect(req.getContextPath()+"/09-内置对象/09-内置对象.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
