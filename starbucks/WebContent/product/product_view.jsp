<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <!-- Breadcrumb -->
    <style>
    .wrap {
    position: relative;
    width: 500px;
    margin: 0 auto;
	}
	/* 확대될 타겟이미지*/
	.target {
	    display: block;
	    width: 100%;
	}
	/* 돋보기 */
	.magnifier {
	    width: 120px;
	    height: 120px;
	    position: absolute;
	    border-radius: 100%;
	    box-shadow: 0 0 0 3px rgba(255, 255, 255, 0.85), 0 0 3px 3px rgba(0, 0, 0, 0.25);
	    display: none;
	}
 
    </style>
    
    <c:forEach var='vo' items='${list }'>
    
    <div class="bg-light py-3">
        <div class="container">
            <div class="row">
                <div class="col-md-12 mb-0">
                    <a href="/starbucks/index.jsp">Home</a> <span class="mx-2 mb-0">/</span> <a href="listPage.pl">ALL Product</a> 
                    <span class="mx-2 mb-0">/</span><strong class="text-black">${vo.item_title }</strong>
                    
                </div>
            </div>
        </div>
    </div>

    <div class="site-section">
      <div class="container">
        <div class="row">
        

          <div class="wrap col-md-5 ">
          	<div class='row'>
            <img id='imgView' src="./fileFolder/${vo.item_thumbnailimg }" alt="Image" class="target img-fluid" data-zoom="3" />
            </div>
            <div class='row'>
            <br />
            <img id='img1' src="./fileFolder/${vo.item_thumbnailimg }" alt="Image" class="img-fluid col-4 img-thumbnail" data-zoom="3" onclick='imgchang(1)' />
            <img id='img2'  src="./fileFolder/${vo.item_mainimg }" alt="Image" class="img-fluid col-4 img-thumbnail" data-zoom="3" onclick='imgchang(2)' />
            <img id='img3'  src="./fileFolder/${vo.item_contentimg }" alt="Image" class="img-fluid col-4 img-thumbnail" data-zoom="3" onclick='imgchang(3)' />

            </div>
          </div>
          <div class="offset-1 col-md-6">

            <h2 class="text-black">${vo.item_title }</h2>
            <p>${vo.item_content }</p>
            <p class="mb-4">용량 : ${vo.item_size }</p>
            <p class="mb-4">재고 : ${vo.item_num }</p>
            <p class="mb-4">적립금 : ${vo.item_savedmoney }원</p>
            <p><strong id='price'class="text-primary h4">${vo.item_price }</strong><strong class='text-primary h4'>원</strong></p>


            <div class="mb-5">
              <div class="input-group mb-3" style="max-width: 120px;">
              <div class="input-group-prepend">
                <button id='minus'class="btn btn-outline-primary js-btn-minus" type="button" onclick='priceminus()'>&minus;</button>
              </div>
              <input id='ea' type="text" class="form-control text-center" value="1" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1">
              <div class="input-group-append">
                <button id='plus' class="btn btn-outline-primary js-btn-plus" type="button" onclick='priceplus()'>&plus;</button>
              </div>
            </div>

            </div>
            
            <!-- 로그인 확인해서 장바구니, 주문하기 버튼 다르게 생성해줌 -->
			    <div class='mb-5 form-inline'>     
				<%if(session.getAttribute("mId") == null){ %> 
				      <p><a href='#' onclick='alert_login()' class="buy-now btn btn-sm btn-primary">장바구니</a></p>
				<%}%>
				
				<%if(session.getAttribute("mId") != null){ %> 
				    <p><a href="./my/cart.jsp" class="buy-now btn btn-sm btn-primary">장바구니</a></p>
				<%}%>
				    
				<%if(session.getAttribute("mId") == null){ %> 
				      <p><a href='#' onclick='alert_login()' class="buy-now btn btn-sm btn-primary offset-1">구매하기</a></p>
				<%}%>
				
				<%if(session.getAttribute("mId") != null){ %> 
				    <p><a href="./my/order.jsp" class="buy-now btn btn-sm btn-primary  offset-1">구매하기</a></p>
				<%}%>
				
					<p><a href="listPage.pl" class="buy-now btn btn-sm btn-primary offset-3">목록</a></p>
				</div>

          </div>
        </div>
      </div>
    </div>
           	<form id='view_frm' name='view_frm' action="">
	        <input type="hidden" id="oriPrice" value='${vo.item_price }' />
            <input type="hidden" id="totPrice" value='' />
            <input type="text" id="oriEa" value='1' />
            <input type="text" id="itemEa" value='1' />
			</form>
            
            


</c:forEach>
<script src="/starbucks/js/productlist.js"></script>
<script>
let priceplus = function(){
	let price = parseInt($('#price').text());
	let oriprice = parseInt($('#oriPrice').val());
	
	let ea = parseInt($('#itemEa').text());
	let oriea = parseInt($('#oriEa').text());
	
	$('#price').text(price+oriprice);
	$('#totPrice').val(price+oriprice);
	$('#itemEa').text(ea+oriea);
}
let priceminus = function(){
	let price = parseInt($('#price').text());
	let oriprice = parseInt($('#oriPrice').val());
	let ea = parseInt($('#itemEa').text());
	let oriea = parseInt($('#oriEa').val());
	
	$('#price').text(price-oriprice);
	$('#totPrice').val(price-oriprice);
	$('#itemEa').text(ea-oriea);
}

let alert_login = function(){
	Swal.fire({
		  icon: 'error',
		  title: 'Oops...',
		  text: '로그인 후 이용해주세요 !',
		  footer: "<a href='/starbucks/member/login.jsp'>로그인화면 이동</a>"
		})
}




let imgchang = function(num){
	
	$('#imgView').attr('src',$('#img'+num).attr('src'));
	zoom();
	
}
let zoom = function () {
	 
    var target = $('.target');
    //1
    var zoom = target.data('zoom');
 
    $(".wrap")
        .on('mousemove', magnify)
        .prepend("<div class='magnifier'></div>")
        .children('.magnifier').css({
            "background": "url('" + target.attr("src") + "') no-repeat",
            // 2
            "background-size": target.width() * zoom + "px " + target.height() * zoom+ "px"
        });
 
    var magnifier = $('.magnifier');
 
    function magnify(e) {
 
        // 마우스 위치에서 .magnify의 위치를 차감해 컨테이너에 대한 마우스 좌표를 얻는다.
        var mouseX = e.pageX - $(this).offset().left;
        var mouseY = e.pageY - $(this).offset().top;
 
        // 컨테이너 밖으로 마우스가 벗어나면 돋보기를 없앤다.
        if (mouseX < $(this).width() && mouseY < $(this).height() && mouseX > 0 && mouseY > 0) {
            magnifier.fadeIn(100);
        } else {
            magnifier.fadeOut(100);
        }
 
        //돋보기가 존재할 때
        if (magnifier.is(":visible")) {
 
            // 3
            var rx = -(mouseX * zoom - magnifier.width() /2 );
            var ry = -(mouseY * zoom - magnifier.height() /2 );
 
            //돋보기를 마우스 위치에 따라 움직인다.
            //돋보기의 width, height 절반을 마우스 좌표에서 차감해 마우스와 돋보기 위치를 일치시킨다.
            var px = mouseX - magnifier.width() / 2;
            var py = mouseY - magnifier.height() / 2;
 
            //적용
            magnifier.css({
                left: px,
                top: py,
                backgroundPosition: rx + "px " + ry + "px"
            });
        }
    }
};



$( function () {
	 
    var target = $('.target');
    //1
    var zoom = target.data('zoom');
 
    $(".wrap")
        .on('mousemove', magnify)
        .prepend("<div class='magnifier'></div>")
        .children('.magnifier').css({
            "background": "url('" + target.attr("src") + "') no-repeat",
            // 2
            "background-size": target.width() * zoom + "px " + target.height() * zoom+ "px"
        });
 
    var magnifier = $('.magnifier');
 
    function magnify(e) {
 
        // 마우스 위치에서 .magnify의 위치를 차감해 컨테이너에 대한 마우스 좌표를 얻는다.
        var mouseX = e.pageX - $(this).offset().left;
        var mouseY = e.pageY - $(this).offset().top;
 
        // 컨테이너 밖으로 마우스가 벗어나면 돋보기를 없앤다.
        if (mouseX < $(this).width() && mouseY < $(this).height() && mouseX > 0 && mouseY > 0) {
            magnifier.fadeIn(100);
        } else {
            magnifier.fadeOut(100);
        }
 
        //돋보기가 존재할 때
        if (magnifier.is(":visible")) {
 
            // 3
            var rx = -(mouseX * zoom - magnifier.width() /2 );
            var ry = -(mouseY * zoom - magnifier.height() /2 );
 
            //돋보기를 마우스 위치에 따라 움직인다.
            //돋보기의 width, height 절반을 마우스 좌표에서 차감해 마우스와 돋보기 위치를 일치시킨다.
            var px = mouseX - magnifier.width() / 2;
            var py = mouseY - magnifier.height() / 2;
 
            //적용
            magnifier.css({
                left: px,
                top: py,
                backgroundPosition: rx + "px " + ry + "px"
            });
        }
    }
});



</script>



    <!-- Breadcrumb END -->
    
	<!-- Content -->    
	
	<!-- Content END-->    
    
<%@include file="../layout/footer.jsp" %>