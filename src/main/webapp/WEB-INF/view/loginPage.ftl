<#assign ctx=request.contextPath />
<!DOCTYPE html>
<html lang="zh">
<head>
    <base id="statics" href="${ctx}/statics/">
    <title>登录界面</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="robots" content="all,follow">
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/fontastic.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
    <link rel="stylesheet" href="css/custom.css">
    <link rel="shortcut icon" href="img/favicon.ico">
</head>
<body>
<div class="page login-page">
    <div class="container d-flex align-items-center">
        <div class="form-holder has-shadow">
            <div class="row">
                <!-- Logo & Information Panel-->
                <div class="col-lg-6">
                    <div class="info d-flex align-items-center">
                        <div class="content">
                            <div class="logo">
                                <h1>Dashboard</h1>
                            </div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                        </div>
                    </div>
                </div>
                <!-- Form Panel    -->
                <div class="col-lg-6 bg-white">
                    <div class="form d-flex align-items-center">
                        <div class="content">
                            <form method="post" class="form-validate" action="${ctx}/login">
                                <div class="form-group">
                                    <input id="login-account" type="text" name="accountNumber" required
                                           data-msg="Please enter your account number" class="input-material">
                                    <label for="login-account" class="label-material">Account Number</label>
                                </div>
                                <div class="form-group">
                                    <input id="login-password" type="password" name="password" required
                                           data-msg="Please enter your password" class="input-material">
                                    <label for="login-password" class="label-material">Password</label>
                                </div>
                                <div class="form-group">
                                    <input id="login" type="submit" value="Login" class="btn btn-primary">
                                </div>
                            </form>
                            <#if message??>
                                <div class="alert alert-danger alert-dismissible fade show" role="alert"
                                     style="width: fit-content">
                                    <strong>${message}</strong>
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                            </#if>
                            <a href="#" class="forgot-pass">Forgot Password?</a><br>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="copyrights text-center">
        <p>Design by <a href="#" class="external">Bootstrapious</a></p>
    </div>
</div>

<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/popper.js/umd/popper.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="vendor/jquery.cookie/jquery.cookie.js"></script>
<script src="vendor/chart.js/Chart.min.js"></script>
<script src="vendor/jquery-validation/jquery.validate.min.js"></script>
<!-- Main File-->
<script src="js/front.js"></script>
</body>
</html>