function loadArticle(topic){
    $.get("index.jsp?topic="+topic,
    function(data){
        $("#article-container").html(data);
    });
    return false;
}
