package Model;

public class Car {
    int id;
    String carName;
    String carImg;
    String carPrice;
    String description;

    public Car(String carName, String carImg, String carPrice, String description, int id) {
        this.carName = carName;
        this.carImg = carImg;
        this.carPrice = carPrice;
        this.description = description;
        this.id = id;
    }
    public Car(String carName, String carImg, String carPrice, String description) {
        this.carName = carName;
        this.carImg = carImg;
        this.carPrice = carPrice;
        this.description = description;
    }

    public String getCarName() {
        return carName;
    }

    public void setCarName(String carName) {
        this.carName = carName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCarImg() {
        return carImg;
    }

    public void setCarImg(String carImg) {
        this.carImg = carImg;
    }

    public String getCarPrice() {
        return carPrice;
    }

    public void setCarPrice(String carPrice) {
        this.carPrice = carPrice;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
