<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dangky.aspx.cs" Inherits="btl_ltw.dangky" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Toy King</title>
    <link rel="stylesheet" href="fontawesome-free-5.15.2-web/css/all.min.css"/>
    <link rel="stylesheet" href="css/main.css"/>
    <link rel="stylesheet" href="css/reponsive.css"/>
    <script src="js/validation1.js"></script>
</head>
<body>
    <form id="form1" runat="server" method="POST" onsubmit="return validation()">
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
                            <a href="dangnhap.aspx" style="color:#3d3d3d;"><i class="far fa-user-circle" style="font-size: 20px;"></i> <asp:Label ID="Acc" runat="server" Text="" Font-Size="20px"></asp:Label></a>
                            <a href="giohang.aspx" style="color:#3d3d3d;"><i class="fas fa-shopping-cart" style="font-size: 20px;"></i>(<asp:Label ID="soluong" runat="server" Text="0"></asp:Label>)</a>
                            <button class="icon menu-btn" type="button"><i class="fas fa-bars" style="font-size: 20px;"></i></button>
                    </div>
                </div>
            </div>
        </nav>
    </header>
    <main>
        <div class="grid wide">
            <div class="row">
                <div class="col l-6 c-12 m-12">
                    <h1 style="position: relative; top: 50%; color: #778beb; font-size: 50px;">Đăng ký</h1>
                </div>
                <div class="col l-6 c-12 m-12">
                    <div id='form_dangky' class="form">
                        <div>
                            <input type="text" name="hoten" id="hoten" placeholder="Họ tên" class="inputfield" runat="server"/>
                            <span class="error"></span>
                        </div>
                        <div>
                            <input type="text" name="sdt" placeholder="Số điện thoại" id="sdt" class="inputfield" runat="server"/>
                            <span class="error"></span>
                        </div>
                        <div>
                            <input type="text" name="email" placeholder="Email" id="email" class="inputfield" runat="server"/>
                            <asp:Label ID="errorDangKy" runat="server" Text="" CssClass="error"></asp:Label>
                        </div>
                        <div>
                            <input type="password" name="matkhau" placeholder="Mật khẩu" id="matkhau" class="inputfield"/>
                            <span class="error"></span>
                        </div>
                        <div>
                            <input type="password" name="nhaplaimatkhau" placeholder="Nhập lại mật khẩu" id="nhaplaimatkhau" class="inputfield"/>
                            <span class="error"></span>
                        </div>
                        <div >
                            <asp:Button ID="dangky_btn" CssClass="btn" runat="server" Text="Đăng ký" onclick="dangky_btn_Click"/>
                        </div>
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
                  <li><a href="#">Sản phẩm</a></li>
                  <li><a href="#">Thông Tin</a></li>
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
                     <p><a href="#">kingtoy@gmail.com</a></p>
                  </li>
               </ul>
            </div>
            <!--Kết Thúc Nội Dung Liên Hệ-->
         </div>
      </footer>
    </form>
    <script src="js/main.js"></script>
</body>
</html>
