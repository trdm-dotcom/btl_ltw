<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="giohang.aspx.cs" Inherits="btl_ltw.giohang" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Toy King</title>
    <link rel="stylesheet" href="fontawesome-free-5.15.2-web/css/all.min.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/reponsive.css">
    <link rel="stylesheet" href="css/giohang.css">
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
                <div class="col l-9 cartwrapper">
                    <div class="heading">
                        <center>
                            <h1>Giỏ hàng của bạn</h1>
                        </center>
                    </div>
                    <div class="cartbox">
                        <h4>Bạn đang có <span id="sl_gio" runat="server">0</span> sản phẩm trong giỏ hàng</h4>
                        <div class="shopping-cart" id="shopping_cart" runat="server">
                        </div>
                    </div>
                </div>
                <div class="col l-3" style="margin: 80px 0; width: 100%;">
                    <div class="billwrapper">
                        <div class="head"><h3>Thông tin đơn hàng</h3></div>
                        <div class="price"><h4>Tổng tiền: <span id="tong" runat="server">0đ</span></h4></div>
                        <button class="thanhtoan">THANH TOÁN</button>
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
    <script>
        function capnhap(id) {
            var idinput = 'input' + id;
            var sl = document.getElementById(idinput).value;
            if (isNaN(Number(sl))) {
                alert("Số lượng nhập số");
                return;
            }
            var url = "xulygiohang.aspx?action=capnhap&idsanpham=" + id+"&sl="+sl;
            window.location = url;
        }
        function xoa(id) {
            var result = confirm("Bạn có muốn xóa sản phẩm này");
            if (result) {
                var url = "xulygiohang.aspx?action=xoa&idsanpham="+id;
                window.location = url
            }
        }
    </script>
</body>
</html>
