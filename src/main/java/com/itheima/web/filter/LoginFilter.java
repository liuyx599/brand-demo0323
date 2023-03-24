package com.itheima.web.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;


/**
 * 登录验证的过滤器
 * 访问服务器资源时，需要先进行登录验证，如果没有登录，则自动跳转到登录页面
 */


@WebFilter("/*")
public class LoginFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest req = (HttpServletRequest) request;  // 转为HttpServlet才能getSession

        // 访问的资源路径是否和登录注册相关
        String[] urls = {"/login.jsp", "/imgs/", "/css/", "/loginServlet", "/register.jsp", "/register.html", "/registerServlet", "/checkCodeServlet", "/selectUserServlet"};
        String url = req.getRequestURL().toString();
        System.out.println("url:" + url);
//
//        // 循环判断
//        for (String u : urls) {
//            if (url.contains(u)) {
//                // 找到了跟登录注册相关的url，无条件放行
//                // 无条件放行
//                chain.doFilter(request, response);
//                return;  // 放行之后， doFilter中后面的逻辑就不用再判断了
//            }
//        }
//
//        // 1 判断session中是否有user
//        HttpSession session = req.getSession();
//        Object user = session.getAttribute("user");
//
//        // 2 判断uer是否为null
//        if (user != null) {
//            // 登陆过了 放行
//            chain.doFilter(request, response);
//        } else {
//            // 没有登录，存储登录提示信息，并跳转到登录界面
//            req.setAttribute("login_msg", "您尚未登陆！");
//            // 转发到登录界面
//            req.getRequestDispatcher("/login.jsp").forward(req, response);
//        }
//

        // 放行
        chain.doFilter(request, response);
    }

    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }


}
