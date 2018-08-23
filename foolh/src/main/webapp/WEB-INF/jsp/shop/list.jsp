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
	.layui-table-body layui-table-main layui-table-box{
		text-align: center;
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
										<input class="nav-search-input input-sm" autocomplete="off" id=shopTitle type="text" name="shopTitle"  placeholder="这里输入店铺名">
										<i class="ace-icon fa fa-search nav-search-icon"></i>
									</span>
									</div>
								</td>
								<!-- 关键字类型 -->
								<td style="vertical-align:top;padding-left:2px;">
								 	<select class="nav-search-input" name="searchType" id="searchType" data-placeholder="关键字类型"  style="border: 1px solid #6fb3e0;border-radius: 4px !important;" onchange="changeSearchType();">
										<option selected="selected" value="0">店铺名</option>
										<option value="1">店铺ID</option>
										<option value="2">店铺创建日期</option>
										<option value="3">添加用户</option>
									</select>
								</td>
								
								<!-- 菜品类型   1:饭店，2. 蔬菜配送，3.水果4.调料干杂，5. 水产，6.海鲜，7.其它 默认0-->
								<td style="vertical-align:top;padding-left:2px;">
								 	<select class="nav-search-input" name="is_check" id="is_check" data-placeholder="请选择状态"  style="border: 1px solid #6fb3e0;border-radius: 4px !important;" onchange="gotoByAjax(page, rows,100);">
										<option selected="selected" value="0">全部</option>
										<option value="1">饭店</option>
										<option value="2">蔬菜配送</option>
										<option value="3">水果</option>
										<option value="4">调料干杂</option>
										<option value="5">水产</option>
										<option value="6">海鲜</option>
										<option value="7">其它</option>
									</select>
								</td>
								<td style="vertical-align:top;padding-left:2px;">
								 	<select class="nav-search-input" name="status" id="status" title="请选择状态"  style="border: 1px solid #6fb3e0;border-radius: 4px !important;" onchange="gotoByAjax(page,rows,100);">
										<option selected="selected" value="">全部</option>
										<option value="0">未审核</option>
										<option value="1">已审核</option>
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
											<th class='center'>店铺名称</th>
											<th class='center'>店铺老板/联系方式</th>
											<th class='center'>店铺老板</th>
											<th class='center'>店铺地址</th>
											<th class='center'>店铺介绍</th>
											<th class='center'>创建时间</th>
											<th class='center'>店铺类别</th>  
											<!-- 只有饭店才能有下面两项选项 -->
											<th class='center' >店铺私房菜</th> 
											<th class='center' >绑定店铺</th> 
											<th class='center'style="width:75px;" >审核状态</th> 
											<th class='center' style="width: 120px;">操作</th>
										</tr>
									</thead>
									<tbody id="shopList">
										<!-- 开始循环 -->
										<tr v-cloak v-for="ser in list">
											<td class='center' style="width: 30px;">
												<label><input type='checkbox' name='ids' :value="ser.id" class="ace" />
													<span class="lbl"></span>
												</label>
											</td>
											<td class='center'>{{ser.id }}</td>
											<td class='center'>{{ser.shopTitle }} </td>
											<td class='center'>{{ser.shopBossName }} / {{ser.shopPhone }} </td>
											<td class='center'>{{ser.shopBossName }}</td>
											<td class='center'>{{ser.shopAddress }} </td>
											<td calss="center" style="text-align: center;">{{ ser.shopMsg == null ? "无":ser.shopMsg}} </td>
											<td calss="center" style="text-align: center;"><span> {{ dateFormat(ser.created)}}</span></td>
											<td class="center">
												<!-- 1.饭店，2. 蔬菜配送，3.水果4.调料干杂，5. 水产，6.海鲜，7.其它 默认0 --> 
												<span v-if="ser.shopType ==1" >饭店</span>
												<span v-if="ser.shopType ==2">蔬菜配送</span>
												<span v-if="ser.shopType ==3">水果</span> 
												<span v-if="ser.shopType ==4">调料干杂</span> 
												<span v-if="ser.shopType ==5">水产</span> 
												<span v-if="ser.shopType ==6">海鲜</span> 
												<span v-if="ser.shopType ==7">其他</span> 
											</td>
											<!-- 只有饭店才有私房菜 -->
											<td calss="center" style="text-align: center;" v-if="ser.shopType ==1"><a class="glyphicon glyphicon-eye-open" @click="getFoolListByShopId(ser.id)" title="点我查看私房菜清单" ></a></td>
											<td calss="center" style="text-align: center;" v-if="ser.shopType !=1">无</td>
											<!-- 查看绑定的所有店铺 -->
											<td calss="center" style="text-align: center;"><a class="glyphicon glyphicon-eye-open" @click="getBindShopByShopId(ser.id)" title="查看绑定店铺详情" ></a></td>
											<td calss="center" style="text-align: center;width:60px" v-if="ser.shopStatus == 1" @click="changeShopStatus(ser.shopStatus,ser.id,$event)"><a class="btn btn-mini btn-primary" title="更改审核状态">已审核</a></td>
											<td calss="center" style="text-align: center;width:60px"  v-if="ser.shopStatus == 0" @click="changeShopStatus(ser.shopStatus,ser.id,$event)"><a class="btn btn-mini btn-danger"  title="更改审核状态">未审核</a></td>
											<td class='center'>
												<div class="hidden-sm hidden-xs action-buttons">
													<a class="green" @click="editshop(ser.id)"> <i
														class="ace-icon fa fa-pencil-square-o bigger-130"
														title="修改"></i>
													</a> <a class="red" @click="delshop(ser.id)"> <i
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
										<a class="btn btn-sm btn-success" onclick="delShops();">批量删除</a>
										<a class="btn btn-sm btn-success" onclick="addShop();">新增</a>
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
<div class="modal fade bs-example-modal-sm"  id="ImgModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-body">
			<!-- ser.foolImgTitle -->
				<img alt="菜品小图" src="企业简介.png" style="width: 100%;height: 100%">
			</div>
		</div>
	</div>
</div>


<!-- 消息模态框（Modal） -->
<div class="modal fade bs-example-modal-sm" id="msgModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-body"><span>没有店铺信息！！</span></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary"  onclick="addBindShop()">绑定店铺</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<!-- /.modal -->



<!-- 绑定店铺列表的modal --> 
<div class="modal fade"  id="shopModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	<div class="modal-dialog " style="width:900px;overflow:auto; ">
		<div class="modal-content">
		 <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myShopModalLabel">绑定店铺列表</h4>
         </div>
			<div class="modal-body">
		<table class="layui-hide" id="LAY_table_user" lay-filter="useruv"></table>
		<script type="text/html" id="barDemo">
    	     <a class="btn btn-danger btn-mini" lay-event="del">取消绑定</a>
		</script>
			
			<!-- 
				<table id="dynamic-table"
					class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th class="center" style="width: 50px;">序号</th>
							<th class='center'>店铺名称</th>
							<th class='center'>店铺老板/联系方式</th>
							<th class='center'>店铺地址</th>
							<th class='center'>店铺详情介绍</th>
							<th class='center'>创建时间</th>
							<th class='center'>店铺类别</th>
							<th class='center'>操作</th>
						</tr>
					</thead>
					<tbody id="foolList"  v-if="shopList[0]">
						开始循环
							<tr v-cloak  v-for="shop in shopList">
								<td class='center'>{{shop.id}}</td>
								<td class="center">{{shop.shopTitle }}</td>
								<td class="center">{{shop.shopBossName }} / {{shop.shopPhone }}</td>
								<td class="center">{{shop.shopAddress }}</td>
								<td class="center">{{shop.shopMsg == null ? "无" : shop.shopMsg}}</td>
								<td class="center">{{ dateFormat(shop.created)}}</td>
								<td class="center">
								1.饭店，2. 蔬菜配送，3.水果4.调料干杂，5. 水产，6.海鲜，7.其它 默认0 
									<span v-if="shop.shopType ==1" >饭店</span>
									<span v-if="shop.shopType ==2">蔬菜配送</span>
									<span v-if="shop.shopType ==3">水果</span> 
									<span v-if="shop.shopType ==4">调料干杂</span> 
									<span v-if="shop.shopType ==5">水产</span> 
									<span v-if="shop.shopType ==6">海鲜</span> 
									<span v-if="shop.shopType ==7">其他</span> 
								</td>
								<td>
								删除此店铺绑定的店铺
								<a class="red" id="cancelShopBtn"><i title="取消绑定" class="ace-icon fa fa-trash-o bigger-130" @click="deleteShopByShopId(shop.id)"></i></a>
								</td>
							</tr>

					</tbody>
				</table> -->
				</div>
		 	 <div class="modal-footer">
               <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
               <button type="button" class="btn btn-primary"  id="addSendShopBtn" @click="getBindShopListByShopId()">绑定其他店铺</button>
           	 </div>
		</div>
	</div>
</div>	


<!-- 添加绑定店铺列表的modal --> 
<div class="modal fade"  id="bindShopModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	<div class="modal-dialog " style="width:850px;overflow:auto; ">
		<div class="modal-content">
		 <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myShopModalLabel">添加绑定店铺列表</h4>
         </div>
			<div class="modal-body">
			<div class="demoTable1">
				    		搜索店铺：
				    <div class="layui-inline">
				        <input class="layui-input" name="keyword" id="demoReload1" placeholder="店铺名" autocomplete="off">
				    </div>
				    <button class="layui-btn" data-type="reload">搜索</button>
				</div>
			<table class="layui-hide" id="bingShop" lay-filter="bingShop"></table>
		<script type="text/html" id="barDemo1">
    	    <a class="btn btn-primary btn-mini" lay-event="bind">绑定</a>
		</script>
			
				<!-- <table id="dynamic-table"
					class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th class="center" style="width: 50px;">序号</th>
							<th class='center'>店铺名称</th>
							<th class='center'>店铺老板/联系方式</th>
							<th class='center'>店铺地址</th>
							<th class='center'>店铺详情介绍</th>
							<th class='center'>创建时间</th>
							<th class='center'>店铺类别</th>
							<th class='center'>操作</th>
						</tr>
					</thead>
					<tbody id="foolList">
						开始循环
							<tr v-cloak v-for="shop in shopList">
								<td class='center'>{{shop.id}}</td>
								<td class="center">{{shop.shopTitle }}</td>
								<td class="center">{{shop.shopBossName }} / {{shop.shopPhone }}</td>
								<td class="center">{{shop.shopAddress }}</td>
								<td class="center">{{shop.shopMsg == null ? "无" : shop.shopMsg}}</td>
								<td class="center">{{ dateFormat(shop.created)}}</td>
								<td class="center">
								1.饭店，2. 蔬菜配送，3.水果4.调料干杂，5. 水产，6.海鲜，7.其它 默认0 
									<span v-if="shop.shopType ==1" >饭店</span>
									<span v-if="shop.shopType ==2">蔬菜配送</span>
									<span v-if="shop.shopType ==3">水果</span> 
									<span v-if="shop.shopType ==4">调料干杂</span> 
									<span v-if="shop.shopType ==5">水产</span> 
									<span v-if="shop.shopType ==6">海鲜</span> 
									<span v-if="shop.shopType ==7">其他</span> 
								</td>
								<td>
								与此店铺进行绑定
								<a class="red" id="bindShopBtn"><i title="绑定此店铺" class="glyphicon glyphicon-plus" @click="BindShopByShopId(shop.id)"></i></a>
								</td>
							</tr>

					</tbody>
				</table> -->
				</div>
		 	 <div class="modal-footer">
               <button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
           	 </div>
		</div>
	</div>
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
	<script type="text/javascript" src="static/js/myjs/shop/foolShop.js"></script>
</body>
</html>