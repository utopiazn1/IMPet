<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 


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
		  text-decoration:none;
}
.paging a:first-child{margin-left:0;}
.paging strong{color:#fff;background:#337AB7;border:1px solid #337AB7;}
.paging .page_arw{font-size:11px;line-height:30px;}
</style>

<link href="/IMPet/resources/css/admin/memberList.css" rel="stylesheet" style="text/css">
 
<link href="/IMPet/resources/css/adminItem/bootstrapadmin.min.css" rel="stylesheet" style="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/resources/ajax/ajax.js'/>" charset="utf-8"></script>
<script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/IMPet/resources/JQuery/joinForm.js" charset="utf-8"></script>

<script type="text/javascript">



 
 
$(document).ready(function(){

 
 	$("a[name='delete']").on("click", function(e){ //삭제 
    
		var GALLERY_NO =$(this).parent().find("#GALLERY_NO").val();	   
		var GALLERY_IMG =$(this).parent().find("#GALLERY_IMG").val();	 
		

		// alert(GALLERY_IMG);     	
		 	  
 	
 		if(confirm(GALLERY_NO +"의 갤러리를 삭제하시겠습니까?")){		    		

 			e.preventDefault();   
 			ajaxGalleryAdminDelete(GALLERY_NO,GALLERY_IMG);
 		} 	
	});
});	


function ajaxGalleryAdminDelete(GALLERY_NO,GALLERY_IMG){
	
	
	var url1 = "/IMPet/Community/GalleryAdminDelete";
	
	var PAGE = $('#PAGE').val();
	
	

	 var dataList =
		{ 
			"GALLERY_NO" : GALLERY_NO,	
			"GALLERY_IMG" : GALLERY_IMG,			
			"PAGE"  : PAGE
		}	

	
	
    $.ajax({    
      type : "POST",
      url : url1,
      data : dataList,
      dataType : "text",      
      error : function() {
    	  
    	 alert('오류임!');     	
      },
      success : function(data) {  
    	 $('#ContextGalleryAdminForm').html(data);
        		
      }
      
    });    		

}




function ajaxPageView(page){	
	
	//alert(page);  
	var dataList =
	{ 
		"PAGE" : page	
	}	

	var url1 = "/IMPet/Community/galleryAdminPageList";
	
    $.ajax({    
     
    	type : "POST",
        url : url1,
        data : dataList,
        dataType : "text",      
        
        error : function() {
      	  
      		alert('오류임!');     	
        },
       
        success : function(data) {  
      		 $('#ContextGalleryAdminForm').html(data);          		
        }
        
      });        

}








</script>

<div id="ContextGalleryAdminForm">


	<input type="hidden" id="PAGE" value="${PAGE}" >


<div class="row" >    
	<h1 class="page-header">갤러리 관리 목록</h1>
</div>

<div class="row">
	<div class="panel panel-default">
	 <div class="panel-heading">
                         [갤러리 목록] 갤러리 목록, 삭제 페이지 입니다.
        </div>
	
	<div id="dataTables-example_wrapper" class="panel-body">
	
	
		<table class="table  table-bordered table-hover dataTable no-footer"
				id="dataTables-example" role="grid"
				aria-describedby="dataTables-example_info">
			
			<thead>
				<tr role="row" style="vertical-align:middle;">
					<th style="width: 7%; text-align:center;vertical-align:middle;">갤러리 번호</th>
					<th style="width: 15%; text-align:center;vertical-align:middle;">작성자</th>															
					<th style="width: 10%; text-align:center;vertical-align:middle;">닉네임</th>					
					<th style="width: 15%; text-align:center;vertical-align:middle;">메인이미지</th>
					<th style="width: 10%; text-align:center;vertical-align:middle;">가입일</th>					
					<th style="width: 10%; text-align:center;vertical-align:middle;">관리</th>
					
					
				</tr>
			</thead>	
			
			<tbody>
				
				<c:forEach var="itemList" items="${listAll}"  varStatus="stat">

					
					<tr>
					
						<td style="text-align:center;vertical-align:middle;">
						  ${itemList.GALLERY_NO}
						</td>
						
						<td style="text-align:center;vertical-align:middle;">
						  ${itemList.MEMBER_ID}
						</td >						
							
						<td style="text-align:center;vertical-align:middle;">
						  ${itemList.MEMBER_NICKNAME}
						</td>
						
						<td style="text-align:center;vertical-align:middle;">
						<img src="/IMPet/resources/image/gallery/${itemList.MAINIMAGE}" width="90" height="90"> 
						
						</td>
						
						<td style="text-align:center;vertical-align:middle;">
						  ${itemList.GALLERY_DATE}
						</td>		
						
							
					
						
						<td style="text-align:center;vertical-align:middle;">
								 	
					 		 <a name='delete'> 
					 		 	<input type="image" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Trash_font_awesome.svg/32px-Trash_font_awesome.svg.png">
					 		 	<input type='hidden' name='GALLERY_NO' id='GALLERY_NO' value="${itemList.GALLERY_NO }">
					 		 	<input type='hidden' name='GALLERY_IMG' id='GALLERY_IMG' value="${itemList.GALLERY_IMG }">					 		 	
					 		 </a>
					 		
					 	
					 	</td>
					 	
					 	
					 </tr>				
				</c:forEach>
			</tbody>				
								
		</table>						
	
	
	<!-- 
	</div> -->


</div>



	<div class="paging">
	
	${pagingHtml} 
			
		
		

		
	</div>

</div>
</div>
</div>

