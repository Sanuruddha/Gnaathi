function showChat() {
    if ($("#chat-box").css("display") === "none") {
        $("#chat-box").css("display", "block");

        $.post("FriendList", function (data) {
            document.getElementById("chat-body").innerHTML='';
            for (var key in data) {            
                $("#chat-body").append("<div class='row'>\n\
<div class='col-lg-12'>\n\
<a href='#'>" + data[key]+ "</a></div></div>");
                }
            },"json"
        
        );

    } else
        $("#chat-box").css("display", "none");
}

