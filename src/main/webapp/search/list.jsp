<%@page import="kr.co.dongdong.vo.FacilitiesVO"%>
<%@page import="kr.co.dongdong.dao.FacilitiesDAO"%>
<%@page import="test.Event"%>

<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Favicons -->
<!--  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  Google Fonts
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Raleway:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">
 -->
<!-- Vendor CSS Files -->
<link href="../Resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../Resources/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="../Resources/vendor/aos/aos.css" rel="stylesheet">
<link href="../Resources/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="../Resources/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">
<!-- Template Main CSS File -->
<link href="../Resources/css/main.css" rel="stylesheet">
<!-- Vendor JS Files -->
<script src="../Resources/js/bootstrap.bundle.js"></script>
<script src="../Resources/vendor/aos/aos.js"></script>
<script src="../Resources/vendor/glightbox/js/glightbox.min.js"></script>
<script src="../Resources/vendor/purecounter/purecounter_vanilla.js"></script>
<script src="../Resources/vendor/swiper/swiper-bundle.min.js"></script>
<script src="../Resources/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="../Resources/vendor/php-email-form/validate.js"></script>

<!-- Template Main JS File -->
<script src="../Resources/js/main.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="semantic/semantic.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>
<script src="semantic/semantic.js"></script>
<style>
img {
	width: 100%;
	height: 190px;
	border: 2px solid black;
	border-radius: 10px;
	border: 2px solid black;
}

#imgdiv {
	width: 250px;
	height: 200px;
	margin: auto;
}

.service-item {
	padding: 30px;
}

.mainmenu {
	float: left;
	width: 150px;
	list-style-type: none;
}

li.mainmenu ul {
	margin: 0;
	list-style-type: none;
	padding: 0;
}

.mainmenu a {
	width: 150px;
	color: white;
	display: block; /* ?????????????????? ??????????????? ?????? */
	background: green;
	text-decoration: none;
	padding: 10px;
	border-bottom: 1px solid #ffffff;
}

#dropdownmenu li a:hover {
	background: black;
}

#bar {
	width: 100%;
	background: blue;
}

.section-header p {
	margin-bottom: 50px;
}
</style>
<script>
	$(function() {
		$("li.mainmenu ul").hide();

		$("li.mainmenu").hover(function() {
			// ???????????? ???????????? ????????? ??????
			// ????????? ??????????????? ul ?????? ????????? ????????? ??????
			$("ul", this).stop().slideDown(500);
		}, function() {
			// ???????????? ????????? ????????? ??????
			$("ul", this).stop().slideUp(500);
		})

		$("#emenu").click(
				function() {
					$(".ui.sidebar")
							.sidebar('setting', 'transition', 'overlay')
							.sidebar("toggle");
				})

		$("#eventmenu .item").click(function() {
							

							var esav = $("#esave").val();
							var lsav = $("#lsave").val();
							var activeTab = $(this).attr('data-tab');
							var activeTab1 = $(this).attr('data-tab1');
							var urlplus = "";
							var urlplus1 = "";
							
							if(activeTab == null){
								urlplus += esav;
							}else{
								urlplus += activeTab
							}
							if(activeTab1 == null){
								urlplus1 += lsav;
							}else{
								urlplus1 += activeTab1
							}
							var activeT = urlplus +"&"+ urlplus1;
							console.log(esav);
							console.log(lsav);
							console.log("urlplus : "+ urlplus);
							console.log("urlplus1 : "+ urlplus1);
							console.log("eventlist.jsp?fevent=" + urlplus+"&facloc="+urlplus1);
							
							$.ajax({
									type : 'GET', //get???????????? ??????
									async : true,
									url : "eventlist.jsp?fevent=" + urlplus+"&facloc="+urlplus1, //?????? data-tab????????? ????????? ??? html????????? ??????
									dataType : "json", //html???????????? ??? ??????
									success : function(response, status,request) { //?????? ????????? ??? ???????????? div??? ???????????? ????????? ?????????.
										//console.log(response);
										//console.log(response[0].facevent);
										//var facevent = urlplus;
										if(response.empty == "empty"){
											alert("????????? ????????????.");
										}else{
											
										
										var eventname = response[0].event; 
										//var facloc = response[0].facloc;
										var event = response;

										var data = "";

										data += "<h2>" + eventname + "</h2>";
											
										data += "<p>?????? " + eventname
													+ "??????~!</p>";
										data += "<input type='hidden' name='save' id='esave' value = '"+urlplus +"' />";
										data += "<input type='hidden' name='save' id='lsave' value = '"+urlplus1 +"' />";
										data += "<div class='row gy-4' data-aos='fade-up' data-aos-delay='100'>";
											
										event.forEach(function(el, index) {
											data += "<div class='col-lg-4 col-md-6'>";
											data += "<div class='service-item  position-relative'>";
											data += "<div id='imgdiv'><img src="+el.facimg+" alt="+el.facname+"/></div>";
											data += "<h3>"+ el.facname + "</h3>";
											data += "<p class='font-monospace'>"+ el.facaddr + "</p>";
											data += "<a href='detail.jsp?facno=" + el.facno + "' class='readmore stretched-link'>detail more <i class='bi bi-arrow-right'></i></a>";
											data += "</div>";
											data += "</div>";
										});
											data += "</div>";
											
										$("#dbody").empty();
										$("#dbody").append(data);}
										},
										error : function(request, status, error) {
											alert("code:" + request.status
													+ "\n" + "\n" + "error:"
													+ error);
										}
									});

						})
		
		
						
		
			});

</script>
</head>
<body>

	<section id="services" class="services sections-bg">


		<div class="ui sidebar inverted vertical menu" id="eventmenu">
			<a data-tab="-1" class="item"> ?????? </a>
			<a data-tab="0" class="item"> ????????? </a>
			<a data-tab="1" class="item"> ?????????</a>
			<a data-tab="2" class="item"> ????????? </a>
			<a data-tab="3" class="item"> ??????????????? </a>
			<a data-tab="4" class="item"> ???????????? </a>
			<a data-tab="5" class="item"> ????????? </a>
			<a data-tab="6" class="item"> ????????? </a>
			<a data-tab="7" class="item"> ????????? </a>
			<a data-tab1="??????" class="item"> ??????</a>
			<a data-tab1="?????????" class="item"> ?????????</a>
			<a data-tab1="?????????" class="item"> ????????? </a>
			<a data-tab1="?????????" class="item"> ????????? </a>
			<a data-tab1="?????????" class="item"> ????????? </a>
			<a data-tab1="?????????" class="item"> ????????? </a>
			<a data-tab1="????????????" class="item"> ???????????? </a>
			<a data-tab1="?????????" class="item"> ????????? </a>
			<a data-tab1="?????????" class="item"> ????????? </a>
		</div>
		<div class="pusher">
			<button id="emenu" class="ui button">menu</button>


			<div class="container" data-aos="fade-up">

				<div class="section-header" id="dbody">
					<%
					// ???????????? ???????????? ????????????
					String faceve = request.getParameter("facevent");
					faceve = "3";
					// ?????? ???????????? ????????????
					String facloc = request.getParameter("facloc");
					//facloc = "?????????";
					String event = "";
					int facevent =30;
					if(faceve != null){
						facevent = Integer.parseInt(faceve);
						Event e = new Event();

						event += e.selectEvent(facevent);
						facloc = "??????";
					}else if(facloc != null){
						facevent = -1;
					}

					
						System.out.println("facevent" + facevent);
						System.out.println("facloc" + facloc);
					%>

					<h2><%=event%></h2>
					<h3><%=facloc%></h3>
					<p>
						??????
						<%=event%>
						??????~!
					</p>
					<input type="hidden" name="save" id="esave" value="<%=facevent%>" />
					<input type="hidden" name="save" id="lsave" value="<%=facloc%>" />


					<div class="row gy-4" data-aos="fade-up" data-aos-delay="100">
						<%
						FacilitiesDAO dao = new FacilitiesDAO();
						ArrayList<FacilitiesVO> list = new ArrayList<FacilitiesVO>();
						if (facevent == -1) { // ????????? ?????? ?????????
							list = dao.locAll(facloc);

						} else if (facloc == "??????") { // ????????? ?????? ?????????
							list = dao.eventAll(facevent);
						}
						for (FacilitiesVO vo : list) {
						%>
						<div class="col-lg-4 col-md-6">
							<div class="service-item  position-relative">
								<div id="imgdiv">
									<img src="<%=vo.getFacimg()%>" alt="<%=vo.getFacname()%>" />
								</div>
								<h3><%=vo.getFacname()%></h3>
								<p class="font-monospace"><%=vo.getFacaddr()%></p>
								<a href="detail.jsp?facno=<%=vo.getFacno()%>"
									class="readmore stretched-link">detail more <i
									class="bi bi-arrow-right"></i></a>
							</div>
						</div>
						<%
						

						}
						%>

					</div>
				</div>
			</div>
		</div>
	</section>

</body>
</html>