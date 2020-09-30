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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark" >
    <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
            <i class="fad fa-rocket-launch"></i>
        </li>
        <li class="nav-item active">
                <a class="nav-link" href="/Admin?action=home" ><h1 style="font-family: monospace">V&T SHOWROOM</h1></a>
            <form method="post" action="/Admin?action=logOut">
                <div class="row">
                <div class="col"> <p style="color: white">Tên người đăng nhập:<a name="account"><%=session.getAttribute("account") %></a> </p></div>
                <div class="col"><button type="submit" class="btn btn-outline-secondary"> ĐĂNG XUẤT</button></div>
                </div>
            </form>
        </li>
    </ul>


    <a type="button" href="/Admin?action=checkbookdate" class="btn btn-outline-secondary" style="margin-right: 10px">Lịch hẹn khách hàng </a>
    <form class="form-inline my-2 my-lg-0" action="/Admin?action=search" method="post">
        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="search">
        <button type="submit" class="btn btn-outline-secondary">
            <i class="fa fa-search" style="font-size:25px"></i>
        </button>
    </form>
</nav>
<div>
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

            <p style="margin-top: 20px;"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-plus-circle" fill="currentColor"
                     xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                    <path fill-rule="evenodd"
                          d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                </svg>
            </button>
                <a href="/cars?action=" data-toggle="modal" data-target="#exampleModalCenter">Thêm mới sản phẩm</a></p>
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
             aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="container">
                            <form action="/Admin?action=add" method="post">
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
                <div class="col-md-6 col-lg-4" style="margin-bottom: 0px">
                    <div class="single_service">
                        <div class="thumb">

                            <div><img src="<c:out value="${car.carImg}"/>" style="width: 100%"; height="200px"></div>
                        </div>
                        <div class="service_infor">
                            <h4>Tên xe: <c:out value="${car.carName}"/></h4>
                            <h4>Giá tiền: <c:out value="${car.carPrice}"/></h4>
                            <h4>Mô tả: <c:out value="${car.description}"/></h4>
                            <div class="row">
                                <div class="col-md-6 col-lg-4">
                                    <button type="button" class="btn btn-outline-secondary" data-toggle="modal" data-target="#exampleModalDelete${car.id}">XÓA</button>
                                    <div class="modal fade" id="exampleModalDelete${car.id}" tabindex="-1" role="dialog"
                                         aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <div class="container">
                                                        <form action="/Admin?action=delete&id=<c:out value="${car.id}"></c:out>" method="post">
                                                            <div class="form-group">
                                                                <label>Bạn có chắc chắn muốn xóa chứ?</label>
                                                            </div>
                                                            <button type="submit" class="btn btn-primary">XÓA</button>
                                                        </form>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-4">
                                    <button type="button" class="btn btn-outline-secondary" data-toggle="modal" data-target="#exampleModalUpdate${car.id}">SỬA</button>
                                    <div class="modal fade" id="exampleModalUpdate${car.id}" tabindex="-1" role="dialog"
                                         aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <div class="container">
                                                        <form action="/Admin?action=update&id=${car.id}" method="post">
                                                            <div class="form-group">
                                                                <label>nhập tên xe</label>
                                                                <input type="text" class="form-control" name="carName" value="<c:out value="${car.carName}"/>">
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Nhập link ảnh</label>
                                                                <input type="text" class="form-control" name="carImg" value="<c:out value="${car.carImg}"/>">
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Nhập giá bán</label>
                                                                <input type="text" class="form-control" name="carPrice" value="<c:out value="${car.carPrice}"/>">
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Chi tiết xe</label>
                                                                <input type="text" class="form-control" name="carDescription"
                                                                       value="<c:out value="${car.description}"/>">
                                                            </div>
                                                            <button type="submit" class="btn btn-primary">LƯU</button>
                                                        </form>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">ĐÓNG</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
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
        <a href="#"> V&T Car</a>
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
