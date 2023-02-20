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




<!doctype html>
<html lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="새로운 개념의 멀티유저 온라인게임 maplestory">
<meta name="google-site-verification" content="OcUfX8Czn819CkCyhhvEaC0zGZCSyoGPgmk70ORTptI" />
<meta property="og:description" content="새로운 개념의 멀티유저 온라인게임 maplestory">
<meta name="keywords" content="maple, maplestory, 메이플, 메이플스토리, wizet, 위젯, 2d, 횡스크롤, 사이드스크롤, rpg, mmorpg, 온라인게임,이벤트,신규직업">
<meta name="author" content="NEXON Korea" />
<title>메이플스토리</title>
<link rel="stylesheet" href="https://lwres.nexon.com/css/maplestory/index.css" type="text/css" />
<link rel="stylesheet" href="https://lwres.nexon.com/css/maplestory/jquery.mCustomScrollbar.css" type="text/css" />

    <script src="https://ssl.nexon.com/s1/p2/ps.min.js" charset="utf-8" data-name="PS" data-ngm="true" data-nxlogin="true"></script>

    <script src="https://ssl.nexon.com/s1/global/ngb_head.js"></script>

<script src="https://lwres.nexon.com/js/maplestory/jquery-1.12.4.min.js" type="text/javascript"></script>
<script src="https://lwres.nexon.com/js/maplestory/jquery-ui.js"></script>
<script src="https://lwres.nexon.com/js/maplestory/index.js" type="text/javascript"></script>
<script src="https://lwres.nexon.com/js/maplestory/jquery.mCustomScrollbar.concat.min.js" type="text/javascript"></script>


<script src="/Scripts/Common/common.js?v=202302201248"></script>
<script src="/Scripts/Common/webboard.js"></script>

<script>
    var COMMON = (function () {
        var instance;

        function initiate() {
            return {
                site: 'nope',
                domain: 'maplestory.nexon.com',
                url: 'https://maplestory.nexon.com/Home/Main',
                oid: '0',
                isLogin: false,
                isMembership: false,
                isParentLogin: false,
                isParentMembershipLogin: false,
                isChannelingNotAgree: false,
                articleSearchDescriptor: {},
                maxTitleLength: 0,
                maxCommentLength: 0
            };
        }

        if (!instance) instance = initiate();
        return instance;
    }());

    $(window).load(function () {
        var commonMessage = '';
        if (commonMessage !== '')
            alert(commonMessage);
    });
</script>



<link rel="stylesheet" href="/Scripts/Common/font_NanumBarunGothic.css" type="text/css" />
<!-- Facebook Pixel Code -->
<script type="text/javascript">    
    !function (f, b, e, v, n, t, s) {
        if (f.fbq) return; n = f.fbq = function () {
            n.callMethod ?
            n.callMethod.apply(n, arguments) : n.queue.push(arguments)
        }; if (!f._fbq) f._fbq = n;
        n.push = n; n.loaded = !0; n.version = '2.0'; n.queue = []; t = b.createElement(e); t.async = !0;
        t.src = v; s = b.getElementsByTagName(e)[0]; s.parentNode.insertBefore(t, s)
    }(window, document, 'script', 'https://connect.facebook.net/en_US/fbevents.js');

     fbq('init', '268046720223120');
    fbq('track', "PageView");
</script>
<noscript><img height="1" width="1" style="display:none" src="https://www.facebook.com/tr?id=268046720223120&ev=PageView&noscript=1" /></noscript>
<!-- End Facebook Pixel Code -->
<!-- Twitter single-event website tag code -->
<script src="//platform.twitter.com/oct.js" type="text/javascript"></script>
<script type="text/javascript">twttr.conversion.trackPid('nx5i7', { tw_sale_amount: 0, tw_order_quantity: 0 });</script>
<noscript>
    <img height="1" width="1" style="display:none;" alt="" src="https://analytics.twitter.com/i/adsct?txn_id=nx5i7&p_id=Twitter&tw_sale_amount=0&tw_order_quantity=0" />
    <img height="1" width="1" style="display:none;" alt="" src="//t.co/i/adsct?txn_id=nx5i7&p_id=Twitter&tw_sale_amount=0&tw_order_quantity=0" />
</noscript>
<!-- End Twitter single-event website tag code -->
<script type="text/javascript">
    (function (m, o, n, r, t, g) {
        t = t + '?l=' + n + '&t=' + r + '&ref=' + encodeURIComponent(o.referrer) + '&loc=' + encodeURIComponent(o.location) + '&r=' + Math.floor(Math.random() * 99999999999);
        o.write("<" + g + " src='" + t + "' style='display:none;'></" + g + ">");
    })(window, document, 'CM_M_1042938', 'brand', 'https://rtb.clickmon.co.kr/RT_GATE/rt_gate.php', 'iframe');
</script>

        <!-- Google Analytics -->
        <!-- Global site tag (gtag.js) - Google Analytics -->
        <script async src=https://www.googletagmanager.com/gtag/js?id=UA-34233427-4></script>
        <script async src=https://www.googletagmanager.com/gtag/js?id=AW-947932633></script>
        <script>
            window.dataLayer = window.dataLayer || [];
            function gtag() { dataLayer.push(arguments); }
            gtag('js', new Date());
            gtag('config', 'UA-34233427-4', { 'custom_map': { 'dimension1': 'oid' } });
            gtag('config', 'G-12M3M6FCC2');
            gtag('event', 'oid', { 'oid': 0 })
            gtag('config', 'AW-947932633');
            gtag('event', 'conversion', { 'send_to': 'AW-947932633/0AANCOGi_IkCENmbgcQD' });
            function gtag_report_conversion(url) {
                var callback = function () {
                    if (typeof (url) != 'undefined') {
                        window.location = url;
                    }
                };
                gtag('event', 'conversion', {
                    'send_to': 'AW-947932633/DKSpCOK-_IkCENmbgcQD',
                    'event_callback': callback
                });
                return false;
            }
        </script>
        <!-- End Google Analytics -->
<!-- Kakao Pixel Code -->
<script type="text/javascript" charset="UTF-8" src="//t1.daumcdn.net/adfit/static/kp.js"></script>
<script type="text/javascript">
    kakaoPixel('2830029952607077079').pageView();
</script>
<!-- End Kakao Pixel Code -->
<!-- Criteo 홈페이지 태그 -->
<script type="text/javascript" src="//dynamic.criteo.com/js/ld/ld.js?a=94120" async="true"></script>
<script type="text/javascript">
    window.criteo_q = window.criteo_q || [];
    var deviceType = /iPad/.test(navigator.userAgent) ? "t" : /Mobile|iP(hone|od)|Android|BlackBerry|IEMobile|Silk/.test(navigator.userAgent) ? "m" : "d";
    window.criteo_q.push({ event: "setAccount", account: [94120, 95207] }, { event: "setSiteType", type: deviceType }, { event: "viewHome" });

    function gameStart_Criteo() {
        window.criteo_q.push(
            { event: "setAccount", account: [94120, 95207] },
            { event: "setSiteType", type: deviceType },            
            {
                event: "trackTransaction", id: Math.floor(Math.random() * 99999999999), item: [
                    { id: "gameStart", price: 1, quantity: 1 }                    
                ]
            }
        );
    }
</script>
<!-- END Criteo 홈페이지 태그 -->




<script src="/Scripts/Common/index_event.js?v=202302201248"></script>
</head>
<body>


    <script type="text/javascript" src="https://rs.nxfs.nexon.com/common/js/gnb.min.js" data-gamecode="589824" data-ispublicbanner="true"></script>

<script>
    $(document).ready(function () {
        $('.sel_login_btn a:eq(0)').bind('click', function (e) {
            e.preventDefault();
            LOGIN.changeID();
        });
        $('.sel_login_btn a:eq(1)').bind('click', function (e) {
            e.preventDefault();
            close_login_pop();
        });
    });
</script>
<div class="login_popup_wrap">
    <div class="login_popup2">
        <h1><span><a href="javascript:void(0)"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/login_pop_h1.png" alt="다른 메이플ID로 로그인" /></a></span></h1>
        <div class="login_popup_con">
            <p>다른 메이플ID로 로그인 하시려면 아래의 ID중 하나를 선택하시기 바랍니다.</p>
            <div class="sel_login_id">
            </div>
            <div class="bnarea">
                <p class="icoinfo">
                    <input type="checkbox" name="chkMaster" /> <label for="che">앞으로 이 메이플ID로 로그인 하겠습니다.</label>
                </p>
            </div>
            <div class="sel_login_btn">
                <a href="#a"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/sel_login_btn.png" alt="선택한 메이플ID로 로그인" /></a>
                <a href="#a"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/rank_pop_close_btn.png" alt="닫기" /></a>
            </div>
        </div>
    </div>
</div>


<div class="skip-navigation">
    <ul>
        <li><a class="skip-navigation-link" href="#section02">본문 바로가기</a></li>
        <li><a class="skip-navigation-link" href="#section01">주 메뉴 바로가기</a></li>
    </ul>
</div>

    <div id="wrap">
        <div id="section01">
<div class="top_menu_wrap">
    <div class="div_inner">
<h1 class="logo"><a href="/Home/Main"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/logo.png" alt="" /></a></h1>

<ul class="top_menu">
    <li>
        <a href="/News/Notice">뉴스</a>
        <ul>
            <li><a href="/News/Notice">공지사항</a></li>
            <li><a href="/News/Update">업데이트</a></li>
            <li><a href="/News/Event">이벤트</a></li>
            <li><a href="/News/CashShop">캐시샵 공지</a></li>
            
            <li><a href="/News/NoticeMapleBoard">메이플 알림판</a></li>
        </ul>
    </li>
    <li>
        <a href="/Guide/GameInformation">가이드</a>
        <ul>
            <li><a href="/Guide/GameInformation">게임정보</a></li>
            <li><a href="/Guide/Quest">퀘스트정보</a></li>
            <li><a href="/Guide/Job" target="_blank">직업소개<span class="icon_window"></span></a></li>
            <li><a href="/Guide/CashShop/Probability/RoyalStyle">확률형 아이템</a></li>
            <li><a href="/Guide/ProbabilityResult/MonthData">확률형 아이템 결과</a></li>
            <li><a href="https://now.nexon.com/service/maplestory" target="_blank">NEXON NOW<span class="icon_window"></span></a></li>
        </ul>
    </li>
    <li>
        <a href="/Ranking/World">랭킹</a>
        <ul>
            <li><a href="/Ranking/World">월드 랭킹</a></li>
            <li><a href="/Ranking/Union">유니온 랭킹</a></li>
            <li><a href="/Ranking/Achievement">업적 랭킹</a></li>
            <li><a href="/Ranking/HallOfFame">명예의 전당</a></li>
            <li><a href="/Ranking/UnionArena">유니온 아레나</a></li>
        </ul>
    </li>
    <li>
        <a href="/Community/Free">커뮤니티</a>
        <ul>
            <li><a href="/Community/Free">자유게시판</a></li>
            <li><a href="/Community/Information">정보게시판</a></li>
            
            <li><a href="/Community/TopicDiscussion">토론게시판</a></li>
            <li><a href="/Community/Art">메이플 아트</a></li>
            <li><a href="/Community/Coordination">메이플 코디</a></li>
        </ul>
    </li>
    <li>
        <a href="/Media/WebToon">미디어</a>
        <ul>
            <li><a href="/Media/WebToon">웹툰</a></li>
            <li><a href="/Media/Font">메이플스토리 서체</a></li>
            <li><a href="/Media/Video">영상</a></li>
            <li><a href="/Media/Music">음악</a></li>
            <li><a href="/Media/ArtWork">아트웍</a></li>
        </ul>
    </li>
    <li>
        <a href="/Support/UnSeal">고객지원</a>
        <ul>
                <li><a href="javascript:void(0);" onclick="window.open('https://cs.nexon.com/HelpBoard/Nexon?gamecode=18', '메이플스토리 고객센터', 'toolbar=no, scrollbars=yes, width=1024, height=800'); return false;">도움말/1:1문의<span class="icon_window"></span></a></li>
                <li><a href="/Support/UnSeal">아이템 봉인해제</a></li>
                <li><a href="/Support/BugReport">버그악용/불법프로그램 신고</a></li>
        </ul>
    </li>
</ul>
    </div>
</div>
<div class="top_menu_bg">
    <div class="div_inner" style="background:url('https://ssl.nexon.com/s2/game/maplestory/renewal/common/top_menu_line.png') left top no-repeat;"></div>
</div>





<div class="main_banner_wrap">
    <ul class="main_banner">
                <li>
                    <div class="banner_img_con">
                        <div class="banner_img_wrap">
                            <a href="/News/Event/Ongoing/703" target="_blank"><img src="https://lwi.nexon.com/maplestory/banner/2023/0119/main_bn_C692C5F51CF38111.jpg" alt="" /></a>
                        </div>
                    </div>
                    <div class="div_inner main_banner_size">
                        <a href="/News/Event/Ongoing/703" target="_blank">
                            <h2>웡스토랑</h2>
                                <p>2023년 1월 19일(목) 점검 후 ~ 3월 1일(수) 오후 11시59분</p>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="banner_img_con">
                        <div class="banner_img_wrap">
                            <a href="/News/Event/Ongoing/704" target="_blank"><img src="https://lwi.nexon.com/maplestory/banner/2023/0119/main_bn_230119_2F05FA6C2E49C3A1.jpg" alt="" /></a>
                        </div>
                    </div>
                    <div class="div_inner main_banner_size">
                        <a href="/News/Event/Ongoing/704" target="_blank">
                            <h2>칼리의 여정</h2>
                                <p>2023년 1월 19일(목) 점검 후 ~ 3월 1일(수) 오후 11시59분</p>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="banner_img_con">
                        <div class="banner_img_wrap">
                            <a href="/News/Event/Ongoing/705" target="_blank"><img src="https://lwi.nexon.com/maplestory/banner/2023/0119/main_bn_230119_5LSCSX58CFSB05TD.jpg" alt="" /></a>
                        </div>
                    </div>
                    <div class="div_inner main_banner_size">
                        <a href="/News/Event/Ongoing/705" target="_blank">
                            <h2>칼리의 바람</h2>
                                <p>2023년 1월 19일(목) 점검 후 ~ 3월 8일(수) 오후 11시59분</p>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="banner_img_con">
                        <div class="banner_img_wrap">
                            <a href="/News/Event/Ongoing/710" target="_blank"><img src="https://lwi.nexon.com/maplestory/banner/2023/0119/main_bn_230123_E24474F402232D4D.jpg" alt="" /></a>
                        </div>
                    </div>
                    <div class="div_inner main_banner_size">
                        <a href="/News/Event/Ongoing/710" target="_blank">
                            <h2>웨이브의<br>챌린지 위크</h2>
                                <p>2023년 2월 16일(목) 오전 10시 ~ 2월 22일(수)오후 11시 59분</p>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="banner_img_con">
                        <div class="banner_img_wrap">
                            <a href="/News/Event/Ongoing/711" target="_blank"><img src="https://lwi.nexon.com/maplestory/banner/2023/0119/main_bn_230119_P56A8W1SEPEM417M.jpg" alt="" /></a>
                        </div>
                    </div>
                    <div class="div_inner main_banner_size">
                        <a href="/News/Event/Ongoing/711" target="_blank">
                            <h2>2023년도<br>행복하길 바라묘</h2>
                                <p>2023년 1월 19일(목) 점검 후 ~ 2월 22일(수) 오후 11시59분</p>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="banner_img_con">
                        <div class="banner_img_wrap">
                            <a href="/News/Event/Ongoing/717" target="_blank"><img src="https://lwi.nexon.com/maplestory/banner/2023/0202/main_bn_230202_BE0985B3D3D64177.jpg" alt="" /></a>
                        </div>
                    </div>
                    <div class="div_inner main_banner_size">
                        <a href="/News/Event/Ongoing/717" target="_blank">
                            <h2>프리미엄 PC방<br> 접속 보상 이벤트</h2>
                                <p>2023년 2월 3일(금) 오전 0시 ~ 3월 16일(목) 오후 11시 59분</p>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="banner_img_con">
                        <div class="banner_img_wrap">
                            <a href="/News/Event/Ongoing/692" target="_blank"><img src="https://lwi.nexon.com/maplestory/banner/2022/1222/main_bn_221222_76BOX6XKJ6E63FQW.jpg" alt="" /></a>
                        </div>
                    </div>
                    <div class="div_inner main_banner_size">
                        <a href="/News/Event/Ongoing/692" target="_blank">
                            <h2>웡스토랑 메인 메뉴</h2>
                                <p>2022년 12월 22일(목) 점검 후 ~ 2023년 3월 1일(수) 오후 11시 59분</p>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="banner_img_con">
                        <div class="banner_img_wrap">
                            <a href="/News/Event/Ongoing/695" target="_blank"><img src="https://lwi.nexon.com/maplestory/banner/2022/1222/main_bn_220630_E1BAF952B2A8EE27.jpg" alt="" /></a>
                        </div>
                    </div>
                    <div class="div_inner main_banner_size">
                        <a href="/News/Event/Ongoing/695" target="_blank">
                            <h2>하이퍼 버닝</h2>
                                <p>2022년 12월 22일(목) 점검 후 ~ 2023년 3월 1일(수) 오후 11시59분</p>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="banner_img_con">
                        <div class="banner_img_wrap">
                            <a href="/News/Event/Ongoing/694" target="_blank"><img src="https://lwi.nexon.com/maplestory/banner/2022/1222/main_bn_221211_A9E21E119751845B.jpg" alt="" /></a>
                        </div>
                    </div>
                    <div class="div_inner main_banner_size">
                        <a href="/News/Event/Ongoing/694" target="_blank">
                            <h2>버닝 월드</h2>
                                <p>2022년 12월 22일(목) 점검 후 ~ 2023년 3월 15일(수) 오후 11시59분</p>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="banner_img_con">
                        <div class="banner_img_wrap">
                            <a href="/News/Event/Ongoing/690" target="_blank"><img src="https://lwi.nexon.com/maplestory/banner/2022/1222/main_bn_221222_6W4265Q0IWG4WO7V.jpg" alt="" /></a>
                        </div>
                    </div>
                    <div class="div_inner main_banner_size">
                        <a href="/News/Event/Ongoing/690" target="_blank">
                            <h2>웡스토랑 코인샵</h2>
                                <p>2022년 12월 22일(목) 점검 후 ~ 2023년 3월 5일(일) 오후 11시59분</p>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="banner_img_con">
                        <div class="banner_img_wrap">
                            <a href="/News/Event/Ongoing/689" target="_blank"><img src="https://lwi.nexon.com/maplestory/banner/2022/1222/main_bn_221222_8F97345AD9A803E5.jpg" alt="" /></a>
                        </div>
                    </div>
                    <div class="div_inner main_banner_size">
                        <a href="/News/Event/Ongoing/689" target="_blank">
                            <h2>웡스토랑<br>보스 코인샵</h2>
                                <p>2022년 12월 22일(목) 점검 후 ~ 2023년 3월 5일(일) 오후 11시59분</p>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="banner_img_con">
                        <div class="banner_img_wrap">
                            <a href="https://blog.maplestory.nexon.com/" target="_blank"><img src="https://lwi.nexon.com/maplestory/banner/2022/0113/main_bn_220113_7C33P42WS640P057.jpg" alt="" /></a>
                        </div>
                    </div>
                    <div class="div_inner main_banner_size">
                        <a href="https://blog.maplestory.nexon.com/" target="_blank">
                            <h2></h2>
                                <p></p>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="banner_img_con">
                        <div class="banner_img_wrap">
                            <a href="http://forum.nexon.com/maplepedia" target="_blank"><img src="https://lwi.nexon.com/maplestory/banner/2022/0831/main_bn_220831_9BB933AC125F8910.jpg" alt="" /></a>
                        </div>
                    </div>
                    <div class="div_inner main_banner_size">
                        <a href="http://forum.nexon.com/maplepedia" target="_blank">
                            <h2></h2>
                                <p></p>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="banner_img_con">
                        <div class="banner_img_wrap">
                            <a href="https://e.kakao.com/t/maple-friends-are-always-cute" target="_blank"><img src="https://lwi.nexon.com/maplestory/banner/2022/1219/main_bn_221219_A2BB59DD662FA7D9.jpg" alt="" /></a>
                        </div>
                    </div>
                    <div class="div_inner main_banner_size">
                        <a href="https://e.kakao.com/t/maple-friends-are-always-cute" target="_blank">
                            <h2>매일매일 귀여운 메이플 친구들!<br>카카오톡 이모티콘에서 만나요~</h2>
                                <p></p>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="banner_img_con">
                        <div class="banner_img_wrap">
                            <a href="https://maplestory.nexon.com/Promotion/event/2022/20220519/event01" target="_blank"><img src="https://lwi.nexon.com/maplestory/banner/2022/0519/main_bn_220519_89C7CFD26FEDA78A.jpg" alt="" /></a>
                        </div>
                    </div>
                    <div class="div_inner main_banner_size">
                        <a href="https://maplestory.nexon.com/Promotion/event/2022/20220519/event01" target="_blank">
                            <h2>돌의 정령의<br>나눔 프로젝트</h2>
                                <p></p>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="banner_img_con">
                        <div class="banner_img_wrap">
                            <a href="https://maplestory.nexon.com/promotion/event/2022/20221215/event/sub03" target="_blank"><img src="https://lwi.nexon.com/maplestory/banner/2023/0125/main_bn_230126_C64ADF10ADECE8C7.jpg" alt="" /></a>
                        </div>
                    </div>
                    <div class="div_inner main_banner_size">
                        <a href="https://maplestory.nexon.com/promotion/event/2022/20221215/event/sub03" target="_blank">
                            <h2>메이플스토리X이삭토스트</h2>
                                <p>2023년 1월 26일(목) ~ 3월 5일(일)</p>
                        </a>
                    </div>
                </li>
    </ul>
</div>

<!-- pos_banner_wrap str -->
<div class="pos_banner_wrap">
    <!-- div_inner str -->
    <div class="div_inner">
        <span class="prev_btn"><a href="#a" onclick="prev_btn()"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/prev.png" alt="" /></a></span>
        <div class="pos_banner">
            <div class="pos_move">
                    <dl>
                        <dt><a href="#a" onclick="pos_click(0)"><img src="https://lwi.nexon.com/maplestory/banner/2023/0119/main_bn_C692C5F51CF38111_thumb.jpg" style="width:100px;height:40px;" alt="" /><span class=pos_line></span></a></dt>
                        <dd><a href="#a" onclick="pos_click(0)">웡스토랑</a></dd>
                        <dd class="pos_on"></dd>
                    </dl>
                    <dl>
                        <dt><a href="#a" onclick="pos_click(1)"><img src="https://lwi.nexon.com/maplestory/banner/2023/0119/main_bn_230119_thumb_2F05FA6C2E49C3A1.jpg" style="width:100px;height:40px;" alt="" /><span ></span></a></dt>
                        <dd><a href="#a" onclick="pos_click(1)">칼리의 여정</a></dd>
                        <dd class="pos_off"></dd>
                    </dl>
                    <dl>
                        <dt><a href="#a" onclick="pos_click(2)"><img src="https://lwi.nexon.com/maplestory/banner/2023/0119/main_bn_230119_5LSCSX58CFSB05TD_thumb.jpg" style="width:100px;height:40px;" alt="" /><span ></span></a></dt>
                        <dd><a href="#a" onclick="pos_click(2)">칼리의 바람</a></dd>
                        <dd class="pos_off"></dd>
                    </dl>
                    <dl>
                        <dt><a href="#a" onclick="pos_click(3)"><img src="https://lwi.nexon.com/maplestory/banner/2023/0119/main_bn_230123_E24474F402232D4D_thumb.jpg" style="width:100px;height:40px;" alt="" /><span ></span></a></dt>
                        <dd><a href="#a" onclick="pos_click(3)">웨이브의<br>챌린지 위크</a></dd>
                        <dd class="pos_off"></dd>
                    </dl>
                    <dl>
                        <dt><a href="#a" onclick="pos_click(4)"><img src="https://lwi.nexon.com/maplestory/banner/2023/0119/main_bn_230119_thumb_P56A8W1SEPEM417M.jpg" style="width:100px;height:40px;" alt="" /><span class=pos_line></span></a></dt>
                        <dd><a href="#a" onclick="pos_click(4)">2023년도<br>행복하길 바라묘</a></dd>
                        <dd class="pos_on"></dd>
                    </dl>
                    <dl>
                        <dt><a href="#a" onclick="pos_click(5)"><img src="https://lwi.nexon.com/maplestory/banner/2023/0202/main_bn_230202_thumb_BE0985B3D3D64177.jpg" style="width:100px;height:40px;" alt="" /><span ></span></a></dt>
                        <dd><a href="#a" onclick="pos_click(5)">프리미엄 PC방<br> 접속 보상 이벤트</a></dd>
                        <dd class="pos_off"></dd>
                    </dl>
                    <dl>
                        <dt><a href="#a" onclick="pos_click(6)"><img src="https://lwi.nexon.com/maplestory/banner/2022/1222/main_bn_221222_thumb_76BOX6XKJ6E63FQW.jpg" style="width:100px;height:40px;" alt="" /><span ></span></a></dt>
                        <dd><a href="#a" onclick="pos_click(6)">웡스토랑 메인 메뉴</a></dd>
                        <dd class="pos_off"></dd>
                    </dl>
                    <dl>
                        <dt><a href="#a" onclick="pos_click(7)"><img src="https://lwi.nexon.com/maplestory/banner/2022/1222/main_bn_220630_thumb_E1BAF952B2A8EE27.jpg" style="width:100px;height:40px;" alt="" /><span ></span></a></dt>
                        <dd><a href="#a" onclick="pos_click(7)">하이퍼 버닝</a></dd>
                        <dd class="pos_off"></dd>
                    </dl>
                    <dl>
                        <dt><a href="#a" onclick="pos_click(8)"><img src="https://lwi.nexon.com/maplestory/banner/2022/1222/main_bn_221222_thumb_A9E21E119751845B.jpg" style="width:100px;height:40px;" alt="" /><span class=pos_line></span></a></dt>
                        <dd><a href="#a" onclick="pos_click(8)">버닝 월드</a></dd>
                        <dd class="pos_on"></dd>
                    </dl>
                    <dl>
                        <dt><a href="#a" onclick="pos_click(9)"><img src="https://lwi.nexon.com/maplestory/banner/2022/1222/main_bn_221222_thumb_6W4265Q0IWG4WO7V.jpg" style="width:100px;height:40px;" alt="" /><span ></span></a></dt>
                        <dd><a href="#a" onclick="pos_click(9)">웡스토랑 코인샵</a></dd>
                        <dd class="pos_off"></dd>
                    </dl>
                    <dl>
                        <dt><a href="#a" onclick="pos_click(10)"><img src="https://lwi.nexon.com/maplestory/banner/2022/1222/main_bn_221222_thumb_8F97345AD9A803E5.jpg" style="width:100px;height:40px;" alt="" /><span ></span></a></dt>
                        <dd><a href="#a" onclick="pos_click(10)">웡스토랑<br>보스 코인샵</a></dd>
                        <dd class="pos_off"></dd>
                    </dl>
                    <dl>
                        <dt><a href="#a" onclick="pos_click(11)"><img src="https://lwi.nexon.com/maplestory/banner/2022/0113/main_bn_220113_7C33P42WS640P057_thumb.jpg" style="width:100px;height:40px;" alt="" /><span ></span></a></dt>
                        <dd><a href="#a" onclick="pos_click(11)"></a></dd>
                        <dd class="pos_off"></dd>
                    </dl>
                    <dl>
                        <dt><a href="#a" onclick="pos_click(12)"><img src="https://lwi.nexon.com/maplestory/banner/2022/0831/220831_9BB933AC125F8910_sub.jpg" style="width:100px;height:40px;" alt="" /><span class=pos_line></span></a></dt>
                        <dd><a href="#a" onclick="pos_click(12)"></a></dd>
                        <dd class="pos_on"></dd>
                    </dl>
                    <dl>
                        <dt><a href="#a" onclick="pos_click(13)"><img src="https://lwi.nexon.com/maplestory/banner/2022/1219/main_bn_221125_A2BB59DD662FA7D9_thumb.jpg" style="width:100px;height:40px;" alt="" /><span ></span></a></dt>
                        <dd><a href="#a" onclick="pos_click(13)">매일매일 귀여운 메이플 친구들!<br>카카오톡 이모티콘에서 만나요~</a></dd>
                        <dd class="pos_off"></dd>
                    </dl>
                    <dl>
                        <dt><a href="#a" onclick="pos_click(14)"><img src="https://lwi.nexon.com/maplestory/banner/2022/0519/main_bn_220519_89C7CFD26FEDA78A_thumb.jpg" style="width:100px;height:40px;" alt="" /><span ></span></a></dt>
                        <dd><a href="#a" onclick="pos_click(14)">돌의 정령의<br>나눔 프로젝트</a></dd>
                        <dd class="pos_off"></dd>
                    </dl>
                    <dl>
                        <dt><a href="#a" onclick="pos_click(15)"><img src="https://lwi.nexon.com/maplestory/banner/2023/0125/main_230126_C64ADF10ADECE8C7_thumb.jpg" style="width:100px;height:40px;" alt="" /><span ></span></a></dt>
                        <dd><a href="#a" onclick="pos_click(15)">메이플스토리X이삭토스트</a></dd>
                        <dd class="pos_off"></dd>
                    </dl>
            </div>
        </div>
        <span class="next_btn"><a href="#a" onclick="next_btn()"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/next.png" alt="" /></a></span>
        <div class="pos_count">
            <dl>
                <dt>01</dt>
                <dd class="pos_len"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/slice.png" alt="" />16</dd>
                <dd class="event_view_all"><a href="#a" onclick="event_onoff()"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/window.png" alt="" /></a></dd>
            </dl>
        </div>
    </div>
    <!-- div_inner end -->
</div>
<!-- pos_banner_wrap end -->

<div class="event_all">
    <!-- event_all_inner str -->
    <div class="event_all_inner">
        <h1 class="event_title"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/event_title.png" alt=""></h1>
        <div class="event_all_bannerwrap">
            <!--<div class="event_all_move"> slide에서만 필요함-->

            <ul class="event_all_banner">
                            <li>
                                <a href="/News/Event/717"><img src="https://file.nexon.com/NxFile/download/FileDownloader.aspx?oidFile=5629539224005907501" alt=""></a>
                                <dl>
                                    <dt><a href="/News/Event/717">프리미엄 PC방 접속 보상 이벤트</a></dt>
                                    <dd><a href="/News/Event/717">2023.02.03 (금) ~ 2023.03.16 (목) 오후 11시59분</a></dd>
                                </dl>
                            </li>
                            <li>
                                <a href="/News/Event/711"><img src="https://file.nexon.com/NxFile/download/FileDownloader.aspx?oidFile=4836905715358504081" alt=""></a>
                                <dl>
                                    <dt><a href="/News/Event/711">2023년도 행복하길 바라묘</a></dt>
                                    <dd><a href="/News/Event/711">2023.01.19 (목) ~ 2023.02.22 (수) 오후 11시59분</a></dd>
                                </dl>
                            </li>
                            <li>
                                <a href="/News/Event/710"><img src="https://file.nexon.com/NxFile/download/FileDownloader.aspx?oidFile=5197193732792784745" alt=""></a>
                                <dl>
                                    <dt><a href="/News/Event/710">(수정)웨이브의 챌린지 위크</a></dt>
                                    <dd><a href="/News/Event/710">2023.02.16 (목) ~ 2023.02.22 (수) 오후 11시59분</a></dd>
                                </dl>
                            </li>
                            <li>
                                <a href="/News/Event/705"><img src="https://file.nexon.com/NxFile/download/FileDownloader.aspx?oidFile=4981020860484685619" alt=""></a>
                                <dl>
                                    <dt><a href="/News/Event/705">칼리의 바람</a></dt>
                                    <dd><a href="/News/Event/705">2023.01.19 (목) ~ 2023.03.08 (수) 오후 11시59분</a></dd>
                                </dl>
                            </li>
                            <li>
                                <a href="/News/Event/704"><img src="https://file.nexon.com/NxFile/download/FileDownloader.aspx?oidFile=5629539275545515188" alt=""></a>
                                <dl>
                                    <dt><a href="/News/Event/704">칼리의 여정</a></dt>
                                    <dd><a href="/News/Event/704">2023.01.19 (목) ~ 2023.03.01 (수) 오후 11시59분</a></dd>
                                </dl>
                            </li>
                            <li>
                                <a href="/News/Event/703"><img src="https://file.nexon.com/NxFile/download/FileDownloader.aspx?oidFile=5701596856698542198" alt=""></a>
                                <dl>
                                    <dt><a href="/News/Event/703">웡스토랑</a></dt>
                                    <dd><a href="/News/Event/703">2023.01.19 (목) ~ 2023.03.01 (수) 오후 11시59분</a></dd>
                                </dl>
                            </li>
                            <li>
                                <a href="/News/Event/695"><img src="https://file.nexon.com/NxFile/download/FileDownloader.aspx?oidFile=5053078510357190701" alt=""></a>
                                <dl>
                                    <dt><a href="/News/Event/695">하이퍼 버닝</a></dt>
                                    <dd><a href="/News/Event/695">2022.12.22 (목) ~ 2023.03.01 (수) 오후 11시59분</a></dd>
                                </dl>
                            </li>
                            <li>
                                <a href="/News/Event/694"><img src="https://file.nexon.com/NxFile/download/FileDownloader.aspx?oidFile=5053078445932679287" alt=""></a>
                                <dl>
                                    <dt><a href="/News/Event/694">버닝 월드</a></dt>
                                    <dd><a href="/News/Event/694">2022.12.22 (목) ~ 2023.03.15 (수) 오후 11시59분</a></dd>
                                </dl>
                            </li>
            </ul>
            <ul class="event_all_banner">
                            <li>
                                <a href="/News/Event/692"><img src="https://file.nexon.com/NxFile/download/FileDownloader.aspx?oidFile=5557481733047195828" alt=""></a>
                                <dl>
                                    <dt><a href="/News/Event/692">(수정) 웡스토랑 메인 메뉴</a></dt>
                                    <dd><a href="/News/Event/692">2022.12.22 (목) ~ 2023.03.01 (수) 오후 11시59분</a></dd>
                                </dl>
                            </li>
                            <li>
                                <a href="/News/Event/690"><img src="https://file.nexon.com/NxFile/download/FileDownloader.aspx?oidFile=5413366433302187800" alt=""></a>
                                <dl>
                                    <dt><a href="/News/Event/690">(수정) 웡스토랑 코인샵</a></dt>
                                    <dd><a href="/News/Event/690">2022.12.22 (목) ~ 2023.03.05 (일) 오후 11시59분</a></dd>
                                </dl>
                            </li>
                            <li>
                                <a href="/News/Event/689"><img src="https://file.nexon.com/NxFile/download/FileDownloader.aspx?oidFile=5197193634008534893" alt=""></a>
                                <dl>
                                    <dt><a href="/News/Event/689">웡스토랑 보스 코인샵</a></dt>
                                    <dd><a href="/News/Event/689">2022.12.22 (목) ~ 2023.03.05 (일) 오후 11시59분</a></dd>
                                </dl>
                            </li>
                            <li>
                                <a href="/promotion/event/2022/20221208/event" target="_blank"><img src="https://file.nexon.com/NxFile/download/FileDownloader.aspx?oidFile=4764848142795413934" alt=""></a>
                                <dl>
                                    <dt><a href="/promotion/event/2022/20221208/event" target="_blank">현생 용사를 위한 겨울 버전 메꾸 패키지</a></dt>
                                    <dd><a href="/promotion/event/2022/20221208/event" target="_blank">2022.12.09 (금) ~ 2023.01.31 (화) 오후 11시59분</a></dd>
                                </dl>
                            </li>
                        <li>
                            <img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/zzzzzzzz.png" alt="">
                            <dl>
                                <dt></dt>
                                <dd></dd>
                            </dl>
                        </li>
                        <li>
                            <img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/zzzzzzzz.png" alt="">
                            <dl>
                                <dt></dt>
                                <dd></dd>
                            </dl>
                        </li>
                        <li>
                            <img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/zzzzzzzz.png" alt="">
                            <dl>
                                <dt></dt>
                                <dd></dd>
                            </dl>
                        </li>
                        <li>
                            <img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/zzzzzzzz.png" alt="">
                            <dl>
                                <dt></dt>
                                <dd></dd>
                            </dl>
                        </li>
            </ul>
            <!--</div>-->
        </div>
        <ul class="event_all_pos">
                    <li><a href="#a" onmouseover="img_on(this)" onmouseout="img_out(this)" class=active><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/pos_event_on.png" alt="" ></a></li>
                    <li><a href="#a" onmouseover="img_on(this)" onmouseout="img_out(this)" ><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/pos_event_off.png" alt="" ></a></li>

        </ul>
        <span class="event_close"><a href="#a" onclick="event_onoff()"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/event_close.png" alt=""></a></span>
    </div>
    <!-- event_all_inner end -->
</div>


        </div>
        <div id="section02">
            <div class="div_inner">
<div class="rolling_event_wrap">
        <dl>
            <dt><a href="/News/Update/InformationCenter/102" target="_blank"><img src="https://lwi.nexon.com/maplestory/banner/2023/0117/bn_update_230117_EBF9D9E520A00FCD.png" alt="" /></a></dt>
            <dd class="rolling_title"><a href="/News/Update/InformationCenter/102" target="_blank">업데이트 정보센터</a></dd>
            <dd class="rolling_text"><a href="/News/Update/InformationCenter/102" target="_blank">2023.1.19 / ver.1.2.373 업데이트 미리보기</a></dd>
        </dl>
</div>



<span class="game_start">
    <div class="gm_str_main_wrap">
        

                    <a href="javascript:void(0)" onclick="alert('로그인 후 메이플ID 생성이 필요합니다.')"><img class="main_str_btn" src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/mp_start_btn_main.png" alt="" /></a>


    </div>
        <span class="download"><a href="/Common/PDS/Download" target="_blank"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/main_game_down.png" alt="" /></a></span>
</span>




<script>
    $(document).ready(function () {
        $('#eid, #epw').bind('keydown', function (e) {
            UTILITY.onEnterKeyDown(e.currentTarget, LOGIN.loginEmail);
        });
        $('.nexon_login_button a').bind('click', function (e) {
            e.preventDefault();
            LOGIN.loginEmail();
        });
        $('#mid, #mpw').bind('keydown', function (e) {
            UTILITY.onEnterKeyDown(e.currentTarget, LOGIN.loginMaple);
        });
        $('.maple_login_button a').bind('click', function (e) {
            e.preventDefault();
            LOGIN.loginMaple();
        });
        $('.email_login .login_info a:eq(1)').bind('click', function (e) {
            e.preventDefault();
            NgbMember.SearchNexonID(136, '');
        });
        $('.tpa_login a:eq(0)').bind('click', function (e) {
            e.preventDefault();
            NgbLogin.LoginFacebook();
        });
        $('.tpa_login a:eq(1)').bind('click', function (e) {
            e.preventDefault();
            NgbLogin.LoginGoogle();
        });
        $('.tpa_login a:eq(2)').bind('click', function (e) {
            e.preventDefault();
            NgbLogin.LoginNaver();
        });
        $('.tpa_login a:eq(3)').bind('click', function (e) {
            e.preventDefault();
            NgbLogin.LoginApple();
        });
    });

    function QRLOGIN() {
        window.location = "https://nxlogin.nexon.com/common/login.aspx?sec=qr&redirect=" + document.URL;
    }
</script>

<!--로그인 형태 선택 창 넥슨 이메일 or 메이플게임 id : Str-->
<div class="login">
    <span><a href="/Authentication/Login"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/login.png" alt="" /></a></span>
    <span><a href="/Authentication/Login?t=2"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/login2.png" alt="" /></a></span>
    
    <button type="button" class="btn_qr" onclick="QRLOGIN()"><img src="https://lwi.nexon.com/maplestory/common/login/btn_qr.png" alt="QR 로그인"></button>
    <div class="tpa_login">
        <ul>
            <li><a href="#a"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/tpa_menu01.png" alt="페이스북"></a></li>
            <li><a href="#a"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/tpa_menu02.png" alt="구글"></a></li>
            <li><a href="#a"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/tpa_menu03.png" alt="네이버"></a></li>
            <li><a href="#a"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/tpa_menu04.png" alt="애플"></a></li>
        </ul>
	</div>
    <span class="join_member"><a href="https://member.nexon.com/join/join.aspx?accesscode=136" target="_blank"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/join_member_new.png" alt="회원가입" /></a></span>
    <span class="join_member2"><a href="https://trans.nexon.com/trans/transemailid.aspx" target="_blank"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/id_chg_btn.png" alt="이메일 ID전환" /></a></span>
</div>
<!--로그인 형태 선택 창 넥슨 이메일 or 메이플게임 id : End-->
<div class="change_id" style="display:none;">
    <div class="email_login">
        <span class="change_id_button">
            <a href="javascript:void(0)" onclick="change_id(1)"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/change_maple.png" alt="" /></a>
        </span>
        <div class="idpw_wrap">
            <ul class="idpw">
                <li>
                    <input type="text" id="eid" />
                    <img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/placeholder_nexon.png" class="placeholder" alt="" />
                </li>
                <li>
                    <input type="password" style="margin-top:1px;" id="epw" />
                    <img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/pw.png" class="placeholder" alt="" />
                </li>
            </ul>
            <div class="save_id_wrap">
                <div class="checkbox_custom">
                    <span class="save_check_bg">
                        <a href="javascript:void(0)" onclick="check_box(this)"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/save_id_check.png" alt=""></a>
                    </span>
                    <span class="save_id_font"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/save_id.png" alt=""></span>
                    <input type="checkbox">
                </div>
            </div>
        </div>
        <span class="nexon_login_button"><a href="#a">로그인</a></span>
        <div class="login_info">
            <span><a href="https://member.nexon.com/join/join.aspx?accesscode=136" target="_blank"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/join_member.png" alt=""></a></span>
            <span><a href="#a"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/id_password.png" alt=""></a></span>
        </div>
    </div>
    <div class="gameid_login">
        <span class="change_id_button">
            <a href="javascript:void(0)" onclick="change_id(0)"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/change_nexon.png" alt="" /></a>
        </span>
        <form id="frmLoginMaple" method="post" action="/Authentication/Login">
            <input type="hidden" name="RedirectTo" value="/Home/Main" />
            <div class="idpw_wrap">
                <ul class="idpw">
                    <li>
                        <input type="text" id="mid" name="ID" />
                        <img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/placeholder_maple.png" class="placeholder" alt="" />
                    </li>
                    <li>
                        <input type="password" style="margin-top:1px;" id="mpw" name="Password" />
                        <img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/pw.png" class="placeholder" alt="" />
                    </li>
                </ul>
                <div class="save_id_wrap">
                    <div class="checkbox_custom">
                        <span class="save_check_bg">
                            <a href="javascript:void(0)" onclick="check_box(this)"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/save_id_check.png" alt=""></a>
                        </span>
                        <span class="save_id_font"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/save_id.png" alt=""></span>
                        <input type="checkbox">
                    </div>
                </div>
            </div>
            <span class="maple_login_button"><a href="#a">로그인</a></span>
            <div class="login_info">
                <span><a href="/Account/Join"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/join_member.png" alt=""></a></span>
                <span><a href="https://trans.nexon.com/trans/transemailid.aspx" target="_blank"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/email_change.png" alt=""></a></span>
                <span><a href="/Account/Search/ID"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/id_password.png" alt=""></a></span>
            </div>
        </form>
    </div>
</div>

            </div>
        </div>
<div class="after_info_lurking">
<div class="notice_banner_wrap">
    
</div>

<div class="lv_info">
    <span class="lv_line"></span>
    <div class="div_inner">
        <dl class="char_lv_info">
            <dt><img src="" alt=""></dt>
            <dd class="char_id">님</dd>
            <dd class="lv_info_font">레벨 정보</dd>
        </dl>
        <div class="maple_id_info">
            <dl>
                <dt class="level_font">LEVEL</dt>
                <dd class="level"></dd>
            </dl>

            <dl>
                <dt>종합랭킹</dt>
                <dd >
                    <img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/line.png" alt="">
                </dd>
                <dd class="ranking_numb">0위</dd>
            </dl>
            <dl>
                <dt>월드랭킹</dt>
                <dd >
                    <img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/line.png" alt="">
                </dd>
                <dd class="ranking_numb">0위</dd>
            </dl>
            <dl>
                <dt>직업랭킹</dt>
                <dd >
                    <img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/line.png" alt="">
                </dd>
                <dd class="ranking_numb">0위</dd>
            </dl>
            <dl>
                <dt>인기도랭킹</dt>
                <dd >
                    <img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/line.png" alt="">
                </dd>
                <dd class="ranking_numb">0위</dd>
            </dl>
            
            <dl>
                <dt>유니온랭킹</dt>
                <dd >
                    <img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/line.png" alt="">
                </dd>
                <dd class="ranking_numb">0위</dd>
            </dl>
            <dl>
                <dt>업적랭킹</dt>
                <dd >
                    <img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/line.png" alt="">
                </dd>
                <dd class="ranking_numb">0위</dd>
            </dl>
        </div>
        <span class="lv_close"><a href="javascript:void(0)" onclick="lv_close()"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/lv_close.png" alt=""></a></span>
    </div>
</div>

</div>


        <!-- section03 str -->
        <div id="section03">
            <div class="div_inner section03_pt">
<div class="cash_item_wrap">
    <ul class="cash_item">
            <li><a href="/News/CashShop/Sale/354" target="_self"><img src="https://lwi.nexon.com/maplestory/banner/2023/0216/cashshop_bn_230216_531E1E3F0717B374.png" alt="" /></a></li>
            <li><a href="/News/CashShop/Sale/353" target="_self"><img src="https://lwi.nexon.com/maplestory/banner/2023/0216/cashshop_bn_E07FC0729C8EA52B.png" alt="" /></a></li>
            <li><a href="/News/CashShop/Sale/352" target="_self"><img src="https://lwi.nexon.com/maplestory/banner/2023/0216/cashshop_bn_230216_A406E325CF3D07E9.png" alt="" /></a></li>
            <li><a href="/News/CashShop/Sale/351" target="_self"><img src="https://lwi.nexon.com/maplestory/banner/2023/0126/cashshop_bn_230126_D62B85B9BD0D80EE.png" alt="" /></a></li>
            <li><a href="/News/CashShop/Sale/350" target="_self"><img src="https://lwi.nexon.com/maplestory/banner/2023/0126/cashshop_bn_230126_OTW61S8N324Q51L8.png" alt="" /></a></li>
            <li><a href="/News/CashShop/Sale/327" target="_self"><img src="https://lwi.nexon.com/maplestory/banner/2022/1027/cashshop_bn_20221027_955C5B7AE77E739E.png" alt="" /></a></li>
            <li><a href="/News/CashShop/Sale/209" target="_self"><img src="https://lwi.nexon.com/maplestory/banner/2021/0617/cashshop_bn_210617_BE40C8EA4462759C.png" alt="" /></a></li>
            <li><a href="/News/CashShop/Sale/200" target="_self"><img src="https://lwi.nexon.com/maplestory/banner/2021/0422/cashshop_bn_210422_TLSRBDJDXODA.png" alt="" /></a></li>
    </ul>
    <span class="cash_line"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/cash_info.png" alt="" /></span>
    <ul class="cash_item_pos">
                <li><a href="#a" class="active" onclick="img_click(0)" onmouseover="img_on(this)" onmouseout="img_out(this)"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/pos_on.png" alt="" /></a></li>
                <li><a href="#a" onclick="img_click(1)" onmouseover="img_on(this)" onmouseout="img_out(this)"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/pos_off.png" alt="" /></a></li>
                <li><a href="#a" onclick="img_click(2)" onmouseover="img_on(this)" onmouseout="img_out(this)"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/pos_off.png" alt="" /></a></li>
                <li><a href="#a" onclick="img_click(3)" onmouseover="img_on(this)" onmouseout="img_out(this)"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/pos_off.png" alt="" /></a></li>
                <li><a href="#a" onclick="img_click(4)" onmouseover="img_on(this)" onmouseout="img_out(this)"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/pos_off.png" alt="" /></a></li>
                <li><a href="#a" onclick="img_click(5)" onmouseover="img_on(this)" onmouseout="img_out(this)"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/pos_off.png" alt="" /></a></li>
                <li><a href="#a" onclick="img_click(6)" onmouseover="img_on(this)" onmouseout="img_out(this)"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/pos_off.png" alt="" /></a></li>
                <li><a href="#a" onclick="img_click(7)" onmouseover="img_on(this)" onmouseout="img_out(this)"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/pos_off.png" alt="" /></a></li>
    </ul>
    <span class="cash_next"><a href="#a" onclick="cash_next()"></a></span>
</div>

                <div class="client_update_wrap">



<div class="client_update">
    <ul>
            <li class="">
            
                <dl>
                    <dt class="announcement">공지</dt>
                    <dd class="announcement_title">
                        <a href="/board/7/140214" target="_self">적절하지 못한 표현을 사과 드립니다. </a>
                    </dd>
                    <dd class="announcement_info"><a href="/board/7/140214" target="_self">메이플스토리에서 부족한 부분들을 차근차근 해결하겠습니다</a></dd>
                </dl>
            
            </li>            
            <li class="">
            
                <dl>
                    <dt class="announcement">공지</dt>
                    <dd class="announcement_title">
                        <a href="https://maplestory.nexon.com/board/83886117/720" target="_self">웡스토랑 오프라인 방문 신청 당첨자 발표</a>
                    </dd>
                    <dd class="announcement_info"><a href="https://maplestory.nexon.com/board/83886117/720" target="_self">2/22(수)까지 개인정보 입력을 완료해주세요.</a></dd>
                </dl>
            
            </li>            
            <li class="s">
            
                <dl>
                    <dt class="announcement">공지</dt>
                    <dd class="announcement_title">
                        <a href="/board/7/140219" target="_self">2/17(금) 운영정책위반 단속결과</a>
                    </dd>
                    <dd class="announcement_info"><a href="/board/7/140219" target="_self">총 2,249개 계정이 단속 되었습니다.</a></dd>
                </dl>
            
            </li>            
            <li class="s">
            
                <dl>
                    <dt class="announcement">공지</dt>
                    <dd class="announcement_title">
                        <a href="/Testworld/Update/481" target="_self">테스트월드 운영기간 안내 (~2/23)</a>
                    </dd>
                    <dd class="announcement_info"><a href="/Testworld/Update/481" target="_self">2/23(목) 업데이트를 미리 확인해보세요.</a></dd>
                </dl>
            
            </li>            
    </ul>
</div>
<div class="mushroom_img"><a href="/Guide/GameInformation/InfoForNewbie/MustKnow"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/maple_image01.jpg" alt=""></a></div>
<div class="mushroom_img" style="margin-top:17px"><a href="/Guide/GameInformation/InfoForNewbie/GuideChangeInfo"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/maple_image02.jpg" alt=""></a></div>

                </div>


                
<script>
    $(document).ready(function () {
        //$('.guidance a:eq(1)').bind('click', function (e) {
        //    e.preventDefault();

        //    var url = $('.guidance a:eq(1)').attr('href');
        //    var pop = window.open(url, 'popPCBang', 'width=917, height=700, scrollbars=yes');
        //    if (pop === null) {
        //        alert('팝업차단을 허용해 주세요.');
        //    }
        //});

        let guidanceClass = ($('.card_bn').length > 0) ? 'guidance' : 'guidance2';
        $("#main_guidance").removeClass().addClass(guidanceClass);
        
    });
</script>

<div class="guidance" id="main_guidance">
    <span><a href="/Support/BugReport" onmouseover="ch_png_on(this)" onmouseout="ch_png_off(this)"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/bug_off.png" alt=""></a></span>
    <span><a href="/Guide/GameInformation/InfoForNewbie/PremiumPcroomBenefit" target="_blank" onmouseover="ch_png_on(this)" onmouseout="ch_png_off(this)"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/pc_room_off.png" alt=""></a></span>
    
        
        <span><a href="/Testworld/Main" onmouseover="ch_png_on(this)" onmouseout="ch_png_off(this)"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/testworld_join_off.png" alt=""></a></span>
    

</div>
            </div>
        </div>
        <!-- section03 end -->
<script>
    $(document).ready(function () {
        $('.issu_tag_search input').bind('keydown', function (e) {
            UTILITY.onEnterKeyDown(e.currentTarget, function () {
                var tag = $('.issu_tag_search input').val();
                //#이 있으면 제거 + trim
                tag = UTILITY.replaceAllCaseInsensitive($.trim(tag), '#', '');
                if (tag === '') {
                    alert('검색어를 입력하세요');
                    return;
                }
                if (tag.length > 12) {
                    alert('태그는 12자를 넘을 수 없습니다.');
                    return;
                }
                if (UTILITY.isSpecialCharacter(tag)) {
                    alert('태그는 특수문자가 포함될 수 없습니다.');
                    return;
                }
                if (UTILITY.checkSpace(tag)) {
                    alert('태그는 공백이 포함될 수 없습니다.');
                    return;
                }
                var url = $('.issu_tag_search a').attr('href') + '?t=' + encodeURI(tag);
                window.location.href = url;
            });
        });
        $('.issu_tag_search a').bind('click', function (e) {
            e.preventDefault();
            var tag = $('.issu_tag_search input').val();
            //#이 있으면 제거
            tag = UTILITY.replaceAllCaseInsensitive($.trim(tag), '#', '');
            if (tag === '') {
                alert('검색어를 입력하세요');
                return;
            }
            if (tag.length > 12) {
                alert('태그는 12자를 넘을 수 없습니다.');
                return;
            }
            if (UTILITY.isSpecialCharacter(tag)) {
                alert('태그는 특수문자가 포함될 수 없습니다.');
                return;
            }
            if (UTILITY.checkSpace(tag)) {
                alert('태그는 공백이 포함될 수 없습니다.');
                return;
            }
            var url = $('.issu_tag_search a').attr('href') + '?t=' + encodeURI(tag);
            window.location.href = url;
        });
    });
</script>
<div id="issue_tag">
    <div class="div_inner">
        <span class="issue_tag"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/issue_tag.png" alt="" /></span>
        <div class="issu_tag_search">
            <input type="text" />
            <span><a href="/Common/Search"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/issu_search_btn.png" alt="검색" /></a></span>
        </div>
        <ul class="issu_tag_con">
                <li>
                    <span class="issu_l"></span>
                    <span class="issu_con"><a href="/Common/Search?t=%eb%a6%ac%eb%b6%80%ed%8a%b8" title="리부트">#리부트</a></span>
                    <span class="issu_r"></span>
                </li>
                <li>
                    <span class="issu_l"></span>
                    <span class="issu_con"><a href="/Common/Search?t=%ea%b0%95%ec%9b%90%ea%b8%b0%ed%99%94%ec%9d%b4%ed%8c%85" title="강원기화이팅">#강원기화이팅</a></span>
                    <span class="issu_r"></span>
                </li>
                <li>
                    <span class="issu_l"></span>
                    <span class="issu_con"><a href="/Common/Search?t=%ed%90%81%ed%90%81" title="퐁퐁">#퐁퐁</a></span>
                    <span class="issu_r"></span>
                </li>
                <li>
                    <span class="issu_l"></span>
                    <span class="issu_con"><a href="/Common/Search?t=%ec%a3%bc%ea%b8%b0%ec%8b%ab%ec%9d%8c%ec%8b%ab%eb%8b%a4%ea%b3%a0%ed%95%b4" title="주기싫음싫다고해">#주기싫음싫다고해</a></span>
                    <span class="issu_r"></span>
                </li>
                <li>
                    <span class="issu_l"></span>
                    <span class="issu_con"><a href="/Common/Search?t=%ed%85%9c%ea%b0%92%ec%88%98%ed%98%b8%eb%8b%a8" title="템값수호단">#템값수호단</a></span>
                    <span class="issu_r"></span>
                </li>
        </ul>
    </div>
</div>
        <!-- community_wrap str -->

<div class="community_wrap">
    <div class="community_inner">
        <div class="community">
            <span class="cm_wrap_title"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/main_txt01.png" alt="메이플스토리 커뮤니티" /></span>
                <ul class="main_cm_list">
                    <li class="cm_text_wrap">
                        <div class="cm_title">
                            <span>[자유게시판]</span>
                            <h2><a href="/Community/Free/370026">이번 메이플 논란이 전혀 논란거리가 아니라는 생각이 든다</a></h2>
                        </div>
                        <div class="cm_con">
                            <p><a href="/Community/Free/370026">본섭과 리부트의 차이는 교환이 불가능한 서버와 가능한 서버 현질을 할 수 있는 서버와 그렇지 않은 서버 정도로 크게 구분이 가능한데 여기서 현질이란 캐쉬를 메포로 교환해서 메소로 구매가 가능한가? 물통 거래로 메소 구매가 가능한가? 이 2가지로 판단된다.애초에 본섭은 현질을 하라고 만들어진 서버다.본섭은 돈만 쓰면 누구보다 빠르게 초반 레벨업이 가능하고 스펙업이 가능하다.다른 말로는 애초에 그러라고 있는 서버가 본섭이다.근데 현질을 적게 하거나 안 하는 사람이 본섭과 리부트를 비교하면서 리부트가 사기다, 너프시켜라이런 소리를 한다? 애초에 리부트 서버의 존재 이유가 그런 사람들이 하라고 있는 서버지만굳이 본인이 리부트를 안 가고 있으면서 리부트를 욕 한다.이게 무슨 소리냐? 결국 본섭에서 옥션에서 템도 편하게 사고 물통 거래도 하고 이것저것 누릴 수 있는 건 누리고 싶고리부트가 어느 부분에서는 확실하게 불편하니 가기는 싫은데 잘 되는 꼴은 보기 싫은 사람들이 생각보다 많다는 것.그 </a></p>
                        </div>
                        <div class="cm_wr_info">
                            <dl>
                                <dt><a href="/Common/Character/Detail/danin?p=mikO8qgdC4hElCwBGQ6GOx8CmO11EvduZkV0bRbPAhYEaPdUAhMZxNx3qZU44W1aWMBxjd%2bc3M92BgB8PPS8TKOYzd9AZvg1%2feICD6iTnj%2b1g93kW5kck1jbjyFAsnlIcCAv6KRV2MofsoPLWgXNqzF6Q4eB5%2frJN36ELIeK%2bys1asDgOS6PRjM9FrjpSR3F"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/world_icon/icon_11.png" alt="리부트2"></a></dt>
                                <dd class="community_char_id"><a href="/Common/Character/Detail/danin?p=mikO8qgdC4hElCwBGQ6GOx8CmO11EvduZkV0bRbPAhYEaPdUAhMZxNx3qZU44W1aWMBxjd%2bc3M92BgB8PPS8TKOYzd9AZvg1%2feICD6iTnj%2b1g93kW5kck1jbjyFAsnlIcCAv6KRV2MofsoPLWgXNqzF6Q4eB5%2frJN36ELIeK%2bys1asDgOS6PRjM9FrjpSR3F">danin</a></dd>
                                <dd class="community_date">2023.02.16</dd>
                            </dl>
                        </div>
                    </li>
                    <li class="cm_text_wrap">
                        <div class="cm_title">
                            <span>[정보게시판]</span>
                            <h2><a href="/Community/Information/369837">리부트 개선해주세요</a></h2>
                        </div>
                        <div class="cm_con">
                            <p><a href="/Community/Information/369837">리부트에선돈, 시간 더 쓰고 더 약한 본섭유저들을 조롱합니다직장에서 연봉도 괜히 오픈 안하는 게 아니고사람이라면 자신의 위치를 남과 비교하기 마련인데 리부트는 그거 이해를 못하네요.가치관이 다른거겠죠?남과 비교를 할 필요 없다는 리부트라면, 마땅히 리셋을 통해 신규 유저들에게 혜택을 주는 것도 괜찮은 것 같습니다.신규 유저들은 남과 비교해서 내가 상태가 나쁘니 들어오는 거고리부트 유저들은 남과 비교를 안하는 사람이니까모두가 같은 선상에서 출발할 수 있도록&#39;Re-Boot&#39;하드리셋 추천합니다.뉴비들을 배려해야겠지요?그리고 남과 비교는 할 필요 없다면서 동일메이플 동일스펙 논리로시간도, 돈도 지르지 않았으면서 엔드 똑같이 가고 싶고본섭 유저만큼 쎄지고 싶다고 하니까최종뎀도 낭낭~하게 10만퍼경험치 10만퍼메소, 드랍 10만퍼일주일이면 카링 깨도록 만들어주세요그게 리부트니까요</a></p>
                        </div>
                        <div class="cm_wr_info">
                            <dl>
                                <dt><a href="/Common/Character/Detail/%eb%82%a0%eb%a8%b9%ec%82%ac%ea%b8%b0%ec%a7%81%ec%97%85?p=mikO8qgdC4hElCwBGQ6GOx8CmO11EvduZkV0bRbPAhY90peGpI1DeTmFI3aTYJAQRD4DxxEB64HuC6ChxCq%2fXJUg3wjOBLaZDwTi%2fPBF9HUcFqKNBNrEdXlDRlh11teLi5LFjydPwMI0NnOtqdZzThswIxEiHAwWze9IKjYcccxEZkldn%2fDjWMtOwERcNaq%2b"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/world_icon/icon_8.png" alt="스카니아"></a></dt>
                                <dd class="community_char_id"><a href="/Common/Character/Detail/%eb%82%a0%eb%a8%b9%ec%82%ac%ea%b8%b0%ec%a7%81%ec%97%85?p=mikO8qgdC4hElCwBGQ6GOx8CmO11EvduZkV0bRbPAhY90peGpI1DeTmFI3aTYJAQRD4DxxEB64HuC6ChxCq%2fXJUg3wjOBLaZDwTi%2fPBF9HUcFqKNBNrEdXlDRlh11teLi5LFjydPwMI0NnOtqdZzThswIxEiHAwWze9IKjYcccxEZkldn%2fDjWMtOwERcNaq%2b">날먹사기직업</a></dd>
                                <dd class="community_date">2023.02.14</dd>
                            </dl>
                        </div>
                    </li>
                    <li class="cm_text_wrap">
                        <div class="cm_title">
                            <span>[토론게시판]</span>
                            <h2><a href="/Community/TopicDiscussion/334025">리부트 제로 전용 던전 몬스터 체력</a></h2>
                        </div>
                        <div class="cm_con">
                            <p><a href="/Community/TopicDiscussion/334025">메이플스토리를 운영하시는 운영자님들, 개발하시는 개발자분들 모두 고생이 많으십니다.한참 메이플스토리를 하지 않던 중, 19주년이라는 이야기를 듣고 메이플에 복귀하게 되었습니다.리부트라는 특이점이 있는 서버가 있길래 리부트2에서 새로 시작을 했습니다.그러나 여러 캐릭터를 키울까 하는 고민과 함께 한가지 의문이 들었습니다.해당 의문은 제목에 쓰여있는 것처럼 제로의 초반 스토리와 연관된 전용 던전에 관한 것이었습니다.제로의 특성 상 몬스터 사냥보다 던전에서 주는 경험치로 레벨업을 하게 되어있습니다.하지만 여타 다른 몬스터들과 같이 체력 2배 증가가 적용되어있습니다.그런데 받는 경험치 량은 던전 클리어 경험치이기에 일반 서버와 같은 경험치를 받게 됩니다.이 점에서 난이도가 급격하게 상승한다고 느껴지고, 다른 직업보다 초반 육성이 배 이상 오래 걸린다고 생각되었습니다.이 문제에 대해서 어떻게 생각하십니까?</a></p>
                        </div>
                        <div class="cm_wr_info">
                            <dl>
                                <dt><a href="/Common/Character/Detail/%eb%82%98%ea%b0%80%ec%a3%bd%ec%9d%80%ec%8b%a4%eb%a0%a5?p=mikO8qgdC4hElCwBGQ6GOx8CmO11EvduZkV0bRbPAhZ%2bCZC8204IRWqM5HHjx7ELRtVIJI8D1czjtsl0lIu%2fA6sjw3rriPmS0UjmStzMiiHvZVqZRzZetJaMmUCJ4KCzoVL7sFeq98tdgFWw83RaFIScYr%2fiC1cXE2SajozDGYRF0C3nINkDKYu6Xlv9mb%2b2"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/world_icon/icon_2.png" alt="리부트2"></a></dt>
                                <dd class="community_char_id"><a href="/Common/Character/Detail/%eb%82%98%ea%b0%80%ec%a3%bd%ec%9d%80%ec%8b%a4%eb%a0%a5?p=mikO8qgdC4hElCwBGQ6GOx8CmO11EvduZkV0bRbPAhZ%2bCZC8204IRWqM5HHjx7ELRtVIJI8D1czjtsl0lIu%2fA6sjw3rriPmS0UjmStzMiiHvZVqZRzZetJaMmUCJ4KCzoVL7sFeq98tdgFWw83RaFIScYr%2fiC1cXE2SajozDGYRF0C3nINkDKYu6Xlv9mb%2b2">나가죽은실력</a></dd>
                                <dd class="community_date">2022.04.25</dd>
                            </dl>
                        </div>
                    </li>
                    <li>
                        <div class="cm_img_wrap">
                            <a href="/Community/Art/370255"><img src="https://file.nexon.com/NxFile/download/FileDownloader.aspx?oidFile=5341361645887161614" alt="" /></a>
                            <span class="cm_radius_left"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/cm_left.png" alt=""></span>
                            <span class="cm_radius_right"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/cm_right.png" alt=""></span>
                        </div>
                        <div class="cm_img_con">
                            <div class="cm2_title">
                                <span>[메이플아트]</span>
                                <h2><a href="/Community/Art/370255">10레벨</a></h2>
                            </div>
                            <div class="cm_wr_info">
                                <dl>
                                    <dt><a href="/Common/Character/Detail/dorkqnfTkdgo?p=mikO8qgdC4hElCwBGQ6GOx8CmO11EvduZkV0bRbPAha0YsXsheCZA6B8G3KtEROTOoDDf5XtfBkHfwSSyea1d2oooc75N%2fuOfHsCVIvF3lKqUgoyJmoegEMaO9GExwCM3OqbkZkogihyYy14xFZqFLfbpWoBrfPskeH9tHrV1JNtP5cBUbt0GWrB1xLuQTk%2bif5OIl6xazur0waGplVQSg%3d%3d"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/world_icon/icon_14.png" alt="아케인" /></a></dt>
                                    <dd class="community_char_id"><a title="3" href="/Common/Character/Detail/dorkqnfTkdgo?p=mikO8qgdC4hElCwBGQ6GOx8CmO11EvduZkV0bRbPAha0YsXsheCZA6B8G3KtEROTOoDDf5XtfBkHfwSSyea1d2oooc75N%2fuOfHsCVIvF3lKqUgoyJmoegEMaO9GExwCM3OqbkZkogihyYy14xFZqFLfbpWoBrfPskeH9tHrV1JNtP5cBUbt0GWrB1xLuQTk%2bif5OIl6xazur0waGplVQSg%3d%3d">dorkqnfTkdgo</a></dd>
                                    <dd class="community_date">2023.02.17</dd>
                                </dl>
                            </div>
                        </div>
                    </li>
                </ul>

            <p class="community_more"><a href="/Community/Free"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/community_plus.png" alt="" /></a></p>
        </div>
        <div class="kodi_king">

            <span style="position:absolute; left:476px; top:2px;"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/main_txt02.png" alt="주간 베스트 코디왕" /></span>
            <span class="kodi_date">2023.02.13 ~ 2023.02.19</span>

                <span style="position:absolute; left:632px; top:79px"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/rank_num01.png" alt="1" /></span>
                <span style="position:absolute; left:379px; top:80px"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/rank_num02.png" alt="2" /></span>
                <span style="position:absolute; left:878px; top:80px"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/rank_num03.png" alt="3" /></span>
                <span style="position:absolute; left:144px; top:80px"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/rank_num04.png" alt="4" /></span>
                <span style="position:absolute; left:1114px; top:80px"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/rank_num05.png" alt="5" /></span>
                <div class="kodi_char">
                    <ul class="kodi_char_ul">
                        <li class="kodi_char_remove"><a href="/Community/Coordination"><img src="https://avatar.maplestory.nexon.com/Character/180/CLNHCONCAILKPNHOAFDPMEABCFEKJAMCNAPPBFHGDHBIMDFFJLJCGEJGAFLPOGGJAAJOBDDIMJIANCPHKBEDBHHHCGDNDPCJPDEKBEILGCKBACBPFAPFGLCBAMAKPAOBBHJKDCMKEEBAFHMMBNAIGNABKLCOIPLOIOCHNEIAPJKHNAOKECGCBFGMJLMHLOBBFEIAJKFGBJCGBEICLLLNIKLKNGLJKPPLCEPNHHIGLDJHDGKBNFOJAKDMOOKBKLIP.png" alt="" onerror="this.src='https://ssl.nexon.com/s2/game/maplestory/renewal/common/no_char_img_180.png'"></a></li>
                        <li class="kodi_char_middle"><a href="/Community/Coordination"><img src="https://avatar.maplestory.nexon.com/Character/180/JCEHJLEKJLNFKBPCAMKOPKKPIBOILHMMMIFNOFHDHMOHNNOIIDCBIFNKHHNMJADLCJBKKNLIDOAMGIEPEJOLHLADFDDIFHADIPBMPMHHHIKJDDAIOJBFJDHDCFPIIEJHPFLMNFDEPCICFGFBDJGINHDNIBMOJFGIBLOFEAIEDAMDINIPFELMHBGDOKNICDGABJPPOCGJKBFOJNPIJFCFPIHFOLCELEEFLFHIHGNNHOFODIBNKCAINFBECJKIOGIP.png" alt="" onerror="this.src='https://ssl.nexon.com/s2/game/maplestory/renewal/common/no_char_img_180.png'"></a></li>
                        <li class="kodi_char_center"><a href="/Community/Coordination"><img src="https://avatar.maplestory.nexon.com/Character/180/KPPMIPHNJLGNKGKAPHIFGCELKGIGOJEDHGADIPGPPLMNKCPNCDHEGBONFPGNNICIEADBFEEGJNLBJPMGLELDAJCHPIFMIHPAJONPEBHLKLIKEGJINAHBLLILNMPILOCHECAMKDOLFAEKAKKLKAFAJEIKPADFOCGMDBPNBDFEIJDBKGPKNFKEMMCKLLHNDJIHPDPIAMMHGGFAGNPPBPGIDNLNGCJJKFGMHFICFCFNCFAKPLOLCCBKLFAFCPPCHGJH.png" alt="" onerror="this.src='https://ssl.nexon.com/s2/game/maplestory/renewal/common/no_char_img_180.png'"></a></li>
                        <li class="kodi_char_middle"><a href="/Community/Coordination"><img src="https://avatar.maplestory.nexon.com/Character/180/NFJMHMFHCHPKEGBKJPFKNIALCCAKJPNLAIFJIPNCLPPGBOCCNCFAKHMMGDLJKLDKDGEEOOBMGMELCENNEJLEJMLNOIONMNMOICOFAHBAMNIDLDKENDFEMFPNEKLHGDJLAHJLFEJDAPHFILKBEJHFBIMEHJPKBPPEIFHHAAJHGGODKOBOPODOCKLGIAEFELNHJIPHBECJIMBJGCFFFDHFDDAPNGDDOMFJDAFEFOBPIJBDGHMHDLMAFPDLECMGDOOJ.png" alt="" onerror="this.src='https://ssl.nexon.com/s2/game/maplestory/renewal/common/no_char_img_180.png'"></a></li>
                        <li class="kodi_char_remove"><a href="/Community/Coordination"><img src="https://avatar.maplestory.nexon.com/Character/180/GMLNEBDIELLLJJPFLFHKACKDMMFNHBECFLHCDDJGJGGJFDBPDFDDNIDALDMAAPFJAKFCGHDPBGKNLKDOFMJIPJELEAGNHICCOLEECHHJDOIHHPKPKBOECFJHEFIHCKMFMIPPHILIJNPAAANOOMABMGDLDMIBOAHMAOPKEMFAOIJNJLMPIFGMFOBHOHBAGIKKHHNPHIHMCEBNGMFGFFGFHMMONINAIEBEJIKCGCBEGIFFCIGEFBBJOIAPDCEONMJA.png" alt="" onerror="this.src='https://ssl.nexon.com/s2/game/maplestory/renewal/common/no_char_img_180.png'"></a></li>
                    </ul>
                    <ul class="kodi_id">
                        <li>
                            <span><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/world_icon/icon_9.png" alt=""><a href="/Common/Character/Detail/%ea%b2%81%ec%94%a8?p=mikO8qgdC4hElCwBGQ6GOx8CmO11EvduZkV0bRbPAhZcOwdOrTB3%2bOMO1aKHLbr2gEKqNDF2Qpi7f7u35R6Jo1pz3sFn1tu9965hCYKXy7r00brluxzc0bcRytQ4vUqJyoyDsblNAbnzyfc1fSMn4YYbYe%2f2Ai7cdzyIGlDEU0c%3d" target="_blank">겁씨</a></span>
                        </li>
                        <li>
                            <span><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/world_icon/icon_12.png" alt=""><a href="/Common/Character/Detail/%eb%a5%b4%eb%ba%84?p=mikO8qgdC4hElCwBGQ6GOx8CmO11EvduZkV0bRbPAhaK%2b6A%2f%2f9wDZerl73C%2beBfRGdvyndhUfrPUN84dmw6CyAvrdmHWkhZw7v2R4cwrvVISDMaizeBtjxL7PKmCIiFBPNNjORixthoby8FKwiuovD3cg8QQIG2EwmNXFZyop1I%3d" target="_blank">르뺄</a></span>
                        </li>
                        <li class="kodi_id_center">
                            <span><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/world_icon/icon_8.png" alt=""><a href="/Common/Character/Detail/%eb%9e%91%ec%b0%a8?p=mikO8qgdC4hElCwBGQ6GOx8CmO11EvduZkV0bRbPAhZp%2bI4DYxKxXkN0nL52EgAtQuWCU1c9kbNfX4z79E3iNQzdbvNfSqdoIMn7kLmvoNUiL%2bUzbpy7FG2xPU%2br823VdxZuJRzkem2yiGrdjK%2btHS%2bx3WAih1EWELBA5THfJhE%3d" target="_blank">랑차</a></span>
                        </li>
                        <li>
                            <span><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/world_icon/icon_9.png" alt=""><a href="/Common/Character/Detail/%ec%bd%a7%eb%ac%bc%ec%bd%a7%eb%ac%bc?p=mikO8qgdC4hElCwBGQ6GOx8CmO11EvduZkV0bRbPAhYlreD9RdGjjfXZ6Gzs9aUjYUqAHYm9Wc3uFPgk8eZAc%2bqUryMDUrFpqqMKdrBwXqBGQd7Ao7xm%2f33vKR7hSYaUSYOdVl5FAx4kzQml36M5MrsPoubPVv1xlsGgDNJoxrXC1lmFKbwjNi9VWZQXQxZP" target="_blank">콧물콧물</a></span>
                        </li>
                        <li>
                            <span><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/world_icon/icon_4.png" alt=""><a href="/Common/Character/Detail/%ec%b5%9c%eb%8b%ac%ec%8f%ad?p=mikO8qgdC4hElCwBGQ6GOx8CmO11EvduZkV0bRbPAhZgwr1qIuQ0FtrToDhmWNFdTB%2fKzCS3%2fXeRROz8iTMLYB9Sk%2bP8uMKEK79bMMQYrSsvHqSaUlUV0pQTOsgoVckvE6%2bKwY0dcO2mIUnU7V%2b0HcU5hrQSV20T3He3j0wAZ90%3d" target="_blank">최달쏭</a></span>
                        </li>
                    </ul>
                </div>
            <p class="community_more"><a href="/Community/Coordination"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/community_plus.png" alt=""></a></p>
        </div>
    </div>
    <!-- community_inner end -->
</div>
        <!-- community_wrap end -->
        <!-- 아카이브 배너 추가 20181126 -->
        <div id="banner_area">
            <a href="https://archive.maplestory.nexon.com/News/Inspection" target="_blank"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/main/bn_archive.png" alt="메이플스토리 아카이브"></a>
        </div>
        <!-- //아카이브 배너 추가 20181126 -->
        <div id="section05">
<div class="div_inner">
    <h2><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/main_txt_section05.png" alt="메이플스토리 게임 정보"></h2>
    <a href="/Guide/GameInformation" class="btn_more">더보기</a>
    <div class="info_list">
        <ul>
            <li class="list1">
                <a href="/Guide/GameInformation/SpecialContents/PartyQuest">
                    <span class="img_wrap">
                        <img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/main_info_1.png" alt="">
                    </span>
                    <div class="txt_wrap">
                        <span class="title">파티퀘스트</span>
                        <span class="subscript">이번 달의 파티퀘스트 일정 정복하기! <br>용사님과 함께 파티퀘스트 즐기는 방법</span>
                    </div>
                    <span class="cover"></span>
                </a>
            </li>
            <li class="list2">
                <a href="/Guide/GameInformation/Skill/4thPromotionAndHyperSkill">
                    <span class="img_wrap">
                        <img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/main_info_2.png" alt="">
                    </span>
                    <div class="txt_wrap">
                        <span class="title">캐릭터&amp;스킬</span>
                        <span class="subscript">모든 직업과 스킬을 한눈에! <br>메이플스토리의 캐릭터, 스킬 정보 확인하기</span>
                    </div>
                    <span class="cover"></span>
                </a>
            </li>
            <li class="list3">
                <a href="/Guide/GameInformation/Security/UOTPSettings">
                    <span class="img_wrap">
                        <img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/main_info_3.png" alt="">
                    </span>
                    <div class="txt_wrap">
                        <span class="title">보안강화하기</span>
                        <span class="subscript">편리와 보안을 한방에! <br>안전하고 편하게 메이플스토리 즐기기</span>
                    </div>
                    <span class="cover"></span>
                </a>
            </li>
        </ul>
    </div>
</div>
        </div>
<div id="sns_wrap">
    <div class="div_inner">
        <dl>
            <dt class="maple_hanz"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/maple_hanz.png" alt=""></dt>
            <dd class="android"><a href="https://play.google.com/store/apps/details?id=com.nexon.handsplus" target="_blank"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/android.png" alt=""></a></dd>
            <dd class="ios"><a href="https://itunes.apple.com/kr/app/id1054905770" target="_blank"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/ios.png" alt=""></a></dd>
        </dl>
        <ul class="sns">
            <li>
                <a href="https://www.facebook.com/MapleStoryKR" target="_blank"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/facebook.png" alt=""></a>
            </li>
            <li>
                <a href="https://twitter.com/MapleStory_KR" target="_blank"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/twitter.png" alt=""></a>
            </li>
            <li>
                <a href="http://www.youtube.com/user/maplestorymaplestyle" target="_blank"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/youtube.png" alt=""></a>
            </li>
        </ul>
    </div>
</div>
<!-- footer str -->
<script>
    $(document).ready(function () {
        //$('.familysite_list a:eq(1)').click(function (e) {
        //    e.preventDefault();
        //    window.open($(e.currentTarget).attr('href'), 'mapleDS', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizeable=no,copyhistory=no, width=1015, height=596');
        //});
        $('.footer_info ul a:eq(3)').click(function (e) {
            e.preventDefault();
            window.open($(e.currentTarget).attr('href'), $(e.currentTarget).text(), 'width=500, height=450; scrollbars=yes');
        });
        $('.licensee a').click(function (e) {
            e.preventDefault();
            window.open($(e.currentTarget).attr('href'), 'communicationViewPopup', 'width=750, height=700; scrollbars=yes');
        });
    });
</script>

<div id="footer"  style="">
    <div class="div_inner">
        <div class="family_site_wrap">
            <span class="familysite_select">
                <a href="#a" onclick="family_site()">Family Site</a>
                <span class="family_arrow"><a href="#a"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/family_site_arrow.png" alt="" /></a></span>
            </span>
            <div class="familysite_list">
                <ul class="language">
                    <li><a href="http://www.maplestory.com/" target="_blank">Global</a></li>
                    <li><a href="https://maplestory.nexon.co.jp" target="_blank">Japan</a></li>
                    <li><a href="http://mxd.sdo.com/web5/home/home.asp" target="_blank">China</a></li>
                    <li><a href="http://tw.beanfun.com/maplestory/" target="_blank">Taiwan</a></li>
                </ul>
                <ul class="country">
                    <li><a href="http://www.maplesea.com/" target="_blank">S.E.A</a></li>
                    <li><a href="http://maplestory.nexon.net/" target="_blank">North America</a></li>
                    <li><a href="https://th.nexon.com/maplestory/th/home/home.aspx/" target="_blank">Thailand</a></li>
                </ul>
                <ul class="maple_list">
                    <li><a href="/Testworld/Main">Maple Tester</a></li>
                    
                </ul>
            </div>
        </div>
        <div class="footer_info">
            <ul>
                <li><a href="http://company.nexon.com/?ST=nexon&PS=footer" target="_blank">회사소개</a></li>
                <li><a href="http://career.nexon.com/" target="_blank">채용안내</a></li>
                <li><a href="https://member.nexon.com/policy/stipulation.aspx" target="_blank">이용약관</a></li>
                <li><a href="/Common/Footer/GameGrade">게임이용등급안내</a></li>
                
                <li><a href="https://member.nexon.com/policy/privacy.aspx" target="_blank" style="font-weight:bold; color:#fff;">개인정보처리방침</a></li>
                <li><a href="https://member.nexon.com/policy/youthprotection.aspx" target="_blank">청소년보호정책</a></li>
                <li><a href="/Common/Footer/OperationPolicy" target="_blank">운영정책</a></li>
                <li><a href="http://pcbang.nexon.com/?ST=nexon&PS=footer" target="_blank">넥슨PC방</a></li>
                <li><a href="/Common/Footer/SiteMap" target="_blank">사이트맵</a></li>
            </ul>
            <p>
                <span>(주)넥슨코리아 대표이사</span>
                <span style="margin-left:5px;">이정헌 경기도 성남시 분당구판교로 256번길 7</span>
                <span style="margin-left:5px;">전화: 1588-7701</span>
                <span>팩스:0502-258-8322</span>
                <br />
                <span>E-mail:contact-us@nexon.co.kr</span>
                <span style="margin-left:5px;">사업자등록번호 : 220-87-17483호</span>
                <span style="margin-left:5px;">통신판매업 신고번호 : 제2013-경기성남-1659호</span>
                <span class="licensee" style="margin-left:5px;"><a href="http://www.ftc.go.kr/info/bizinfo/communicationViewPopup.jsp?wrkr_no=2208717483">사업자정보확인</a></span>
            </p>
            <span class="copyright">ⓒ NEXON Korea Corporation All Rights Reserved.</span>
            <span class="footer_logo">
                <a href="https://www.nexon.com" target="_blank"><img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/footer_logo.png" alt="" /></a>
            </span>
        </div>
    </div>
</div>


<!-- footer end -->
    </div>



    <!--2020.12.01 네이버 채널링 종료 사전 안내 팝업 추가-->
     
    
    <!--2020.12.01 네이버 채널링 종료 사전 안내 팝업 추가-->

</body>
</html>



