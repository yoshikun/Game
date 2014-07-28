<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<!--META-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录界面</title>

<!--STYLESHEETS-->
<link href="views/css/style.css" rel="stylesheet" type="text/css" />

<!--SCRIPTS-->
<script type="text/javascript" src="views/js/jquery.min.js"></script>
<!--Slider-in icons-->
<script type="text/javascript">
$(document).ready(function() {
	$(".username").focus(function() {
		$(".user-icon").css("left","-48px");
	});
	$(".username").blur(function() {
		$(".user-icon").css("left","0px");
	});
	
	$(".password").focus(function() {
		$(".pass-icon").css("left","-48px");
	});
	$(".password").blur(function() {
		$(".pass-icon").css("left","0px");
	});
});
</script>

</head>
<body>

<!--GRADIENT--><div class="gradient"></div><!--END GRADIENT-->

<!--WRAPPER-->
<div id="wrapper">

	<!--SLIDE-IN ICONS-->
    <div class="user-icon"></div>
    <div class="pass-icon"></div>
    <!--END SLIDE-IN ICONS-->

<!--LOGIN FORM-->
<form name="login-form" class="login-form" action="<?php echo $_SERVER['PHP_SELF']?>?c=welcome&m=login" method="post">

	<!--HEADER-->
    <div class="header">
    <!--TITLE--><h1>进击的勇士</h1><!--END TITLE-->
    <?php if ($error):?>
    <span class="error"><?php echo $error?></span>
	<?php else: ?>
    <span>请输入用户名密码进行登录，如还未注册用户，登录时会自动以登录用户，密码进行注册</span>
	<?php endif; ?>
    </div>
    <!--END HEADER-->
	
	<!--CONTENT-->
    <div class="content">
	<!--USERNAME--><input name="username" type="text" class="input username" value="请输入用户名" onfocus="this.value=''" /><!--END USERNAME-->
    <!--PASSWORD--><input name="password" type="password" class="input password" value="123456" onfocus="this.value=''" /><!--END PASSWORD-->
    </div>
    <!--END CONTENT-->
    
    <!--FOOTER-->
    <div class="footer">
    <!--LOGIN BUTTON--><input type="submit" name="submit" value="登录" class="button" /><!--END LOGIN BUTTON-->
    <!--REGISTER BUTTON--><input type="submit" name="submit" value="注册" class="register" /><!--END REGISTER BUTTON-->
    </div>
    <!--END FOOTER-->

</form>
<p style="font-size: 12px;margin-top: 10px;line-height: 21px;text-shadow: 1px 1px 0 rgba(256,256,256,1.0);">
抵制不良游戏  拒绝盗版游戏 注意自我保护 谨防受骗上当<br/>
适度游戏益脑  沉迷游戏伤身 合理安排时间 享受健康生活
</p>
<!--END LOGIN FORM-->

</div>
<!--END WRAPPER-->

</body>
</html>
