<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	    <div class="row">
	        <div class="col">
	            <p class="text-white mt-5 mb-5">환영합니다, <b>관리자님</b></p>
	        </div>
	    </div>
	    <!-- row -->
	    <div class="row tm-content-row">
	        <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
	            <div class="tm-bg-primary-dark tm-block summary-layout" >
	                <h3 class="tm-block-title text-center">월별 매출</h3>
	                <canvas id="lineChart" style="margin-top:30px;"></canvas>
	            </div>
	        </div>
	        	        <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
	            <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-overflow summary-layout">
	                <h2 class="tm-block-title text-center">Daily Report</h2>
	                <div class="tm-notification-items" style="height:300px;">
	                    <div class="media tm-notification-item">
	                        <div class="tm-gray-circle"><img src="/starbucks/images/shopping-cart (4).png" class="rounded-circle" width="100%" height="100%""></div>
	                        <div class="media-body">
	                            <p class="mb-2"><b>주문완료</b> : <a href="#"
	                                    class="tm-notification-link">${dr[2].orderCnt } </a>건. </p>
	                                    <h3>${dr[2].orderTotal } 원</h3>
	                            <span class="tm-small tm-text-color-secondary">2020년 4월 06일</span>
	                        </div>
	                    </div>
	                    <div class="media tm-notification-item">
	                        <div class="tm-gray-circle"><img src="/starbucks/images/refund (3).png" class="rounded-circle" width="100%" height="100%"></div>
	                        <div class="media-body">
	                            <p class="mb-2"><b>주문취소</b> : <a href="#"
	                                    class="tm-notification-link">${dr[0].orderCnt } </a>건. </p>
	                                    <h3>${dr[0].orderTotal } 원</h3>
	                            <span class="tm-small tm-text-color-secondary">2020년 4월 06일</span>
	                        </div>
	                    </div>
	                    <div class="media tm-notification-item">
	                        <div class="tm-gray-circle"><img src="/starbucks/images/order.jpg" class="rounded-circle" width="100%" height="100%"></div>
	                        <div class="media-body">
	                            <p class="mb-2"><b>승인대기</b> : <a href="#"
	                                    class="tm-notification-link">${dr[1].orderCnt } </a>건. </p>
	                                    <h3>${dr[1].orderTotal } 원</h3>
	                            <span class="tm-small tm-text-color-secondary">2020년 4월 06일</span>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
	            <div class="tm-bg-primary-dark tm-block summary-layout">
	                <h3 class="tm-block-title text-center">TOP7 인기상품</h3>
	                <canvas id="barChart"></canvas>
	            </div>
	        </div>
	        <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
	            <div class="tm-bg-primary-dark tm-block tm-block-taller summary-layout">
	                <h2 class="tm-block-title text-center" style="margin-bottom:10px;">테마별 판매량</h2>
	                <div id="pieChartContainer">
	                    <canvas id="pieChart" class="chartjs-render-monitor"></canvas>
	                </div>                        
	            </div>
	        </div>

	        <div class="col-12 tm-block-col">
	            <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
	                <h2 class="tm-block-title text-center">금일 배송리스트</h2>
	                <div class="text-right">
	                <button id="getCSV" class="btnDownload mb-3"> 다운로드 (.csv) </button>
	                <button id="getExcel" class="btnDownload mb-3"> 다운로드 (.xls) </button>
	                </div>
	                <table class="table" id="orderTable">
	                    <thead>
	                        <tr>
	                        	<th scope="col" class='text-center'>주문상태</th>
	                            <th scope="col" class='text-center'>주문번호</th>
	                            <th scope="col" class='text-center'>아이디</th>
	                            <th scope="col" class='text-center'>상품코드</th>
	                            <th scope="col" class='text-center'>결제금액</th>
	                            <th scope="col" class='text-center'>연락처</th>
	                            <th scope="col" class='text-center'>배송지</th>
	                            <th scope="col" class='text-center'>주문날짜</th>
	                            
	                        </tr>
	                    </thead>
	                    <tbody>
	                        <c:forEach var = "vo" items="${orderList }">
	                        <tr>
	                            <td>
	                                
	                                <c:choose>
	                                	<c:when test="${vo.orderStatus eq '1'}">
	                                		<div class=	"tm-status-circle cancelled"></div>주문취소
	                                	</c:when>
										<c:when test="${vo.orderStatus eq '2'}">
											<div class=	"tm-status-circle pending"></div>승인대기
										</c:when>
										<c:when test="${vo.orderStatus eq '3'}">
											<div class=	"tm-status-circle moving"></div>주문완료
										</c:when>
	                                </c:choose>
	                            </td>
	                            <td><b>${vo.orderNumber }</b></td>
	                            <td class='text-center'><b>${vo.memberId }</b></td>
	                            <td class='text-center'><b>${vo.itemCode }</b></td>
	                            <td class='text-center'>${vo.orderPrice }</td>
	                            <td class='text-center'><b>${vo.getPhone }</b></td>
	                            <td class='text-center'><b>${vo.getAddress }</b></td>
	                            <td class='text-center'>${vo.orderregDate}</td>
	                        </tr>
	                        </c:forEach>
	                    </tbody>
	                </table>
	            </div>
	        </div>
	    </div>
	</div>
	<form id="dashFrm" name="dashFrm">
	<c:forEach var="item" items="${pList }">
	<input type="hidden" name="bestItem" value="${item.item_title }"/>
	<input type="hidden" name="bestItemValue" value="${item.order_sumnum }"/>
	</c:forEach>
	
	<c:forEach var="item" items="${sum }">
	<input type="hidden" name="totalSum" value="${item }"/>
	</c:forEach>
	
	<c:forEach var="item" items="${list2 }">
	<input type="hidden" name="themeSum" value="${item.item_theme }"/>
	<input type="hidden" name="themeSumValue" value="${item.salesSum}"/>
	</c:forEach>
	</form>
	
	<script>
	   $(document).ready(function(){
		    $('#dashNav').addClass('active');
	   });
	   
	</script>
</body>
</html>