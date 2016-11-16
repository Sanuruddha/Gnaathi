function sendMessage() {
    var message = $("#message").val();
    alert(message);
    $.post("chat", {message: message,mode:"0"}, function (data) {});
}

function getMessages(id) {
    $.post("chat",{mode:"1",id:id},function (message) {
        
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

function loadChat(id){
    getMessages(id);
}

function showUser(id,name) {
    $("#main-chatbox").css("display", "none");
    $("#user-chatbox").css("display", "block");
    var title = document.getElementById("title");
    var heading = document.getElementById("heading");
    title.innerHTML = '';
    title.innerHTML = name;
    heading.innerHTML = '';
    heading.innerHTML = name;
    loadChat(id);
}





