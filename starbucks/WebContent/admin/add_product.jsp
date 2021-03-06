<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <body>
	<div class="container tm-mt-big tm-mb-big">
		<div class="row">
			<div class="col-xl-10 col-lg-11 col-md-12 col-sm-12 mx-auto">
				<div class="tm-bg-primary-dark tm-block tm-block-h-auto">
					<div class="row">
						<div class="col-12">
							<h2 class="tm-block-title d-inline-block">상품 등록</h2>
						</div>
					</div>
					<form id="productFrm" name="productFrm" method="post" enctype="multipart/form-data"
						class="tm-edit-product-row">
						<div class="col-xl-12 col-lg-12 col-md-12">
							<div class="form-group mb-3">
								<label for="item_title">상품명 </label> <input
									id="item_title" name="item_title" type="text"
									class="form-control validate" required />
							</div>
							<div class="row">
								<div class="form-group mb-3 col-xs-12 col-sm-6">
									<label for="item_price">판매가
									</label> <input id="item_price" name="item_price" type="text"
										class="form-control validate" data-large-mode="true" />
								</div>
								<div class="form-group mb-3 col-xs-12 col-sm-6">
									<label for="item_num">재고
									</label> <input id="item_num" name="item_num" type="number"
										class="form-control validate" required />
								</div>
								
							</div>
							<div class="row">
								<div class="form-group mb-3 col-xs-12 col-sm-6">
									<label for="item_size">사이즈/크기
									</label> <input id="item_size" name="item_size" type="text"
										class="form-control validate" required />
								</div>
								<div class="form-group mb-3 col-xs-12 col-sm-6">
									<label for="item_status">판매상태</label> <select
										class="custom-select tm-select-accounts" id="item_status"
										name="item_status">
										<option selected>판매상태</option>
										<option value="판매">판매</option>
										<option value="판매안함">판매안함</option>
									</select>
								</div>
							</div>
							<div class="form-group mb-3">
								<label for="item_content">상품설명</label>
								<textarea id="item_content" name="item_content"
									class="form-control validate" rows="3" required></textarea>
							</div>

							<hr />
							<div class="row">
							<div class="form-group mb-3 col-xs-12 col-sm-6">
									<label for="item_group">분류</label> <select
										class="custom-select tm-select-accounts" id="item_group"
										name="item_group">
										<option selected>분류선택</option>
										<option value="MG">머그</option>
										<option value="GL">글라스</option>
										<option value="TB">텀블러</option>
										<option value="TM">보온병</option>
										<option value="AC">액세서리</option>
										<option value="CO">커피용품/원두</option>
									</select>
								</div>
								<div class="form-group mb-3 col-xs-12 col-sm-6">
									<label for="item_theme">테마</label> <select
										class="custom-select tm-select-accounts" id="item_theme"
										name="item_theme">
										<option selected>테마선택</option>
										<option value="20 체리블라썸">20 체리블라썸</option>
										<option value="베라왕 X 스타벅스">베라왕 X 스타벅스</option>
										<option value="시티투어 콜렉션">시티투어 콜렉션</option>
										<option value="스프링 콜렉션">스프링 콜렉션</option>
									</select>
								</div>
							</div>

							<div class="row">
								<div class="form-group mb-3 col-xs-12 col-sm-6">
									<label for="item_regdate">등록일자
									</label> <input id="item_regdate" name="item_regdate" type="text"
										class="form-control validate" data-large-mode="true" 
										value = "2020-04-06"/>
								</div>

							</div>
							<br />
						<div class="form group">
								<label style="color:#fff;">파일업로드</label>
							</div>
				<div class="row" id="photoRow" style="height:250px;">
					
				<br/>
				</div>
					<input id="fileBtn" name="fileBtn" type="file" style="display: none;" />

				<div class="col-12">
					<button type="button" id="btnSaveItem"
						class="btn btn-primary btn-block text-uppercase">상품등록</button>
				</div>
		<hr/>
				<div class="row">
				<div class="col-9"></div>
				<div class="col-3">
					<div class="row">
					<span class="col-6 bottom-nav" onclick="toList();"
						>목록으로</span>
					<span class="col-6 bottom-nav" onclick="$('html').scrollTop(0);"
						>맨 위로</span>
						</div>
				</div>
				</div>
				
				<input type="hidden" id="resultMsg" value="${msg }"/>
				</form>
			</div>
		</div>
	</div>
		<!-- row -->
		
</div>
	<!-- container -->

	<script>
	
	$('#proNav').addClass('active');

    $(function() {
        $("#item_regdate").datepicker({
          defaultDate: "2020-04-06"
        });
      });
      
      let main = document.querySelector('#photoRow');
      makeDiv(main);
      
      var j = jQuery.noConflict();
      j(document).ready(function(){
          j('#datetimepicker').datepicker();
      })
      
    </script>
  </body>
</html>