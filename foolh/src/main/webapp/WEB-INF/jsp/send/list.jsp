<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	 String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">

<!-- jsp文件头和头部 -->
<%@ include file="../system/index/top.jsp"%>
<link rel="stylesheet" href="static/css/mycss.css" />
<!-- 防止vue在网络慢的情况下 加载时闪现模板的解决方法 -->
<style type="text/css">
	[v-cloak]{ display: none; }
	nav li:hover{
		cursor: pointer;
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
					<div>
						<div class="row" id="zhongxingss">
							<div class="col-xs-12">
							
							<table style="margin-top:5px;">
							<tbody>
							<tr>
								<!-- 关键字 -->
								<td>
									<div class="nav-search">
									<span class="input-icon" id='typeViews'>
										<input class="nav-search-input input-sm" autocomplete="off" id="jianYiTitle" type="text" name="jianYiTitle"  placeholder="这里输入建议名称">
										<i class="ace-icon fa fa-search nav-search-icon"></i>
									</span>
									</div>
								</td>
								<!-- 关键字类型 -->
								<td style="vertical-align:top;padding-left:2px;">
								 	<select class="nav-search-input" name="searchType" id="searchType" data-placeholder="关键字类型"  style="border: 1px solid #6fb3e0;border-radius: 4px !important;" onchange="changeSearchType();">
										<option selected="selected" value="0">建议标题</option>
										<option value="1">建议时间</option>
									</select>
								</td>
								
								<td style="vertical-align:top;padding-left:2px;">
								 	<select class="nav-search-input" name="is_check" id="is_check" data-placeholder="请选择状态"  style="border: 1px solid #6fb3e0;border-radius: 4px !important;" onchange="gotoByAjax(page, rows,100);">
										<option selected="selected" value="">全部</option>
										<option value="0">未审核</option>
										<option value="1">已审核</option>
									</select>
								</td>
 								<td style="vertical-align:top;padding-left:2px;">
 									<a class="btn btn-light btn-xs" onclick="gotoByAjax(page, rows, 100);" title="检索">
 										<i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i>
 									</a>
 								</td>
							</tr>
						</tbody>
						</table>
							<table id="dynamic-table" class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th class="center" style="width: 35px;" >
												<label class="pos-rel">
													<input type="checkbox" class="ace" id="zcheckbox" @click="chooseAll()" /><span class="lbl"></span>
												</label>
											</th>
											<th class="center" style="width: 50px;">序号</th>
											<th class='center'>订单标题</th>
											<th class='center'>内容详情</th>
											<th class='center'>建议用户</th>
											<th class='center'>时间</th>
											<th class='center' width="100px">处理状态</th> 
											<th class='center' width="100px">操作</th> 
										</tr>
									</thead>
									<tbody id="jianYiList" >
										<!-- 开始循环 -->
										<tr v-cloak v-if="list != []"  v-for="ser in list">
											<td class='center' style="width: 30px;">
												<label><input type='checkbox' name='ids' :value="ser.id" class="ace" />
													<span class="lbl"></span>
												</label>
											</td>
											
											<td class='center'>{{ser.id }}</td>
											<td class='center'>{{ser.propTitle }} </td>
											<td calss="center" style=" max-width:100px;overflow:hidden;text-overflow:ellipsis;white-space: nowrap;" @click.prevent="showTextIfOut($event)">{{ ser.propMsg == null ? "无":ser.propMsg}}</td>
											<td calss="center" style="text-align: center;"><a class="glyphicon glyphicon-eye-open"  @click="checkUserByID(ser.propAddUserId)" title="点我查看用户信息"></a></td>
											<td calss="center" style="text-align: center;"><span> {{ dateFormat(ser.created)}}</span></td>
											<!-- 审核状态 -->
											<td calss="center" style="text-align: center;width:60px" v-if="ser.propIsCheck == 1" @click="changeJianyiStatus(ser.propIsCheck,ser.id,$event)"><a class="btn btn-mini btn-primary" title="更改审核状态">已审核</a></td>
											<td calss="center" style="text-align: center;width:60px"  v-if="ser.propIsCheck == 0" @click="changeJianyiStatus(ser.propIsCheck,ser.id,$event)"><a class="btn btn-mini btn-danger"  title="更改审核状态">未审核</a></td>
											<td calss="center" style="max-width: 30px">
												<div class="hidden-sm hidden-xs action-buttons center-block" style="max-width: 30px">
													<a class="red" @click="deljianyi(ser.id)"> <i class="ace-icon fa fa-trash-o bigger-130" title="删除"></i></a>
												</div>
											</td>
										</tr>
									</tbody>
								</table>

								<div>
									<div class="col-md-3" >
										<a class="btn btn-sm btn-success" onclick="delJianyis();">批量删除</a>
									</div>			
									<!--显示分页信息-->
									<div class="row pull-right" >
										<!--分页条-->
										<div class="pull-right no-margin" >
											<nav aria-label="...">
												<ul  class="pagination " id="pageNums">
							
												</ul>
											</nav>
										</div>
									</div>
							</div>
							<!-- /.col -->
						</div>

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

<!-- 私房菜列表的modal --> 
<div class="modal fade "  id="shopFoolModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	<div class="modal-dialog " style="width:850px;overflow:auto; ">
		<div class="modal-content">
		 <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">私房菜列表</h4>
         </div>
			<div class="modal-body">
				<table id="demo" lay-filter="test" ></table>	
				</div>
		 	 <div class="modal-footer">
               <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
               <!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addSeasModal" onclick="addFoolSeasView()">添加材料</button> -->
           	 </div>
		</div>
	</div>
</div>	

	
	



<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../system/index/foot.jsp"%>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 删除时确认窗口 -->
	<script src="static/vue.js"></script>
	<script src="static/vue-resource.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<script src="https://cdn.bootcss.com/moment.js/2.18.1/moment-with-locales.min.js"></script>  
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript" src="static/js/myjs/jianyi/jianyi.js"></script>
</body>
</html>