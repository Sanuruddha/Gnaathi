function loadWiki(){
    location.href = "wiki/index.jsp#jump-to";
}

$(document).ready(function(){$( "#login" ).click(function() {
        if($( "#loginform-container" ).css("display")==="none")
            $( "#loginform-container" ).css("display","block");
        else
            $( "#loginform-container" ).css("display","none");
});});

function showRegisterform(){
    
}