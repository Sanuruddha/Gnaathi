<!DOCTYPE html>
<html>

    <head>

        <title>Navigation</title>
        <link rel="stylesheet" href="css/bootstrap-3.3.7-dist/css/bootstrap.css">
        <style type="text/css">
            .center {	
                float: right;
                top:0;
                left:0; 
                padding-left: 0px;
                display: inline-block;

            }
        </style>

        <style type="text/css">

            body{
                padding: 10;
                margin: 10;
            }
            .menu{
                display: inline-block;
                background-color: #2ECC71;
                float: left;
            }

            .menu ul{
                list-style: none;
                margin: 0;
                padding: 0;
                display: inline-block;
            }
            .menu ul li{
                padding: 15px;
                position: relative;
                width: 150px;
                vertical-align: middle;
                background-color: #34495E;
                cursor: pointer;
                border-top: 1px solid #BDC3C7;
                -webkit-transition:all 0.3s;
                transition:all 0.3s;
                transition: all 0.3s;
            }
            .menu ul li:hover{
                background-color: #2ECC71;	
            }
            .menu > ul >li{
                border-right: 5px solid #F1C40F;
            }
            .menu ul ul{
                transition:all 0.3s;
                opacity: 0;
                position: absolute;
                border-left: 5px solid #F1C40F;;
                visibility: hidden;
                left:100%;
                top:-2%;
            }
            .menu ul li:hover>ul{
                opacity: 1;
                visibility: visible;
            }
            .menu ul li a{
                color: #fff;
                text-decoration: none;
            }
            span{
                margin-right: 15px;
            }
            .menu > ul >li:nth-of-type(2)::after{
                content: "+";
                position: absolute;
                margin-left: 35%;
                color: #fff;
                font-size: 20px;
            }
        </style>
    </head>


    <body>

        <div>
            
            <div class="menu">
                <ul>
                    <li><a href="#">Cancer</a></li>
                    <li> <a href="#">Diabetes</a></li>
                    <li> <a href="#">STDs</a></li>
                    <li> <a href="#">Kidney Diseases</a></li>
                    <li> <a href="#">Dengue</a></li>
                    <li> <a href="#">How to</a></li>
                    <a href="vir_tour.jsp">Virtual Tours</a>
                    <li> <a href="#">Tips and First Aid</a></li>
                    <li> <a href="#">Religious</a>
                        <ul>
                            <li> <a href="#">Bhuddhist</a></li>
                            <li> <a href="#">Christian</a></li>
                        </ul>

                    </li>
                    <li> <a href="#">Entertainment</a></li>



                </ul>
            </div>
        </div>


    </body>
</html>