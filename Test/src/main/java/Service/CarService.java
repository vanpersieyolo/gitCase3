package Service;

import Controller.AdminCarServlet;
import Model.Admin;
import Model.BookCar;
import Model.Car;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CarService implements ICarService {
    private String jdbcURL = "jdbc:mysql://localhost:3306/SellCar?useSSL=false";
    private String jdbcUsername = "root";
//    private String jdbcPassword = "danganhvan";
    private String jdbcPassword = "123456";
//    private String jdbcPassword = "djenha88";



    public CarService() {

    }

    protected Connection getConnection() throws SQLException {

        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }
    @Override
    public boolean add(Car car) throws SQLException {
        boolean check =false;
        String query = "{call insert_car(?,?,?,?)}";
        try (Connection connection = getConnection(); CallableStatement callableStatement = connection.prepareCall(query);) {
            callableStatement.setString(1, car.getCarName());
            callableStatement.setString(2, car.getCarImg());
            callableStatement.setString(3, car.getCarPrice());
            callableStatement.setString(4, car.getDescription());
            check = callableStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return check;

    }

    @Override
    public List<Car> selectAll() throws SQLException {
        Car car = null;
        String query = "{call select_all()}";
        List<Car> carList = new ArrayList<>();
        Connection connection = getConnection();
        CallableStatement callableStatement = connection.prepareCall(query);
        ResultSet rs = callableStatement.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("car_id");
            String name = rs.getString("car_name");
            String img = rs.getString("car_img");
            String price = rs.getString("car_price");
            String des = rs.getString("car_description");
            car = new Car(name, img, price, des, id);
            carList.add(car);
        }
        return carList;
    }

    @Override
    public boolean removeCar(int id) throws SQLException {
        boolean removeComplete;
        String query = "{call delete_car(?)}";
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(query)) {
            callableStatement.setInt(1, id);
            removeComplete = callableStatement.executeUpdate() > 0;
        }
        return removeComplete;
    }

    @Override
    public boolean updateCar(Car car) throws SQLException {
        boolean updateComplete;
        String query ="{call update_car(?,?,?,?,?)}";
        Connection connection = getConnection();
            CallableStatement callableStatement = connection.prepareCall(query);
            callableStatement.setInt(1, car.getId());
            callableStatement.setString(2, car.getCarName());
            callableStatement.setString(3, car.getCarImg());
            callableStatement.setString(4, car.getCarPrice());
            callableStatement.setString(5, car.getDescription());
            updateComplete = callableStatement.executeUpdate() > 0;
        return updateComplete;
    }

    @Override
    public boolean addCalendarBookCar(BookCar bookCar) {
        boolean checkAdd =false;
        String query= "{call book_car(?,?,?,?,?)}";
        try (Connection connection = getConnection(); CallableStatement callableStatement = connection.prepareCall(query);) {
            callableStatement.setString(1, bookCar.getName());
            callableStatement.setString(2, bookCar.getPhone());
            callableStatement.setString(3, bookCar.getEmail());
            callableStatement.setString(4, bookCar.getDate());
            callableStatement.setInt(5, bookCar.getCar_id());
            checkAdd = callableStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return checkAdd;
    }

    @Override
    public List<BookCar> selectCalendarBook() {
        String query = "{call select_calendar_book()}";
        List<BookCar> list = new ArrayList<>();
        try(Connection connection = getConnection();
            CallableStatement callableStatement = connection.prepareCall(query);) {
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                int id_car = rs.getInt("car_id");
                String name_car = rs.getString("car_name");
                String name = rs.getString("customer_name");
                String phone = rs.getString("customer_phone");
                String email = rs.getString("customer_email");
                String date = rs.getString("order_date");
                list.add(new BookCar(name,phone,email,date,id_car,name_car));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public Admin checklogin(String account, String password){

        String query = "{call check_login(?,?)}";
        try {
            Connection connection = getConnection();
            CallableStatement callableStatement = connection.prepareCall(query);
            callableStatement.setString(1,account);
            callableStatement.setString(2,password);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()){
                 Admin admin1 = new Admin(resultSet.getString(1),resultSet.getString(2));
                 return admin1;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

}
