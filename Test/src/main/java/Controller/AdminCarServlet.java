package Controller;

import Model.BookCar;
import Model.Car;
import Service.CarService;

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

@WebServlet("/Admin")
public class AdminCarServlet extends HttpServlet {
    CarService carService = new CarService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String acction = request.getParameter("action");

        if (acction == null){
            acction ="";
        }
        try{
            switch (acction){
                case "add":
                    insertCar(request,response);
                    break;
                case "search":
                    searchBy(request,response);
                    break;
                case "update":
                    updateProduct(request,response);
                    break;
                case "delete":
                    deleteProduct(request,response);
                    break;
                case "logOut":
                    logout(request,response);
                    break;
                case "back":
                    selectAllAdmin(request,response);
                    break;
                default:
                    selectAllAdmin(request,response);
                    break;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String acction = request.getParameter("action");
        ClientCarServlet clientCarServlet = new ClientCarServlet();
        if (acction == null){
            acction ="";
        }
        switch (acction){
            case "checkbookdate":
                checkBookCar(request,response);
                break;
            case "home":
                selectAllAdmin(request,response);
                break;
            default:
                login(request,response);
                break;
        }
    }

    protected void insertCar (HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String carName = request.getParameter("carName");
        String carImg = request.getParameter("carImg");
        String carPrice = request.getParameter("carPrice");
        String carDescription = request.getParameter("carDescription");
        Car newCar =new Car(carName,carImg,carPrice,carDescription);
        carService.add(newCar);
        selectAllAdmin(request,response);
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
        RequestDispatcher rq = request.getRequestDispatcher("/View/HomePage.jsp");
        rq.forward(request, response);
    }

    protected void updateProduct(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        int id =Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("carName");
        String img = request.getParameter("carImg");
        String price = request.getParameter("carPrice");
        String description = request.getParameter("carDescription");
        Car car = new Car(name,img,price,description,id);
        carService.updateCar(car);
        selectAllAdmin(request,response);
    }

    protected void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        carService.removeCar(id);
        selectAllAdmin(request,response);
    }
    public void selectAllAdmin(HttpServletRequest request, HttpServletResponse response){
        try {
            List<Car> carList = carService.selectAll();
            request.setAttribute("carlist",carList);
            RequestDispatcher rq = request.getRequestDispatcher("/View/HomePage.jsp");
            rq.forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void checkBookCar(HttpServletRequest request, HttpServletResponse response){
        try{
            List<BookCar> list= carService.selectCalendarBook();
            request.setAttribute("list",list);
            RequestDispatcher rq = request.getRequestDispatcher("/View/viewBook.jsp");
            rq.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
    protected void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("account");
        response.sendRedirect("/Client");
    }
    protected void login(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        if (session.getAttribute("account") == null){
            response.sendRedirect("/Client");
            return;
        }

        request.getRequestDispatcher("View/HomePage.jsp").forward(request, response);
    }
}
