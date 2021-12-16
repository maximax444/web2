package controller;

import model.Results;
import model.Shoot;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@WebServlet("/main")
public class AreaCheckServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long startTime = System.nanoTime();
        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter output = resp.getWriter();
        output.println("Начался чек");
        try {
            output.println("берем числа");
            double x = Double.parseDouble(req.getParameter("coordX"));
            double y = Double.parseDouble(req.getParameter("coordY"));
            double r = Double.parseDouble(req.getParameter("coordR"));
            output.println("взяли");
            output.println(x);
            output.println(y);
            output.println(r);
            Results results = (Results) req.getSession().getAttribute("shots");
            output.println("создали объект");
            /*create shoot*/
            SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
            String curTime = dateFormat.format(new Date());
            double execTime = (double) (System.nanoTime() - startTime) / 1000000;
            output.println(isShoot(x, y,r));
            output.println(curTime);
            output.println(execTime);
            Shoot shoot = new Shoot(x, y, r, isShoot(x, y,r), curTime,execTime);
            output.println(execTime);
            System.out.println(shoot.toString());
            if (results == null) {
                output.println("создаем результаты");
                results = new Results(shoot);
                output.println("создаем результаты2");
            } else {
                results.getShootsList().add(shoot);
            }
            System.out.println(results.toString());



            output.println(isValid(x, y, r));

            /*if (isValid(x, y, r)) {
                Shoot shoot = createShoot(req, startTime);
                output.println(results.getShootsList());

                if(results.getShootsList() == null) {
                    results = new Results();
                }
                output.println(results.getShootsList());
                results.getShootsList().add(shoot);
            } else {
                output.println(results.toString());

            }*/
            output.println("проверили");

            output.println("вывели лист");
            req.getSession().setAttribute("shots", results);
            output.println("записали в сессию");
            req.getRequestDispatcher(("/result.jsp")).forward(req, resp);

        } catch (NumberFormatException | ServletException e) {
            output.println("Формат координат некорректен");
        } finally {
            output.close();
        }
    }



    private boolean isValid(double x, double y, double r) {
        return (x >= -3 && x <= 5) && (y >= -5 && y <= 5) && (r >= 1 && r <= 5);
    }

    private boolean isShoot(double x, double y, double r) {
        return checkRectangle(x, y, r) || checkTriangle(x, y, r) || checkCircle(x, y, r);
    }

    private boolean checkRectangle(double x, double y, double r) {
        return x <= 0 && y >= 0 && y <= r/2 && x >= -r;
    }

    private boolean checkTriangle(double x, double y, double r) {
        return y >= -(r / 2 + 0.5 * x) && x <= 0 && y <= 0;
    }

    private boolean checkCircle(double x, double y, double r) {
        return (x * x + y * y) <= (r/2) * (r/2) && x >= 0 && y <= 0;
    }
}
