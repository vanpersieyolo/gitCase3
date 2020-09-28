//package Controller;
//
//import Model.Admin;
//import Model.BookCar;
//import Model.Car;
//import Service.CarService;
//
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import java.io.IOException;
//import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.List;
//
//@WebServlet("/cars")
//public class CarServlet extends HttpServlet {
//    CarService carService = new CarService();
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//       String acction = request.getParameter("action");
//
//       if (acction == null){
//           acction ="";
//       }
//       try{
//           switch (acction){
//               case "add":
//                   insertCar(request,response);
//                   break;
//               case "search":
//                   searchBy(request,response);
//                   break;
//               case "update":
//                   updateProduct(request,response);
//                   break;
//               case "delete":
//                   deleteProduct(request,response);
//                   break;
//               case "login":
//                   login(request,response);
//                   break;
//               case "bookcar":
//                   insertDate(request,response);
//                   break;
//               default:
//                   selectAll(request,response);
//                   break;
//           }
//       }catch (SQLException e){
//           e.printStackTrace();
//       }
//
//    }
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String action = request.getParameter("action");
//
//        if (action == null) {
//            action = "";
//        }
//        switch (action) {
//            case "edit":
//                break;
//            case "search":
//                break;
//            case "checkbookdate":
//                checkBookCar(request,response);
//                break;
//            default:
//                selectAll(request,response);
//                break;
//        }
//    }
//
//    protected  void selectAll(HttpServletRequest request, HttpServletResponse response){
//        try {
//            List<Car> carList = carService.selectAll();
//            request.setAttribute("carlist",carList);
//            RequestDispatcher rq = request.getRequestDispatcher("/ViewClient/ClientHomePage.jsp");
//            rq.forward(request, response);
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } catch (ServletException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//    }
//    protected  void selectAllAdmin(HttpServletRequest request, HttpServletResponse response){
//        try {
//            List<Car> carList = carService.selectAll();
//            request.setAttribute("carlist",carList);
//            RequestDispatcher rq = request.getRequestDispatcher("/View/HomePage.jsp");
//            rq.forward(request, response);
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } catch (ServletException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//    }
//    // chức năng thêm mới
//    protected void insertCar (HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
//        String carName = request.getParameter("carName");
//        String carImg = request.getParameter("carImg");
//        String carPrice = request.getParameter("carPrice");
//        String carDescription = request.getParameter("carDescription");
//        Car newCar =new Car(carName,carImg,carPrice,carDescription);
//        carService.add(newCar);
//        selectAllAdmin(request,response);
//    }
//    // chức năng tìm kiếm
//    protected void searchBy(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
//        List<Car> carList = carService.selectAll();
//        List<Car> cars = new ArrayList<>();
//        String search = request.getParameter("search");
//        for (Car car : carList){
//            if (car.getCarName().contains(search) || car.getDescription().contains(search)){
//                cars.add(car);
//            }
//        }
//        request.setAttribute("carlist",cars);
//        RequestDispatcher rq = request.getRequestDispatcher("/View/HomePage.jsp");
//        rq.forward(request, response);
//    }
//    //chức năng xóa
//    protected void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
//        int id = Integer.parseInt(request.getParameter("id"));
//        carService.removeCar(id);
//        selectAllAdmin(request,response);
//    }
//    //chức năng update
//    protected void updateProduct(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
//        int id =Integer.parseInt(request.getParameter("id"));
//        String name = request.getParameter("carName");
//        String img = request.getParameter("carImg");
//        String price = request.getParameter("carPrice");
//        String description = request.getParameter("carDescription");
//        Car car = new Car(name,img,price,description,id);
//
//        carService.updateCar(car);
//        response.sendRedirect("/cars");
//    }
//    protected void login(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
//        HttpSession session = request.getSession();
//        String account = request.getParameter("account");
//        String password = request.getParameter("passwords");
//        Admin admin = carService.checklogin(account,password);
//
//        if (admin == null){
//            response.sendRedirect("/cars");
//        }else{
//            session.setAttribute("account",account);
//            session.setAttribute("password",password);
//            response.sendRedirect("/car/action?");
//        }
//    }
//    //chức năng đặt lịch phía client
//    protected void insertDate(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        String name =request.getParameter("customer_name");
//        String phone = request.getParameter("customer_phone");
//        String email = request.getParameter("customer_email");
//        String time = request.getParameter("time");
//        int car_id =Integer.parseInt(request.getParameter("id"));
//        BookCar bookCar = new BookCar(name,phone,email,time,car_id);
//
//        carService.addCalendarBookCar(bookCar);
//        response.sendRedirect("/cars");
//    }
//    // chức năng xem lịch sử đặt xe
//    protected void checkBookCar(HttpServletRequest request, HttpServletResponse response){
//        try{
//            List<BookCar> list= carService.selectCalendarBook();
//            request.setAttribute("list",list);
//            RequestDispatcher rq = request.getRequestDispatcher("/View/viewBook.jsp");
//            rq.forward(request, response);
//        } catch (ServletException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//
//    }
//}
