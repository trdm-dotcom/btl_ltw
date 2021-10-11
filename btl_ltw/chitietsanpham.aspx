<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="chitietsanpham.aspx.cs" Inherits="btl_ltw.chitietsanpham" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Toy King</title>
    <link rel="stylesheet" href="fontawesome-free-5.15.2-web/css/all.min.css"/>
    <link rel="stylesheet" href="css/main.css"/>
    <link rel="stylesheet" href="css/reponsive.css"/>
    <link href="css/chitietsanpham.css" rel="stylesheet"/>
    <style>
        .alert {
            visibility: hidden;
            position: fixed;
            width: 312px;
            padding: 16px;
            top: 15%;
        }
        .alert-2-success {
            border-left: 4px solid #2ec946;
            background-color: rgba(46, 201, 70, 0.05);
        }
        .alert-2-success .alert-title {
            color: #2ec946;
        }
        .alert-title {
            margin-top: 0;
            margin-bottom: 8px;
            font-size: 16px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        #dropdown {
            float: left;
            overflow: hidden;
        }
        #dropdown_content {
            display: none;
            cursor:pointer;
            position: absolute;
            background-color: #fff;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }
        #dropdown:hover #dropdown_content {
            display: block;
        }
        #dangxuat{
            cursor:pointer;
            border: 0;
            font-size: 16px;
            outline: none;
            background:#fff;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" onsubmit="return kiemtra()">
        <header>
            <nav class="navbar">
                <div class="content grid wide">       
                    <div class="logo">
                        <a href="trangchu.aspx" class="logo-text">TOY KING</a>
                    </div>
                    <div class="menu-box">
                        <ul class="menu-list">
                            <button class="icon close-btn" type="button"><i class="fas fa-times" style="font-size: 20px;"></i></button>
                            <li class="menu-item"><a href="trangchu.aspx">Trang chủ</a></li>
                            <li class="menu-item"><a href="trangsanpham.aspx">Sản phẩm</a></li>
                            <li class="menu-item"><a href="#">Tuổi</a></li>
                            <li class="menu-item"><a href="#">Giới tính</a></li>
                            <li class="menu-item"><a href="#">Thông tin</a></li>
                        </ul>
                        <div class="menu-icon">
                            <div id="dropdown">
                                <a href="dangnhap.aspx" style="color:#3d3d3d;"><i class="far fa-user-circle" style="font-size: 20px;"></i> <asp:Label ID="Acc" runat="server" Text="" Font-Size="20px"></asp:Label></a>
                                <div id="dropdown_content" runat="server">
                                    <asp:Button ID="dangxuat" runat="server" Text="Đăng xuất" onclick="dangxuat_Click"/>
                                </div>
                            </div>
                            <a href="giohang.aspx" style="color:#3d3d3d;"><i class="fas fa-shopping-cart" style="font-size: 20px;"></i>(<asp:Label ID="soluongArea" runat="server" Text="0"></asp:Label>)</a>
                            <button class="icon menu-btn" type="button"><i class="fas fa-bars" style="font-size: 20px;"></i></button>
                        </div>
                    </div>
                </div>
            </nav>
        </header>
        <main>
            <div class="grid wide">
                <%--<div class="row">
                    <div class="col l-9"></div>
                    <div class="col l-3">
                        <div class="alert alert-2-success" id="alert">
                            <h3 class="alert-title">Thêm sản phẩm thành công</h3>
                        </div>
                    </div>
                </div>--%>
                <div class="row" style="margin-top: 100px;">
                    <div class="col l-5 m-12 c-12" id="product_img" runat="server">
                    </div>
                    <div class="col l-4 m-12 c-12" id="product-detail">
                        <div class="product-description">
                            <span id="brand" runat="server"></span>
                            <h1 id="name" runat="server"></h1>
                        </div>
                        <div class="product-color">
                            <span>Số lượng</span>
                            <div class="color-choose">
                                <input type="text" id="sl" name="soluong" value="1" style="width:50px; height:30px" runat="server"/>
                                <span id="error_sl" style="color:red"></span>
                            </div>
                        </div>
                        <div class="product-price">
                            <span id="price" runat="server" style="display:block; font-size: 26px; font-weight: 600; margin-bottom: 15px; color: #e17055"></span>
                            <asp:Button ID="themgio" runat="server" CssClass="cart-btn" Text="Thêm vào giỏ hàng" OnClick="themgio_Click"/>
                        </div>
                    </div>
                    <div class="col l-3 m-12 c-12">
                        <center>
                            <h3>Sản phẩm đã xem</h3>
                        </center>
                        <div>
                            <ul id="chosenlist" runat="server">
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <!-- footer -->
      <footer>
         <div class="container">
            <!--Bắt Đầu Nội Dung Giới Thiệu-->
            <div class="noi-dung about">
               <h2>Về Chúng Tôi</h2>
               <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
            </div>
            <!--Kết Thúc Nội Dung Giới Thiệu-->
            <!--Bắt Đầu Nội Dung Đường Dẫn-->
            <div class="noi-dung links">
               <h2>Đường Dẫn</h2>
               <ul>
                  <li><a href="#">Trang Chủ</a></li>
                  <li><a href="#">Về Chúng Tôi</a></li>
                  <li><a href="#">Thông Tin Liên Lạc</a></li>
                  <li><a href="#">Dịch Vụ</a></li>
                  <li><a href="#">Điều Kiện Chính Sách</a></li>
               </ul>
            </div>
            <!--Kết Thúc Nội Dung Đường Dẫn-->
            <!--Bắt Đâu Nội Dung Liên Hệ-->
            <div class="noi-dung contact">
               <h2>Thông Tin Liên Hệ</h2>
               <ul class="info">
                  <li>
                     <span><i class="fa fa-map-marker"></i></span>
                     <span>
                     Đường Số 1<br />
                     Quận 1, Thành Phố Hồ Chí Minh<br />
                     Việt Nam
                     </span>
                  </li>
                  <li>
                     <span><i class="fa fa-phone"></i></span>
                     <p>
                        <a href="#">+84 123 456 789</a>
                        <br />
                        <a href="#">+84 987 654 321</a>
                     </p>
                  </li>
                  <li>
                     <span><i class="fa fa-envelope"></i></span>
                     <p><a href="#">firefood@gmail.com</a></p>
                  </li>
               </ul>
            </div>
            <!--Kết Thúc Nội Dung Liên Hệ-->
         </div>
      </footer>
    </form>
    <% if (message != null)
        {
            Response.Write(message);
        }%>
    <script src="js/main.js"></script>
    <script>
        function kiemtra() {
            var soluong = document.getElementById('sl').value;
            var error_sl = document.getElementById('error_sl');
            if (soluong.trim() == '') {
                error_sl.innerHTML = 'Số lượng sản phẩm không để chống';
                return false;
            }
            if (isNaN(Number(soluong))) {
                error_sl.innerHTML = 'Số lượng sản phẩm dạng số';
                return false;
            }
            return true;
        }
    </script>
</body>
</html>
