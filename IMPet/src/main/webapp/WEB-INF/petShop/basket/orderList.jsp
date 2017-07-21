<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">

$( document ).ready(function() {
	$('#sum').rowspan(0);
});


$.fn.rowspan = function(colIdx, isStats) {       
	return this.each(function(){      
		var that;     
		$('tr', this).each(function(row) {      
			$('td:eq('+colIdx+')', this).filter(':visible').each(function(col) {
				
				if ($(this).html() == $(that).html()
					&& (!isStats 
							|| isStats && $(this).prev().html() == $(that).prev().html()
							)
					) {            
					rowspan = $(that).attr("rowspan") || 1;
					rowspan = Number(rowspan)+1;

					$(that).attr("rowspan",rowspan);
					
					// do your action for the colspan cell here            
					$(this).hide();
					
					//$(this).remove(); 
					// do your action for the old cell here
					
				} else {            
					that = this;         
				}          
				
				// set the that if not already set
				that = (that == null) ? this : that;      
			});     
		});    
	});  
}; 


	function delchk() {
		
	    return confirm("주문 취소 하시겠습니까?");  
	}
	
	function delchk_no() {
		
		alert("입금 확인 후에는 주문 취소가 불가합니다."); 
		location.href = 'redirect:/IMPet/PetShop/OrderList';
	}


	function test(orderList) {
		
	    var div_test = document.getElementById('test');
	    div_test.innerHTML = orderList.RECEIVE_NAME;      
	}
	 
</script>
<style type="text/css">
.paging{text-align:center;height:32px;margin-top:5px;margin-bottom:15px;}
.paging a,
.paging strong{display:inline-block;width:36px;height:32px;line-height:28px;font-size:14px;border:1px solid #e0e0e0;margin-left:5px;
-webkit-border-radius:3px;
   -moz-border-radius:3px;
		border-radius:3px;
-webkit-box-shadow:1px 1px 1px 0px rgba(235,235,235,1);
	-moz-box-shadow:1px 1px 1px 0px rgba(235,235,235,1);
		  box-shadow:1px 1px 1px 0px rgba(235,235,235,1);
}
.paging a:first-child{margin-left:0;}
.paging strong{color:#fff;background:#337AB7;border:1px solid #337AB7;}
.paging .page_arw{font-size:11px;line-height:30px;}
</style>
<div class="category_top">
	<ul>
	 	<li>강아지 ></li><li>주문리스트</li>			
	</ul>
</div>
<div class="basket_list">
	<div class="basket_list_top">
		<h2 class="basketcart"><img src="http://okidogki.com/web/upload/goodymallSkin/title/order_list.gif" alt="장바구니"></h2>
	</div>
	<div class="basket_main">
	<form name="basketList" method="post">
	<input type="hidden" name="MEMBER_ID" value="${sessionScope.member_ID}">
		<table class="basket" style="margin-bottom:15px;" id="sum">
				<colgroup>
					<col width="18%">
					<col width="10%">
					<col width="35%">
					<col width="7%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">주문일자<br/>[주문번호]</th>
						<th scope="col">이미지</th>
						<th scope="col">상품명</th>
						<th scope="col">수량</th>
						<th scope="col">상품구매금액</th>
						<th scope="col">주문처리상태</th>
						<th scope="col">주문취소</th>
					</tr>
				</thead>
				
   
				<c:forEach var="orderList"  items="${orderList}" varStatus="status">	
					<tr>
						<td align="center"><fmt:formatDate value="${orderList.ORDER_DATE}" pattern="YY-MM-dd" /><br/>[ ${orderList.RECEIVE_NO} ]<br/><br/>
						<%-- [ 송장 : ${order.order_trans_num} ] --%></td>
						<td align="center"><img src="/IMPet/resources/image/itemImg/${orderList.ORDER_IMG}" width="90" height="90"></td>
						<td align="center"><a href="/IMPet/PetShop/ItemView?ITEM_NO=${orderList.ITEM_NO}"> ${orderList.ORDER_NAME}</a></td>
						<td align="center">${orderList.ORDER_BUYCOUNT}EA</td>
						<td align="center"><strong id="id2"><fmt:formatNumber value="${orderList.ORDER_PRICE}" type="number"/>원</strong></td>
						<td>
							<c:choose>
								<c:when test="${orderList.ORDER_TYPE eq 0}">입금전</c:when>
								<c:when test="${orderList.ORDER_TYPE eq 1}">입금확인</c:when>
								<c:when test="${orderList.ORDER_TYPE eq 2}">배송시작</c:when>
								<c:when test="${orderList.ORDER_TYPE eq 3}">배송완료</c:when>
								<c:when test="${orderList.ORDER_TYPE eq 4}">주문취소</c:when>
								<c:otherwise>오류</c:otherwise>
							</c:choose>
						</td>
						<td align="center">
							<c:choose>
								<c:when test="${orderList.ORDER_TYPE eq 0}">
									<a href="/IMPet/PetShop/OrderDelete?ORDER_NO=${orderList.ORDER_NO}"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Trash_font_awesome.svg/32px-Trash_font_awesome.svg.png"onclick="return delchk()" ></a>
								</c:when>
								<c:otherwise><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Trash_font_awesome.svg/32px-Trash_font_awesome.svg.png"onclick="return delchk_no()" ></c:otherwise>
							</c:choose>
						</td>
					</tr>
					
					<c:if test="${orderList[status.index].ORDER_NO != orderList[status.index+1].ORDER_NO}">
						<tr style="height:30px;">
							<td colspan="7" style="background:#f6f6f6;border-top: 1px solid #e5e5e5; border-bottom: 1px solid #e5e5e5;"></td>
						</tr>
					</c:if>
				</c:forEach>
				
				<c:if test="${fn:length(orderList) <= 0}">
					<tr>
						<td colspan="7" align="center"><font size="2">주문리스트 담긴 상품이 없습니다.</font></td>
					</tr>
				</c:if>
				
				<tfoot>
					<tr style="height:1px;">
						<td colspan="7" style="background:#f6f6f6;border-top: 1px solid #e5e5e5; text-align:right;color:black;">
							
						</td>
					</tr>
				</tfoot>
			</table>
			
			<div class="paging">
				${pagingHtml}
			</div>
			
			<div class="basket_button">					
				<a href="/IMPet/PetShop/Main" ><img src="http://okidogki.com/web/upload/goodymallSkin/product/btn_order_ing.gif" alt="쇼핑계속하기"></a>  		
			</div>		
		</form>
		</div>
</div>



<%-- 

	<form name="orderList" method="post">
		<table width="700" align="center">
			<tr>
				<td colspan="7" align="center">
				주문 리스트
				</td>
			</tr>
			
			
   
				<c:forEach var="order"  items="${orderList}" varStatus="status">	
					<tr>
						<td width="80" align="center"><img src="/pet/resources/goods_upload/${order.order_goods_image}" width="100" height="100"></td>									
						<td width="300" align="center">
						<a href="goodsView.dog?goods_num=${order.order_goods_num}"> 
								${order.order_goods_name}&nbsp;&nbsp;</a>
						</td>
					
						<td width="80"align="center">주문번호 : ${order.order_trade_num}</td>
					
						<td width="80"align="center">${order.order_goods_price}원</td>
						<td width="80"align="center">${order.order_goods_amount}EA</td>
						<td width="80" align="center">${order.order_sum_money}원</td>
						<td width="80" align="center">주문상태 : ${order.order_status}</td>
						<td width="80" align="center">
						<input type="button" onClick="test(${orderList})" value="상세보기"/>
						
						<a href="orderdelete.dog?order_num=${order.order_num} " >삭제</a>
							<!-- 이거는 나중에 없애기 삭제말고 상세보기 -->
							</td>
					</tr> 
					<tr>
					
					</tr>
						<td width="300" align="center">
						송장번호 : ${order.order_trans_num}</td>
					<tr>  
						<td colspan="6" align="center">
						<c:if test="${orderList[status.index].order_trade_num != orderList[status.index+1].order_trade_num}">
							------------------------------------------------------------------------------------
							</c:if>
						</td>
					</tr>
				
					
				</c:forEach>
					<tr>
					<td><br /><br />		</td>
					</tr>
					<c:if test="${fn:length(orderList) <= 0}">
						<tr>
							<td colspan="6" align="center"><font size="2">구매 내역이 없습니다</font></td>
						</tr>
					</c:if>
				<tr height="40">
					<td align="right" colspan="6">
					
					
					<a href="/pet/main.dog" >메인으로</a>
					
					</td>
				</tr>
			</table>
		</form> --%>