$(document).ready(function () {

    // ANIMATEDLY DISPLAY THE NOTIFICATION COUNTER.
    $('#notfication-container').click(function () {

        // TOGGLE (SHOW OR HIDE) NOTIFICATION WINDOW.
        $('#notifications').fadeToggle('fast', 'linear', function () {
            if ($('#notifications').is(':hidden')) {
                $('#noti_Button').css('background-color', '#2E467C');
            } else
                $('#noti_Button').css('background-color', '#2E467C');        // CHANGE BACKGROUND COLOR OF THE BUTTON.
        });

        $('#noti_Counter').fadeOut('slow');                 // HIDE THE COUNTER.


        /// insert the new notifications
        $.get("Notifications", {type: 1}, function (data) {
            var element = $("#notification-body");
            element.html("");
            for (var key in data) {
                
                element.append("<div style='font-size:13px' class='panel panel-default'><div class='panel-body'>" + data[key] + "</div></div>");
               
            }


        }, "json");


        return false;
    });

    // HIDE NOTIFICATIONS WHEN CLICKED ANYWHERE ON THE PAGE.
    $(document).click(function () {
        $('#notifications').hide();

        // CHECK IF NOTIFICATION COUNTER IS HIDDEN.
        if ($('#noti_Counter').is(':hidden')) {
            // CHANGE BACKGROUND COLOR OF THE BUTTON.
            $('#noti_Button').css('background-color', '#2E467C');
        }
    });

    $('#notifications').click(function () {
        return false;       // DO NOTHING WHEN CONTAINER IS CLICKED.
    });
});

function addNewNotiIcon() {
    if ($('#noti_Counter').css('display') !== 'block') {
        $('#noti_Counter')
                .css({display: 'block'})
                .css({opacity: 0})
                .text('+')              // ADD DYNAMIC VALUE (YOU CAN EXTRACT DATA FROM DATABASE OR XML).
                .css({top: '-10px'})
                .animate({top: '37.5%', opacity: 1}, 500);
    }
}

function checkNotifications() {
    $.ajax({
        url: 'Notifications',
        type: 'POST',
        data: {type: 0},
        success: function (data) {
            data = data.trim();
            if (data === "true") {
                addNewNotiIcon();
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            
        }
    });
}

setInterval(checkNotifications, 5000);