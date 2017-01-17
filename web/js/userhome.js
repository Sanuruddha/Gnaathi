
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
                        
                        + data[key]
                        + "</a></div></div></div>");
            }
            

        }, "json");


    } else {
        $("#chat-box").css("display", "none");
        $("#main-chatbox").css("display", "block");
    }
}

function openDonationForm(){
    document.getElementById("donNav").style.width = "100%";
    return false;
}

function closeForm(){
    document.getElementById("donNav").style.width = "0%";
    return false;
}

function openAcquisitionForm(){
    document.getElementById("acqNav").style.width = "100%";
    return false;
}

function closeAcqForm(){
    document.getElementById("acqNav").style.width = "0%";
    return false;
}

function openInviteForm(){
    document.getElementById("invNav").style.width = "100%";
    return false;
}

function closeInviteForm(){
    document.getElementById("invNav").style.width = "0%";
    return false;
}
