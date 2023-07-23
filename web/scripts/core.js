function logout(check) {
    if (!check) {
        setCookie("logout", "true", 2147483647);
        window.sessionStorage.removeItem("accountEmail");
        window.sessionStorage.removeItem("accountName");
        window.location.href = "/login";
    }
    if ((check) && confirm("정말 로그아웃하시겠습니까?")) {
        setCookie("logout", "true");
        window.sessionStorage.removeItem("accountEmail");
        window.sessionStorage.removeItem("accountName");
        window.location.href = "/login";
    }
}

var deleteCookie = function(name){
    document.cookie = name + '=; expires=Thu, 01 Jan 1999 00:00:10 GMT;';
}

var setCookie = function(name, value, exp){
    var date = new Date();
    date.setTime(date.getTime() + exp*60*60*1000);
    document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';
};

var getCookie = function(name){
    var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
    return value? value[2] : null;
}