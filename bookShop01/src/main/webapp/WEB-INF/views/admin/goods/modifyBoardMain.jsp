<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />	
<!DOCTYPE html>
<meta charset="utf-8">
<head>


<!-- order 에서 따옴 -->
<c:choose>
<c:when test='${not empty order_goods_list}'>
<script  type="text/javascript">
window.onload=function()
{
	init();
}

//화면이 표시되면서  각각의 주문건에 대한 배송 상태를 표시한다.
function init(){
	var frm_delivery_list=document.frm_delivery_list;
	var h_delivery_state=frm_delivery_list.h_delivery_state;
	var s_delivery_state=frm_delivery_list.s_delivery_state;
	
	
	if(h_delivery_state.length==undefined){
		s_delivery_state.value=h_delivery_state.value; //조회된 주문 정보가 1건인 경우
	}else{
		for(var i=0; s_delivery_state.length;i++){
			s_delivery_state[i].value=h_delivery_state[i].value;//조회된 주문 정보가 여러건인 경우
		}
	}
}
</script>
</c:when>
</c:choose>


<script type="text/javascript">
  var cnt=0;
  function fn_addFile(){
	  if(cnt == 0){
		  $("#d_file").append("<br>"+"<input  type='file' name='main_image' id='f_main_image' />");	  
	  }else{
		  $("#d_file").append("<br>"+"<input  type='file' name='detail_image"+cnt+"' />");
	  }
  	
  	cnt++;
  }
  
  
  function fn_add_new_goods(obj){
		 fileName = $('#f_main_image').val();
		 if(fileName != null && fileName != undefined){
			 obj.submit();
		 }else{
			 alert("메인 이미지는 반드시 첨부해야 합니다.");
			 return;
		 }
		 
	}
  
  function search_goods_list(fixeSearchPeriod){
		var formObj=document.createElement("form");
		var i_fixedSearch_period = document.createElement("input");
		i_fixedSearch_period.name="fixedSearchPeriod";
		i_fixedSearch_period.value=searchPeriod;
	    formObj.appendChild(i_fixedSearch_period);
	    document.body.appendChild(formObj); 
	    formObj.method="get";
	    formObj.action="${contextPath}/admin/goods/adminGoodsMain.do";
	    formObj.submit();
	}


	function  calcPeriod(search_period){
		var dt = new Date();
		var beginYear,endYear;
		var beginMonth,endMonth;
		var beginDay,endDay;
		var beginDate,endDate;
		
		endYear = dt.getFullYear();
		endMonth = dt.getMonth()+1;
		endDay = dt.getDate();
		if(search_period=='today'){
			beginYear=endYear;
			beginMonth=endMonth;
			beginDay=endDay;
		}else if(search_period=='one_week'){
			beginYear=dt.getFullYear();
			beginMonth=dt.getMonth()+1;
			dt.setDate(endDay-7);
			beginDay=dt.getDate();
			
		}else if(search_period=='two_week'){
			beginYear = dt.getFullYear();
			beginMonth = dt.getMonth()+1;
			dt.setDate(endDay-14);
			beginDay=dt.getDate();
		}else if(search_period=='one_month'){
			beginYear = dt.getFullYear();
			dt.setMonth(endMonth-1);
			beginMonth = dt.getMonth();
			beginDay = dt.getDate();
		}else if(search_period=='two_month'){
			beginYear = dt.getFullYear();
			dt.setMonth(endMonth-2);
			beginMonth = dt.getMonth();
			beginDay = dt.getDate();
		}else if(search_period=='three_month'){
			beginYear = dt.getFullYear();
			dt.setMonth(endMonth-3);
			beginMonth = dt.getMonth();
			beginDay = dt.getDate();
		}else if(search_period=='four_month'){
			beginYear = dt.getFullYear();
			dt.setMonth(endMonth-4);
			beginMonth = dt.getMonth();
			beginDay = dt.getDate();
		}
		
		if(beginMonth <10){
			beginMonth='0'+beginMonth;
			if(beginDay<10){
				beginDay='0'+beginDay;
			}
		}
		if(endMonth <10){
			endMonth='0'+endMonth;
			if(endDay<10){
				endDay='0'+endDay;
			}
		}
		endDate=endYear+'-'+endMonth +'-'+endDay;
		beginDate=beginYear+'-'+beginMonth +'-'+beginDay;
		//alert(beginDate+","+endDate);
		return beginDate+","+endDate;
	}
	
	
	// order 에서 따옴
	function search_order_history(search_period){	
		temp=calcPeriod(search_period);
		var date=temp.split(",");
		beginDate=date[0];
		endDate=date[1];
		
	    
		var formObj=document.createElement("form");
		var i_command = document.createElement("input");
		var i_beginDate = document.createElement("input"); 
		var i_endDate = document.createElement("input");
	    
		i_beginDate.name="beginDate";
		i_beginDate.value=beginDate;
		i_endDate.name="endDate";
		i_endDate.value=endDate;
		
	    formObj.appendChild(i_beginDate);
	    formObj.appendChild(i_endDate);
	    document.body.appendChild(formObj); 
	    formObj.method="get";
	    formObj.action="${contextPath}/admin/order/adminOrderMain.do";
	    formObj.submit();
	}


	function  calcPeriod(search_period){
		var dt = new Date();
		var beginYear,endYear;
		var beginMonth,endMonth;
		var beginDay,endDay;
		var beginDate,endDate;
		
		endYear = dt.getFullYear();
		endMonth = dt.getMonth()+1;
		endDay = dt.getDate();
		if(search_period=='today'){
			beginYear=endYear;
			beginMonth=endMonth;
			beginDay=endDay;
		}else if(search_period=='one_week'){
			beginYear=dt.getFullYear();
			beginMonth=dt.getMonth()+1;
			dt.setDate(endDay-7);
			beginDay=dt.getDate();
			
		}else if(search_period=='two_week'){
			beginYear = dt.getFullYear();
			beginMonth = dt.getMonth()+1;
			dt.setDate(endDay-14);
			beginDay=dt.getDate();
		}else if(search_period=='one_month'){
			beginYear = dt.getFullYear();
			dt.setMonth(endMonth-1);
			beginMonth = dt.getMonth();
			beginDay = dt.getDate();
		}else if(search_period=='two_month'){
			beginYear = dt.getFullYear();
			dt.setMonth(endMonth-2);
			beginMonth = dt.getMonth();
			beginDay = dt.getDate();
		}else if(search_period=='three_month'){
			beginYear = dt.getFullYear();
			dt.setMonth(endMonth-3);
			beginMonth = dt.getMonth();
			beginDay = dt.getDate();
		}else if(search_period=='four_month'){
			beginYear = dt.getFullYear();
			dt.setMonth(endMonth-4);
			beginMonth = dt.getMonth();
			beginDay = dt.getDate();
		}
		
		if(beginMonth <10){
			beginMonth='0'+beginMonth;
			if(beginDay<10){
				beginDay='0'+beginDay;
			}
		}
		if(endMonth <10){
			endMonth='0'+endMonth;
			if(endDay<10){
				endDay='0'+endDay;
			}
		}
		endDate=endYear+'-'+endMonth +'-'+endDay;
		beginDate=beginYear+'-'+beginMonth +'-'+beginDay;
		//alert(beginDate+","+endDate);
		return beginDate+","+endDate;
	}
	
	function fn_modify_order_state(order_id,select_id){
		var s_delivery_state=document.getElementById(select_id);
	    var index = s_delivery_state.selectedIndex;
	    var value = s_delivery_state[index].value;
	    //console.log("value: "+value );
		 
		$.ajax({
			type : "post",
			async : false,
			url : "${contextPath}/admin/order/modifyDeliveryState.do",
			data : {
				order_id:order_id,
				"delivery_state":value
			},
			success : function(data, textStatus) {
				if(data.trim()=='mod_success'){
					alert("주문 정보를 수정했습니다.");
					location.href="${contextPath}//admin/order/adminOrderMain.do";
				}else if(data.trim()=='failed'){
					alert("다시 시도해 주세요.");	
				}
				
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
			},
			complete : function(data, textStatus) {
				//alert("작업을완료 했습니다");
				
			}
		}); //end ajax		
	}
	
	function fn_enable_detail_search(r_search){
		var frm_delivery_list=document.frm_delivery_list;
		t_beginYear=frm_delivery_list.beginYear;
		t_beginMonth=frm_delivery_list.beginMonth;
		t_beginDay=frm_delivery_list.beginDay;
		t_endYear=frm_delivery_list.endYear;
		t_endMonth=frm_delivery_list.endMonth;
		t_endDay=frm_delivery_list.endDay;
		s_search_type=frm_delivery_list.s_search_type;
		t_search_word=frm_delivery_list.t_search_word;
		btn_search=frm_delivery_list.btn_search;
		
		if(r_search.value=='detail_search'){
			//alert(r_search.value);
			t_beginYear.disabled=false;
			t_beginMonth.disabled=false;
			t_beginDay.disabled=false;
			t_endYear.disabled=false;
			t_endMonth.disabled=false;
			t_endDay.disabled=false;
			
			s_search_type.disabled=false;
			t_search_word.disabled=false;
			btn_search.disabled=false;
		}else{
			t_beginYear.disabled=true;
			t_beginMonth.disabled=true;
			t_beginDay.disabled=true;
			t_endYear.disabled=true;
			t_endMonth.disabled=true;
			t_endDay.disabled=true;
			
			s_search_type.disabled=true;
			t_search_word.disabled=true;
			btn_search.disabled=true;
		}
			
	}
	
	function fn_detail_order(order_id){
		//alert(order_id);
		var frm_delivery_list=document.frm_delivery_list;
		
	
		var formObj=document.createElement("form");
		var i_order_id = document.createElement("input");
		
		i_order_id.name="order_id";
		i_order_id.value=order_id;
		
	    formObj.appendChild(i_order_id);
	    document.body.appendChild(formObj); 
	    formObj.method="post";
	    formObj.action="${contextPath}/admin/order/orderDetail.do";
	    formObj.submit();
		
	}
	
	//상세조회 버튼 클릭 시 수행
	function fn_detail_search(){
		var frm_delivery_list=document.frm_delivery_list;
		
		beginYear=frm_delivery_list.beginYear.value;
		beginMonth=frm_delivery_list.beginMonth.value;
		beginDay=frm_delivery_list.beginDay.value;
		endYear=frm_delivery_list.endYear.value;
		endMonth=frm_delivery_list.endMonth.value;
		endDay=frm_delivery_list.endDay.value;
		search_type=frm_delivery_list.s_search_type.value;
		search_word=frm_delivery_list.t_search_word.value;
	
		var formObj=document.createElement("form");
		var i_command = document.createElement("input");
		var i_beginDate = document.createElement("input"); 
		var i_endDate = document.createElement("input");
		var i_search_type = document.createElement("input");
		var i_search_word = document.createElement("input");
	    
		//alert("beginYear:"+beginYear);
		//alert("endDay:"+endDay);
		//alert("search_type:"+search_type);
		//alert("search_word:"+search_word);
		
	    i_command.name="command";
	    i_beginDate.name="beginDate";
	    i_endDate.name="endDate";
	    i_search_type.name="search_type";
	    i_search_word.name="search_word";
	    
	    i_command.value="list_detail_order_goods";
		i_beginDate.value=beginYear+"-"+beginMonth+"-"+beginDay;
	    i_endDate.value=endYear+"-"+endMonth+"-"+endDay;
	    i_search_type.value=search_type;
	    i_search_word.value=search_word;
		
	    formObj.appendChild(i_command);
	    formObj.appendChild(i_beginDate);
	    formObj.appendChild(i_endDate);
	    formObj.appendChild(i_search_type);
	    formObj.appendChild(i_search_word);
	    document.body.appendChild(formObj); 
	    formObj.method="post";
	    formObj.action="${contextPath}/admin/order/detailOrder.do";
	    formObj.submit();
	    //alert("submit");
		
	}
		
	
</script>    
</head>
<BODY>
<form action="${contextPath}/admin/goods/addNewGoods.do" method="post"  enctype="multipart/form-data">

		<h1>관리자 게시판 관리</h1>

<div class="tab_container">
	<!-- 내용 들어 가는 곳 -->
	<div class="tab_container" id="container">
		<ul class="tabs">

			<li><a href="#tab1">상품관리</a></li>
			<li><a href="#tab2">주문관리</a></li>
			<li><a href="#tab3">회원관리</a></li>
			<li><a href="#tab4">배송관리</a></li>
		</ul>
		<div class="tab_container">
			<div class="tab_content" id="tab1">
                        <div>
                            <H3>상품 조회</H3>
                            <form method="post">
                                <TABLE cellpadding="10" cellspacing="10">
                                    <TBODY>
                                        <TR>
                                            <TD>
                                                <input type="radio" name="r_search" checked="checked"/>
                                                등록일로조회 &nbsp;&nbsp;&nbsp;
                                                <input type="radio" name="r_search"/>상세조회 &nbsp;&nbsp;&nbsp;
                                            </TD>
                                        </TR>
                                        <TR>
                                            <TD>
                                                <select name="curYear">
                                                    <c:forEach var="i" begin="0" end="5">
                                                        <c:choose>
                                                            <c:when test="${endYear==endYear-i}">
                                                                <option value="${endYear}" selected="selected">${endYear}</option>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="${endYear-i }">${endYear-i }</option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </select>년
                                                <select name="curMonth">
                                                    <c:forEach var="i" begin="1" end="12">
                                                        <c:choose>
                                                            <c:when test="${endMonth==i }">
                                                                <option value="${i }" selected="selected">${i }</option>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="${i }">${i }</option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </select>월

                                                <select name="curDay">
                                                    <c:forEach var="i" begin="1" end="31">
                                                        <c:choose>
                                                            <c:when test="${endDay==i}">
                                                                <option value="${i }" selected="selected">${i }</option>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="${i }">${i }</option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </select>일 &nbsp;이전&nbsp;&nbsp;&nbsp;&nbsp;
                                                <a href="javascript:search_goods_list('today')">
                                                    <img src="${contextPath}/resources/image/btn_search_one_day.jpg">
												</a>
                                                <a href="javascript:search_goods_list('one_week')">
                                                    <img src="${contextPath}/resources/image/btn_search_1_week.jpg">
												</a>
                                                <a href="javascript:search_goods_list('two_week')">
                                                    <img src="${contextPath}/resources/image/btn_search_2_week.jpg">
												</a>
                                                <a href="javascript:search_goods_list('one_month')">
                                                    <img src="${pageContext.request.contextPath}/resources/image/btn_search_1_month.jpg">
												</a>
                                                <a href="javascript:search_goods_list('two_month')">
                                                    <img src="${contextPath}/resources/image/btn_search_2_month.jpg">
												</a>
                                                <a href="javascript:search_goods_list('three_month')">
                                                    <img src="${contextPath}/resources/image/btn_search_3_month.jpg">
												</a>
                                                <a href="javascript:search_goods_list('four_month')">
                                                    <img src="${contextPath}/resources/image/btn_search_4_month.jpg">
												</a>
                                                &nbsp;까지 조회
                                            </TD>
                                        </TR>
											<tr>
												<td>
													<select name="search_condition" disabled="disabled">
														<option value="전체" checked="checked">전체</option>
														<option value="제품번호">상품번호</option>
														<option value="제품이름">상품이름</option>
														<option value="제조사">제조사</option>
													</select>
													<input type="text" size="30" disabled="disabled"/>
													<input type="button" value="조회" disabled="disabled"/>
												</td>
											</tr>
											<tr>
												<td>
													조회한 기간:<input type="text" size="4" value="${beginYear}"/>년
													<input type="text" size="4" value="${beginMonth}"/>월
													<input type="text" size="4" value="${beginDay}"/>일 &nbsp; ~
													<input type="text" size="4" value="${endYear }"/>년
													<input type="text" size="4" value="${endMonth }"/>월
													<input type="text" size="4" value="${endDay }"/>일
												</td>
											</tr>
                            		</TBODY>
                                </TABLE>
                                <DIV class="clear"></DIV>
                            </form>
                                <DIV class="clear"></DIV>
                                <TABLE class="list_view">
									<TBODY align="center">
										<tr style="background:#33ff00">
											<td>상품번호</td>
											<td>상품이름</td>
											<td>저자</td>
											<td>출판사</td>
											<td>상품가격</td>
											<td>입고일자</td>
											<td>출판일</td>
										</tr>

										<c:choose>
										<c:when test="${empty newGoodsList }">
										<TR>
											<TD colspan="8" class="fixed">
												<strong>조회된 상품이 없습니다.</strong>
											</TD>
										</TR>
    									</c:when>
										<c:otherwise>
										<c:forEach var="item" items="${newGoodsList }">
										<TR>
											<TD>
												<strong>${item.goods_id }</strong>
											</TD>
											<TD>
												<a href="${pageContext.request.contextPath}/admin/goods/modifyGoodsForm.do?goods_id=${item.goods_id}">
													<strong>${item.goods_title }
													</strong>
												</a>
											</TD>
											<TD>
												<strong>${item.goods_writer }</strong>
											</TD>
											<TD >
												<strong>${item.goods_publisher }</strong>
											</TD>
											<td>
												<strong>${item.goods_sales_price }</strong>
											</td>
											<td>
												<strong>${item.goods_credate }</strong>
											</td>
											<td>
												<c:set var="pub_date" value="${item.goods_published_date}"/>
												<c:set var="arr" value="${fn:split(pub_date,' ')}"/>
												<strong>
													<c:out value="${arr[0]}"/>
												</strong>
											</td>
										</TR>
										</c:forEach>
										</c:otherwise>
										</c:choose>
                                        <tr>
                                            <td colspan="8" class="fixed">
                                                <c:forEach var="page" begin="1" end="10" step="1">
    											<c:if test="${section >1 && page==1 }">
                                                <a href="${contextPath}/admin/goods/adminGoodsMain.do?chapter=${section-1}&pageNum=${(section-1)*10 +1 }">&nbsp; &nbsp;</a>
                                                </c:if>
                                                <a href="${contextPath}/admin/goods/adminGoodsMain.do?chapter=${section}&pageNum=${page}">${(section-1)*10 +page }
												</a>
                                                <c:if test="${page ==10 }">
                                                <a href="${contextPath}/admin/goods/adminGooodsMain.do?chapter=${section+1}&pageNum=${section*10+1}">&nbsp; next</a>
                                                </c:if>
                                                </c:forEach>
                                    </TBODY>
                                </TABLE>
                        </div>
                    </div>
			
			
			<div class="tab_content" id="tab2">
				<H3>주문 조회</H3>
	<form name="frm_delivery_list" action="${contextPath }/admin/admin.do" method="post">	
		<table   >
			<tbody>
				<tr>
					<td>
						<input type="radio" name="r_search_option" value="simple_search" checked onClick="fn_enable_detail_search(this)"/> 간단조회 &nbsp;&nbsp;&nbsp;
						<input type="radio" name="r_search_option" value="detail_search"  onClick="fn_enable_detail_search(this)" /> 상세조회 &nbsp;&nbsp;&nbsp;
					</td>
				</tr>
				<tr>
					<td>
					  <select name="curYear">
					     <c:forEach   var="i" begin="0" end="5">
					      <c:choose>
					        <c:when test="${endYear==endYear-i}">
					          <option value="${endYear }" selected>${endYear  }</option>
					        </c:when>
					        <c:otherwise>
					          <option value="${endYear-i }">${endYear-i }</option>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>
					</select>년 <select name="curMonth" >
						 <c:forEach   var="i" begin="1" end="12">
					      <c:choose>
					        <c:when test="${endMonth==i }">
					          <option value="${i }"  selected>${i }</option>
					        </c:when>
					        <c:otherwise>
					          <option value="${i }">${i }</option>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>					
					</select>월
					
					 <select name="curDay">
					  <c:forEach   var="i" begin="1" end="31">
					      <c:choose>
					        <c:when test="${endDay==i }">
					          <option value="${i }"  selected>${i }</option>
					        </c:when>
					        <c:otherwise>
					          <option value="${i }">${i }</option>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>	
					</select>일  &nbsp;이전&nbsp;&nbsp;&nbsp;&nbsp; 
					<a href="javascript:search_order_history('today')">
					   <img   src="${contextPath}/resources/image/btn_search_one_day.jpg">
					</a>
					<a href="javascript:search_order_history('one_week')">
					   <img   src="${contextPath}/resources/image/btn_search_1_week.jpg">
					</a>
					<a href="javascript:search_order_history('two_week')">
					   <img   src="${contextPath}/resources/image/btn_search_2_week.jpg">
					</a>
					<a href="javascript:search_order_history('one_month')">
					   <img   src="${contextPath}/resources/image/btn_search_1_month.jpg">
					</a>
					<a href="javascript:search_order_history('two_month')">
					   <img   src="${contextPath}/resources/image/btn_search_2_month.jpg">
					</a>
					<a href="javascript:search_order_history('three_month')">
					   <img   src="${contextPath}/resources/image/btn_search_3_month.jpg">
					</a>
					<a href="javascript:search_order_history('four_month')">
					   <img   src="${contextPath}/resources/image/btn_search_4_month.jpg">
					</a>
					&nbsp;까지 조회
					</td>
				</tr>
				
				<tr>
				  <td>
					조회 기간:
					<select name="beginYear" disabled>
					 <c:forEach   var="i" begin="0" end="5">
					      <c:choose>
					        <c:when test="${beginYear==beginYear-i }">
					          <option value="${beginYear-i }" selected>${beginYear-i  }</option>
					        </c:when>
					        <c:otherwise>
					          <option value="${beginYear-i }">${beginYear-i }</option>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>
					</select>년 
					<select name="beginMonth" disabled >
						 <c:forEach   var="i" begin="1" end="12">
					      <c:choose>
					        <c:when test="${beginMonth==i }">
					          <option value="${i }"  selected>${i }</option>
					        </c:when>
					        <c:otherwise>
					          <c:choose>
					            <c:when test="${i <10 }">
					              <option value="0${i }">0${i }</option>
					            </c:when>
					            <c:otherwise>
					            <option value="${i }">${i }</option>
					            </c:otherwise>
					          </c:choose>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>					
					</select>월
					 <select name="beginDay" disabled >
					  <c:forEach   var="i" begin="1" end="31">
					      <c:choose>
					        <c:when test="${beginDay==i }">
					          <option value="${i }"  selected>${i }</option>
					        </c:when>
					        <c:otherwise>
					          <c:choose>
					            <c:when test="${i <10 }">
					              <option value="0${i }">0${i }</option>
					            </c:when>
					            <c:otherwise>
					            <option value="${i }">${i }</option>
					            </c:otherwise>
					          </c:choose>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>	
					</select>일  &nbsp; ~
					
					<select name="endYear" disabled >
					 <c:forEach   var="i" begin="0" end="5">
					      <c:choose>
					        <c:when test="${endYear==endYear-i }">
					          <option value="${2016-i }" selected>${2016-i  }</option>
					        </c:when>
					        <c:otherwise>
					          <option value="${2016-i }">${2016-i }</option>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>
					</select>년 
					<select name="endMonth" disabled >
						 <c:forEach   var="i" begin="1" end="12">
					      <c:choose>
					        <c:when test="${endMonth==i }">
					          <option value="${i }"  selected>${i }</option>
					        </c:when>
					        <c:otherwise>
					          <c:choose>
					            <c:when test="${i <10 }">
					              <option value="0${i }">0${i }</option>
					            </c:when>
					            <c:otherwise>
					            <option value="${i }">${i }</option>
					            </c:otherwise>
					          </c:choose>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>					
					</select>월
					 <select name="endDay" disabled >
					  <c:forEach   var="i" begin="1" end="31">
					      <c:choose>
					        <c:when test="${endDay==i }">
					          <option value="${i }"  selected>${i }</option>
					        </c:when>
					        <c:otherwise>
					          <c:choose>
					            <c:when test="${i <10 }">
					              <option value="0${i }">0${i }</option>
					            </c:when>
					            <c:otherwise>
					            <option value="${i }">${i }</option>
					            </c:otherwise>
					          </c:choose>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>	
					</select>
												 
				  </td>
				</tr>
				<tr>
				  <td>
				    <select name="s_search_type" disabled >
						<option value="all" checked>전체</option>
						<option value="orderer_name">주문자이름</option>
						<option value="orderer_id">주문자아이디</option>
						<option value="orderer_hp">주문자휴대폰번호</option>
						<option value="orderer_goods">주문상품품명</option>
					</select>
					<input  type="text"  size="30" name="t_search_word" disabled />  
					<input   type="button"  value="조회" name="btn_search" onClick="fn_detail_search()" disabled  />
				  </td>
				</tr>				
			</tbody>
		</table>
		<div class="clear">
	</div>
	
<div class="clear"></div>
<table class="list_view">
		<tbody align=center >
			<tr style="background:#33ff00" >
				<td class="fixed" >주문번호</td>
				<td class="fixed">주문일자</td>
				<td>주문내역</td>
				<td>배송상태</td>
				<td>배송수정</td>
			</tr>
   <c:choose>
     <c:when test="${empty newOrderList}">			
			<tr>
		       <td colspan=5 class="fixed">
				  <strong>주문한 상품이 없습니다.</strong>
			   </td>
		     </tr>
	 </c:when>
	 <c:otherwise>
     <c:forEach var="item" items="${newOrderList}" varStatus="i">
        <c:choose>
          <c:when test="${item.order_id != pre_order_id }">  
            <c:choose>
              <c:when test="${item.delivery_state=='delivery_prepared' }">
                <tr  bgcolor="lightgreen">    
              </c:when>
              <c:when test="${item.delivery_state=='finished_delivering' }">
                <tr  bgcolor="lightgray">    
              </c:when>
              <c:otherwise>
                <tr  bgcolor="orange">   
              </c:otherwise>
            </c:choose>   
				 <td width=10%>
				   <a href="javascript:fn_detail_order('${item.order_id}')">
				     <strong>${item.order_id}</strong>
				   </a>
				</td>
				<td width=20%>
				 <strong>${item.pay_order_time }</strong> 
				</td>
				<td width=50% align=left >
				    <strong>주문자:${item.orderer_name}</strong><br>
				  <strong>주문자 번화번호:${item.orderer_hp}</strong><br>
				  <strong>수령자:${item.receiver_name}</strong><br>
				  <strong>수령자 번화번호:${item.receiver_hp1}-${item.receiver_hp2}-${item.receiver_hp3}</strong><br>
				  <strong>주문상품명(수량):${item.goods_title}(${item.order_goods_qty})</strong><br>
				     <c:forEach var="item2" items="${newOrderList}" varStatus="j">
				       <c:if test="${j.index > i.index }" >
				          <c:if  test="${item.order_id ==item2.order_id}" >
				            <strong>주문상품명(수량):${item2.goods_title}(${item2.order_goods_qty})</strong><br>
				      </c:if>   
				       </c:if>
				    </c:forEach> 
				</td>
				<td width=10%>
				 <select name="s_delivery_state${i.index }"  id="s_delivery_state${i.index }">
				 <c:choose>
				   <c:when test="${item.delivery_state=='delivery_prepared' }">
				     <option  value="delivery_prepared" selected>배송준비중</option>
				     <option  value="delivering">배송중</option>
				     <option  value="finished_delivering">배송완료</option>
				     <option  value="cancel_order">주문취소</option>
				     <option  value="returning_goods">반품</option>
				   </c:when>
				    <c:when test="${item.delivery_state=='delivering' }">
				    <option  value="delivery_prepared" >배송준비중</option>
				     <option  value="delivering" selected >배송중</option>
				     <option  value="finished_delivering">배송완료</option>
				     <option  value="cancel_order">주문취소</option>
				     <option  value="returning_goods">반품</option>
				   </c:when>
				   <c:when test="${item.delivery_state=='finished_delivering' }">
				    <option  value="delivery_prepared" >배송준비중</option>
				     <option  value="delivering"  >배송중</option>
				     <option  value="finished_delivering" selected>배송완료</option>
				     <option  value="cancel_order">주문취소</option>
				     <option  value="returning_goods">반품</option>
				   </c:when>
				   <c:when test="${item.delivery_state=='cancel_order' }">
				    <option  value="delivery_prepared" >배송준비중</option>
				     <option  value="delivering"  >배송중</option>
				     <option  value="finished_delivering" >배송완료</option>
				     <option  value="cancel_order" selected>주문취소</option>
				     <option  value="returning_goods">반품</option>
				   </c:when>
				   <c:when test="${item.delivery_state=='returning_goods' }">
				    <option  value="delivery_prepared" >배송준비중</option>
				     <option  value="delivering"  >배송중</option>
				     <option  value="finished_delivering" >배송완료</option>
				     <option  value="cancel_order" >주문취소</option>
				     <option  value="returning_goods" selected>반품</option>
				   </c:when>
				   </c:choose>
				 </select> 
				</td>
				<td width=10%>
			     <input  type="button" value="배송수정"  onClick="fn_modify_order_state('${item.order_id}','s_delivery_state${i.index}')"/>
			    </td>
			</tr>
		</c:when>
		</c:choose>	
		<c:set  var="pre_order_id" value="${item.order_id }" />
	</c:forEach>
	</c:otherwise>
  </c:choose>	
         <tr>
             <td colspan=8 class="fixed">
                 <c:forEach   var="page" begin="1" end="10" step="1" >
		         <c:if test="${section >1 && page==1 }">
		          <a href="${contextPath}/admin/order/adminOrderMain.do?chapter=${section-1}&pageNum=${(section-1)*10 +1 }">&nbsp;&nbsp;</a>
		         </c:if>
		          <a href="${contextPath}/admin/order/adminOrderMain.do?chapter=${section}&pageNum=${page}">${(section-1)*10 +page } </a>
		         <c:if test="${page ==10 }">
		          <a href="${contextPath}/admin/order/adminOrderMain.do?chapter=${section+1}&pageNum=${section*10+1}">&nbsp; next</a>
		         </c:if> 
	      		</c:forEach> 
           </td>
        </tr>  		   
		</tbody>
	</table>
  </form>   	
	<div class="clear"></div>
			</div>
			
			
			
			<div class="tab_content" id="tab3">
				<H3>회원 조회</H3>
	<form name="frm_delivery_list" >	
		<table cellpadding="10" cellspacing="10"  >
			<tbody>
				<tr>
					<td>
						<input type="radio" name="r_search_option" value="simple_search" checked onClick="fn_enable_detail_search(this)"/> 간단조회 &nbsp;&nbsp;&nbsp;
						<input type="radio" name="r_search_option" value="detail_search"  onClick="fn_enable_detail_search(this)" /> 상세조회 &nbsp;&nbsp;&nbsp;
					</td>
				</tr>
				<tr>
					<td>
					  <select name="curYear">
					     <c:forEach   var="i" begin="0" end="5">
					      <c:choose>
					        <c:when test="${endYear==endYear-i}">
					          <option value="${endYear }" selected>${endYear  }</option>
					        </c:when>
					        <c:otherwise>
					          <option value="${endYear-i }">${endYear-i }</option>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>
					</select>년 <select name="curMonth" >
						 <c:forEach   var="i" begin="1" end="12">
					      <c:choose>
					        <c:when test="${endMonth==i }">
					          <option value="${i }"  selected>${i }</option>
					        </c:when>
					        <c:otherwise>
					          <option value="${i }">${i }</option>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>					
					</select>월
					
					 <select name="curDay">
					  <c:forEach   var="i" begin="1" end="31">
					      <c:choose>
					        <c:when test="${endDay==i }">
					          <option value="${i }"  selected>${i }</option>
					        </c:when>
					        <c:otherwise>
					          <option value="${i }">${i }</option>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>	
					</select>일  &nbsp;이전&nbsp;&nbsp;&nbsp;&nbsp; 
					<a href="javascript:search_member('today')">
					   <img   src="${pageContext.request.contextPath}/resources/image/btn_search_one_day.jpg">
					</a>
					<a href="javascript:search_member('one_week')">
					   <img   src="${pageContext.request.contextPath}/resources/image/btn_search_1_week.jpg">
					</a>
					<a href="javascript:search_member('two_week')">
					   <img   src="${pageContext.request.contextPath}/resources/image/btn_search_2_week.jpg">
					</a>
					<a href="javascript:search_member('one_month')">
					   <img   src="${pageContext.request.contextPath}/resources/image/btn_search_1_month.jpg">
					</a>
					<a href="javascript:search_member('two_month')">
					   <img   src="${pageContext.request.contextPath}/resources/image/btn_search_2_month.jpg">
					</a>
					<a href="javascript:search_member('three_month')">
					   <img   src="${pageContext.request.contextPath}/resources/image/btn_search_3_month.jpg">
					</a>
					<a href="javascript:search_member('four_month')">
					   <img   src="${pageContext.request.contextPath}/resources/image/btn_search_4_month.jpg">
					</a>
					&nbsp;까지 조회
					</td>
				</tr>
				
				<tr>
				  <td>
					조회 기간:
					<select name="beginYear" disabled>
					 <c:forEach   var="i" begin="0" end="5">
					      <c:choose>
					        <c:when test="${beginYear==beginYear-i }">
					          <option value="${beginYear-i }" selected>${beginYear-i  }</option>
					        </c:when>
					        <c:otherwise>
					          <option value="${beginYear-i }">${beginYear-i }</option>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>
					</select>년 
					<select name="beginMonth" disabled >
						 <c:forEach   var="i" begin="1" end="12">
					      <c:choose>
					        <c:when test="${beginMonth==i }">
					          <option value="${i }"  selected>${i }</option>
					        </c:when>
					        <c:otherwise>
					          <c:choose>
					            <c:when test="${i <10 }">
					              <option value="0${i }">0${i }</option>
					            </c:when>
					            <c:otherwise>
					            <option value="${i }">${i }</option>
					            </c:otherwise>
					          </c:choose>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>					
					</select>월
					 <select name="beginDay" disabled >
					  <c:forEach   var="i" begin="1" end="31">
					      <c:choose>
					        <c:when test="${beginDay==i }">
					          <option value="${i }"  selected>${i }</option>
					        </c:when>
					        <c:otherwise>
					          <c:choose>
					            <c:when test="${i <10 }">
					              <option value="0${i }">0${i }</option>
					            </c:when>
					            <c:otherwise>
					            <option value="${i }">${i }</option>
					            </c:otherwise>
					          </c:choose>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>	
					</select>일  &nbsp; ~
					
					<select name="endYear" disabled >
					 <c:forEach   var="i" begin="0" end="5">
					      <c:choose>
					        <c:when test="${endYear==endYear-i }">
					          <option value="${2016-i }" selected>${2016-i  }</option>
					        </c:when>
					        <c:otherwise>
					          <option value="${2016-i }">${2016-i }</option>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>
					</select>년 
					<select name="endMonth" disabled >
						 <c:forEach   var="i" begin="1" end="12">
					      <c:choose>
					        <c:when test="${endMonth==i }">
					          <option value="${i }"  selected>${i }</option>
					        </c:when>
					        <c:otherwise>
					          <c:choose>
					            <c:when test="${i <10 }">
					              <option value="0${i }">0${i }</option>
					            </c:when>
					            <c:otherwise>
					            <option value="${i }">${i }</option>
					            </c:otherwise>
					          </c:choose>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>					
					</select>월
					 <select name="endDay" disabled >
					  <c:forEach   var="i" begin="1" end="31">
					      <c:choose>
					        <c:when test="${endDay==i }">
					          <option value="${i }"  selected>${i }</option>
					        </c:when>
					        <c:otherwise>
					          <c:choose>
					            <c:when test="${i<10}">
					              <option value="0${i}">0${i }</option>
					            </c:when>
					            <c:otherwise>
					            <option value="${i}">${i }</option>
					            </c:otherwise>
					          </c:choose>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>	
					</select>
												 
				  </td>
				</tr>
				<tr>
				  <td>
				    <select name="s_search_type" disabled >
						<option value="all" checked>전체</option>
						<option value="member_name">회원이름</option>
						<option value="member_id">회원아이디</option>
						<option value="member_hp_num">회원휴대폰번호</option>
						<option value="member_addr">회원주소</option>
					</select>
					<input  type="text"  size="30" name="t_search_word" disabled />  
					<input   type="button"  value="조회" name="btn_search" onClick="fn_detail_search()" disabled  />
				  </td>
				</tr>				
			</tbody>
		</table>
		<div class="clear">
	</div>
	
<div class="clear"></div>
<table class="list_view">
		<tbody align=center >
			<tr align=center bgcolor="#ffcc00">
				<td class="fixed" >회원아이디</td>
				<td class="fixed">회원이름</td>
				<td>휴대폰번호</td>
				<td>주소</td>
				<td>가입일</td>
				<td>탈퇴여부</td>
			</tr>
   <c:choose>
     <c:when test="${empty member_list}">			
			<tr>
		       <td colspan=5 class="fixed">
				  <strong>조회된 회원이 없습니다.</strong>
			   </td>
		     </tr>
	 </c:when>
	 <c:otherwise>
	     <c:forEach var="item" items="${member_list}" varStatus="item_num">
	            <tr >       
					<td width=10%>
					
					  <a href="${pageContext.request.contextPath}/admin/member/memberDetail.do?member_id=${item.member_id}">
					     <strong>${item.member_id}</strong>
					  </a>
					</td>
					<td width=10%>
					  <strong>${item.member_name}</strong><br>
					</td>
					<td width=10% >
					  <strong>${item.hp1}-${item.hp2}-${item.hp3}</strong><br>
					</td>
					<td width=50%>
					  <strong>${item.roadAddress}</strong><br>
					  <strong>${item.jibunAddress}</strong><br>
					  <strong>${item.namujiAddress}</strong><br>
					</td>
					<td width=10%>
					   <c:set var="join_date" value="${item.joinDate}" />
					   <c:set var="arr" value="${fn:split(join_date,' ')}" />
					   <strong><c:out value="${arr[0]}" /></strong>
				    </td>
				    <td width=10%>
				       <c:choose>
				         <c:when test="${item.del_yn=='N' }">
				           <strong>활동중</strong>  
				         </c:when>
				         <c:otherwise>
				           <strong>탈퇴</strong>
				         </c:otherwise>
				       </c:choose>
				    </td>
				</tr>
		</c:forEach>
	</c:otherwise>
  </c:choose>	
         <tr>
             <td colspan=8 class="fixed">
                 <c:forEach   var="page" begin="1" end="10" step="1" >
		         <c:if test="${chapter >1 && page==1 }">
		          <a href="${pageContext.request.contextPath}/admin/member/adminMemberMain.do?chapter=${chapter-1}&pageNum=${(chapter-1)*10 +1 }">&nbsp;pre &nbsp;</a>
		         </c:if>
		          <a href="${pageContext.request.contextPath}/admin/member/adminMemberMain.do?chapter=${chapter}&pageNum=${page}">${(chapter-1)*10 +page } </a>
		         <c:if test="${page ==10 }">
		          <a href="${pageContext.request.contextPath}/admin/member/adminMemberMain.do?chapter=${chapter+1}&pageNum=${chapter*10+1}">&nbsp; next</a>
		         </c:if> 
	      		</c:forEach> 
           </td>
        </tr>  		   
		</tbody>
	</table>
  </form>   	
	<div class="clear"></div>
<c:choose>
 <c:when test="${not empty order_goods_list }">	
   <DIV id="page_wrap">
		 <c:forEach   var="page" begin="1" end="10" step="1" >
		         <c:if test="${chapter >1 && page==1 }">
		          <a href="${pageContext.request.contextPath}/admin/member/adminMemberMain.do?chapter=${chapter-1}&pageNum=${(chapter-1)*10 +1 }">&nbsp;pre &nbsp;</a>
		         </c:if>
		          <a href="${pageContext.request.contextPath}/admin/member/adminMemberMain.do?chapter=${chapter}&pageNum=${page}">${(chapter-1)*10 +page } </a>
		         <c:if test="${page ==10 }">
		          <a href="${pageContext.request.contextPath}/admin/member/adminMemberMain.do?chapter=${chapter+1}&pageNum=${chapter*10+1}">&nbsp; next</a>
		         </c:if> 
	      </c:forEach> 
	</DIV>	
 </c:when>
</c:choose>
			</div>
			
			
			
			

			<div class="tab_content" id="tab4">
				<H4>제품소개</H4>
				<table>
					<tr>
						<td >제품소개</td>
						<td><textarea  rows="100" cols="80" name="goods_intro"></textarea></td>
				    </tr>
			    </table>
			</div>

		</div>
	</div>
	<div class="clear"></div>
<center>	
	 <table>
	 <tr>
			  <td align=center>
				<!--   <input  type="submit" value="상품 등록하기"> --> 
				  <input  type="button" value="상품 등록하기"  onClick="fn_add_new_goods(this.form)">
			  </td>
			</tr>
	 </table>
</center>	 
</div>
</form>	 