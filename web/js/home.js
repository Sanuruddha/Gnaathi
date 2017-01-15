

function processSelect(val) {

    if (val === "3") {
        if (document.getElementById("reg-table").rows.length !== 9) {
            $("#register-form").css("height", "340px");
            //$("#register-form").css("width", "440px");
            var row = document.getElementById("reg-table").insertRow(7);
            var cell1 = row.insertCell(0);
            var cell2 = row.insertCell(1);
            var cell3 = row.insertCell(2);
            cell1.innerHTML = "<div  id='register-label6'>Society registration number:</div>";
            cell2.innerHTML = "<input type='text' required>";
            cell3.innerHTML = "";
        }
    } else {
        if (document.getElementById("reg-table").rows.length !== 8) {
            document.getElementById("reg-table").deleteRow(7);
            $("#register-form").css("height", "270px");
           // $("#register-form").css("width", "440px");
        }

    }
}

function validateForm() {
    if (validateEmail() && validateName() && validatePassword() && validateRePassword())
        return true;
    return false;

}

function validateEmail()
{
    var val = document.getElementById("email-field").value;
    if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(val))
    {
        document.getElementById("email-field").style.border = "2px inset green";
        return true;
    } else {
        document.getElementById("email-field").style.border = "2px inset red";
        return false;
    }

}

function validateName() {
    var val = document.getElementById("name-field").value;
    if (val.length <= 5) {
        document.getElementById("name-field").style.border = "2px inset red";
        return false;
    } else {
        document.getElementById("name-field").style.border = "2px inset green";
        return true;
    }
}

function validatePassword() {
    var val = document.getElementById("password-field").value;
    if (val.length <= 6) {
        document.getElementById("password-field").style.border = "2px inset red";
        return false;
    } else {
        document.getElementById("password-field").style.border = "2px inset green";
        return true;
    }
}

function validateRePassword() {
    var val1 = document.getElementById("password-field").value;
    var val2 = document.getElementById("repassword-field").value;
    if (val1 !== val2) {
        document.getElementById("repassword-field").style.border = "2px inset red";
        return false;
    } else {
        document.getElementById("repassword-field").style.border = "2px inset green";
        return true;
    }
}

function loadWiki() {
    location.href = "wiki/index.jsp#jump-to";
}

function loadForum() {
    location.href = "forum/index.jsp#jump-to";
}

function loadBlog() {
    location.href = "blog/index.jsp#jump-to";
}

function loadVideo() {
    location.href = "gallery/index.jsp";
}

function loadImage() {
    location.href = "image_gallery/index.html";
}

$(document).ready(function () {
    $("#login").click(function () {
        document.getElementById("login-form").style.width = "100%";
    });
});

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

function closeLogin() {
    document.getElementById("login-form").style.width = "0%";
    return false;
}

function loadProfile() {

}

function showNotifications() {

}