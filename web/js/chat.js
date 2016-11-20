function sendMessage(id) {
    var message = $("#message").val();
    $("#message").val("");
    var name = $("#name_self").val();
    $("#chat-body").append("<div class='row'><div class='col - lg - 12'><div class='media'>"
            + "<a class='pull-left' href='#'>"
            + "<img class='media-object img-circle' src='http://lorempixel.com/30/30/people/7/' alt=''>"
            + "</a>"
            + "<div class='media-body'><h4 class='media-heading'>" + name
            + "<span class='small pull-right'>12:39 PM"
            + "</span>"
            + "</h4><p>" + message + "</p></div></div></div></div>");

    $.ajax({
        url: 'chat',
        type: 'POST',
        data: {message: message, mode: "0", id: parseInt(id)},
        error: function (jqXHR, textStatus, errorThrown) {
            alert(jqXHR.responseText);
        }
    });

}

function getMessages(id) {
    $.post("chat", {mode: "1", id: id}, function (message) {
        if (message.trim() !== "") {
            $("#chat-body").append("<div class='row'><div class='col - lg - 12'><div class='media'>"
                    + "<a class='pull-left' href='#'>"
                    + "<img class='media-object img-circle' src='http://lorempixel.com/30/30/people/7/' alt=''>"
                    + "</a>"
                    + "<div class='media-body'><h4 class='media-heading'>" + document.getElementById("heading").innerHTML
                    + "<span class='small pull-right'>12:39 PM"
                    + "</span>"
                    + "</h4><p>" + message + "</p></div></div></div></div>");
        }
    });
}

function loadChat(id) {
    getMessages(id);
    setInterval(function () {
        getMessages(id);
    }, 4000);
}

function showUser(id, name) {
    $("#main-chatbox").css("display", "none");
    $("#user-chatbox").css("display", "block");
    var title = document.getElementById("title");
    var heading = document.getElementById("heading");
    title.innerHTML = '';
    title.innerHTML = name;
    heading.innerHTML = '';
    heading.innerHTML = name;
    $("#chat-send").click(function () {
        sendMessage(id);
    });
    loadChat(id);
}

function closeUser() {
    $("#chat-box").css("display", "block");
    $("#main-chatbox").css("display", "block");
    $("#user-chatbox").css("display", "none");
    
}

