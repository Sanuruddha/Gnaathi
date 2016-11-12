function sendMessage() {
    var message = $("#message").val();
    alert(message);
    $.post("chatprocess.jsp", {message:message},function(data){});
}

function doSomething() {
    $.get("chatprocess.jsp", function (message) {
        $("#chat-body").append("<div class='row'><div class='col - lg - 12'><div class='media'>\n\
        <a class='pull-left' href='#'>\n\
        <img class='media-object img-circle' src='http://lorempixel.com/30/30/people/7/' alt=''>\n\
        </a>\n\
        <div class='media-body'><h4 class='media-heading'>Jane Smith\n\
        <span class='small pull-right'>12:39 PM\n\
        </span>\n\
        </h4><p>"+message+"</p></div></div></div></div>");
    });
}

setInterval(doSomething, 3000);


