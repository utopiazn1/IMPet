<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/IMPet/resources/JQuery/joinForm.js" charset="utf-8"></script>


<link rel="stylesheet" href="/IMPet/resources/css/member/joinForm.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>


<script type="text/javascript">
	

	window.onload = function() {
		$("input[name=order_trade_type1]").attr("disabled", true);  
	}
	
	/* 	
	function openZipcode(){
		var url="zipcodeCheckForm.dog";
		open(url, "confirm","toolbar=no, location=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=410, height=400");
	} */

	function chk_radio() { 
		
		if($("input[name=order_trade_payer]:radio:checked").length == 0){
			
		    alert("무통장 입금계좌를 선택하세요");
		    document.order.order_trade_type.focus();
		    
		}else{
			  frm.method = "post";
			  frm.action = "/IMPet/PetShop/OrderItemPay";
			  frm.submit();
			  return true;
		 } 
	}
	
</script>


<style type="text/css">
	.orderArea h3{
	    margin: 30px 0 5px 5px;
	    font-size: 12px;
	    color: #888;
	    font-weight: bold;
	}
	.orderArea .boardWrite table{
		table-layout: fixed;
	    border-top: 1px solid #ccc;
	    border-bottom: 1px solid #ccc;
	    font-size: 12px;
	    width: 100%;
	    border: 0;
	    border-spacing: 0;
	    border-collapse: collapse;
	    font-weight: 800;
	}
	.orderArea .boardWrite table th{
	    width: 140px;
	    padding: 5px 0 5px 22px;
	    border-top: 1px solid #e7e7e7;
	    background: #FAFAFA;
	    color: #888;
	    text-align: left;
	    line-height: 140%;
	    border-left: 0px;
	}
	.orderArea .boardWrite table td{
		width: auto;
	    padding: 5px 0 3px 22px;
	    border-top: 1px solid #e7e7e7;
	    color: #8f8f8f;
	    line-height: 140%;
	    font-size: 12px;
	    border-right: 0px;
	}
	.boardWrite input[type="text"]{
		text-indent: 5px;
	    font-size: 12px;
	    border: 1px solid #cfcecd;
	    background: #fff;
	}

</style>
<div class="category_top">
	<ul>
	 	<li>펫샵 ></li><li>주문하기</li>			
	</ul>
</div>


<div  class="basket_list">

	<div class="basket_list_top">
		<h2 class="basketcart"><img src="http://okidogki.com/web/upload/goodymallSkin/title/order.gif" alt="장바구니"></h2>
		<img style="width:1000px;" src="http://okidogki.com/web/upload/goodymall15/layout/img_orderStep2.gif" alt="step 01 장바구니">
	</div>

	<div class="basket_main">
		  <c:if test="${!BASKET_NO eq null}"> 
		<c:forEach var="orderView" items="${orderView}">
			<table class="basket" style="margin-bottom:15px;">
				<colgroup>
					<col width="22%">
					<col width="42%">
					<col width="12%">
					<col width="12%">
					<col width="12%">
				</colgroup>
				
				<thead>
					<tr>
						<th scope="col">이미지</th>
						<th scope="col">상품명</th>
						<th scope="col">단일금액</th>
						<th scope="col">수량</th>
						<th scope="col">합계</th>
					</tr>
				</thead>	
							
					<tr>
						<td align="center"><img src="/IMPet/resources/image/itemImg/${orderView.ITEM_IMG}" width="90" height="90"></td>
						<td align="center">${orderView.ITEM_NAME}</td>
						<td align="center"><fmt:formatNumber value="${orderView.ITEM_PRICE}" type="number"/>원</td>
						<td align="center">${orderView.BASKET_BUYCOUNT}EA</td>
						<td align="center"><strong id="id2"><fmt:formatNumber value="${orderView.ITEM_PRICE * orderView.BASKET_BUYCOUNT}" type="number"/>원</strong></td>						
						<%-- <c:set var= "sum" value="${sum + (basketList.basket_goods_price * basketList.basket_goods_amount)}"/> --%>
					</tr>
				
				
				<tfoot>
					<tr style="height:30px;">
						<td colspan="6" style="background:#f6f6f6;border-top: 1px solid #e5e5e5; text-align:right;color:black;">
							<strong style="float:left;color:#688abd;">&nbsp;&nbsp;&nbsp;[ 기본배송 ]</strong>
							상품구매금액 <strong><fmt:formatNumber value="${orderView.ITEM_PRICE * orderView.BASKET_BUYCOUNT}" type="number"/> </strong> + 배송비 <strong>0</strong> = <strong style="color: #f8941d;font-size: 14px;">합계 : <fmt:formatNumber value="${orderView.ITEM_PRICE * orderView.BASKET_BUYCOUNT}" type="number"/>원 </strong>&nbsp;&nbsp;&nbsp;
						</td>
					</tr>
				</tfoot>
				
			</table>				
		</c:forEach>
		</c:if>
		 
		 <c:if test="${BASKET_NO eq null}"> 
			<table class="basket" style="margin-bottom:15px;">
				<colgroup>
					<col width="22%">
					<col width="42%">
					<col width="12%">
					<col width="12%">
					<col width="12%">
				</colgroup>
				
				<thead>
					<tr>
						<th scope="col">이미지</th>
						<th scope="col">상품명</th>
						<th scope="col">단일금액</th>
						<th scope="col">수량</th>
						<th scope="col">합계</th>
					</tr>
				</thead>	
							
					<tr>
						<td align="center"><img src="/IMPet/resources/image/itemImg/${orderView.ITEM_IMG}" width="90" height="90"></td>
						<td align="center">${orderView.ITEM_NAME}</td>
						<td align="center"><fmt:formatNumber value="${orderView.ITEM_PRICE}" type="number"/>원</td>
						<td align="center">${orderView.BASKET_BUYCOUNT}EA</td>
						<td align="center"><strong id="id2"><fmt:formatNumber value="${orderView.ITEM_PRICE * orderView.BASKET_BUYCOUNT}" type="number"/>원</strong></td>						
						<%-- <c:set var= "sum" value="${sum + (basketList.basket_goods_price * basketList.basket_goods_amount)}"/> --%>
					</tr>
				
				
				<tfoot>
					<tr style="height:30px;">
						<td colspan="6" style="background:#f6f6f6;border-top: 1px solid #e5e5e5; text-align:right;color:black;">
							<strong style="float:left;color:#688abd;">&nbsp;&nbsp;&nbsp;[ 기본배송 ]</strong>
							상품구매금액 <strong><fmt:formatNumber value="${orderView.ITEM_PRICE * orderView.BASKET_BUYCOUNT}" type="number"/> </strong> + 배송비 <strong>0</strong> = <strong style="color: #f8941d;font-size: 14px;">합계 : <fmt:formatNumber value="${orderView.ITEM_PRICE * orderView.BASKET_BUYCOUNT}" type="number"/>원 </strong>&nbsp;&nbsp;&nbsp;
						</td>
					</tr>
				</tfoot>
				
			</table>		
			</c:if>		 
	
	</div>
</div>

<form name="order" id="frm" method="post">
<input type="hidden" name="order_sum_money" value="${orderView.ITEM_PRICE * orderView.BASKET_BUYCOUNT}" />
<input type="hidden" name="id" value="${member_ID}" />
<input type="hidden" name="item_no" value="${orderView.ITEM_NO}" />
<input type="hidden" name="basket_buycount" value="${orderView.BASKET_BUYCOUNT}"/>


<div class="orderArea">
	<h3>결제자 정보</h3>
		<div class="boardWrite">
			<table border="1" summary="">
				<caption>결제자 정보</caption>
				<tbody>
					<tr>
						<th scope="row">성명</th>
						<td>${orderView.MEMBER_NAME}</td>
					</tr>
					<tr>
						<th scope="row">휴대폰</th>
						<td>${orderView.MEMBER_TEL}</td>
					</tr>
					<tr>
						<th scope="row">이메일</th>
						<td>${orderView.MEMBER_EMAIL}&nbsp;&nbsp;&nbsp;&nbsp;<font style="color:#cfcfcf;">*제품구입시 E-mail을 통해 주문처리과정을 보내 드립니다.</font></td>
					</tr>              
				</tbody>
			</table>
		</div>
</div>
<div class="orderArea">
	<h3>배송지 정보</h3>
		<div class="boardWrite">
			<table border="1" summary="">
				<caption>배송지 정보</caption>
				<tbody>
					<tr>
						<th scope="row">주소</th>
						<td><input type="text"  name="zipcode" onclick="this.value=''" id="sample6_postcode" readonly value="${orderView.MEMBER_ZIPCODE}" style="margin-bottom:2px;"/> 
								<a href="#none" title="우편번호(새창으로 열기)" onclick="return sample6_execDaumPostcode()" id="postBtn"><img style="margin-bottom:5px;" src="http://img.echosting.cafe24.com/design/skin/default/member/btn_zip.gif" alt="우편번호"></a><br>
							<input type="text"  style="width:100%;margin-bottom:2px;" name="addr" onclick="this.value=''" id="sample6_address" readonly value="${orderView.MEMBER_ADDRESS}"  style="margin-bottom:5px;"/><br>
                   	 		<input type="text" style="width:100%;" name="addr2" onclick="this.value=''" id="sample6_address2" />
						</td>
					</tr>
					<tr>
						<th scope="row">이름</th>
						<td><input type="text" name="order_receive_name" value="${orderView.MEMBER_NAME}" /></td>
					</tr>
					<tr>
						<th scope="row">휴대폰</th>
						<td><input type="text" name="order_receive_mobile" value="${orderView.MEMBER_TEL}" /></td>						
					</tr> 
					<tr>
						<th scope="row">배송요청사항</th>
						<td>
						<textarea style="width:100%;" name="order_memo"  placeholder=" 배송시요청사항 예)부재시 경비실에 맡겨주세요"></textarea></td>
					</tr>
					<tr>
						<th scope="row" rowspan="2">결제방식</th>
						<td><input type="radio" name="order_trade_type" value="무통장입금" checked="">무통장입금&nbsp;
						<input type="radio"	name="order_trade_type1" value="카드결제"> 카드결제&nbsp;
							</td>
					</tr>   
					<tr>
						<td>
							<div style="text-align:center;">
					    		<div style="display:inline-block;">
					    		
						    		<div style="float:left;margin-top: 116px;">
								    		<input type="radio" name="order_trade_payer" value="농협은행 : 1207-01-004061 박준영">
								    		<br/><br/><br/><br/>
											<input type="radio" name="order_trade_payer" value="우리은행 : 1002-834-406482 박준영">
											<br/><br/><br/><br/>
											<input type="radio" name="order_trade_payer" value="경남은행 : 528-22-0247871 박준영">
									</div>
									
						    		<div style="float:left;"><img src="/IMPet/resources/image/test/paybank.gif">
						    		</div>
					    					    	   		
					    		</div>
					    	</div>
						</td>
					</tr>           
				</tbody>
			</table>
		</div>
</div>


			<div class="basket_button" style="margin-top:5px;">
					<input type="image" src="http://okidogki.com/web/upload/goodymallSkin/product/btn_payment.gif" onclick="chk_radio()" >					
			</div>	


</form>