

function sendMessage(id) {
    
    var message = $("#message").val();
    $("#message").val("");
    var name = $("#name_self").val();

    var json_str = sessionStorage.chats;
    var chats = JSON.parse(json_str);
    chats[id].push(message);
    var json_str = JSON.stringify(chats);
    sessionStorage.chats = json_str;
    
    $("#chat-body").append("<div class='row'><div class='col - lg - 12'><div class='media'>"
            + "<a class='pull-left' href='#'>"
            + "<img class='media-object img-circle' src='http://lorempixel.com/30/30/people/7/' alt=''>"
            + "</a>"
            + "<div class='media-body'><h4 class='media-heading'>" + name
            + "<span class='small pull-right'>12:39 PM"
            + "</span>"
            + "</h4><p>" + message + "</p></div></div></div></div>");
    

    $.ajax({
        url: 'Chat',
        type: 'POST',
        data: {message: message, mode: "0", id: parseInt(id)},
        error: function (jqXHR, textStatus, errorThrown) {
            alert(jqXHR.responseText);
        }
    });

}

function getMessages(id) {

    $.post("Chat", {mode: "1", id: id}, function (message) {

        if (message.trim() !== "") {

            var json_str = sessionStorage.chats;
            var chats = JSON.parse(json_str);
            chats[id].push(message);
            var json_str = JSON.stringify(chats);
            sessionStorage.chats = json_str;

            if ($("#id").attr("value") === String(id)) {

                $("#chat-body").append("<div class='row'><div class='col - lg - 12'><div class='media'>"
                        + "<a class='pull-left' href='#'>"
                        + "<img class='media-object img-circle' src='http://lorempixel.com/30/30/people/7/' alt=''>"
                        + "</a>"
                        + "<div class='media-body'><h4 class='media-heading'>" + document.getElementById("heading").innerHTML
                        + "<span class='small pull-right'>12:39 PM"
                        + "</span>"
                        + "</h4><p>" + message + "</p></div></div></div></div>");
            }
        }
    });
}

function loadChat(id) {
    getMessages(id);
    setInterval(function () {
        getMessages(id);
    }, 2000);
}

function showUser(id, name) {

    $("#main-chatbox").css("display", "none");

    $("#user-chatbox").css("display", "block");


    var heading = document.getElementById("heading");

    $("#id").attr("value", id);
    heading.innerHTML = '';
    heading.innerHTML = name;

    $("#chat-send").click(function () {
        sendMessage(id);
    });

    document.getElementById("chat-body").innerHTML = '';

    var json_str = sessionStorage.chats;
    var chats = JSON.parse(json_str);

    for (i = 0; i < chats[String(id)].length; i++) {
        $("#chat-body").append("<div class='row'><div class='col - lg - 12'><div class='media'>"
                + "<a class='pull-left' href='#'>"
                + "<img class='media-object img-circle' src='http://lorempixel.com/30/30/people/7/' alt=''>"
                + "</a>"
                + "<div class='media-body'><h4 class='media-heading'>" + document.getElementById("heading").innerHTML
                + "<span class='small pull-right'>12:39 PM"
                + "</span>"
                + "</h4><p>" + chats[id][i] + "</p></div></div></div></div>");

    }

    loadChat(id);
}

function closeUser() {
    $("#chat-box").css("display", "block");
    $("#main-chatbox").css("display", "block");
    $("#user-chatbox").css("display", "none");

}

