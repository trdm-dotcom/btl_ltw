<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dathang.aspx.cs" Inherits="btl_ltw.dathang" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Toy King</title>
    <link rel="stylesheet" href="fontawesome-free-5.15.2-web/css/all.min.css"/>
    <link rel="stylesheet" href="css/main.css"/>
    <link rel="stylesheet" href="css/reponsive.css"/>
    <link rel="stylesheet" href="css/giohang.css"/>
    <style>
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
        .row{
            padding-top:50px;
        }
        .col h3{
            background: #e17055;
            padding: 10px 20px;
            color: #fff;
            text-transform: uppercase;
        }
        #thongtindonhang{
            padding: 0 !important;
            background: #dfe6e9;
        }
        #chitietdanhang, #danhsachsp{
            margin: 0 20px !important;
            padding:30px 0px; 
            border-bottom: 2px dashed  #7f8c8d;
            color: #4b4b4b;
        }
        .text-right{
            text-align:right;
        }
        #donhang{
            color: #74b9ff;
        }
        #dathang{
            margin: 30px 20px; 
            width: 474px;
            padding: 10px;
            border: 0;
            outline: none;
            color: white;
            font-size: 20px;
            font-weight: 700;
            background: #74b9ff;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
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
                <div class="row">
                    <div class="col l-7">
                        <h3>Thông tin giao hàng</h3>
                        <div id='form_dathang' class="form">
                            <div>
                                <label for="hoten">Họ tên:</label>
                                <input type="text" name="hoten" id="hoten" placeholder="Họ tên" class="inputfield" runat="server"/>
                                <span class="error"></span>
                            </div>
                            <div>
                                <label for="sdt">Số điện thoại:</label>
                                <input type="text" name="sdt" placeholder="Số điện thoại" id="sdt" class="inputfield" runat="server"/>
                                <span class="error"></span>
                            </div>
                            <div>
                                <label for="email">Email:</label>
                                <input type="text" name="email" placeholder="Email" id="email" class="inputfield" runat="server"/>
                                <span class="error"></span>
                            </div>
                            <div>
                                <label for="diachi">Địa chỉ:</label>
                                <textarea placeholder="Địa chỉ" class="inputfield" id="diachi"></textarea>
                                <span class="error"></span>
                            </div>
                        </div>
                    </div>
                    <div class="col l-5" id="thongtindonhang">
                        <h3>Đơn hàng</h3>
                        <div id="danhsachsp" class="row" runat="server">
                        </div>
                        <div id="chitietdanhang" class="row">
                            <div class="col l-7"><h4>Đơn hàng:</h4></div>
                            <div class="col l-5 text-right"><h4 id="donhang" runat="server"></h4></div>
                        </div>
                        <button type="button" id="dathang">Đặt hàng</button>
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
    <script>
        let btndathang = document.getElementById("dathang");
        btndathang.onclick = function () {
            alert("Đặt hàng thành công");
        }
    </script>
</body>
</html>
