<%--
Licensed to the Apache Software Foundation (ASF) under one or more
contributor license agreements.  See the NOTICE file distributed with
this work for additional information regarding copyright ownership.
The ASF licenses this file to You under the Apache License, Version 2.0
(the "License"); you may not use this file except in compliance with
the License.  You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
--%>
<%@ page session="false" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%
java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy");
request.setAttribute("year", sdf.format(new java.util.Date()));
request.setAttribute("tomcatUrl", "https://tomcat.apache.org/");
request.setAttribute("tomcatDocUrl", "/docs/");
request.setAttribute("tomcatExamplesUrl", "/examples/");

Thread.sleep(2000);

%>

<!DOCTYPE html>
<html lang="ko" 
	data-service="lineage"
>
<head>
	<!-- meata -->
	
		<title>리니지 - NCSOFT</title>
	    <meta charset="UTF-8" />
	    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
	    <!-- Mobile -->
	    <meta name="HandheldFriendly" content="True" />
	    <meta name="MobileOptimized" content="320" />
	    <meta name="viewport" content="user-scalable=no, maximum-scale=1.0, minimum-scale=1.0, width=device-width, initial-scale=1.0" />
	    <meta name="description" content="MMORPG의 살아 있는 신화, 리니지가 온라인 게임의 역사를 만들어갑니다." />
	    <meta name="keywords" content="리니지, LINEAGE" />

	    <!-- Facebook -->
	    <meta property="og:title" content="리니지 - NCSOFT" />
	    <meta property="og:image" content="https://assets.playnccdn.com/lineage/v1/img/meta/lineage_fb.jpg" />
	    <meta property="og:type" content="website" />
	    <!-- Twitter -->
	    <meta name="twitter:card" content="summary_large_image" />
	    <meta name="twitter:title" content="리니지 - NCSOFT"  />
	    <meta name="twitter:description" content="MMORPG의 살아 있는 신화, 리니지가 온라인 게임의 역사를 만들어갑니다." />

	    <meta name="twitter:image" content="https://assets.playnccdn.com/lineage/v1/img/meta/lineage_fb.jpg" />

		
		

	    <!-- shortcut -->
	    <link rel="shortcut icon" href="https://assets.playnccdn.com/lineage/v1/img/meta/lineage.ico" type="image/x-icon"/>
	    <link rel="icon" href="https://assets.playnccdn.com/lineage/v1/img/meta/lineage.ico" type="image/x-icon"/>
	    <link rel="apple-touch-icon" href="https://assets.playnccdn.com/lineage/v1/img/meta/lineage_home.png" type="image/png">
	
	
    <!-- css -->
    <link rel="stylesheet" href="https://assets.playnccdn.com/uikit/cnb/v3/css/nc-cnb.css?v=202302151513" />
 	
	    
		<link rel="stylesheet" href="https://assets.playnccdn.com/uikit/ncui/1.6.10/css/ncui.css?_=202302151513">
		 
	    	<link rel="stylesheet" type="text/css" href="https://assets.playnccdn.com/lineage/v1/css/l1.main.css?v=202302151513">
	    

	
 	
 	<!-- js -->
 	<!-- GTM head -->
 	
	<!-- Google Tag Manager 2019.02.-->
	<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
	new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
	j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
	'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
	})(window,document,'script','dataLayer','GTM-M3KJMLX');</script>
	<!-- End Google Tag Manager -->
	<!-- Google Tag Manager 20201224 -->
	<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
	new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
	j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
	'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
	})(window,document,'script','dataLayer','GTM-TB72J98');</script>
	<!-- End Google Tag Manager -->

 	

		<script src="https://assets.playnccdn.com/lineage/v1/js/common/vendor.js?v=202302151513"></script>
    	<script src="https://assets.playnccdn.com/lineage/v1/js/common/common.js?v=202302151513"></script>
    	<script src="https://assets.playnccdn.com/uikit/autosuggest/v1/js/AutoSuggest.js?v=202302151513"></script>
		<script src="https://assets.playnccdn.com/lineage/v1/js/common/uikit-lineage.js?v=202302151513"></script>

	    <script type="text/javascript">
			var _path = "/",
				_device = "pc",
				//_serviceRegion = "kr",
				_lineagePath = "https://lineage.plaync.com",
				_serviceEnv = "LIVE",
				isLoginFlag = "false",
				_isDarkmode = "false";

	        //<![CDATA[
	        var shareUrl = location.href;
	        var shareTitle = encodeURIComponent('리니지 - NCSOFT');
	        var logIdFacebook = '\'/리니지 - NCSOFT/facebook\'';
	        var logIdTwitter = '\'/리니지 - NCSOFT/twitter\'';
	        //]]>
	    </script>

	    <script type="text/javascript">
	    	var Server = function() {
	    		var _server_list_area;
				var _dropdown;
				
	    		this.init = function(parentElement, initServerId, callback) {
					if (_dropdown != null) {
						alert("already init!");
						return;
					}
					_init_server(parentElement, initServerId, callback);
				};
				
				this.initByData = function(parentElement, serverList, initServerId, callback) {					
					if (serverList != null && serverList != undefined) {
						var _wrap_server_list = parentElement.find('.ui-dropdown-server .option ul');
						_wrap_server_list.empty();
						var _serverListArray = []; 
						for (var _idx_server in serverList) {
							var _data_server = serverList[_idx_server];
							if( _data_server.serverId > 0) {
								_serverListArray.push( '<li><a href=\"#\" data-server-id="'+ _data_server.serverId +'">'+ _data_server.serverName +'</a></li>');
							} else {
								_serverListArray.push( '<li><a href=\"#\" data-server-id="'+ _data_server.id +'">'+ _data_server.name +'</a></li>');
							}
						}
						_serverListArray.join('');
						_wrap_server_list.append(_serverListArray);
					}
					_init_server(parentElement, initServerId, callback);
				};
				
				this.getSelectedServerId = function() {
					var _element_index = _dropdown.getActivatedOptionIndex()-1;
					return _server_list_area.find("a:eq("+_element_index+")").attr("data-server-id");
				};
				
				var _init_server = function(parentElement, initServerId, callback) {
					_server_list_area = parentElement.find('.ui-dropdown-server');
					var initIndex = _server_list_area.find("a").index(_server_list_area.find("a[data-server-id="+initServerId+"]"))+1;
					_dropdown = nc.lineage.dropdown({
						wrap: _server_list_area,
						activateIndex: initIndex,
						activateCallback: function(obj) {
							if (obj.prevIndex != 0 && obj.index != obj.prevIndex) {
								var _element_index = obj.index-1;
								callback(_server_list_area.find("a:eq("+_element_index+")").attr("data-server-id"));
							}
						}
					});
					_server_list_area.find(".btn-close").click(function() {
						_dropdown.close();
		            });
					// console.info(_dropdown);
				}
				this.construct = function(){};
				this.construct();
	    	};
		</script>

		<!-- /* IE 지원 종료 페이지 리다이렉트 */ -->
		<script>
			if(navigator.userAgent.indexOf('MSIE') > -1 || navigator.userAgent.indexOf('Trident') > -1){
				location.href = "https://assets.playnccdn.com" + '/support/not-supported-ie/html/index.html?lang='+ document.documentElement.getAttribute('lang');
			}
		</script>

		<script src="https://assets.playnccdn.com/uikit/uikit-dark-mode/js/ui.dark-mode.js?_=202302151513"></script>
		<script>
			new window._ui.darkmode();
		</script>

	

    <!-- /* <th:block th:if="${device eq 'pc'}">
	    <script th:src="|${ui['wstatic.common']}/support/launcherPluginLoader.js|"></script>
		<script th:src="|${ui['wstatic.common']}/js/gameStartLayer.js|"></script>
	    <script th:src="@{/js/launcher/launcher.js}"></script>
	    <script th:inline="javascript">
			(function ($) {
				$(document).ready(function () {
					var option = {
						"api_domain" : https://api-lineage.plaync.com,
						"verify_realname" : https://go.plaync.com/Account/CheckRealName
					};
					Launcher.init(option);
				});
			}(jQuery));
		</script>
	</th:block>*/ -->
</head>
<body class="pc page-main">

	<script>
    var _serverNameMap =[{"serverId":1,"serverName":"데포로쥬","serverType":"LIVE"},{"serverId":2,"serverName":"켄라우헬","serverType":"LIVE"},{"serverId":3,"serverName":"질리언","serverType":"LIVE"},{"serverId":4,"serverName":"이실로테","serverType":"LIVE"},{"serverId":5,"serverName":"조우","serverType":"LIVE"},{"serverId":6,"serverName":"하딘","serverType":"LIVE"},{"serverId":9,"serverName":"크리스터","serverType":"LIVE"},{"serverId":10,"serverName":"아툰","serverType":"LIVE"},{"serverId":11,"serverName":"가드리아","serverType":"LIVE"},{"serverId":12,"serverName":"군터","serverType":"LIVE"},{"serverId":13,"serverName":"아스테어","serverType":"LIVE"},{"serverId":14,"serverName":"듀크데필","serverType":"LIVE"},{"serverId":15,"serverName":"발센","serverType":"LIVE"},{"serverId":16,"serverName":"어레인","serverType":"LIVE"},{"serverId":17,"serverName":"캐스톨","serverType":"LIVE"},{"serverId":18,"serverName":"세바스챤","serverType":"LIVE"},{"serverId":19,"serverName":"데컨","serverType":"LIVE"},{"serverId":20,"serverName":"아인하사드","serverType":"LIVE"},{"serverId":21,"serverName":"파아그리오","serverType":"LIVE"},{"serverId":22,"serverName":"에바","serverType":"LIVE"},{"serverId":23,"serverName":"사이하","serverType":"LIVE"},{"serverId":24,"serverName":"마프르","serverType":"LIVE"},{"serverId":25,"serverName":"린델","serverType":"LIVE"},{"serverId":30,"serverName":"로엔그린","serverType":"LIVE"},{"serverId":48,"serverName":"오크","serverType":"LIVE"},{"serverId":53,"serverName":"피닉스","serverType":"LIVE"},{"serverId":55,"serverName":"서큐버스","serverType":"LIVE"},{"serverId":61,"serverName":"데스나이트","serverType":"LIVE"},{"serverId":62,"serverName":"사신","serverType":"LIVE"},{"serverId":64,"serverName":"나이트발드","serverType":"LIVE"},{"serverId":65,"serverName":"아덴","serverType":"LIVE"},{"serverId":100,"serverName":"테스트(PvP)","serverType":"TEST"},{"serverId":200,"serverName":"테스트(전투특화)","serverType":"TEST"}];
    var _boardCategoryMap = [];
    var _gameclassCategoryMap = [{"gameClassId":0,"gameClassName":"군주"},{"gameClassId":1,"gameClassName":"기사"},{"gameClassId":2,"gameClassName":"요정"},{"gameClassId":3,"gameClassName":"마법사"},{"gameClassId":4,"gameClassName":"다크엘프"},{"gameClassId":5,"gameClassName":"용기사"},{"gameClassId":6,"gameClassName":"환술사"},{"gameClassId":7,"gameClassName":"전사"},{"gameClassId":8,"gameClassName":"검사"},{"gameClassId":9,"gameClassName":"창기사"}];
</script>

	<!-- (s) CNB -->
	

<!-- CNB -->
<form name="FrmGNBLogout" id="FrmGNBLogout" action="https://loginapi.plaync.com/login/logout" method="post">
    <input type="hidden" name="return_url" value="" />
</form>
<div id="nc-cnb" class="nc-cnb nc-cnb--lineage" data-device=""></div>
<!-- // CNB -->

<!-- CNB JS -->
<script>
// LOGIN/OUT
function GNBLogin(){
var returnurl = "?site_id=13&return_url=" + escape(document.location.href);
var loginURL = "https://login.plaync.com/nclogin/signin"; 
document.location.href = loginURL + (loginURL.indexOf("?") > 0 ? "&"+returnurl.substring(1) : returnurl);
}

function GNBLogout(){
var frm = document.getElementById("FrmGNBLogout");
frm.submit();
}

$("form[name='FrmGNBLogout'] input[name='return_url']").val(document.location.href);

// 캐릭터 변경 버튼 눌렀을때의 동작이 정의된 함수
// function cnbCharacterChange() {}
</script>


        <script>
          
            var userData ={"locale":"ko-KR","now":"2023-02-15T16:05:02.500207678+09:00","site":"lineage","guid":"","useAccountType":"gameAccount","ncAccount":{"name":"","profileImage":"","url":"","target":""},"gameAccount":{"name":"","serverId":1,"serverName":"","gameUserUid":"","profileImage":"","url":"","subData":[]},"accountState":[],"nshop":{"coupon":0,"ncoin":0,"npoint":0,"ngrade":""},"isLogin":false};
        </script>


	
	<script src="https://assets.playnccdn.com/uikit/cnb/v3/js/cnb.js?v=202302151513"></script>
<!--	TODO 확인-->
<!--	<script sec:authorize="isAuthenticated()" th:src="|${ui['wstatic.base']}/js/common/cnb-support.js?v=${_timestamp}|"></script>-->
	
	<script>
		(function($) {
			$(document).ready(function() {
				if(!nc || !nc.lineage || !nc.lineage.cnbSupport) return;			
			
				nc.lineage.cnbSupport({
					wrapName: '#nc-cnb',
					apiDomain: 'https://api-lineage.plaync.com',
					isLogin: false,
					userData: window.userData || null
				});
			});
		}(jQuery));
	</script>

	
	<script src="https://assets.playnccdn.com/lineage/v1/js/common/cnb.config.ko.js?v=202302151513"></script>
	<script>
	//<![CDATA[
	    // 현재 활성화 될 메뉴, 비활성일 경우 null
	    /*cnbConfig.active = {
	        d1: 0,
        	d2: 0
	    };*/
	    // cnb 시작 함수를 실행
	    window.cnb && window.cnb.start( cnbConfig );
	  //]]>
	</script>
	<!-- // CNB JS -->

	<!-- (e) CNB -->
	<!-- RWD COMMON -->
	
		<script src="https://assets.playnccdn.com/plaync/rwdcommon/js/nc.rwd.common.1.1.0.js?v=202302151513"></script>
		<script type="text/javascript">
			window.ncrwd = new nc.rwd.common({
				wstatic: "https://assets.playnccdn.com",
				isLogin: false
			});
		</script>

	

	<!-- GTM body -->
	
	<!-- Google Tag Manager 2019.02. -->
	<script>
		var userLevel = 0;
		if (userData.gameAccount.accountStatus != undefined && userData.gameAccount.subData.length > 0 ) {
			userLevel = userData.gameAccount.subData[1].value.replace(/[^0-9]/g, '')
		}
		var dimensionValue = { platform : _device, isLogin : isLoginFlag, level : userLevel };
	</script>
	<!-- Google Tag Manager (noscript) -->
	<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-M3KJMLX" height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
	<!-- End Google Tag Manager (noscript) -->
	<!-- Google Tag Manager (noscript) 20201224 -->
	<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-TB72J98" height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
	<!-- End Google Tag Manager (noscript) -->


	<div id="container" class="container">

	    <div class="wrap-header">
	        <header class="header">
	            <h1 class="header-title">리니지 - NCSOFT</h1>
	        </header>
	    </div>

	    <!-- section-contents -->
	    <div class="section-contents">
	        <div class="wrap-contents">

				

				

				

	
	
	<!-- 프로모션 -->
	<!--	<th:block th:replace="main/promotion :: promotion"></th:block>-->
	<section class="section-promotion"></section>

	<!-- 숏컷 -->
	<div class="wrap-section-shortcut">
		<section class="section-shortcut"></section>
	</div>
	
	

	<div class="wrap-section wrap-section-portal">
	<section class="bundle">
	    <!-- 공지사항 -->
		<section class="section-notice"></section>
	
	    <!-- 핫이슈 -->
		

	<script>
		var popularKeyword = window.popularKeyword || {};
		popularKeyword.data = popularKeyword.data || [];
	</script>
	<!-- 핫이슈 인기키워드  -->
	<script src="https://assets.playnccdn.com/search/popkwd/popularkeyword_lineage.js?v=2023-02-15T16:05:02.448+09:00"></script>

    <section class="section-hotissue">
        <header>
            <h2>핫이슈</h2>
            <span class="btn-toggle"></span>
        </header>

        <article>
            <ol class="keyword"></ol>
        </article>
    </section>
    
	
	

	
		
		
			<!-- 로그인전 : 파워북/카툰 	 -->
			<section class="section-topcontent"></section>
		
	    
	</section>
	</div>

	<!-- 스페셜 -->
	
	<div class="wrap-section-special"></div>
	
	<!-- 리니지 월드, 서버지기 뉴스 리니지 라이프, 소식지 -->
	<div class="wrap-section wrap-section-article"></div>
	
	
	<!-- 공성전 -->
	
	<!-- 공성전 -->
	<!-- 스페셜 -->
	<div class="wrap-section-siege">
		<section class="section-siege">
			<header><h2>공성전</h2></header>
	        <article>
	        	<p class="siege__subject"><span data-date="2023-02-15T16:05:02.448+09:00"></span> 공성결과</p>
	        	<div class="siege">
	        		<div class="siege__map">
	        			<img src="https://assets.playnccdn.com/lineage/v1/img/main/siege-map.jpg" class="siege__mapimg" />
		        		<div class="siege__util">
							<!-- 서버선택 -->
							
	<div class="ui-dropdown ui-dropdown-server">
		<div class="select">
			<span></span>
		</div>
		<div class="option">
			<header>서버 변경</header><span class="btn-close">close</span>
			<ul></ul>
		</div>
	</div>

							<script>
								(function($) {
									$(document).ready(function() {
										var serverId = 1;
										new Server().initByData($(".ui-dropdown-server").parent(), _serverNameMap , serverId , function(serverId) {
											if(window.changeSiegeResult) window.changeSiegeResult(serverId);
										});
										/* new Server().init($(".siege__util"), serverId, function(_serverId) {
											// use window.changeSiegeResult from main.js
											if(window.changeSiegeResult) window.changeSiegeResult(_serverId);
										}); */
									});
								}(jQuery));
							</script>
						</div>
		        		<span class="siege__castle-giran" data-castle-id="4"><strong>혈</strong> 획득</span>
		        		<span class="siege__castle-orc" data-castle-id="2"><strong>혈</strong> 획득</span>
		        		<span class="siege__castle-kent" data-castle-id="1"><strong>혈</strong> 획득</span>
		        	</div>
		        	<div class="siege__content"></div>
		        	<!-- mainContentsUtil main-contents-siege -->
					
		        	
		        	
	        	</div>
	        	
	        </article>
		</section>
	</div>



	<!-- 판도라의 상점 nshop -->
	<div class="wrap-section wrap-section-nshop">
		<section class="section-nshop"></section>
	</div>
	
	<!-- 기타서비스 etc -->
	<div class="wrap-section wrap-section-etcservice">
		<section class="section-etcservice"></section>
	</div>

	

	<script src="https://assets.playnccdn.com/lineage/v1/js/main/main.js?v=202302151513"></script>
	<script>
	    (function ($) {
	        "use strict";
	
	        $(document).ready(function () {
	        	var serverId = 1;
	        	
	            nc.lineage.main({
	            	apiDomain: 'https://api-lineage.plaync.com',
	            	staticDomain: 'https://assets.playnccdn.com',
					isIngame : false,
	            	userData: window.userData || null,
	            	promotionBanner: {
	                    wrap: $('.section-promotion'),
	                    rollingInterval: 5000
	                },
	                serviceShortcut: {
	                    wrap: $('.section-shortcut')
	                },
					newsContent: {
						wrap: $('.section-notice')
					},
					topContent: {
						wrap: $('.section-topcontent')
					},
					sectionContent: {
						wrap: $('.wrap-section-article')
					},
	                specialBanner: {
	                    wrap: $('.wrap-section-special')
	                },
	                hotIssue: {
	                    wrap: $('.section-hotissue')
	                },
					nshopContent: {
						wrap: $('.section-nshop')
					},
	                my: {
	                    wrap: $('.section-my')
	                },
	                siege: {
	                	wrap: $('.section-siege'),
	                	serverId: serverId
	                },
					etcService: {
						wrap: $('.section-etcservice')
					}
	            });
	        });
	    }(jQuery));
	</script>



	        </div>
	    </div>

		<!-- ncbanner  -->
		
	<script src="https://assets.playnccdn.com/uikit/ncui/1.6.10/js/ncui-commonbanner.js?_=202302151513"></script>
	<script>
		if (window.ncui) {
			new window.ncui.commonBanner({
				wstatic:"https:\/\/assets.playnccdn.com",
				isLogin: false,
				ncBanner: JSON.parse('{"movieBanner":{"show":false,"CDN":false,"youtubeID":"","URL":"","LauncherShow":true,"Cookie":"Movie20201228","startDate":"","startTime":"","endDate":"","endTime":""},"mainToastBanner":{"show":false,"BG":"","Lable":"","Title":"","SubTitle":"","Link":"","LinkNewWindow":false,"LauncherShow":true,"Cookie":"MainToast20201228","CookieExpiredays":999,"startDate":"","startTime":"","endDate":"","endTime":""},"topBanner":{"show":false,"ddayShow":false,"ddayDate":"20201229","ButtonShow":false,"ButtonLable":"","Lable":"","Title":"","Link":"","LinkNewWindow":false,"LauncherShow":true,"startDate":"","startTime":"","endDate":"","endTime":""},"toastBanner":{"show":false,"BG":"","Lable":"","Title":"","SubTitle":"","Link":"","LinkNewWindow":false,"LauncherShow":true,"Cookie":"Toast20201228","startDate":"","startTime":"","endDate":"","endTime":""},"floatingBanner":{"show":false,"BG":"","Title":"","Link":"","LinkNewWindow":false,"LauncherShow":true,"Cookie":"floating20201228","startDate":"","startTime":"","endDate":"","endTime":""},"mainFloatingBanner":{"show":false,"BG":"","Title":"","Link":"","LinkNewWindow":false,"LauncherShow":true,"Cookie":"Mainfloating20201228","CookieExpiredays":999,"startDate":"","startTime":"","endDate":"","endTime":""},"imageBanner":{"show":false,"OrientationVertical":true,"MobileBG":"","PcBG":"","Link":"","LinkNewWindow":false,"LauncherShow":true,"Cookie":"Image20201228","startDate":"","startTime":"","endDate":"","endTime":""}}'),
			});
		}
	</script>

		<!-- // ncbanner  -->

	    <!-- (s) Footer -->
		

	<footer id="footer" class="wrap-footer"></footer>
	<script src="https://assets.playnccdn.com/uikit/ncui/1.6.10/js/ncui-footer.js?_=202302151513"></script>
	<script>var footerConfig = {  "default": {    "countryList": [],    "languageList": [],    "snsList": [],    "linkList": [        {            "name": "companyLink",            "link": "https://kr.ncsoft.com/kr/index.do",            "target": "_blank",            "type": "link"        },        {            "name": "termsOfService",            "link": "https://www.plaync.com/policy/service",            "target": "_blank",            "type": "link"        },        {            "name": "privacyPolicy",            "link": "https://www.plaync.com/policy/privacy",            "target": "_blank",            "type": "link",            "isBold": true        },        {            "name": "youthProtectionPolicy",            "link": "https://www.plaync.com/policy/youthpolicy",            "target": "_blank",            "type": "link",            "isBold": true        },        {            "name": "operationPolicy",            "link": "",            "target": "_blank",            "type": "link"        },        {            "name": "gameGrade",            "link": "",            "target": "",            "type": "image"        },    ],    "gameGrade": "https://assets.playnccdn.com/lineage/v1/img/common/grade-lineage-2019.png",    "csInfoType": "pc",    "copyright": "<span class='show-on-pc'>Lineage ® is a registered trademark of NCSOFT Corporation. Copyright</span><span class='line-break'>Ⓒ NCSOFT Corporation. All Rights Reserved.</span>",    "companyLink" : "https://kr.ncsoft.com/kr/index.do",    "keepPath": false,    "operationPolicyLink": "https://www.plaync.com/policy/operation/lineage"  }}</script>
	<script>
		if (window.ncui && window.ncui.footer) {
			new window.ncui.footer(footerConfig);
		}
	</script>


		<!-- (e) Footer -->
	</div>

	
	

	
		<script async src="https://www.googletagmanager.com/gtag/js?id=UA-139944891-6"></script>
		<script>
		  window.dataLayer = window.dataLayer || [];
		  function gtag(){dataLayer.push(arguments);}
		  gtag('js', new Date());
		  gtag('config', 'UA-139944891-6');
		</script>
		<script src="https://wstatic-cdn.plaync.com/deviceid/deviceid-client-js/1.4.5/live/bf.js"></script>
		<script>
		    Browser_fingerprint.create_fingerprint({ async: true });
		</script>
	
	
	
	<!-- (e) logger -->

	


</body>
</html>
