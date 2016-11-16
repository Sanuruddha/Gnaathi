function showChat() {
    if ($("#chat-box").css("display") === "none") {
        $("#user-chatbox").css("display", "none");
        $("#chat-box").css("display", "block");

        $.post("FriendList", function (data) {
            document.getElementById("chat-body").innerHTML = '';
            for (var key in data) {
                $("#chat-body").append("<div class='row'>"
                        + "<div class='col-lg-12'>"
                        + "<div class='media'>"
                        + "<a class='pull-left' onclick='showUser("+key+",\"" + data[key] + "\")' style='line-height:4;vertical-align:middle;text-align:center;'>"
                        + "<img style='vertical-align:middle;text-align:center;' class='media-object img-circle' src='http://localhost:8080/Gnaathi/icons/chat/"
                        + key + ".png' alt=''><p>"
                        + data[key]
                        + "</a></div></div></div>");
            }
        }, "json"

                );

    } else {
        $("#chat-box").css("display", "none");
        $("#main-chatbox").css("display", "block");
    }
}


