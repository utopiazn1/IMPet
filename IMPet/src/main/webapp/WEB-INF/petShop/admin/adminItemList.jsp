<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 


<!DOCTYPE html>
<html lang=ko>
<style>
	
	.main_itemlist {clear:both; width:100%; height:auto; overflow:hidden; padding-top:30px; }
	.main_itemlist .item-cont {width:  1095px;    height: auto;    margin: 0 auto; }
	.main_itemlist .item-cont dl {float:left; width:281px;}
	.main_itemlist .item-cont dl dt {width:250px; height:250px; border:1px solid #ececec; box-sizing:border-box;}
	.main_itemlist .item-cont dl dt img {width:100%;}
	.main_itemlist .item-cont dl dd {width:250px; height:75px; margin-top:15px; margin-bottom:50px;  margin: 0px !important;}
	.main_itemlist .item-cont dl dd ul {margin: 5px 0 5px 10px; padding: 0px !important;}
	.main_itemlist .item-cont dl dd ul li.prd-name {color:#7d7d7d; line-height:20px; width:100%; height:55px; overflow:hidden; }
	.main_itemlist .item-cont dl dd ul li.prd-price {width:100%; height:20px; position:relative;list-style:none;}
	.item-list:nth-child(4){width:250px !important;}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/resources/ajax/ajax.js'/>" charset="utf-8"></script>
<script type="text/javascript">

fn_selectList(1);

function fn_selectList(pageNo){
    var comAjax = new ComAjax();
    comAjax.setUrl("<c:url value='AdminItemList' />");
    comAjax.setCallback("fn_selectListCallback");
    comAjax.addParam("PAGE_INDEX",pageNo);
    comAjax.addParam("PAGE_ROW", 10);
    comAjax.ajax();
}

function fn_selectListCallback(data){
	
	var total = data.TOTAL;
	var body = $("#div");
	body.empty();
	if(total == 0){
		var str = "<tr>" + 
						"<td colspan='11' style='text-align:center;'>등록된 상품이 없습니다.</td>" + 
					"</tr>";
		body.append(str);
	}
	else{
		var params = {
			divId : "PAGE_NAVI",
			pageIndex : "PAGE_INDEX", 
			pageRow : 10,
			totalCount : total,
			eventName : "fn_selectList"
		};
		gfn_renderPaging(params);
		
		var str = "";
		$.each(data.list, function(key, value){
			str +=  
				/* "<tr>" + 
						"<td>" + value.ITEM_NO + "</td>" + 
						 "<td class='title'>" +
							"<a href='#this' name='title'>" + value.ITEM_NAME + "</a>" +
							"<input type='hidden' name='IDX' id='IDX' value=" + value.ITEM_NO + ">" + 
							
						"</td>" +
						"<td>" + value.ITEM_IMG + "</td>" + 
						"<td>" + value.ITEM_PRICE + "</td>" +  
					"</tr>";   */ 					
		"<div class='main_itemlist'>" + 
			"<div class='item-cont'>" +
			 	"<dl class='item-list'>" +
					"<dt class='humb'><a href=''><img class= src= alt='상품 섬네일' title='상품 섬네일'>"+value.ITEM_IMG+"</a></dt>" +
					"<dd>" +
						"<ul>" +
							"<li class='prd-name'>" + value.ITEM_NAME + " </li>" +
							"<li class='prd-price'> " +
								"<span class='prd_priceno'> " + value.ITEM_PRICE + "</span>" +
								"<span class='prd_preview'><a href=''><img src=''></a> </span>" +
							"</li>" +
						"<ul>" +
					"<dd>" +
				"</dl>" +
			"</div>" +
		"</div>";
		});
		body.append(str);
		 
		$("a[name='title']").on("click", function(e){ //제목 
			e.preventDefault();
			fn_openBoardDetail($(this));
		});
	}
}

</script>
<head>
<meta charset="UTF-8">
<title>관리자상품리스트</title>
</head>
<body>
<div class="row" style="padding-left:15px;width:900px;">    
	<h1 class="page-header">상품목록</h1>
</div>
<div class="row">
	<div class="panel panel-default">
		<div class="panel-heading">
                         [상품목록페이지] 상품을 검색, 수정, 삭제 기능하는 페이지입니다.
        </div>
        <div class="panel-body">
			<div class="dataTable_wrapper">
				<div id="dataTables-example_wrapper"
					class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row" style="margin-bottom:5px;">
						<div class="col-sm-6">
							<a href="/SIRORAGI/goods/goodsList"><button type="button" class="btn btn-outline btn-default">전체</button></a>
							<select class="form-control" name="select" onchange="window.open(value,'_self');">
								<option value ="">--카테고리--</option>
								<option value ="/SIRORAGI/goods/goodsList?searchNum=2&isSearch=OUTER">OUTER</option>
								<option value ="/SIRORAGI/goods/goodsList?searchNum=2&isSearch=TOP">TOP</option>
								<option value ="/SIRORAGI/goods/goodsList?searchNum=2&isSearch=PANTS">PANTS</option>
								<option value ="/SIRORAGI/goods/goodsList?searchNum=2&isSearch=SHOES">SHOES</option>
								<option value ="/SIRORAGI/goods/goodsList?searchNum=2&isSearch=ACC">ACC</option>
							</select>
							<select class="form-control" name="select" onchange="window.open(value,'_self');">
								<option value ="">--상품구분--</option>
								<option value ="/SIRORAGI/goods/goodsList?searchNum=3&isSearch=0">판매중</option>
								<option value ="/SIRORAGI/goods/goodsList?searchNum=4&isSearch=">품절상품</option>
								<option value ="/SIRORAGI/goods/goodsList?searchNum=3&isSearch=1">비활성화</option>
							</select>			
							<select class="form-control" name="select" onchange="window.open(value,'_self');">
								<option value ="">--상품정렬--</option>
								<option value ="/SIRORAGI/goods/goodsList?searchNum=5&isSearch=GOODS_AMOUNT">판매수량순</option>
								<option value ="/SIRORAGI/goods/goodsList?searchNum=6&isSearch=GOODS_COUNT">조회순</option>
							</select>											
						</div>
						<div class="col-sm-6" style="text-align:right;">
							<div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite">총 상품수 : ${totalCount}</div>
						</div>
						
					</div>
					<div class="row">
						<div class="col-sm-12">
							<table
								class="table  table-bordered table-hover dataTable no-footer"
								id="dataTables-example" role="grid"
								aria-describedby="dataTables-example_info">
								<thead>
									<tr role="row" style="vertical-align:middle;">
										<th style="width: 5%; text-align:center;vertical-align:middle;">상품번호</th>
										<th style="width: 8%; text-align:center;vertical-align:middle;">상품 사진</th>										
										<th style="width: 7%; text-align:center;vertical-align:middle;">카테고리</th>
										<th style="width: 20%; text-align:center;vertical-align:middle;">상품명</th>
										<th style="width: 8%; text-align:center;vertical-align:middle;">가격</th>
										<th style="width: 7%; text-align:center;vertical-align:middle;">색상</th>
										<th style="width: 6%; text-align:center;vertical-align:middle;">사이즈</th>
										<th style="width: 7%; text-align:center;vertical-align:middle;">수량</th>
										<th style="width: 7%; text-align:center;vertical-align:middle;">판매량</th>
										<th style="width: 12%; text-align:center;vertical-align:middle;">등록일자</th>									
										<th style="width: 13%; text-align:center;vertical-align:middle;">관리</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="goodsList"  items="${goodsList}" varStatus="stat">
								<c:url var="viewURL" value="/goods/goodsModifyForm" >
									<c:param name="GOODS_NUMBER" value="${goodsList.GOODS_NUMBER }" />
								</c:url>									
									<tr class="gradeA even" role="row">
										<td style="text-align:center;vertical-align:middle;">${goodsList.GOODS_NUMBER}<div style='display:none;'>${goodsList.GOODS_NUMBER}</div></td>										
										<td style="text-align:center;vertical-align:middle;"><img src="/SIRORAGI/file/goodsFile/${goodsList.GOODS_THUMBNAIL}" width="60" height="60" alt=""  onerror="this.src='/SIRORAGI/file/noimg_130.gif'" /><div style='display:none;'>${goodsList.GOODS_NUMBER}</div></td>
										<td style="text-align:center;vertical-align:middle;">${goodsList.GOODS_CATEGORY1}/<br/>${goodsList.GOODS_CATEGORY2 }<div style='display:none;'>${goodsList.GOODS_NUMBER}</div></td>
										<td style="text-align:center;vertical-align:middle;">${goodsList.GOODS_NAME}<div style='display:none;'>${goodsList.GOODS_NUMBER}</div></td>
										
										<c:if test="${goodsList.GOODS_DCPRICE != null}">
										<td style="text-align:center;vertical-align:middle;">
												<del><fmt:formatNumber value="${goodsList.GOODS_PRICE}" type="number"/>원<br/></del>
												<fmt:formatNumber value="${goodsList.GOODS_DCPRICE}" type="number"/>원<div style='display:none;'>${goodsList.GOODS_NUMBER}</div></td>
										</c:if>
										<c:if test="${goodsList.GOODS_DCPRICE == null}">
										<td style="text-align:center;vertical-align:middle;">
												<fmt:formatNumber value="${goodsList.GOODS_PRICE}" type="number"/>원<div style='display:none;'>${goodsList.GOODS_NUMBER}</div></td>
										</c:if>
												
										<td style="text-align:center;vertical-align:middle;">${goodsList.GOODS_COLOR}<div style='display:none;'>${goodsList.GOODS_NUMBER}</div></td>
										<td style="text-align:center;vertical-align:middle;">${goodsList.GOODS_SIZE}<div style='display:none;'>${goodsList.GOODS_NUMBER}</div></td>
										<td style="text-align:center;vertical-align:middle;">${goodsList.GOODS_AMOUNT}개<div style='display:none;'>${goodsList.GOODS_NUMBER}</div></td>
										<td style="text-align:center;vertical-align:middle;">${goodsList.GOODS_SELLCOUNT}개<div style='display:none;'>${goodsList.GOODS_NUMBER}</div></td>
										<td style="text-align:center;vertical-align:middle;"><fmt:formatDate value="${goodsList.GOODS_DATE}" pattern="YY.MM.dd HH:mm" /><div style='display:none;'>${goodsList.GOODS_NUMBER}</div></td>										
										<td style="text-align:center;vertical-align:middle;">
											<a href="${viewURL}"><input type="image" src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Cog_font_awesome.svg/32px-Cog_font_awesome.svg.png"></a>&nbsp;&nbsp;
										<c:url var="viewURL2" value="/goods/goodsDelete" >
											<c:param name="GOODS_NUMBER" value="${goodsList.GOODS_NUMBER }" />							
										</c:url>	
										 <a href="${viewURL2}"><input type="image" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Trash_font_awesome.svg/32px-Trash_font_awesome.svg.png" onclick="return delchk()"></a><div style='display:none;'>${goodsList.GOODS_NUMBER}</div></td>									
									</tr>
								</c:forEach>
								<!--  등록된 상품이 없을때 -->
									<c:if test="${fn:length(goodsList) le 0}">
										<tr><td colspan="11" style="text-align:center;">등록된 상품이 없습니다</td></tr>
									</c:if> 
								</tbody>
							</table>
						</div>
					</div>
					<div class="paging">
						${pagingHtml}
					</div>
					<div class="row">
							<div style="text-align:center;">
								<div id="dataTables-example_filter" class="dataTables_filter">
									<form action="">
									<select class="form-control" name="searchNum" id="searchNum">
										<option value="0">상품명</option>
										<option value="1">상품번호</option>
									</select>
										<input class="form-control" type="text" name="isSearch" id="isSearch"/>
										<span>
										<button type="submit" class="btn btn-default">검색</button>
										</span>
									</form>
								</div>							
							</div>
							
					</div>
				</div>
			</div>
			<!-- /.table-responsive -->							
		</div>
	</div>
        <!-- /.panel -->   
</div>
  <div id="PAGE_NAVI"></div>
    <input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
</body>
</html>