<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../layout/header.jsp" %>
        <!-- Breadcrumb -->
        <div class="bg-light py-3">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 mb-0">
                        <a href="index.html">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">MyPage</strong>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb END -->

        <!-- Content -->
        <div class="site-section">
            <div class="container">
                <div class="row mb-5">
                    <div class="col-md-3 order-1 mb-5 mb-md-0">
                        <div class="border p-4 rounded mb-4">
                            <h3 class="mb-3 h6 text-uppercase d-block"><a href="./" class=" text-black">MyPage</a></h3>
                            <ul class="list-unstyled mb-0">
                                <li class="mb-1"><a href="./cart.jsp" class="d-flex"><span>장바구니</span></a></li>
                                <li class="mb-1"><a href="./order_list.jsp" class="d-flex"><span>구매내역</span></a></li>
                                <li class="mb-1"><a href="./account.jsp" class="d-flex"><span>회원정보 수정</span></a></li>
                                <li class="mb-1"><a href="./out.jsp" class="d-flex"><span>회원탈퇴</span></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-9 order-2">
                        <div class="row mb-3">
                            <div class="col-md-12">
                                <h2 class="h3 mb-3 text-black">회원정보 수정</h2>
                            </div>
                        </div>
                        <form class="row">
                            <div class="col-12">
                                <h2 class="h5 mb-3 text-black">기본 정보</h2>
                            </div>
                            <div class="col-md-6 mb-5 mb-md-0">
                                <div class="form-group row">
                                    <div class="col-md-12">
                                        <label for="userNm" class="text-black">이름 <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control" id="userNm" name="userNm">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-12">
                                        <label for="userPwd" class="text-black">비밀번호 <span class="text-danger">*</span></label>
                                        <input type="password" class="form-control" id="userPwd" name="userPwd">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-12">
                                        <label for="userPhone" class="text-black">연락처 <span class="text-danger">*</span></label>
                                        <input type="tel" class="form-control" id="userPhone" name="userPhone" pattern="[0-9]{3}-[0-9]{4}-[0-9]{3}">
                                    </div>
                                </div>
                                <div class="form-group row mb-5">
                                    <div class="col-md-12">
                                        <label for="memberEmail" class="text-black">이메일 <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control" id="memberEmail" name="memberEmail">
                                    </div>

                                </div>

                            </div>

                            <div class="col-md-6 mb-5 mb-md-0">
                                <div class="form-group row">
                                    <div class="col-md-12">
                                        <label for="zonecode" class="text-black">우편번호 <span class="text-danger">*</span></label>
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="zonecode" name="zonecode" readonly>
                                            <div class="input-group-append">
                                                <button class="btn btn-primary btn-sm" type="button" onclick="openDaumZipAddress();">우편번호 찾기</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-md-12">
                                        <label for="address" class="text-black">주소 <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control" id="address" name="address" readonly>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-12">
                                        <label for="address_etc" class="text-black">상세주소 <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control" id="address_etc" name="address_etc ">
                                    </div>
                                </div>



                            </div>
                            <div class="col-12 text-right">
                                <button type="button" class="btn btn-primary min-width-125" id="btnSave2">
                                    저장
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Content END-->


        <script>
            $(function () {
                $("#btnSave2").click(function () {
                    Swal.fire({
                        icon: 'SUCCESS',
                        title: 'success',
                        text: '회원정보가 정상적으로 수정되었습니다.',
                        showConfirmButton: false,
                        timer: 1500
                    })
                });
            })
        </script>
        <%@include file="../layout/footer.jsp" %>