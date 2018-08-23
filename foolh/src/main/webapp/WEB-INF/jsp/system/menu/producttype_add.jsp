<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<!-- jsp文件头和头部 -->
<%@ include file="../index/top.jsp"%>

</head>
<body class="no-skin">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
				
					<div class="page-header">
							<h1>
								<small>
									<i class="ace-icon fa fa-angle-double-right"></i>
									编辑菜单
								</small>
							</h1>
					</div><!-- /.page-header -->

					<div class="row">
						<div class="col-xs-12">

						<form  action="<%=basePath%>pdtType/add.do" name="menuForm" id="menuForm" method="post" class="form-horizontal">
							<input type="hidden" name="ptid" id="ptid" value="${pd.ptid }"/>
							<input type="hidden" name="t_state" id="t_state" value="${pd.t_state }"/>
							<input type="hidden" name="p_id" id="p_id" value="${null == pd.p_id ? ptid:pd.p_id}"/>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 上级 :</label>
								<div class="col-sm-9">
									<div style="padding-top:5px;">
										<div class="col-xs-4 label label-lg label-light arrowed-in arrowed-right">
											<b>${null == pds.text ?'(无) 此项为顶级菜单':pds.text}</b>
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 名称 :</label>
								<div class="col-sm-9">
									<input type="text" name="text" id="text" value="${pd.text }" placeholder="这里输入菜单名称" class="col-xs-10 col-sm-5" />
								</div>
							</div>
							<!--  <div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 链接  :</label>
								<div class="col-sm-9">
									<c:if test="${null != pds.text}">
									<input type="text" name="MENU_URL" id="menuUrl" value="${pd.MENU_URL }" placeholder="这里输入菜单链接" class="col-xs-10 col-sm-5" />
									</c:if>
									<c:if test="${null == pds.text}">
									<input type="text" name="MENU_URL" id="menuUrl" value="" readonly="readonly" placeholder="顶级菜单禁止输入" class="col-xs-10 col-sm-5" />
									</c:if>
								</div>
							</div>
							-->
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 序号 : </label>
								<div class="col-sm-9">
									<input type="number" name="MENU_ORDER" id="menuOrder" value="${pd.MENU_ORDER}" placeholder="这里输入菜单序号" title="请输入正整数" class="col-xs-10 col-sm-5" />
								</div>
							</div>
							
							<!--<c:if test="${'0' == id}">
							  <div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 类型 : </label>
								<div class="col-sm-9">
									<label style="float:left;padding-left: 8px;padding-top:7px;">
										<input name="form-field-radio" type="radio" class="ace" id="form-field-radio1" <c:if test="${pd.MENU_TYPE == '1' }">checked="checked"</c:if> onclick="setType('1','1');"/>
										<span class="lbl"> 系统菜单</span>
									</label>
									<label style="float:left;padding-left: 5px;padding-top:7px;">
										<input name="form-field-radio" type="radio" class="ace" id="form-field-radio2" <c:if test="${pd.MENU_TYPE == '2' }">checked="checked"</c:if> onclick="setType('1','2');"/>
										<span class="lbl"> 业务菜单</span>
									</label>
								</div>
							</div>
							</c:if>-->
							
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 状态 : </label>
								<div class="col-sm-9">
									<label style="float:left;padding-left: 8px;padding-top:7px;">
										<input name="form-field-radio2" type="radio" class="ace" id="form-field-radio3" <c:if test="${pd.t_state == 1 }">checked="checked"</c:if> onclick="setType(1);"/>
										<span class="lbl"> 显示</span>
									</label>
									<label style="float:left;padding-left: 5px;padding-top:7px;">
										<input name="form-field-radio2" type="radio" class="ace" id="form-field-radio4" <c:if test="${pd.t_state == 0 }">checked="checked"</c:if> onclick="setType(0);"/>
										<span class="lbl"> 隐藏</span>
									</label>
								</div>
							</div>
							
							<div class="clearfix form-actions">
								<div class="col-md-offset-3 col-md-9">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="goback('${ptid}');">取消</a>
								</div>
							</div>
							<div class="hr hr-18 dotted hr-double"></div>
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
		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../index/foot.jsp"%>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!-- inline scripts related to this page -->
	<script type="text/javascript">
		//$(top.hangge());
		
		//返回
		function goback(id){
			
			window.location.href="<%=basePath%>pdtType.do?ptid="+id;
		}
		
		//保存
		function save(){
			if($("#text").val()==""){
				$("#text").tips({
					side:3,
		            msg:'请输入菜单名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#text").focus();
				return false;
			}
			
			
			//状态值为空默认为显示
			if($("#t_state").val()==""){
				$("t_state").val(1);
			}
			
			$("#menuForm").submit();
		}
		
		//设置菜单类型or状态
		function setType(value){
			
				$("#t_state").val(value);
		}
	</script>


</body>
</html>