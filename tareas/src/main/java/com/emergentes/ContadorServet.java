
package com.emergentes;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ContadorServet", urlPatterns = {"/ContadorServet"})
public class ContadorServet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int contador = 0;
        
        
        Cookie[] cuki = request.getCookies();
        
        if (cuki != null) {
            for (Cookie c : cuki) {
                if (c.getName().equals("visitas")) {
                    contador = Integer.parseInt(c.getValue());
                }
            }
        }
        
        contador++;
        
        Cookie c = new Cookie("visitas",Integer.toString(contador));
        
        c.setMaxAge(30);
        response.addCookie(c);
        //generar contenido a partir del servet
        response.setContentType("text/html");
        
        PrintWriter out = response.getWriter();
        
        if (contador==1) {
            out.println("Bienvenido a nuestro sitio WEB");
        }else{
            out.println("Gracias por Visitarnos Nueva mente");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
