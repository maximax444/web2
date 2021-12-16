package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/check")
public class ControllerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            if (req.getParameter("coordX") != null && req.getParameter("coordY") != null && req.getParameter("coordR") != null) {
                getServletContext().getRequestDispatcher("/main").forward(req, resp);
            } else if (req.getParameter("clear").equals("true")) {
                getServletContext().getRequestDispatcher("/clear").forward(req, resp);
            } else getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
        } catch (NullPointerException | NumberFormatException e) {
            System.out.println(e.getClass());
            getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
        }
    }
}
