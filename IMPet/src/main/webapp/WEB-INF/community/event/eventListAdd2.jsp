<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<c:if test="${sessionScope.member_Admin==1 }">
			<div align="right">
				<input value="+ Add" class="button4 btn-4" type="button" onclick="ajaxeventForm();"/>
			</div>
		</c:if>		
	
	<!-- <div id="ContextEvent" align="center" style="width:100%;  float: left;">
	 -->
				
		<div align="center">
			<table style="width: 100%">
			
				<c:forEach var="Event" items="${listAll}">
				
					<tr>
						<td>
							<div class="con">
								<div>
									<img alt="s2" src="/IMPet/resources/image/event/${Event.EVENT_IMG}" onclick="EventView(${Event.EVENT_NO});" style="padding-left : 8px; width: 30%; height: 100%; float:left;" >
								</div>
								
								<div>
									 <a href="javascript:EventView(${Event.EVENT_NO});" >
									 
									 <h3>&nbsp;&nbsp; ${Event.EVENT_SUBJECT}</h3>	
									 								 
									 <div  style="text-align:right; "> 조회수: ${Event.EVENT_COUNT}&nbsp;&nbsp;&nbsp; </div>
									 
									  <br/>
									 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${Event.EVENT_TIME} <br/>									 
									 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${Event.EVENT_CONTENT} <br/>
									 
									 
									 </a>
								</div>
							</div>
									
						</td>
					</tr>
				</c:forEach>
			</table>
			
			
			<div class="paging">			
				${pagingHtml} 
			</div>
	</div>			 					 
		
	
		
	
	
	
	<!-- 
	</div> -->
	


		

