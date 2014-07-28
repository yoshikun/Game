<!DOCTYPE html>
<!-- saved from url=(0014)about:internet -->
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en"> 
    <!-- 
    Smart developers always View Source. 
    
    This application was built using Adobe Flex, an open source framework
    for building rich Internet applications that get delivered via the
    Flash Player or to desktops via Adobe AIR. 
    
    Learn more about Flex at http://flex.org 
    // -->
    <head>
        <title></title>
        <meta name="google" value="notranslate" />         
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
        <!-- Include CSS to eliminate any default margins/padding and set the height of the html element and 
             the body element to 100%, because Firefox, or any Gecko based browser, interprets percentage as 
             the percentage of the height of its parent container, which has to be set explicitly.  Fix for
             Firefox 3.6 focus border issues.  Initially, don't display flashContent div so it won't show 
             if JavaScript disabled.
        -->
        <style type="text/css" media="screen"> 
            html, body  { height:100%;}
            body { margin:0; padding:0; overflow:auto; text-align:center; 
                   background-color: #000000; }   
            object:focus { outline:none; }
            #flashContent { display:none; }
        </style>
            
        <script type="text/javascript" src="application/views/swfobject.js"></script>
        <script type="text/javascript">
            // For version detection, set to min. required Flash Player version, or 0 (or 0.0.0), for no version detection. 
            var swfVersionStr = "10.2.0";
            // To use express install, set to playerProductInstall.swf, otherwise the empty string. 
            var xiSwfUrlStr = "application/views/playerProductInstall.swf";
            var url = window.location.href;
            var allParam = [];
            var urlArray = url.split("?");
            if (urlArray.length > 1) {
                  var urlParams = urlArray[1];
                  allParam = urlParams.split("&");
            }
            function setCookie(name, value) 
            { 
                var argv = setCookie.arguments; 
                var argc = setCookie.arguments.length; 
                var expires = (argc > 2) ? argv[2] : null; 
                if (expires!=null) 
                { 
                    var LargeExpDate = new Date (); 
                    LargeExpDate.setTime(LargeExpDate.getTime() + (expires*1000*3600*24));         
                } 
                document.cookie = name + "=" + escape (value)+((expires == null) ? "" : ("; expires=" +LargeExpDate.toGMTString())); 
            }
            function getCookie(Name) 
            { 
                var search = Name + "=";
                if(document.cookie.length > 0) 
                { 
                    offset = document.cookie.indexOf(search);
                    if(offset != -1) 
                    { 
                        offset += search.length;
                        end = document.cookie.indexOf(";", offset);
                        if(end == -1) end = document.cookie.length;
                        return unescape(document.cookie.substring(offset, end));
                    } 
                    else return "";
                } 
            }
            var flashvars = {};
            for (var i = 0; i < allParam.length; i++) {
                var param = allParam[i].split("=");
                flashvars[param[0]] = param[1];
            }
            var unloadFlag = <?php echo $unloadCheck?>;
            var unloadStr = "是否要退出勇士法则";
            function setUnloadString(str)
            {
                unloadStr = str;
            }
            
            function setUnloadFlag()
            {
                unloadFlag = false;
            }
            
            window.onbeforeunload = function(event){
                if(unloadFlag)
                {
                    //if (addfavorite('义乐-勇士法则','http://ys.yile.com') == false) {
                    try {
                        var text;
                        if (! getSWF("Main").offlineText) {
                            text = unloadStr;
                        } else {
                            text = getSWF("Main").offlineText();
                        }
                        if (! text) {
                            text = unloadStr;
                        }
                    }
                    catch(e) {}
                        return text;
                    //}
                }
            }
            function getSWF(movieName) 
            {  
                if (navigator.appName.indexOf("Microsoft") != -1) 
                {  
                    return window[movieName];  
                } 
                else 
                {  
                    return document[movieName]; 
                } 
            }
            function addfavorite(title,url){
                if (document.all && window.external.addFavorite){
                    window.external.addFavorite(url,title);
                }else if (window.sidebar && window.sidebar.addPanel){
                    window.sidebar.addPanel(title, url, "");
                }else{
                    return false;
                }
                return true;
            }

            // 认证信息
            flashvars['gauth'] = '<?php echo $gauth?>';
            // 充值地址
            flashvars['rechargeUrl'] = '<?php echo $rechargeUrl?>';
            // 版本号
            flashvars['version'] = '<?php echo $version?>';
            <?php
            if ($debug == 1) {
            ?>
            flashvars['debug'] = '<?php echo $debug?>';
            <?php
            }
            ?>
            <?php
            if ($sid == 65) {
            ?> 
            flashvars['logUrl'] = 'http://web.ys.yile.com/index.php?c=Log';
            flashvars['platform'] = '1';
            flashvars['zone'] = '<?php echo $sid?>';
            <?php
            }
            ?>
            flashvars['url'] = '<?php echo $url?>';
            flashvars['isClient'] = '<?php echo $isClient?>';
            flashvars['clientUrl'] = '<?php echo $clientUrl?>';
            flashvars['cmUrl'] = '<?php echo $cmUrl?>';
            <?php
            if (false) {
            ?> 
            flashvars['hideCutScene'] = '1';
            <?php
            }
            ?>
            var params = {};
            params.quality = "high";
            params.bgcolor = "#000000";
            params.allowscriptaccess = "always";
            params.allowfullscreen = "true";
            params.wmode = "direct";
            params.allowFullScreenInteractive = "true";
            var attributes = {};
            attributes.id = "Main";
            attributes.name = "Main";
            attributes.align = "middle";
            var flashVersion = swfobject.getFlashPlayerVersion();
			swfobject.embedSWF(
				"<?php echo $resUrl?><?php echo $version?>.swf", "flashContent", 
				"1000", "600", 
				swfVersionStr, xiSwfUrlStr, 
				flashvars, params, attributes);
            // JavaScript enabled so display the flashContent div in case it is not replaced with a swf object.
            swfobject.createCSS("#flashContent", "display:block;text-align:left;");

            function disableCopyPaste(elm) {   
                elm.oncontextmenu = function() {   
                    return false;   
                }   
              
                //elm.onkeydown = interceptKeys;     
            }   
              
            function interceptKeys(evt) {   
                var evt = evt || window.event,   
                    c = evt.keyCode,   
                    ctrlDown = evt.ctrlKey;   
              
                if (ctrlDown && c===67) { // c   
                    return false;   
                } else if (ctrlDown && c===86) { // v   
                    return false;   
                } else if (ctrlDown && c===88) { // x   
                    return false;   
                } else {   
                    return true;   
                }   
            }
            // disableCopyPaste(document); 

        </script>
    </head>
    <body style="background-color:#000000">
        <!-- SWFObject's dynamic embed method replaces this alternative HTML content with Flash content when enough 
             JavaScript and Flash plug-in support is available. The div is initially hidden so that it doesn't show
             when JavaScript is disabled.
        -->
		<div id="flashWrapper">
        <div id="flashContent">
            <p>
                To view this page ensure that Adobe Flash Player version 
                11.1.0 or greater is installed. 
            </p>
            <script type="text/javascript"> 
                var pageHost = ((document.location.protocol == "https:") ? "https://" : "http://"); 
                document.write("<a href='http://www.adobe.com/go/getflashplayer'><img src='" 
                                + pageHost + "www.adobe.com/images/shared/download_buttons/get_flash_player.gif' alt='Get Adobe Flash player' /></a>" ); 
            </script> 
        </div>
        </div>
        
        <noscript>
            <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="1000" height="600" id="Main">
                <param name="movie" value="http://static.ys.yile.com/ysgame/<?php echo $version?>.swf" />
                <param name="quality" value="high" />
                <param name="bgcolor" value="#000000" />
                <param name="allowScriptAccess" value="sameDomain" />
                <param name="allowFullScreen" value="true" />
                <!--[if !IE]>-->
                <object type="application/x-shockwave-flash" data="http://static.ys.yile.com/ysgame/<?php echo $version?>.swf" width="1000" height="600">
                    <param name="quality" value="high" />
                    <param name="bgcolor" value="#000000" />
                    <param name="allowScriptAccess" value="sameDomain" />
                    <param name="allowFullScreen" value="true" />
                <!--<![endif]-->
                <!--[if gte IE 6]>-->
                    <p> 
                        Either scripts and active content are not permitted to run or Adobe Flash Player version
                        11.1.0 or greater is not installed.
                    </p>
                <!--<![endif]-->
                    <a href="http://www.adobe.com/go/getflashplayer">
                        <img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="Get Adobe Flash Player" />
                    </a>
                <!--[if !IE]>-->
                </object>
                <!--<![endif]-->
            </object>
        </noscript>     
   </body>
   <script type="text/javascript">
			calcPosition();
			window.onresize = calcPosition;
			function calcPosition() {
				var clientSize = getSize();
				var flashWrapper = document.getElementById('flashWrapper');
				flashWrapper.style.top = (clientSize[1] - 600) / 2 + 'px';
                flashWrapper.style.left = (clientSize[0] - 1000) / 2 + 'px';
                flashWrapper.style.position = 'absolute';
			}
			function getSize() {
				var bw, bh;
				if (window.innerHeight)
				{
					bw = window.innerWidth;
					bh = window.innerHeight;
				}
				else if (document.documentElement && document.documentElement.clientHeight)
				{
					bw = document.documentElement.clientWidth;
					bh = document.documentElement.clientHeight;
				}
				else if (document.body)
				{
					bw = document.body.clientWidth
					bh = document.body.clientHeight;
				}
				return [bw, bh];
			}
   </script>
</html>
