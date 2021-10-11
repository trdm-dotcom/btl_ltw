function validation() {
    let hoten = document.getElementById("hoten").value;
    let sdt = document.getElementById("sdt").value;
    let email = document.getElementById("email").value;
    let mk = document.getElementById("matkhau").value;
    let mkl = document.getElementById("nhaplaimatkhau").value;
    var errorArea = document.getElementsByClassName("error");
    var kq = true;
    errorArea[0].innerHTML = "";
    if (hoten.trim() == "")     { errorArea[0].innerHTML = "Vui lòng nhập họ tên"; kq = false; }
    errorArea[1].innerHTML = "";
    if (sdt.trim() == "")       { errorArea[1].innerHTML = "Vui lòng nhập số điện thoại"; kq = false; }  
    else if (isNaN(Number(sdt)) || sdt.length!=10) { errorArea[1].innerHTML = "Vui lòng nhập lại điện thoại"; kq = false; }
    errorArea[2].innerHTML = "";
    if (email.trim() == "")     { errorArea[2].innerHTML = "Vui lòng nhập lại email"; kq = false; }
    else if (!checkMail(email))  { errorArea[2].innerHTML = "Hãy nhập địa chỉ email hợp lệ"; kq = false; }
    errorArea[3].innerHTML = "";
    if (mk.trim() == "") { errorArea[3].innerHTML = "Vui lòng nhập mật khẩu"; kq = false; }
    else if (mk.length < 6) { errorArea[3].innerHTML = "Mật khẩu tối thiểu 6 ký tự"; kq = false; }
    else if (!checkMK(mk)) { errorArea[3].innerHTML = "Mật khẩu có chữ hoa và các ký tự đặc biệt"; kq = false;}
    errorArea[4].innerHTML = "";
    if (mkl.trim() == "")       { errorArea[4].innerHTML = "Vui lòng nhập mật khẩu nhập lại"; kq = false; }
    else if (mkl != mk)         { errorArea[4].innerHTML = "Mật khẩu nhập lại không khớp"; kq = false; }
    return kq;
}
function checkMail(email) {
    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if (!filter.test(email)) {
        console.log(1);
        return false;
    }
    else {
        console.log(2);
        return true;
    } 
}
function checkMK(mk) {
    var filter = /[A-Z]/;
    var dbfilter = /[@\$\&\#\%]/;
    if (!filter.test(mk) || !dbfilter.test(mk)) {
        console.log(filter.test(mk));
        console.log(dbfilter.test(mk));
        return false;
    }
    else {
        console.log(filter.test(mk));
        console.log(dbfilter.test(mk));
        return true;
    }
}

