var friends = [];
var self = {};
var chats={};

$(document).ready(function () {
    self['1'] = document.getElementById("name_self").value;
    self['id'] = document.getElementById("id_self").value;
});


//chat open function
//this will send a post request to the frienlist servlet where it will initialize the necessory data structures and 
//send the friend list back
function showChat() {
    //this will toggle the show hide for the chat box
    if ($("#chat-box").css("display") === "none") {
        $("#user-chatbox").css("display", "none");
        $("#chat-box").css("display", "block");
        
        //post request to the servlet
        $.post("FriendList", function (data) {
            document.getElementById("list-body").innerHTML = '';

            for (var key in data) {
                $("#list-body").append("<div class='row'>"
                        + "<div class='col-lg-12'>"
                        + "<div class='media'>"
                        + "<a class='pull-left' onclick='showUser(" + key + ",\"" + data[key] + "\")' style='line-height:4;vertical-align:middle;text-align:center;'>"
                        + "<img style='vertical-align:middle;text-align:center;' class='media-object img-circle' src='http://localhost:8080/Gnaathi/icons/chat/"
                        + key + ".png' alt=''><p>"
                        + data[key]
                        + "</a></div></div></div>");
            }
            

        }, "json");


    } else {
        $("#chat-box").css("display", "none");
        $("#main-chatbox").css("display", "block");
    }
}




