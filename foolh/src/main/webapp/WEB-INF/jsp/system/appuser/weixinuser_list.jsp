<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../index/top.jsp"%>
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
<style type="text/css">
		.file {
    position: relative;
    display: inline-block;
    background: #D0EEFF;
    border: 1px solid #99D3F5;
    border-radius: 4px;
    padding: 4px 12px;
    overflow: hidden;
    color: #1E88C7;
    text-decoration: none;
    text-indent: 0;
    line-height: 20px;
}
.file input {
    position: absolute;
    font-size: 100px;
    right: 0;
    top: 0;
    opacity: 0;
}
.file:hover {
    background: #AADFFD;
    border-color: #78C3F3;
    color: #004974;
    text-decoration: none;
}
</style>
</head>
<body class="no-skin">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
						<!-- 检索  -->
						<form action="hweixinuser/listUsers.do" method="post" name="userForm" id="userForm">
						
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
									<span class="input-icon">
										<input class="nav-search-input" autocomplete="off" id="nav-search-input" type="text" name="keywords" value="${pd.keywords }" placeholder="这里输入关键词" />
										<i class="ace-icon fa fa-search nav-search-icon"></i>
									</span>
									</div>
								</td>
								<td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="searchs();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
								 <td style="vertical-align:top;padding-left:2px;">
								 	<select class="chosen-select form-control" name="is_check" id="is_check" data-placeholder="请选择状态" style="vertical-align:top;width: 120px;" onchange="searchs();">
									<option value="" <c:if test="${pd.is_check == '' }">selected</c:if>>全部</option>
									<option value="1" <c:if test="${pd.is_check == 1 }">selected</c:if>>已审核</option>
									<option value="2" <c:if test="${pd.is_check == 2 }">selected</c:if>>待审核</option>
									</select>
								</td>
								 <td style="vertical-align:top;padding-left:2px;">
								 	<select class="chosen-select form-control" name="is_authen" id="is_authen" data-placeholder="请选择状态" style="vertical-align:top;width: 120px;" onchange="searchs2();">
									<option value="" <c:if test="${pd.is_authen == '' }">selected</c:if>>全部</option>
									<option value="0" <c:if test="${pd.is_authen == 0 }">selected</c:if>>已认证</option>
									<option value="1" <c:if test="${pd.is_authen == 1 }">selected</c:if>>待认证</option>
									</select>
								</td>
								<td>审核开关:</td>
								<td >
								<c:if test="${ic.ischeck==0 }">未开启&nbsp;&nbsp;
											<a class="label label-success arrowed" onclick="changeCheck('${ic.checkId}',1);">开启</a></c:if>
											<c:if test="${ic.ischeck==1 }">已开启
											&nbsp;&nbsp;<a class="label label-success arrowed" onclick="changeCheck('${ic.checkId}',0);">关闭</a>
											</c:if>
								</td>
						  </tr>
						</table>
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">
							<thead>
								<tr>
									<th class="center" style="width:35px;">
									<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th>
									<th class="center" style="width:50px;">序号</th>
									<th class="center">用户昵称</th>
							        <th class="center">用户姓名</th>
									<th class="center">用户电话</th>
									<th class="center">性别</th>
									<th class="center">注册时间</th>
									<th class="center">邀请人数</th>
									
									<th class="center">操作</th>
								</tr>
							</thead>
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty userList}">
									<c:if test="${QX.cha == 1 }">
									<c:forEach items="${userList}" var="user" varStatus="vs">
										<tr>
											<td class='center' style="width: 30px;">
												<label><input type='checkbox' name='ids' value="${user.user_id }" id="${user.user_id }" alt="${user.user_id }" class="ace"/><span class="lbl"></span></label>
											</td>
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class="center">${user.user_name }</td>
											<td class="center" style="cursor:pointer;color:blue;" onClick="showA('${user.user_id}')">${user.name }</td>
											<td class="center">${user.phone }</td>
											<td class="center"><c:if test="${user.sex==1 }">男</c:if>
											<c:if test="${user.sex==2 }">女</c:if></td>
											<td class="center">${user.created }</td>
											<td class="center">${user.invite }人</td>
											<td class="center"><c:if test="${user.is_check==1 }">已审核&nbsp;&nbsp;
											<a class="label label-success arrowed" onclick="changeState('${user.user_id}',2);">拉黑</a></c:if>
											<c:if test="${user.is_check==2 }">待审核
											&nbsp;&nbsp;<a class="label label-success arrowed" onclick="changeState('${user.user_id}',1);">审核</a>
											</c:if></td>
										</tr>
									</c:forEach>
									</c:if>
									<c:if test="${QX.cha == 0 }">
										<tr>
											<td colspan="100" class="center">您无权查看</td>
										</tr>
									</c:if>
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="100" class="center" >没有相关数据</td>
									</tr>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
						<div class="page-header position-relative">
						<table style="width:100%;">
							<tr>
								<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
							</tr>
						</table>
						</div>
						</form>
 						</div>
 				 
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->
		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
	</div>
	<!-- /.main-container -->
	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../index/foot.jsp"%>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	</body>
 	<script type="text/javascript">

		$(top.hangge());
		function changeState(uid,state){
			
			bootbox.confirm("确定要进行此操作吗?", function(result) {
				
				    if(result){
				    	top.jzts();
			          $.ajax({
		                  type:'POST',
		                  url:'<%=basePath%>hweixinuser/updateState.do',
		                  data:{
		                	  is_check:state,
		                     user_id:uid,
		                       },
		                 success:function(data){
				         window.location.reload();
		                 }
					})
				    }
			});
		}
		
		$(top.hangge());
		function changeLine(uid,line){
			bootbox.confirm("确定要进行此操作吗?", function(result) {
				    if(result){
				    	top.jzts();
			          $.ajax({
		                  type:'POST',
		                  url:'<%=basePath%>hweixinuser/updateLine.do',
		                  data:{
		                	 offline:line,
		                     user_id:uid,
		                       },
		                 success:function(data){
				         window.location.reload();
		                 }
					})
				    }
			});
		}
		function showA(user_id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="查看";
			 diag.URL = '<%=basePath%>hweixinuser/goAddA.do?user_id='+user_id;
			 diag.Width = 600;
			 diag.Height = 432;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					top.jzts();
					setTimeout("self.location.reload()",100);
				}
				 window.location.reload();
				diag.close();
			 };
			 diag.show();
		}
		//检索
		function searchs(){
			top.jzts();
			$("#userForm").submit();
		}
		function searchs2(){
			top.jzts();
			$("#userForm").submit();
		}
      function changeCheck(checkId,state){
			
			bootbox.confirm("确定要进行此操作吗?", function(result) {
				
				    if(result){
				    	top.jzts();
			          $.ajax({
		                  type:'POST',
		                  url:'<%=basePath%>hweixinuser/updateCheck.do',
		                  data:{
		                	  ischeck:state,
		                	  checkId:checkId,
		                       },
		                 success:function(data){
				         window.location.reload();
		                 }
					})
				    }
			});
		}
		
	
		//批量操作
		function makeAll(msg){
			bootbox.confirm(msg, function(result) {
				if(result) {
					var str = '';
					var emstr = '';
					var phones = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++)
					{
						  if(document.getElementsByName('ids')[i].checked){
						  	if(str=='') str += document.getElementsByName('ids')[i].value;
						  	else str += ',' + document.getElementsByName('ids')[i].value;
						  	
						  	if(emstr=='') emstr += document.getElementsByName('ids')[i].id;
						  	else emstr += ';' + document.getElementsByName('ids')[i].id;
						  	
						  	if(phones=='') phones += document.getElementsByName('ids')[i].alt;
						  	else phones += ';' + document.getElementsByName('ids')[i].alt;
						  }
					}
					if(str==''){
						bootbox.dialog({
							message: "<span class='bigger-110'>您没有选择任何内容!</span>",
							buttons: 			
							{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
						});
						$("#zcheckbox").tips({
							side:3,
				            msg:'点这里全选',
				            bg:'#AE81FF',
				            time:8
				        });
						
						return;
					}else{
						if(msg == '确定要删除选中的数据吗?'){
							top.jzts();
							$.ajax({
								type: "POST",
								url: '<%=basePath%>happuser/deleteAllU.do?tm='+new Date().getTime(),
						    	data: {USER_IDS:str},
								dataType:'json',
								//beforeSend: validateData,
								cache: false,
								success: function(data){
									 $.each(data.list, function(i, list){
											nextPage(${page.currentPage});
									 });
								}
							});
						}else if(msg == '确定要给选中的用户发送邮件吗?'){
							sendEmail(emstr);
						}else if(msg == '确定要给选中的用户发送短信吗?'){
							sendSms(phones);
						}
						
					}
				}
			});
		}
		
		</script>
</html>
