package Controller;

import Model.Admin;
import Model.BookCar;
import Model.Car;
import Service.CarService;

import javax.faces.lifecycle.LifecycleFactory;
import javax.jms.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/Client")
public class ClientCarServlet extends HttpServlet {
    CarService carService = new CarService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String acction = request.getParameter("action");

        if (acction == null){
            acction ="";
        }
        try{
            switch (acction){
                case "search":
                    searchBy(request,response);
                    break;
                case "login":
                    login(request,response);
                    break;
                case "bookcar":
                    insertDate(request,response);
                    break;
                default:
                    selectAll(request,response);
                    break;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        selectAll(request,response);
    }
    protected void searchBy(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Car> carList = carService.selectAll();
        List<Car> cars = new ArrayList<>();
        String search = request.getParameter("search");
        for (Car car : carList){
            String typeCar = car.getCarName().toLowerCase();
            String typeDetail = car.getDescription().toLowerCase();
            if (typeCar.contains(search.toLowerCase()) || typeDetail.contains(search.toLowerCase())){
                cars.add(car);
            }
        }
        request.setAttribute("carlist",cars);
        RequestDispatcher rq = request.getRequestDispatcher("/ViewClient/ClientHomePage.jsp");
        rq.forward(request, response);
    }
    protected HttpSession login(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        AdminCarServlet adminsl = new AdminCarServlet();
        HttpSession session = request.getSession();
        String account = request.getParameter("account");
        String password = request.getParameter("passwords");
        Admin admin = carService.checklogin(account,password);
        if (admin == null){
            response.sendRedirect("/Client");
        }else{
            session.setAttribute("account",account);
            session.setAttribute("password",password);
            adminsl.selectAllAdmin(request,response);
        }
        return session;
    }

    protected void insertDate(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name =request.getParameter("customer_name");
        String phone = request.getParameter("customer_phone");
        String email = request.getParameter("customer_email");
        String time = request.getParameter("time");
        int car_id =Integer.parseInt(request.getParameter("id"));
        BookCar bookCar = new BookCar(name,phone,email,time,car_id);

        carService.addCalendarBookCar(bookCar);
        response.sendRedirect("/Client");
    }
    protected  void selectAll(HttpServletRequest request, HttpServletResponse response){
        try {
            List<Car> carList = carService.selectAll();
            request.setAttribute("carlist",carList);
            RequestDispatcher rq = request.getRequestDispatcher("/ViewClient/ClientHomePage.jsp");
            rq.forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
