function loadArticleManager() {
    $("#default").css("display", "none");
    $("#user-manager").css("display", "none");
    $("#article-manager").css("display", "block");
}

function loadUserManager() {
    $("#default").css("display", "none");
    $("#article-manager").css("display", "none");
    $("#user-manager").css("display", "block");
}

function loadArticleList(){
    $.post("Articles",{do:"articlelist"},function(data){
        
    });
}



