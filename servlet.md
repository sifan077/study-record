# Servlet

### 1. HelloWorld

Java实现Servlet需要继承HttpServlet类，把注解@WebServlet() 的 value中设置路径。

重写doGet(HttpServletRequest request, HttpServletResponse response)

或者 doPost(HttpServletRequest request, HttpServletResponse response)即可。

```java
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ServletDemo", value = "/ServletDemo")
public class ServletDemo extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();   //获取打印到网页的流
        out.println("<html><body>");              //打印到网页 
        out.println("<h1>" + "servletDemo" + "</h1>");
        out.println("</bod  y></html>");
        out.close();                              //关闭流
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
```

