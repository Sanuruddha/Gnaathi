<div id="main-chatbox" style="height:450px;">
    <div class="chat-container">
        <div class="portlet portlet-default" style="margin-bottom:2px;">
            <div class="portlet-heading">
                <div class="portlet-title">
                    <h4><i class="fa fa-circle text-green"></i>Friend list</h4>
                </div>
                <div class="portlet-widgets">
                    <div class="btn-group">
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

                    </div>
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
    <div class="chat-container">
        <div class="portlet portlet-default" style="margin-bottom:2px;">
            <div class="portlet-heading">
                <div class="portlet-title">
                    <h4><i class="fa fa-circle text-green"></i><font id="heading"></font></h4>
                </div>
                <div class="portlet-widgets" onclick="closeUser()" style="cursor: pointer">&#10006</div>
                <div class="portlet-widgets">
                    <div class="btn-group">
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
                        <input hidden="true" type="text" id="name_self" value="<%=session.getAttribute("user_name")%>">
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

