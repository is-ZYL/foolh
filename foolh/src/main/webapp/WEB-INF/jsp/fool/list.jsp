﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
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
										<input class="nav-search-input input-sm" autocomplete="off" id="nav-search-input" type="text" name="keywords" value="" placeholder="这里输入菜名">
										<i class="ace-icon fa fa-search nav-search-icon"></i>
									</span>
									</div>
								</td>
								<!-- 关键字类型 -->
								<td style="vertical-align:top;padding-left:2px;">
								 	<select class="nav-search-input" name="searchType" id="searchType" data-placeholder="关键字类型"  style="border: 1px solid #6fb3e0;border-radius: 4px !important;" onchange="changeSearchType();">
										<option selected="selected" value="">菜品名</option>
										<option value="1">菜品ID</option>
										<option value="2">菜品创建日期</option>
										<option value="3">店铺ID</option>
									</select>
								</td>
								
								<td style="vertical-align:top;padding-left:2px;">
								 	<select class="nav-search-input" name="is_check" id="is_check" data-placeholder="请选择状态"  style="border: 1px solid #6fb3e0;border-radius: 4px !important;" onchange="gotoByAjax(page, rows,100);">
										<option value="">全部</option>
										<option value="1">公共菜品</option>
										<option value="2">私有菜品</option>
									</select>
								</td>
								<!-- 菜品类型 -->
								<td style="vertical-align:top;padding-left:2px;">
								 	<select class="nav-search-input" name="fool_type" id="fool_type" data-placeholder="请选择状态"  style="border: 1px solid #6fb3e0;border-radius: 4px !important;" onchange="gotoByAjax(page, rows,100);">
										<option value="">全部</option>
										
									</select>
								</td>
								
 								<td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="gotoByAjax(page, rows, 100);" title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
								
							</tr>
						</tbody>
						
						</table>
							
								<table id="dynamic-table"
									class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th class="center" style="width: 35px;" >
												<label class="pos-rel">
													<input type="checkbox" class="ace" id="zcheckbox" @click="chooseAll()" /><span class="lbl"></span>
												</label>
											</th>
											<th class="center" style="width: 50px;">序号</th>
											<th class='center'>名称</th>
											<th class='center'>菜品小图</th>
											<th class='center'>制作时间</th>
											<th class='center'>单价</th>
											<th class='center'>材料</th>
											<th class='center'>绑定店铺</th>
											<th class='center'>菜品类型</th>
											<th class='center'>创建时间</th>
											<th class='center'>更新时间</th>
											<th class='center'>添加用户</th>
											<th class='center'>制作方法</th>
											<th class='center' style="width: 120px;">操作</th>
										</tr>
									</thead>
									<tbody id="foolList">
										<!-- 开始循环 -->
										<tr v-cloak v-for="ser in list">
											<td class='center' style="width: 30px;">
												<label><input type='checkbox' name='ids' :value="ser.id" class="ace" />
													<span class="lbl"></span>
												</label>
											</td>
											<td class='center'>{{ser.id }}</td>
											<td class='center' style=" max-width:100px;overflow:hidden;text-overflow:ellipsis;white-space: nowrap;" @click.prevent="showTextIfOut($event)">{{ser.foolTitle }} </td>
											<td class='center'><a class="glyphicon glyphicon-eye-open"  @click="showImgTitle(ser.id)"  title="点我查看菜品小图"></a></td>
											<td class="center">{{ser.foolMakeTime }}分钟</td>
											<td calss="center" style="text-align: center;">{{ser.foolPrice }}元</td>
											<td calss="center" style="text-align: center;"><a class="glyphicon glyphicon-eye-open"  @click="checkFoolSeasByFoolId(ser.id)"  title="点我查看材料信息"></a></td>
											<td calss="center" style="text-align: center;"><span>{{ser.foolIsShop == "1"?"公共菜品":"私有菜品 店铺id="+ser.foolShopId}}  </span></td>
											<td calss="center" style="text-align: center;">{{getFoolTypeVal(ser.foolType)}}</td>
											<td calss="center" style=" max-width:100px;overflow:hidden;text-overflow:ellipsis;white-space: nowrap;" @click.prevent="showTextIfOut($event)"><span> {{ dateFormat(ser.created)}}</span></td>
											<td calss="center" style=" max-width:100px;overflow:hidden;text-overflow:ellipsis;white-space: nowrap;" @click.prevent="showTextIfOut($event)"><span> {{ dateFormat(ser.updated)}}</span></td>
											<td calss="center" style="text-align: center;"><a class="glyphicon glyphicon-eye-open"  @click="checkUserByID(ser.foolAddUserId)" title="点我查看用户信息"></a></td>
											<td calss="center" style="max-width:100px;overflow:hidden;text-overflow:ellipsis;white-space: nowrap;" @click="showTextIfOut($event)">{{ser.foolMsg == null ? "无":ser.foolMsg }}</td>
											<td class='center'>
												<div class="hidden-sm hidden-xs action-buttons">
													<a class="green" @click="editmenu(ser.id)"> <i
														class="ace-icon fa fa-pencil-square-o bigger-130"
														title="修改"></i>
													</a> <a class="red" @click="delmenu(ser.id)"> <i
														class="ace-icon fa fa-trash-o bigger-130" title="删除"></i>
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
															<li><a @click="editTb(ser.id);" class="tooltip-info"
																data-rel="tooltip" title="View"> <span class="blue">
																		<i
																		class="ace-icon glyphicon glyphicon-picture bigger-120"
																		title="编辑图标"></i>
																</span>
															</a></li>
															<li><a @click="editmenu(ser.id)"
																class="tooltip-success" data-rel="tooltip" title="Edit">
																	<span class="green"> <i
																		class="ace-icon fa fa-pencil-square-o bigger-120"
																		title="修改"></i>
																</span>
															</a></li>


															<li><a @click="delmenu(ser.id)"
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
									<div class="col-md-3" >
										<a class="btn btn-sm btn-success" onclick="delFools();">批量删除</a>
										<a class="btn btn-sm btn-success" onclick="addfool();">新增</a>
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
	
													
<!-- 菜品小图模态框（Modal） -->
<div  class="modal fade bs-example-modal-sm"  id="ImgModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-body">
			<!-- ser.foolImgTitle -->
				<img id="foolImgTitleShow" alt="菜品小图" src="" style="width: 100%;height: 100%">
			</div>
		</div>
	</div>
</div>


<!-- 添加材料的modal -->
<div class="modal fade "   id="addSeasModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
	<div class="modal-dialog ">
		<div class="modal-content" >
		 <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">添加材料</h4>
         </div>
			<div class="modal-body" >
				<form   action="" method="post" name="foolseasMenu" id="foolseasMenu">
				<table class="center-block" style="margin: 0 auto;width: 300px">
					<tr>
						<div class="form-inline form-group">
						<td>
								<div class="form-group">
										 <label class="control-lable">材料名:</label>
										<input type="text"  class="form-control"  name="seasTitle" id="seasTitle"  placeholder="材料名" onblur="checkFoolSeasTitleIsOk(this)" onkeyup="value=value.replace(/[^\u4E00-\u9FA5]/g,'')" />
								</div>
						</td>
						<td>
								<div class="form-group"  style="margin-left: 10px">
										<lable class="control-lable">重量:</lable>
										<input  type="number"  class="form-control"  name="seasWeigetKg" id="seasWeigetKg"  min="0" placeholder="单位：kg" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" />
								</div>
						</td>
						</div>
					</tr>
						<tr>
							<div class="form-inline form-group" >
							<td>
									<div class="form-group">
											<lable class="control-lable">材料类型:</lable>
												<select class="form-control" name="seasSelect" id="seasSelect" style="width: 145px">
														<option selected="selected" value="0">主料</option>
														<option value="1">配料</option>
														<option value="2">调料</option>
														<option value="3">其他</option>
												</select>
									</div>
							</td>
							<td class="col-md-offset-1">
									<div class="form-group col-md-offset-1">
											<lable class="control-lable">菜品备注:</lable>
											<input  type="text"  class="form-control" name="seasMsg" id="seasMsg"  min="0" placeholder="备注" onkeyup="value=value.replace(/[^\u4E00-\u9FA5]/g,'')" />
									</div>
							</td>
							</div>
						</tr>
					</table>
				</form>
			 </div>
		 	 <div class="modal-footer">
               <button type="button" class="btn btn-default" data-dismiss="modal" onclick="$('#foolseasMenu')[0].reset();">关闭</button>
               <button type="button" class="btn btn-primary" onclick="addFoolseas()" >添加</button>
           	 </div>
		</div>
	</div>
</div>


<!-- 消息模态框（Modal） -->
<div class="modal fade bs-example-modal-sm" id="msgModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-body">没有菜品材料！！</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addSeasModal" onclick="addFoolSeasView()">添加材料</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<!-- /.modal -->



<!-- 材料列表的modal --> 
<div class="modal fade bs-example-modal-sm"  id="seasModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	<div class="modal-dialog ">
		<div class="modal-content">
		 <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">材料列表</h4>
         </div>
			<div class="modal-body">
				<table id="dynamic-table"
					class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th class="center" style="width: 50px;">序号</th>
							<th class='center'>材料名称</th>
							<th class='center'>材料类型</th>
							<th class='center'>重量</th>
							<th class='center'>创建时间</th>
							<th class='center'>更新时间</th>
							<th class='center'>备注</th>
							<th class='center'>操作</th>
						</tr>
					</thead>
					<tbody id="foolList">
						<!-- 开始循环 -->
							<tr v-cloak v-for="seas in foolseasList">
								<td class='center'>{{seas.id}}</td>
								<td class="center">{{seas.seasTitle }}</td>
								<td class="center">
										<!-- 0：主料，1.配料，2.调料，3.其它搭配的 --> 
										<span class="red" v-if="seas.seasSelect ==0">主料</span>
										<span v-if="seas.seasSelect ==1" >配料</span>
										<span v-if="seas.seasSelect ==2">调料</span>
										<span v-if="seas.seasSelect ==3">其他</span> 
								</td>
								<td calss="center" style="text-align: center;">{{seas.seasWeigetKg}}kg/{{seas.seasWeigetCatty}} 斤</td>
								<td calss="center" style="text-align: center;"><span>{{ dateFormat(seas.created)}}</span></td>
								<td calss="center" style="text-align: center;"><span>{{ dateFormat(seas.updated)}}</span></td>
								<td calss="center" style="text-align: center;">{{seas.seasMsg == null?"无":seas.seasMsg}}</td>
								<td calss="center " style="text-align: center;width: 50px;margin:auto" @click="deleteFoolSeasByid(seas.id)">
									<a class="red"><i title="删除" class="ace-icon fa fa-trash-o bigger-130"></i></a>
								</td>
							</tr>

					</tbody>
				</table>
				</div>
		 	 <div class="modal-footer">
               <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
               <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addSeasModal" onclick="addFoolSeasView()">添加材料</button>
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
	<script type="text/javascript" src="static/js/myjs/fool/foolList.js"></script>


</body>
</html>