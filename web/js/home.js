function loadWiki(){
    location.href = "wiki/index.jsp#jump-to";
}

function loadForum(){
    location.href = "forum/index.jsp#jump-to";
}

function loadBlog(){
    location.href="blog/index.jsp#jump-to";
}

$(document).ready(function(){$( "#login" ).click(function() {
        document.getElementById("login-form").style.width = "100%";       
});});

function openNav() {
    document.getElementById("myNav").style.width = "100%";
    document.getElementById("login-form").style.width = "0%";
    return false;
}

/* Close when someone clicks on the "x" symbol inside the overlay */
function closeNav() {
    document.getElementById("myNav").style.width = "0%";
    document.getElementById("login-form").style.width = "100%";
    return false;
}

function closeLogin(){
    document.getElementById("login-form").style.width = "0%";
    return false;
}