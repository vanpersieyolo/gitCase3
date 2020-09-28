package Model;


public class BookCar {
    private int idBC;
    private String name , phone, email, date;
    private int car_id;
    private String car_name;

    public BookCar(String name, String phone, String email, String date, int car_id, String car_name) {
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.date = date;
        this.car_id = car_id;
        this.car_name = car_name;
    }

    public String getCar_name() {
        return car_name;
    }

    public void setCar_name(String car_name) {
        this.car_name = car_name;
    }

    public BookCar(String name, String phone, String email, String date, int car_id) {
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.date = date;
        this.car_id = car_id;
    }

    public int getIdBC() {
        return idBC;
    }

    public void setIdBC(int idBC) {
        this.idBC = idBC;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getCar_id() {
        return car_id;
    }

    public void setCar_id(int car_id) {
        this.car_id = car_id;
    }
}
