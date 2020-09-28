package Service;

import Model.BookCar;
import Model.Car;

import java.sql.SQLException;
import java.util.List;

public interface ICarService {
    boolean add (Car car) throws SQLException;
    List<Car> selectAll() throws SQLException;
    boolean removeCar(int id) throws SQLException;
    boolean updateCar(Car car) throws SQLException;
    boolean addCalendarBookCar(BookCar bookCar);
    List<BookCar> selectCalendarBook();
}
