function loadWiki(){
    location.href = "wiki/index.jsp#jump-to";
}

$(document).ready(function(){$( "#login" ).click(function() {
        if($( "#loginform-container" ).css("display")==="none")
            $( "#loginform-container" ).css("display","block");
        else
            $( "#loginform-container" ).css("display","none");
});});

function openNav() {
    document.getElementById("myNav").style.width = "100%";
    $( "#loginform-container" ).css("display","none");
    return false;
}

/* Close when someone clicks on the "x" symbol inside the overlay */
function closeNav() {
    document.getElementById("myNav").style.width = "0%";
    $( "#loginform-container" ).css("transition-delay","0.3s");
    $( "#loginform-container" ).css("display","block");
    return false;
}
