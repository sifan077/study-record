package com.example.listener;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebListener
public class ContextLoaderListener implements ServletContextListener, HttpSessionListener, HttpSessionAttributeListener {

    int count=0;
    public ContextLoaderListener() {
    }


    //监听servletContext对象创建的。servletContext对象服务器启动后自动创建
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        /* This method is called when the servlet context is initialized(when the Web application is deployed). */
        System.out.println("servletContext对象创建了");
    }

    //servletContext对象服务器关闭后后自动销毁,服务器正常关闭后会调用执行
    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        /* This method is called when the servlet Context is undeployed or Application Server shuts down. */
        System.out.println("servletContext对象销毁了");
    }

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        /* Session is created. */
        ServletContext context=se.getSession().getServletContext();
        Integer count=(Integer)context.getAttribute("count");
        if(count==null){
            count=1;
        }else {
            count++;
        }
        context.setAttribute("count", count);
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        /* Session is destroyed. */
        ServletContext context=se.getSession().getServletContext();
        Integer count=(Integer)context.getAttribute("count");
        count--;
        context.setAttribute("count", count);
    }

    @Override
    public void attributeAdded(HttpSessionBindingEvent sbe) {
        /* This method is called when an attribute is added to a session. */
    }

    @Override
    public void attributeRemoved(HttpSessionBindingEvent sbe) {
        /* This method is called when an attribute is removed from a session. */
    }

    @Override
    public void attributeReplaced(HttpSessionBindingEvent sbe) {
        /* This method is called when an attribute is replaced in a session. */
    }
}
