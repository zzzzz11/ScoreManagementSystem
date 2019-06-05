<#compress>
    <#macro base base_title base_keywords="" base_js=[] base_css=[]>
        <#assign ctx=request.contextPath />
        <html lang="zh">
        <head>
            <#-- 静态资源根目录 -->
            <base id="statics" href="${ctx}/statics/">
            <title>${base_title}</title>
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <meta name="robots" content="all,follow">
            <!-- Bootstrap CSS-->
            <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
            <!-- Font Awesome CSS-->
            <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
            <!-- Fontastic Custom icon font-->
            <link rel="stylesheet" href="css/fontastic.css">
            <!-- Google fonts - Poppins -->
            <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">
            <!-- theme stylesheet-->
            <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
            <!-- Custom stylesheet - for your changes-->
            <link rel="stylesheet" href="css/custom.css">
            <!-- Favicon-->
            <link rel="shortcut icon" href="img/favicon.ico">
            <#-- 遍历扩展页css -->
            <#list base_css as c>
                <link rel="stylesheet" href="${c}">
            </#list>

            <style type="text/css">
                @-webkit-keyframes chartjs-render-animation {
                    from {
                        opacity: 0.99
                    }
                    to {
                        opacity: 1
                    }
                }

                @keyframes chartjs-render-animation {
                    from {
                        opacity: 0.99
                    }
                    to {
                        opacity: 1
                    }
                }

                .charts-render-monitor {
                    -webkit-animation: chartjs-render-animation 0.001s;
                    animation: chartjs-render-animation 0.001s;
                }
            </style>
        </head>

        <body>
        <div class="page">
            <!-- Main Navbar -->
            <header class="header">
                <nav class="navbar">
                    <div class="container-fluid">
                        <div class="navbar-holder d-flex align-items-center justify-content-between">
                            <!-- Navbar Header-->
                            <div class="navbar-header">
                                <a href="#" class="navbar-brand d-none d-sm-inline-block">
                                    <div class="brand-text d-none d-lg-inline-block">
                                        <span>Bootstrap </span><strong>Dashboard</strong>
                                    </div>
                                    <div class="brand-text d-none d-sm-inline-block d-lg-none"><strong>BD</strong></div>
                                </a>
                                <!-- Toggle Button-->
                                <a id="toggle-btn" href="#"
                                   class="menu-btn active">
                                    <span></span><span></span><span></span>
                                </a>
                            </div>
                            <ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
                                <li class="nav-item dropdown">
                                    <a id="notifications" rel="nofollow" data-target="#"
                                       href="#"
                                       data-toggle="dropdown" aria-haspopup="true"
                                       aria-expanded="false"
                                       class="nav-link">
                                        <i class="fa fa-bell-o"></i>
                                        <span class="badge bg-red badge-corner">12</span>
                                    </a>
                                    <ul aria-labelledby="notifications" class="dropdown-menu">
                                        <li>
                                            <a rel="nofollow" href="#" class="dropdown-item">
                                                <div class="notification">
                                                    <div class="notification-content">
                                                        <i class="fa fa-envelope bg-green"></i>
                                                        You have 6 new messages
                                                    </div>
                                                    <div class="notification-time">
                                                        <small>4 minutes ago</small>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a rel="nofollow" href="#" class="dropdown-item">
                                                <div class="notification">
                                                    <div class="notification-content">
                                                        <i class="fa fa-twitter bg-blue"></i>
                                                        You have 2 followers
                                                    </div>
                                                    <div class="notification-time">
                                                        <small>4 minutes ago</small>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a rel="nofollow" href="#"
                                               class="dropdown-item all-notifications text-center">
                                                <strong>view all notifications </strong>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="nav-item">
                                    <a href="${ctx}/logout" class="nav-link logout">
                                        <span class="d-none d-sm-inline">Logout</span>
                                        <i class="fa fa-sign-out"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </header>
            <#-- 侧边栏的位置 -->
            <#nested>
        </div>

        <!-- JavaScript files-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/popper.js/umd/popper.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="vendor/jquery.cookie/jquery.cookie.js"></script>
        <script src="vendor/chart.js/Chart.min.js"></script>
        <script src="vendor/jquery-validation/jquery.validate.min.js"></script>
        <!-- Main File-->
        <script src="js/front.js"></script>

        <#-- 遍历扩展页js -->
        <#list base_js as j>
            <script src="${j}"></script>
        </#list>
        </body>
        </html>
    </#macro>
</#compress>
