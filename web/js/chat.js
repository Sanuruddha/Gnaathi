function sendMessage(){
    var message=$("#message").val();
    alert(message);
    $.post("chatprocess.jsp",message);
}

function doSomething() {
    $.get("chatprocess.jsp",function(message){
        alert(message);
    });
}

setInterval(doSomething, 1000);


