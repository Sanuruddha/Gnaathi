<style>
    .portlet {
        
        margin-bottom: 15px;
    }

    .btn-white {
        border-color: #cccccc;
        color: #333333;
        background-color: #ffffff;
    }

    .portlet {
        border: 1px solid;
        
        
    }

    .portlet .portlet-heading {
        padding: 0 15px;
    }

    .portlet .portlet-heading h4 {
        padding: 1px 0;
        font-size: 16px;
    }

    .portlet .portlet-heading a {
        color: #fff;
    }

    .portlet .portlet-heading a:hover,
    .portlet .portlet-heading a:active,
    .portlet .portlet-heading a:focus {
        outline: none;
    }

    .portlet .portlet-widgets .dropdown-menu a {
        color: #333;
    }
    .chat-container{
        width:100%;
        height:100%;
    }

    .portlet .portlet-widgets ul.dropdown-menu {
        min-width: 0;
    }

    .portlet .portlet-heading .portlet-title {
        float: left;
    }

    .portlet .portlet-heading .portlet-title h4 {
        margin: 10px 0;
    }

    .portlet .portlet-heading .portlet-widgets {
        float: right;
        margin: 8px 0;
    }

    .portlet .portlet-heading .portlet-widgets .tabbed-portlets {
        display: inline;
    }

    .portlet .portlet-heading .portlet-widgets .divider {
        margin: 0 5px;
    }

    .portlet .portlet-body {
        padding: 15px;
        background: #fff;
    }

    .portlet .portlet-footer {
        height:100%;
        padding: 10px 15px;
        background: #e0e7e8;
    }

    .portlet .portlet-footer ul {
        margin: 0;
    }

    .portlet-green,
    .portlet-green>.portlet-heading {
        border-color: #16a085;
    }

    .portlet-green>.portlet-heading {
        color: #fff;
        background-color: #16a085;
    }

    .portlet-orange,
    .portlet-orange>.portlet-heading {
        border-color: #f39c12;
    }

    .portlet-orange>.portlet-heading {
        color: #fff;
        background-color: #f39c12;
    }

    .portlet-blue,
    .portlet-blue>.portlet-heading {
        border-color: #2980b9;
    }

    .portlet-blue>.portlet-heading {
        color: #fff;
        background-color: #2980b9;
    }

    .portlet-red,
    .portlet-red>.portlet-heading {
        border-color: #e74c3c;
    }

    .portlet-red>.portlet-heading {
        color: #fff;
        background-color: #e74c3c;
    }

    .portlet-purple,
    .portlet-purple>.portlet-heading {
        border-color: #8e44ad;
    }

    .portlet-purple>.portlet-heading {
        color: #fff;
        background-color: #8e44ad;
    }

    .portlet-default,
    .portlet-dark-blue,
    .portlet-default>.portlet-heading,
    .portlet-dark-blue>.portlet-heading {
        border-color: #34495e;
    }

    .portlet-default>.portlet-heading,
    .portlet-dark-blue>.portlet-heading {
        color: #fff;
        background-color: #61a2b4;
    }

    .portlet-basic,
    .portlet-basic>.portlet-heading {
        border-color: #333;
    }

    .portlet-basic>.portlet-heading {
        border-bottom: 1px solid #333;
        color: #333;
        background-color: #fff;
    }

    @media(min-width:768px) {
        .portlet {
            margin-bottom: 30px;
        }
    }

    .text-green {
        color: #16a085;
    }

    .text-orange {
        color: #f39c12;
    }

    .text-red {
        color: #e74c3c;
    }  

    #chat-body a,#list-body a{
        cursor: pointer;
    }
</style>
<div id="main-chatbox" style="height:450px;">
    <div class="chat-container">
        <div class="portlet portlet-default" style="margin-bottom:2px;">
            <div class="portlet-heading">
                <div class="portlet-title">
                    <h4><i class="fa fa-circle text-green"></i>Friend list</h4>
                </div>
                <div class="portlet-widgets" onclick="closeChat()" style="cursor: pointer">&#10006</div>
                <div class="portlet-widgets">
                    <!--<div class="btn-group">
                        <button type="button" class="btn btn-white dropdown-toggle btn-xs" data-toggle="dropdown">
                            <i class="fa fa-circle text-green"></i> Status
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#"><i class="fa fa-circle text-green"></i> Online</a>
                            </li>
                            <li><a href="#"><i class="fa fa-circle text-orange"></i> Away</a>
                            </li>
                            <li><a href="#"><i class="fa fa-circle text-red"></i> Offline</a>
                            </li>
                        </ul>

                    </div>-->
                    <span class="divider"></span>
                    <a data-toggle="collapse" data-parent="#accordion" href="#chat"><i class="fa fa-chevron-down"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div id="friend-chat" class="panel-collapse collapse in">
                <div>
                    <div id="list-body" class="portlet-body chat-widget" style="overflow-y: auto; width: auto; height: 300px;">


                    </div>
                </div>
                <div class="portlet-footer">
                    <form role="form">
                        <div class="form-group">
                            <input class="form-control" placeholder="Enter name..." id="friend-name">
                        </div>
                        <div class="form-group">
                            <button type="button" class="btn btn-default pull-right" id="search-button" onclick="searchFriend()">Search</button>
                            <div class="clearfix"></div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<div id="user-chatbox" style="display:none">
    <input type="text" hidden="true" id="id">
    <div class="chat-container">
        <div class="portlet portlet-default" style="margin-bottom:2px;">
            <div class="portlet-heading">
                <div class="portlet-title">
                    <h4><i class="fa fa-circle text-green"></i><font id="heading"></font></h4>
                </div>
                <div class="portlet-widgets" onclick="closeUser()" style="cursor: pointer">&#10006</div>
                <div class="portlet-widgets">

                    <div class="btn-group">
                        <!--
                        <i class="fa fa-circle text-green"></i> Status
                        <span class="caret"></span>

                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#"><i class="fa fa-circle text-green"></i> Online</a>
                            </li>
                            <li><a href="#"><i class="fa fa-circle text-orange"></i> Away</a>
                            </li>
                            <li><a href="#"><i class="fa fa-circle text-red"></i> Offline</a>
                            </li>
                        </ul>
                        -->
                        <input hidden="true" type="text" id="name_self" value="<%=session.getAttribute("user_name")%>">
                        <input hidden="true" type="text" id="id_self" value="<%=session.getAttribute("user_id")%>">
                    </div>
                    <span class="divider"></span>
                    <a data-toggle="collapse" data-parent="#accordion" href="#chat"><i class="fa fa-chevron-down"></i></a>
                </div>

                <div class="clearfix"></div>
            </div>
            <div id="user-chat" class="panel-collapse collapse in">
                <div>
                    <div id="chat-body" class="portlet-body chat-widget" style="overflow-y: auto; width: auto; height: 300px;">
                        <div class="row">
                            <div class="col-lg-12">
                                <p class="text-center text-muted small">January 1, 2014 at 12:23 PM</p>
                            </div>
                        </div>
                        <div class="row" style="display:none">
                            <div class="col-lg-12">
                                <div class="media">
                                    <a class="pull-left" href="#">
                                        <img class="media-object img-circle" src="http://lorempixel.com/30/30/people/1/" alt="">
                                    </a>
                                    <div class="media-body">
                                        <h4 class="media-heading" id="title">
                                        </h4>
                                        <p>Hi</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr>

                    </div>
                </div>
                <div class="portlet-footer">
                    <form role="form">
                        <div class="form-group">
                            <textarea class="form-control" placeholder="Enter message..." id="message"></textarea>
                        </div>
                        <div class="form-group">
                            <button type="button" class="btn btn-default pull-right" id="chat-send">Send</button>
                            <div class="clearfix"></div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

