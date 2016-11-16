function sendMessage() {
    var message = $("#message").val();
    alert(message);
    $.post("chat", {message: message,mode:"0"}, function (data) {});
}

function doSomething() {
    $.post("chat",{mode:"1"},function (message) {
        
        if(message.trim()!=="") {
            $("#chat-body").append("<div class='row'><div class='col - lg - 12'><div class='media'>"
                    + "<a class='pull-left' href='#'>"
                    + "<img class='media-object img-circle' src='http://lorempixel.com/30/30/people/7/' alt=''>"
                    + "</a>"
                    + "<div class='media-body'><h4 class='media-heading'>Jane Smith"
                    + "<span class='small pull-right'>12:39 PM"
                    + "</span>"
                    + "</h4><p>" + message + "</p></div></div></div></div>");
        }
    });
}

setInterval(doSomething, 3000);


