<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script src="/IMPet/resources/ajax/HotelAjax.js" charset="utf-8"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 -->
 <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<!-- <script src="https://code.jquery.com/jquery-1.10.2.js"></script> -->
<link rel="stylesheet" href="/IMPet/resources/css/gallery/gallery.css">

<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
 --><link rel="stylesheet" href="/IMPet/resources/css/gallery/slider.css">
<!-- <link rel="stylesheet" href="/IMPet/resources/css/adminItem/bootstrapadmin.min.css">
 -->
<script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
<style>
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
@import url(//fonts.googleapis.com/earlyaccess/kopubbatang.css);
.button3 {
  position: relative;
  padding: 14px 0;
  border: 2px #00B488 solid;
  float : left;
  color: black;
  cursor: pointer;
  font-family: 'Noto sans KR', sans-serif;
  font-size: 30px;
  text-transform: uppercase;
  transition: color 0.4s, background-color 0.4s;
  display: inline-block;
  vertical-align: middle;
  line-height: 1em;
  outline: none;
  text-align: center;
  text-decoration: none;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  width: 50%;
  background-color: white;
  height: 70px;
}
.button3:hover, .button3:focus {
  transition: color 0.4s, background-color 0.4s;
  color: white;
  text-decoration: none;
  background-color: #00B488;
}

.button4{
    display: block;
    margin: 5px 1px;
    height: 30px;
    width: 100px;
    background-color: transparent;
    font-size: 15px;
    font-family: 'Roboto', sans-serif;
    font-weight: 500;
    letter-spacing: 0.5px;
    outline: none;
    cursor: pointer;
    transition: all 0.2s ease;
}
.button4:hover{
  color: #fff;
}

.btn-4{
  border: 2px solid #00B488;
  color: #00B488;
}
.btn-4:hover{
  background-color: #00B488;
}


</style> 


<script type="text/javascript">



function GalleryView(GALLERY_NO){
		  
	var url1 = "/IMPet/Community/GalleryView";
	
	// alert(GALLERY_NO);     	

	 var dataList =
		{ 
			"GALLERY_NO" : GALLERY_NO	
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
    	  
    	  
    	 $('#ContextEvent2').html(data);
        		
      }
      
    });    
   
}

function ajaxGalleryModifyForm(GALLERY_NO){
		  
	var url1 = "/IMPet/Community/GalleryModifyForm";
	
	 //alert(GALLERY_NO);     	

	 var dataList =
		{ 
			"GALLERY_NO" : GALLERY_NO	
		}	

	
	
    $.ajax({    
      type : "POST",
      url : url1,
      data : dataList,
      dataType : "text",      
      error : function() {
    	  
    	 alert('오류임!!!');     	
      },
      success : function(data) {  
    	 $('#ContextEvent2').html(data);
        		
      }
      
    });    
   
}




function ajaxComment(){	
	
	  
	var obj =document.jform1;
	//alert(obj.comment.value); 	 

	
	//alert(page);  
	var dataList =
	{ 
		"GALLERYCOMMENT_CONTENT" :obj.comment.value,
		"GALLERY_NO" :obj.GALLERY_NO.value
	}	

	var url1 = "/IMPet/Community/GalleryComment"; 
	
    $.ajax({    
     
    	type : "POST",
        url : url1,
        data : dataList,
        dataType : "text",      
        
        error : function() {
      	  
      		alert('오류임!');     	
        },
       
        success : function(data) {  
      		 $('#ContextGallery').html(data);          		
        }
        
      });  
     

}




function ajaxCommentDel(GALLERYCOMMENT_NO){	
	
	
	
	var  GALLERY_NO=  document.getElementById('GALLERY_NO').value;
	
 	var dataList =
	{ 
		"GALLERYCOMMENT_NO" : GALLERYCOMMENT_NO,
		"GALLERY_NO" : GALLERY_NO
		
	}	

	var url1 = "/IMPet/Community/GalleryCommentDelete"; 
	
    $.ajax({    
     
    	type : "POST",
        url : url1,
        data : dataList,
        dataType : "text",      
        
        error : function() {
      	  
      		alert('오류임!');     	
        },
       
        success : function(data) {  
      		 $('#ContextGallery').html(data);          		
        }
        
      });  
    

}





function ajaxgalleryForm(){	
	
	
	

	var url1 = "/IMPet/Community/GalleryForm";
	
    $.ajax({    
     
    	type : "POST",
        url : url1,        
        dataType : "text",      
        
        error : function() {
      	  
      		alert('오류임!');     	
        },
       
        success : function(data) {  
      		 $('#ContextEvent2').html(data);          		
        }
        
      });        

}




function ajaxPageView(page){	
	
	alert(page);  
	var dataList =
	{ 
		"PAGE" : page	
	}	

	var url1 = "/IMPet/Community/galleryPageList";
	
    $.ajax({    
     
    	type : "POST",
        url : url1,
        data : dataList,
        dataType : "text",      
        
        error : function() {
      	  
      		alert('오류임!');     	
        },
       
        success : function(data) {  
      		 $('#ContextEvent').html(data);          		
        }
        
      });  
}

/* 

function ImageIndex(index){
	
	
	//alert(index); 
	
	
	var Txt = "데이터가 없습니다.";
	
	if(index==1){
		Txt = "${TxT01}";
		
	}else if(index==2){

		Txt = "${TxT02}";
		
	}else if(index==3){
		
		Txt = "${TxT03}";
		
	}else if(index==4){
		
		Txt = "${TxT04}";
		
	}else if(index==5){
		
		Txt = "${TxT05}";
		
	}
	
	$("#dd").html(Txt);
	

		
}
 */


</script>






<div align="center" style="width: 100%;">


<div id="ContextEvent2">


<br/><br/>
	<div style="width: 100%; float: left;" >
	  <div role="group">
	    <button type="button" class="button3" onclick="location.href='/IMPet/Community/GalleryList'">갤러리</button>
	  </div>
	  <div role="group">
	    <button type="button" class="button3" onclick="location.href='/IMPet/Community/EventList'">이벤트</button>
	  </div>
	</div>
	


	<div id="ContextEvent" align="center" style="width:100%;  float: left;">
	

	
	
		<jsp:include page="/WEB-INF/community/gallery/galleryListAdd.jsp"/>


					
   </div>
   
 </div>
	
</div>	

<!-- 

커뮤니티 갤러리 리스트

<br/><br/><br/><br/><br/>

<input value="갤러리 리스트 중 한개의 상세보기 이동" type="button" onclick="location.href='/IMPet/Community/GalleryView'"/> 

<input value="갤러리  추가" type="button" onclick="location.href='/IMPet/Community/GalleryForm'"/> 
 -->

