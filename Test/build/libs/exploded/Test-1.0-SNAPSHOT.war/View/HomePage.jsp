<%--
  Created by IntelliJ IDEA.
  User: DANG ANH VAN
  Date: 9/23/2020
  Time: 10:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Home Page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark" >
    <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
            <i class="fad fa-rocket-launch"></i>
        </li>
        <li class="nav-item active">
            <a class="nav-link" href="#"><h1 style="font-family: monospace">V&T SHOWROOM</h1></a>
        </li>
    </ul>

    <form class="form-inline my-2 my-lg-0" action="/cars?action=search" method="post">
        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="search">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Tìm kiếm</button>
    </form>
</nav>
<div style=" border: black solid 1px">
    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="d-block w-100" src="../bmw.jpg" alt="First slide" style="width: 50% ; height: 700px">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="../posher1.jpg" alt="Second slide" style="width: 50% ; height: 700px">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="../merce.jpg" alt="Third slide" style="width: 50%; height: 700px">
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <div class="container">
        <%--        <a href="/cars?action=">Trở về trang trước</a>--%>

        <form action="/cars?action=" style="margin-top: 20px">
            <button type="button" class="btn btn-primary">
                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-house-door" fill="currentColor"
                     xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd"
                          d="M7.646 1.146a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 .146.354v7a.5.5 0 0 1-.5.5H9.5a.5.5 0 0 1-.5-.5v-4H7v4a.5.5 0 0 1-.5.5H2a.5.5 0 0 1-.5-.5v-7a.5.5 0 0 1 .146-.354l6-6zM2.5 7.707V14H6v-4a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 .5.5v4h3.5V7.707L8 2.207l-5.5 5.5z"/>
                    <path fill-rule="evenodd" d="M13 2.5V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
                </svg>
            </button>
            <a href="/cars?action=">Trang chủ</a>
        </form>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-plus-circle" fill="currentColor"
                 xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                <path fill-rule="evenodd"
                      d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
            </svg>
        </button>
        <a href="/cars?action=" data-toggle="modal" data-target="#exampleModalCenter">Thêm mới sản phẩm</a>
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
             aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="container">
                            <form action="/cars?action=add" method="post">
                                <div class="form-group">
                                    <label>nhập tên xe</label>
                                    <input type="text" class="form-control" name="carName" placeholder="Tên xe">
                                </div>
                                <div class="form-group">
                                    <label>Nhập link ảnh</label>
                                    <input type="text" class="form-control" name="carImg" placeholder="File ảnh xe">
                                </div>
                                <div class="form-group">
                                    <label>Nhập giá bán</label>
                                    <input type="text" class="form-control" name="carPrice" placeholder="Giá bán xe">
                                </div>
                                <div class="form-group">
                                    <label>Chi tiết xe</label>
                                    <input type="text" class="form-control" name="carDescription"
                                           placeholder="Nhập chi tiết xe">
                                </div>
                                <button type="submit" class="btn btn-primary">ADD</button>
                            </form>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    </div>
                </div>
            </div>
        </div>
        <h1 style="text-align: center">Bảng giá các loại xe</h1>
        <div class="row">
            <c:forEach var="car" items="${carlist}">
                <div class="col-md-6 col-lg-4" style="margin-top: 30px">
                    <div class="single_service">
                        <div class="thumb">
                            <span><img src="<c:out value="${car.carImg}"/>" style="width: 100%"></span>
                        </div>
                        <div class="service_infor">
                            <h4>Tên xe: <c:out value="${car.carName}"/></h4>
                            <h4>Giá tiền: <c:out value="${car.carPrice}"/></h4>
                            <h4>Mô tả: <c:out value="${car.description}"/></h4>
                            <div class="row">
                                <div class="col-md-6 col-lg-4"><a href="#">DELETE</a></div>
                                <div class="col-md-6 col-lg-4"><a href="#">UPDATE</a></div>
                                <div class="col-md-6 col-lg-4"><a href="#">DESCRIPTION</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
<footer>
    <div class="footer-copyright text-center py-3">© 2020 Copyright:
        <a href="#"> T&V Car</a>
        HOTLINE:<a href="$">0999.686.868</a>
    </div>
</footer>

</body>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</html>
