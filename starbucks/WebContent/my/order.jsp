<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- left side menu -->
	<%@include file="./left.jsp" %>
<div class="col-md-9 order-2">
    <div class="row mb-5">
        <div class="col-md-12">
            <h2 class="h3 mb-3 text-black">주문하기</h2>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 mb-5 mb-md-0">
            <h2 class="h5 mb-3 text-black">배송지 정보</h2>
            <!-- <label class="checkbox-btn">
                                <input type="checkbox">
                                <span class="btn btn-light">기본 배송지</span>
                            </label> -->
            <div class="p-3 p-lg-5 border">
                <div class="form-group row">
                    <div class="col-md-12">
                        <label for="getName" class="text-black">수령인 <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" id="getName" name="getName">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-md-12">
                        <label for="getPhone" class="text-black">연락처 <span class="text-danger">*</span></label>
                        <input type="tel" class="form-control" id="getPhone" name="getPhone" pattern="[0-9]{3}-[0-9]{4}-[0-9]{3}">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-md-12">
                        <label for="getAddress" class="text-black">배송지</label>
                        <input type="text" class="form-control" id="getAddress" name="getAddress">
                    </div>
                </div>

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


                <div class="form-group row mb-5">
                    <div class="col-md-12">
                        <label for="memberEmail" class="text-black">이메일 <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" id="memberEmail" name="memberEmail">
                    </div>

                </div>



            </div>
        </div>
        <div class="col-md-6">

            <div class="row mb-5">
                <div class="col-md-12">
                    <h2 class="h5 mb-3 text-black">적립금 안내</h2>
                    <div class="p-3 p-lg-5 border">
                        <div class="d-flex">
                            <span class="text-black mb-3">보유 적립금</span>
                            <span class="text-black ml-auto h5" id="memberSavedmoney">2,220</span>
                        </div>
                        <div class="input-group">
                            <input type="text" class="form-control" id="c_code" placeholder="" aria-label="Coupon Code" aria-describedby="button-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary btn-sm" type="button" id="button-addon2">전액 사용</button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="row mb-5">
                <div class="col-md-12">
                    <h2 class="h5 mb-3 text-black">결제 금액</h2>
                    <div class="p-3 p-lg-5 border">
                        <table class="table site-block-order-table mb-5">
                            <thead>
                                <th>Product</th>
                                <th>Total</th>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Top Up T-Shirt <strong class="mx-2">x</strong> 1</td>
                                    <td>$250.00</td>
                                </tr>
                                <tr>
                                    <td>Polo Shirt <strong class="mx-2">x</strong> 1</td>
                                    <td>$100.00</td>
                                </tr>
                                <tr>
                                    <td class="text-black font-weight-bold"><strong>Cart Subtotal</strong></td>
                                    <td class="text-black">$350.00</td>
                                </tr>
                                <tr>
                                    <td class="text-black font-weight-bold"><strong>Order Total</strong></td>
                                    <td class="text-black font-weight-bold"><strong>$350.00</strong></td>
                                </tr>
                            </tbody>
                        </table>

                    </div>
                </div>
            </div>

            <div class="row mb-5">
                <div class="col-md-12">
                    <h2 class="h5 mb-3 text-black">결제 방식</h2>
                    <div class="p-3 p-lg-5 border">
                        <div class="form-group">
                            <label class="custom-control custom-radio mb-3">
                                <input class="custom-control-input" type="radio" name="payment" checked="">
                                <div class="custom-control-label ml-2">무통장 입금</div>
                            </label>
                            <label class="custom-control custom-radio mb-3">
                                <input class="custom-control-input" type="radio" name="payment">
                                <div class="custom-control-label ml-2">계좌이체</div>
                            </label>
                        </div>
                        <div class="form-group">
                            <button class="btn btn-primary btn-lg py-3 btn-block" onclick="window.location='./order_result.jsp'">결제하기</button>
                        </div>

                    </div>
                </div>
            </div>

        </div>
    </div>
    <!-- </form> -->
</div>
