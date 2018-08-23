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

</head>
<body class="no-skin">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row" id="zhongxingss">
						<div class="col-xs-12">
							<table id="dynamic-table"
								class="table table-striped table-bordered table-hover">

								<thead>
									<tr>
										<th class="center" style="width: 50px;">序号</th>
										<th class='center'>名称</th>
										<th class='center'>制作时间</th>
										<th class='center'>纬度</th>
										<th class='center'>纬度</th>
										<th class='center'>纬度</th>
										<th class='center'>纬度</th>
										<th class='center'>纬度</th>
										<th class='center' style="width: 120px;">操作</th>
									</tr>
								</thead>

								<tbody>

									<tr v-for="ser in list">
										<td class='center'>{{ser.id }}</td>
										<td class='center'>{{ser.foolTitle }}</td>
										<td class="center">{{ser.foolMakeTime }}分钟</td>
										<td calss="center">{{ser.foolPrice }}元</td>
										<td calss="center"><span >公共菜品{{ser.foolIsShop}}</span><span
											>店铺菜品</span></td>
										<td calss="center">{{ser.foolAddUserId }}</td>
										<td calss="center">{{ser.foolShopId }}</td>

										<td align="center" style="cursor: pointer; color: blue;"
											onClick="showU('{{ser.user_id}}')">查看</td>

										<td class='center'>
											<div class="hidden-sm hidden-xs action-buttons">
												<a class="green" href="javascript:editmenu('{{ser.id }}');">
													<i class="ace-icon fa fa-pencil-square-o bigger-130"
													title="修改"></i>
												</a> <a class="red" href="javascript:delmenu('{{ser.id }}');">
													<i class="ace-icon fa fa-trash-o bigger-130" title="删除"></i>
												</a>
											</div>
											<div class="hidden-md hidden-lg">
												<div class="inline pos-rel">
													<button class="btn btn-minier btn-yellow dropdown-toggle"
														data-toggle="dropdown" data-position="auto">
														<i class="ace-icon fa fa-caret-down icon-only bigger-120"></i>
													</button>

													<ul
														class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">

														<li><a href="javascript:editTb('{{ser.id}}');"
															class="tooltip-info" data-rel="tooltip" title="View">
																<span class="blue"> <i
																	class="ace-icon glyphicon glyphicon-picture bigger-120"
																	title="编辑图标"></i>
															</span>
														</a></li>
														<li><a href="javascript:editmenu('{{ser.id }}');"
															class="tooltip-success" data-rel="tooltip" title="Edit">
																<span class="green"> <i
																	class="ace-icon fa fa-pencil-square-o bigger-120"
																	title="修改"></i>
															</span>
														</a></li>


														<li><a href="javascript:delmenu('{{ser.id }');"
															class="tooltip-error" data-rel="tooltip" title="Delete">
																<span class="red"> <i
																	class="ace-icon fa fa-trash-o bigger-120" title="删除"></i>
															</span>
														</a></li>

													</ul>
												</div>
											</div>
										</td>
									</tr>



								</tbody>
							</table>

							<div>
								<a class="btn btn-sm btn-success" onclick="addfool();">新增</a>


							</div>

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
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>

	<!-- inline scripts related to this page -->
	<script type="text/javascript">
	$(top.hangge());
	new Vue({
		el: '#zhongxingss',
		data:{
			 list:[],
			 page:1,
			 rows:20,
			 type:100,
			 total:0
		},
	created:function(){
		var _this=this;
            $.ajax({
            	url:'<%=basePath%>user/getFoolMenuLibraryList?page='+_this.page+'&rows='+_this.rows+'&type='+_this.type,
                type:'GET',
                success:function(d){
                	
                	_this.total=d.length;
                	_this.list=d.rows;
                },
                error:function(){
                	console.log(222)
                }
            }) 
	},
	motheds:{
		
	}
	
	})

		 //去此ID下子菜单列表
		
			function addfool(){
				 top.jzts();
				 var diag = new top.Dialog();
				 diag.Drag=true;
				 diag.Title ="编辑";
				 diag.URL = '<%=basePath%>page/fool/add';
				 diag.Width = 400;
				 diag.Height = 552;
				 diag.CancelEvent = function(){ //关闭事件
					 
					 window.location.reload();
					diag.close();
				 };
				 diag.show();
			}
		function goSonmenu(id){
			
			window.location.href="<%=basePath%>address.do?id="+id;
		}; 
		
		//新增菜单
		function addtype(id){
		
			window.location.href="<%=basePath%>address/toAdd.do?id="+id;
		};
		
		//编辑菜单
		function editmenu(id){
			
			window.location.href="<%=basePath%>address/toEdit.do?id="+id;
		};
		
		//删除
		function delmenu(id){
			bootbox.confirm("确定要删除此菜单吗?", function(result) {
				
				if(result) {
					var url = "<%=basePath%>address/delete.do?id=";

					$.get(url, function(data) {
						if ("success" == data.result) {

						} else if ("false" == data.result) {

						}
					});
				}
			});
		}
	</script>


</body>
</html>