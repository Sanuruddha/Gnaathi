//called when send message button pressed
function sendMessage(id) {
    //get the value in the text box and clear the text box
    var message = $("#message").val();
    $("#message").val("");
    var name = $("#name_self").val();

    
    //insert the message into the chatbody
    $("#chat-body").append("<div class='row'><div class='col - lg - 12'><div class='media'>"
            + "<a class='pull-left' href='#'>"
            + "<img class='media-object img-circle' src='http://lorempixel.com/30/30/people/7/' alt=''>"
            + "</a>"
            + "<div class='media-body'><h4 class='media-heading'>you" 
            + "<span class='small pull-right'>12:39 PM"
            + "</span>"
            + "</h4><p>" + message + "</p></div></div></div></div>");
    
    
    ///send the message to the server 
    $.ajax({
        url: 'Chat',
        type: 'POST',
        data: {message: message, mode: "0", id: parseInt(id)},
        error: function (jqXHR, textStatus, errorThrown) {
            alert(jqXHR.responseText);
        }
    });

}

////called to receive messages form backend
function getMessages(id) {

    $.get("Chat", {init:1, id: id}, function (message) {
        ///recieves chats one by one
        if (message.trim() !== "") {
            
            ////insert new chats into the chatbody
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

 ///called by the the showUser function
function loadChat(id) {
    //callse the get messages function to get new chats from server and set an interval to start polling
    getMessages(id);
    setInterval(function () {
        getMessages(id);
    }, 1000);
}


function showUser(id, name) {
    ///when user clicks a friend's name it changes the friend list window into a user chat box window
    
    $("#main-chatbox").css("display", "none");

    $("#user-chatbox").css("display", "block");


    //setting the friend name

    var heading = document.getElementById("heading");

    $("#id").attr("value", id);
    heading.innerHTML = '';
    heading.innerHTML = name;

    //binds a function to send button
    $("#chat-send").click(function () {
        sendMessage(id);
    });
    
    //a get request will be sent to the Chat servlet to get the recent chats and initialize the chat 
    $.get("Chat",{init:0,id:id},function(data){
        
        $("#chat-body").html(data);
    });
    
    /*
    ///clears the chat body to insert user chats
    document.getElementById("chat-body").innerHTML = '';

    //deserialize the stored chats
    var json_str = sessionStorage.chats;
    var chats = JSON.parse(json_str);
    
    ///adds the deserialized chats into the chat body
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
    
    */
    //class the loadchat function to start polling
    loadChat(id);
    document.getElementById("chat-friend").innerHTML=heading;
}

///called when close button of the user chat box is pressed

function closeUser() {
    $("#chat-box").css("display", "block");
    $("#main-chatbox").css("display", "block");
    $("#user-chatbox").css("display", "none");

}

