<!DOCTYPE html>
<html>
    <head>
        <title>Gnaathi</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="wiki.css">
        <link rel="stylesheet" href="cancer/article.css">
        <link rel="stylesheet" href="diabetes/article.css">
        <link rel="stylesheet" href="dengue/article.css">
        <link rel="stylesheet" href="../css/bootstrap-3.3.7-dist/css/bootstrap.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script  type="text/javascript" src="wiki.js"></script>
    </head>
    <body>
        <header>
            <div id='header'>
                <img id='header-background' src="img/edit/websiteedit_0010_headerback.png" alt="header back">
                <a href="../home.html"><img id='logo' src="img/edit/websiteedit_0008_logo.png" alt="logo"></a>
                <img id='picture' src="img/edit/websiteedit_0006_picture.png" alt="picture">
                <img id='login' src="img/edit/websiteedit_0000_settings.png" alt="login">
                <img id='clock' src="img/edit/websiteedit_0001_clock.png" alt="clock">
                <a href="index.html"><div id='door'><img src="img/edit/websiteedit_0007_door.png" alt="door"></div></a>
                <div id='logout'><img src="img/edit/websiteedit_0004_----Logout.png" alt="logout"></div>

            </div>
        </header>
        <%
            String topic = request.getParameter("topic");
            if (topic != null) {
                String url=topic+"/"+topic+".html";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            }

        %>

        <div id="body">
            <div id="tv-container">
                <div id="tv-screen"></div>
                <img src="img/edit/websiteedit_0011_TV.png" alt="tv">
            </div>
            <div id="middle-container">        
            </div>
            <div id="screen-container">
                <div id="projector-screen"></div>
                <img src="img/edit/websiteready_0002_projector.png" alt="screen">
            </div>
        </div>
        <div class="container-fluid" id="long-container">
            <div class="row">
                <div class="col-sm-12">
                    <div id="wiki-header"><font id="wiki-title">Welcome to Gnaathi Wiki !</font></div>
                </div>
                <div class="col-sm-12">
                    <div id="wiki-left">
                        <img src="">
                        <div>
                            <font>Topics</font>

                            <ul id="category-list">
                                <li><a onclick="loadArticle('cancer')">Cancer</a></li>
                                <li><a onclick="loadArticle('diabetes')">Diabetes</a></li>
                                <li><a onclick="loadArticle('hiv')">HIV</a></li>
                                <li><a onclick="loadArticle('dengue')">Dengue</a></li>
                            </ul>
                        </div>
                    </div><div class="devider"></div><!--
                    --><div id="wiki-middle"><div id="article-container">
                            <h2>Did you know these 10 facts about diabetes? ...</h2>
                            <ul>
                                <li>About one third of all people with diabetes do not know they have the disease.</li>

                                <li>Type 2 diabetes often does not have any symptoms.</li>

                                <li>Only about five percent of all people with diabetes have type 1 diabetes.</li>

                                <li>If you are at risk, type 2 diabetes can be prevented with moderate weight loss (10?15 pounds) and 30 minutes of moderate physical activity (such as brisk walking) each day.</li>

                                <li>A meal plan for a person with diabetes isn?t very different than that which is recommended for people without diabetes.</li>

                                <li>Diabetes is the leading cause of blindness in working-age adults.</li>

                                <li>People with diabetes are twice as likely to develop heart disease than someone without diabetes.</li>

                                <li>Good control of diabetes significantly reduces the risk of developing complications and prevents complications from getting worse.</li>

                                <li>Bariatric surgery can reduce the symptoms of diabetes in obese people.</li>

                                <li>Diabetes costs $174 billion annually, including $116 billion in direct medical expenses. </li>
                            </ul>
                        </div></div><div class="devider"></div><!--
                    --><div id="wiki-right"></div>
                </div>
            </div>
        </div>
    </body>

</html>