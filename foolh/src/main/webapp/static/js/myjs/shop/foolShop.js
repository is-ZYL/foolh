// 截取，得到项目名称
var pathName = window.document.location.pathname;
var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);

// 初始化所有数据
var page = 1;
var rows = 10;
var type = 100;
var total = 0;
var list = []; // 店铺list数据
var diag;// 弹窗
// 设置关键字搜索初始默认值 店铺名，店铺创建时间，店铺类型，店铺ID，店铺老板名称/手机号，审核状态
var shopTitle = "", created = "", is_check = "", shopId = 0, addUser = "",status="";
var sendShopId;//配送店铺id
var bindShopId;//绑定店铺id
$(top.hangge());


$(function(){
	//设置模态框隐藏时，所有数据清零，防止数据错误
	$("#shopModal").on('hide.bs.modal', function () {
		shopModal.shopList=[];
	});
	$("#bindShopModal").on('hide.bs.modal', function () {
		bindShopModal.shopList=[];
	});
})


/**
 * 新增店铺
 * 
 * @returns
 */
function addShop() {
	top.jzts();
	var diag = new top.Dialog();
	diag.Drag = false;
	diag.Title = "编辑";
	diag.URL = projectName + '/page/shop/add';
	diag.Width = 450;
	diag.Height = 552;
	diag.CancelEvent = function() { // 关闭事件
		diag.close();
	};
	diag.show();
}
/**
 * 批量删除店铺
 * 
 * @returns
 */
function delShops() {
	if (!$(":input[name='ids']").is(":checked")) {
		layer.msg("未选择任何店铺", {
			icon : 6
		});
		$("#zcheckbox").tips({
			side : 3,
			msg : '点这里全选',
			bg : '#AE81FF',
			time : 2
		});
	} else {
		bootbox.confirm("确定要删除选中店铺吗?", function(result) {
			var ids = [];
			$("#shopList").find(":input[name='ids']:checked").each(function() {
				ids.push($(this).val());
			})
			if (result && ids.length != 0) {
				var url = projectName + "/foolshop/DeleteShops?ids=" + ids;
				$.ajax({
					url : url,
					type : "get",
					success : function(data) {
						// 成功，刷新当前页面
						window.location.reload();
					},
					error : function() {
						layer.msg("服务器异常，请稍后再试", {
							icon :5
						});
						window.location.reload();
					}
				});
			}
		});
	}
}
/**
 * 构建分页条
 * 
 * @param result
 * @returns
 */
function build_page_nav(result) {
	var index = layer.load(2, {
		time : 10 * 1000
	});
	// 判断result是否为空
	if (!$.isEmptyObject(result)) {
		var firstPage = $("<li></li>").append($("<a></a>").append("首页"));
		var upPage = $("<li></li>").append($("<a></a>").append("&laquo;"));
		var nextPage = $("<li></li>").append($("<a></a>").append("&raquo;"));
		var lastPage = $("<li></li>").append($("<a></a>").append("末页"));
		// 跳转页面的输入框
		var inputNums = $("<li></li>")
				.append(
						$(
								"<input type='number' id='toGoPage' style='width:55px;height:34px;text-align:center;margin-top:1px' min='1' placeholder='页码'/>")
								.append("末页"));
		// 跳转页面的按钮
		var inputNumsButton = $("<li></li>")
				.append(
						$(
								"<a style='float:right;height:34px;' class='btn btn-mini btn-success' onclick='gotoPage();'></a>")
								.append("跳转"));
		// 总共条数
		var totalInfo = $("<li></li>").append(
				$("<a></a>").append("共").append(
						$("<font color='red'>" + result.total + "</font>"))
						.append("条"));
		// 总共页数
		var pageNumsInfo = $("<li></li>").append(
				$("<a></a>").append("共" + result.pages + "页"));
		// 每页显示条数选择框
		var pageSizeChoose = $("<li></li>")
				.append(
						$(
								"<select title='显示条数'  id='changeCount' style='margin-left:1px;height:34px;'  onchange='changeCount(this.value)'></select>")
								.append(
										"<option selected='selected' value='10'>10</option><option value='20'>20</option><option value='30'>30</option><option value='40'>40</option><option value='50'>50</option><option value='60'>60</option><option value='70'>70</option><option value='80'>80</option><option value='90'>90</option><option value='100'>100</option>"));

		var ul = $("#pageNums");
		// 先清空之前的数据
		ul.empty();
		var nums = result.navigatepageNums;

		// 总条数、首页 和 上一页
		ul.append(totalInfo).append(firstPage).append(upPage);

		// 判断是否为第一页 为true则禁用 为false则添加点击事件
		if (result.isFirstPage == true) {
			upPage.addClass("disabled");
			firstPage.addClass("disabled");
		} else {
			firstPage.click(function() {
				gotoByAjax(1, rows, type);
			});
			upPage.click(function() {
				gotoByAjax(result.prePage, rows, type);
			});
		}

		// 判断是否为最后一页 为true则禁用 为false则添加点击事件
		if (result.isLastPage == true) {
			nextPage.addClass("disabled");
			lastPage.addClass("disabled");
		} else {
			nextPage.click(function() {
				gotoByAjax(result.nextPage, rows, type);
			});
			lastPage.click(function() {
				gotoByAjax(result.lastPage, rows, type);
			});
		}

		$.each(nums, function(index, item) {
			var numLi;
			if (result.pageNum == item) {
				numLi = $("<li></li>").addClass("active").append(
						$("<a></a>").append(item));
			} else {
				numLi = $("<li></li>").append($("<a ></a>").append(item));
			}
			numLi.click(function() {
				gotoByAjax(item, rows, type);
			})
			if (result.pageNum != item) {
				// 给每个li添加点击事件 onclick='gotoByAjax("+item+","+rows+","+type+");'
			}
			ul.append(numLi);
		});
		// 下一页 、末页、页数、每页展示数据的条数、跳转页面输入框及跳转按钮
		ul.append(nextPage).append(lastPage).append(pageNumsInfo).append(
				pageSizeChoose).append(inputNums).append(inputNumsButton);
		layer.close(index);
	} else {

	}
}
/**
 * 更改每页显示条数
 * 
 * @param value
 * @returns
 */
function changeCount(value) {
	$("#zcheckbox").attr("checked", false);
	// 将选中的全部取消
	$("input[name='ids']:checkbox").each(function() {
		$(this).prop("checked", false);
	});
	gotoByAjax(1, value, type);
	$("#changeCount").val(value);
	menuList.rows = value;
	rows = value;
}
/**
 * 跳转到指定页码去
 * 
 * @returns
 */
function gotoPage() {
	var pageNum = $("#toGoPage").val();
	// 判断输入的内容是否合格 不能是当前页，为空 ，以及大于最后一页的数
	if (pageNum != "" && $.trim(pageNum).legth != 0
			&& pageNum != pageInfo.pageNum && pageNum <= pageInfo.lastPage) {
		gotoByAjax(pageNum, rows, type);
	} else {
		layer.msg("请选择正确的页码！！!");
		$("#toGoPage").val("");
	}
}
/**
 * 请求菜品数据
 * 
 * @param page
 * @param rows
 * @param type
 * @returns
 */
function gotoByAjax(page, rows, type) {
	var index = layer.load(2, {
		time : 10 * 1000
	});
	var searchType = $("#searchType").val();
	if (searchType == 0) {
		shopTitle = $("#shopTitle").val().length == 0 ? "" : $("#shopTitle").val();
		// 获取过后将其他关键字值进行初始化
		shopId = 0;
		created = "";
		addUser = "";
	} else if (searchType == 1) {
		shopId = $("#shopId").val().length == 0 ? 0 : $("#shopId").val();
		shopTitle = "";
		created = "";
		addUser = "";
	} else if (searchType == 2) {
		created = $("#created").val().length == 0 ? "" : $("#created").val();
		addUser = "";
		shopTitle = "";
		shopId = 0;
	} else if (searchType == 3) {
		addUser = $("#addUser").val().length == 0 ? "" : $("#addUser").val();
		shopId = 0;
		shopTitle = "";
		created = "";
	}
	is_check = $("#is_check").val();
	status = $("#status").val();
	var allInfo = [ page, rows, type, shopTitle, is_check, created, shopId,addUser,status];
	$.ajax({
		url : projectName + '/foolshop/getShopList?allInfo=' + allInfo,
		type : 'GET',
		success : function(d) {
			layer.close(index);
			// Vue.set(target,key，value); 可通过此方式直接进行对vue里面的数据更新或者覆盖
			// target：要更改的数据源(可以是对象或者数组) key：要更改的具体数据(可以是字符串和数字) value ：重新赋的值
			menuList.list = d.list;
			menuList.rows = rows;
			menuList.page = page;
			menuList.total = d.total;
			pageInfo = d;
			total = d.total;
			list = d.list;
			build_page_nav(d);
			$("#changeCount").val(rows);
		},
		error : function() {
			layer.close(index);
			console.log("服务异常" + 222)
		}
	})
}

var menuList = new Vue({
	el : '#zhongxingss',
	data : {
		list : [],
		page : 1,
		rows : 10,
		type : 100,
		total : 0,
		i:true
	},
	created : function() {
		var _this = this;
		gotoByAjax(_this.page, _this.rows, _this.type);
	},
	methods : { 
		editshop : function(id) {
			top.jzts();
			var diag = new top.Dialog();
			diag.Drag = true;
			diag.Title = "店铺详情";
			diag.URL = projectName + '/foolshop/foolShopMenuEdit?shopId=' + id;
			diag.Width = 469;
			diag.Height = 510;
			diag.CancelEvent = function() { // 关闭事件
				diag.close();
			};
			diag.show();
		},
		delshop: function(id) {
			bootbox.confirm("确定要删除此店铺吗?",
					function(result) {
						if (result) {deleteShopByid(id)}
					});
		},
		chooseAll : function() {
			if ($("#zcheckbox").is(":checked")) {
				$("input[name='ids']:checkbox").each(function() {
					$(this).prop("checked", true);
				});
			} else {
				$("input[name='ids']:checkbox").each(function() {
					$(this).prop("checked", false);
				});
			}
		},
		checkUserByID : function(id) {// 查看用户信息
			top.jzts();
			var diag = new top.Dialog();
			diag.Drag = true;
			diag.Title = "用户详情";
			diag.URL = projectName + '/user/view?USER_ID=' + id;
			diag.Width = 469;
			diag.Height = 510;
			diag.CancelEvent = function() { // 关闭事件
				diag.close();
			};
			diag.show();
		},
		getFoolListByShopId : function(id) {
			// 利用bootstrap的modal和layer结合展现菜品数据 实时更新数据
			$("#shopFoolModal").modal("show");
			layui.use('table', function() {
				let table = layui.table;
				table.render({
					elem : '#demo',
					url : projectName+ '/foolshop/getFoolListByShopId?foolShopId=' + id // 数据接口
					,page : true // 开启分页
					,cols : [ [ // 表头
					{field : 'id',title : 'ID',minWidth : 50,sort : true,fixed : 'left',offset : 'auto'}
					, {field : 'foolTitle',title : '菜品名',minWidth : 120,offset : 'auto'}
					, {field : 'foolMakeTime',title : '制作时间/分钟',minWidth : 120,sort : true,offset : 'auto'}
					, {field : 'foolPrice',title : '价格/元',minWidth : 120,sort : true,offset : 'auto'}
					, {field : 'created',title : '创建时间',minWidth : 120,sort : true,offset : 'auto'}
					, {field : 'updated',title : '更新时间',minWidth : 100,sort : true,offset : 'auto'}
					, {field : 'userName',title : '菜品添加用户',minWidth : 130,offset : 'auto'}
					, {field : 'foolMsg',title : '菜品备注',minWidth : 120,offset : 'auto'} 
					] ]
			/*	,response: {
				    statusName: 'code' //数据状态的字段名称，默认：code
				    ,statusCode: 200 //成功的状态码，默认：0
				    ,msgName: 'msg' //状态信息的字段名称，默认：msg
				    ,countName: 'count' //数据总数的字段名称，默认：count
				    ,dataName: 'data' //数据列表的字段名称，默认：data
				}*/
					,limit : 10// 每页显示条数
				});
			});
		},getBindShopByShopId:function(id){//获取当前店铺绑定的所有店铺（包括饭店绑定其他的配送店铺，以及配送店铺绑定的饭店店铺......）
			//  $("#cancelShopBtn").show();
			//  $("#bindShopBtn").hide();
			var _this = this;
			var index = layer.load(2, {time : 10 * 1000	});
			$("#shopModal").modal("show");
			 bindShopId = id;//绑定店铺id
			 layui.use('table', function() {
			 let a = layui.table;
			 a.render({
		          elem: '#LAY_table_user'
		          ,url: projectName+"/foolshop/getBindShopByShopId?id="+id
		          ,cols: [[
		              {checkbox: true, fixed: true}
		              ,{field:'id', title: 'ID', minWidth:50, sort: true, fixed: true,offset : 'auto'}
		              ,{field:'shopTitle', title: '店铺名', minWidth:80, sort: true,offset : 'auto'}
		              ,{field:'shopBossName', title: '老板', minWidth:80, sort: true,offset : 'auto'}
		              ,{field:'shopPhone', title: '店铺联系电话', minWidth:100, sort: true,offset : 'auto'}
		              ,{field:'shopAddress', title: '店铺地址', minWidth:100,offset : 'auto'}
		              ,{field:'shopMsg', title: '店铺介绍', minWidth:100,offset : 'auto'}
		              ,{field:'created', title: '创建时间', minWidth:100,offset : 'auto',templet: function(obj){
		                  return _this.dateFormat(obj.created)
		              }}
		              ,{field:'shopType', title: '店铺类型', minWidth:100,offset : 'auto',templet:function(obj){
		            	  //1.饭店，2. 蔬菜配送，3.水果4.调料干杂，5. 水产，6.海鲜，7.其它 默认0 
		            	  switch (obj.shopType){
		            	  case 1:
		            		 return "饭店";break; 
		            	  case 2:
		            		  return "蔬菜配送";break; 
		            	  case 3:
		            		  return "水果";break; 
		            	  case 4:
		            		  return "调料干杂";break; 
		            	  case 5:
		            		  return "水产";break; 
		            	  case 6:
		            		  return "海鲜";break; 
		            	  case 7:
		            		  return "其它";break; 
		            	  }
		              }}
		              ,{field:'right', title: '操作', minWidth:100,toolbar:"#barDemo",offset : 'auto'}
		          ]] 
			 	/*	,response: {
					     statusName: 'code' //数据状态的字段名称，默认：code
					    ,statusCode: 200 //成功的状态码，默认：0
					    ,msgName: 'msg' //状态信息的字段名称，默认：msg
					    ,countName: 'count' //数据总数的字段名称，默认：count
					    ,dataName: 'data' //数据列表的字段名称，默认：data
					}*/
			 		,id: 'tableReload'
			 		,limit : 10// 每页显示条数
			 		,page: true
		      });
			 //添加点击事件
			 a.on("tool(useruv)",function(obj){
				 var data = obj.data;
				 if(obj.event === "del"){
					 layer.confirm('真的要取消店铺绑定么', function(index){
						 shopModal.deleteShopByShopId(data.id)
						 obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
						 layer.close(index);
					 })
				 }	
			 })
		 })
		layer.close(index);
		}
		// 时间格式化	
		,dateFormat : function(time) {
			var date = new Date(time);
			var year = date.getFullYear();
			/*
			 * 在日期格式中，月份是从0开始的，因此要加0 使用三元表达式在小于10的前面加0，以达到格式统一 如 09:11:05
			 */
			var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1)
					: date.getMonth() + 1;
			var day = date.getDate() < 10 ? "0" + date.getDate() : date
					.getDate();
			var hours = date.getHours() < 10 ? "0" + date.getHours() : date
					.getHours();
			var minutes = date.getMinutes() < 10 ? "0" + date.getMinutes()
					: date.getMinutes();
			var seconds = date.getSeconds() < 10 ? "0" + date.getSeconds()
					: date.getSeconds();
			// 拼接
			return year + "-" + month + "-" + day + " " + hours + ":" + minutes
					+ ":" + seconds;
		},//更改店铺的审核状态  0未审核   1已审核
		changeShopStatus:function(shopStatus,id,e){
		 layer.confirm('确认更改审核状态？', function(index){
			$.ajax({
				url:projectName+"/foolshop/changeShopStatus",
				data:{"shopStatus":shopStatus,"id":id},
				type:"post",
				success:function(data){
					var el = e.target ;
					layer.msg("审核状态更新成功",{icon:6})
					gotoByAjax(page, rows, type);
				},error:function(){
					layer.msg("审核状态更新失败",{icon:5})
				}
				
			})
			 })
		},showTextIfOut:function(event){
			let _this =this;
			let e = event.currentTarget;
			let td_width = $(e).width();//td列的宽度
			let word_width = $(e)[0].scrollWidth;//文本宽度.
			let res = word_width > td_width;
			if(_this.i && res){
				_this.index = layer.tips($(e).text(),$(e),{
					tips: [3, '#0FA6D8'], //设置tips方向和颜色 类型：Number/Array，默认：2 tips层的私有参数。支持上右下左四个方向，通过1-4进行方向设定。如tips: 3则表示在元素的下面出现。有时你还可能会定义一些颜色，可以设定tips: [1, '#c00']
					tipsMore: false, //是否允许多个tips 类型：Boolean，默认：false 允许多个意味着不会销毁之前的tips层。通过tipsMore: true开启
					time:0 //2秒后销毁，还有其他的基础参数可以设置   0表示不销毁
				})
				_this.i=!_this.i;
			}else if(!_this.i){
				layer.close(_this.index);
				_this.i=!_this.i;
			}
		}
	}

})

/**
 * 根据菜品id查询所有材料
 * 
 * @param id
 * @returns
 */
function checkFoolSeasByFoolId(id) {
	// 将用户点击获取到的id保存 方便进行添加操作
	foolIdBySeas = id;
	$.ajax({
		url : projectName + '/foolseas/getFoolSeasListByFoolId?foolId=' + id,
		type : "get",
		success : function(data) {
			if (data.length == 0) {
				$("#msgModal").modal("show");
			} else {
				$("#seasModal").modal("show");
				// foolShop.foolseasList = data;
			}
		},
		error : function() {
			layer.msg("查询菜品异常！！！ 请稍后重试", {
				icon : 5
			});
		}

	})

}


  var shopModal = new Vue({
	  el : '#shopModal',
	  data : { shopList : [] },
	  methods : {
		  // 时间格式化 
	  dateFormat : function(time) { 
		  var date = new Date(time);
		  var year = date.getFullYear();
		  //在日期格式中，月份是从0开始的，因此要加0 使用三元表达式在小于10的前面加0，以达到格式统一 如 09:11:05
		  var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) :  date.getMonth() + 1;
		  var day = date.getDate() < 10 ? "0" + date.getDate() : date .getDate(); 
		  var hours = date.getHours() < 10 ? "0" + date.getHours() : date .getHours();
		  var minutes = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes(); 
		  var seconds = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds(); // 拼接
		  return year + "-" + month+ "-" + day + " " + hours + ":" + minutes + ":" + seconds;
  }
	,deleteShopByShopId: function(id) { //取消店铺绑定  oldId 绑定店铺 newId 被绑定店铺
		var index = layer.load(2, {time : 10 * 1000	});
		 $.ajax({
			  url:projectName+"/foolshop/cancelBindShopByShopId?oldId="+bindShopId+"&newId="+id,
			  type:"post",
			  success:function(data){
				  layer.close(index);
				  menuList.getBindShopByShopId(bindShopId);
				  layer.msg("取消绑定成功",{icon:6});
			  },error:function(){
				  layer.close(index);
				  layer.msg("取消绑定店铺失败！！！ 请稍后重试",{icon:5});
			  }
		  })
	}
	,getBindShopListByShopId:function(){//当前店铺添加绑定店铺
		var index = layer.load(2, {time : 10 * 1000	});
		$("#bindShopModal").modal("show");
		var _this =this;
		 layui.use('table', function() {
		 let b = layui.table;
			 b.render({
	          elem: '#bingShop'
	          ,url: projectName+"/foolshop/getBindShopListByShopId?id="+bindShopId
	          ,cols: [[
	               {field:'id', title: 'ID', minWidth:80, sort: true, fixed: true,offset : 'auto'}
	              ,{field:'shopTitle', title: '店铺名', minWidth:80, sort: true,offset : 'auto'}
	              ,{field:'shopBossName', title: '老板', minWidth:80, sort: true,offset : 'auto'}
	              ,{field:'shopPhone', title: '店铺联系电话', minWidth:100, sort: true,offset : 'auto'}
	              ,{field:'shopAddress', title: '店铺地址', minWidth:100,offset : 'auto'}
	              ,{field:'shopMsg', title: '店铺介绍', minWidth:100,offset : 'auto'}
	              ,{field:'created', title: '创建时间', minWidth:100,offset : 'auto',templet: function(obj){
	                  return _this.dateFormat(obj.created)
	              }}
	              ,{field:'shopType', title: '店铺类型', minWidth:100,offset : 'auto',templet:function(obj){
	            	  //1.饭店，2. 蔬菜配送，3.水果4.调料干杂，5. 水产，6.海鲜，7.其它 默认0 
	            	  switch (obj.shopType){
	            	  case 1:
	            		 return "饭店";break; 
	            	  case 2:
	            		  return "蔬菜配送";break; 
	            	  case 3:
	            		  return "水果";break; 
	            	  case 4:
	            		  return "调料干杂";break; 
	            	  case 5:
	            		  return "水产";break; 
	            	  case 6:
	            		  return "海鲜";break; 
	            	  case 7:
	            		  return "其它";break; 
	            	  }
	              }}
	              ,{field:'right', title: '操作', minWidth:100,toolbar:"#barDemo1",offset : 'auto'}
	          ]]
			/* ,response: {
				    statusName: 'code' //数据状态的字段名称，默认：code
				    ,statusCode: 200 //成功的状态码，默认：0
				    ,msgName: 'msg' //状态信息的字段名称，默认：msg
				    ,countName: 'count' //数据总数的字段名称，默认：count
				    ,dataName: 'data' //数据列表的字段名称，默认：data
				}*/
			 	,id: 'testReload'
		 		,limit : 10// 每页显示条数
		 		,page: true
	      });
		 //添加点击事件
		 b.on("tool(bingShop)",function(obj){
			 var data = obj.data;
			 if(obj.event === "bind"){
				 layer.confirm('确认绑定么', function(index){
					 bindShopModal.BindShopByShopId(data.id);
					 layer.close(index);
				 })
			 }	
		 })
			 var $ = layui.$, active = {
            reload: function(){
                var demoReload = $('#demoReload1');

                b.reload('testReload', {
                    where: {
                        keyword: demoReload.val()
                    }
                });
            }}
		 
		 $('.demoTable1 .layui-btn').on('click', function(){
	            var type = $(this).data('type');
	            active[type] ? active[type].call(this) : '';
	        });
	 })
	 layer.close(index);
	  }
  } 
 })
 
  
  var bindShopModal = new Vue({
	  el : '#bindShopModal',
	  data : { shopList : [],id:0},
	  methods : {
		  // 时间格式化 
		  dateFormat : function(time) { 
			  var date = new Date(time);
			  var year = date.getFullYear();
			  //在日期格式中，月份是从0开始的，因此要加0 使用三元表达式在小于10的前面加0，以达到格式统一 如 09:11:05
			  var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) :  date.getMonth() + 1;
			  var day = date.getDate() < 10 ? "0" + date.getDate() : date .getDate(); 
			  var hours = date.getHours() < 10 ? "0" + date.getHours() : date .getHours();
			  var minutes = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes(); 
			  var seconds = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds(); // 拼接
			  return year + "-" + month+ "-" + day + " " + hours + ":" + minutes + ":" + seconds;
		  }
	  	,BindShopByShopId:function(id){
	  		 var index = layer.load(2, {time : 10 * 1000	});
	  		  $.ajax({//oldId 绑定id  newId被绑定id 
	  			  url:projectName+"/foolshop/bindShopByShopId?oldId="+bindShopId+"&newId="+id,
	  			  type:"post",
	  			  success:function(data){
	  				 layer.close(index);
	  				 layer.msg("绑定店铺成功",{icon:6});
	  				 $("#shopModal").modal("hide");
	  				 $("#bindShopModal").modal("hide");
	  			  },error:function(){
	  				layer.close(index);
	  				  layer.msg("绑定店铺失败！！！ 请稍后重试",{icon:5});
	  			  }
	  		  })
	  		  
	  } 
	  } 
  })
  
/**
 * 改变关键字类型
 * 
 * @returns
 */
function changeSearchType() {
	var i = $("<i class='ace-icon fa fa-search nav-search-icon'></i>")
	var ByShopTitle = $("<input class='nav-search-input input-sm' autocomplete='off' id='shopTitle' type='text' name='shopTitle' value='' placeholder='这里输入店铺名'>");
	var ByAddUser = $("<input class='nav-search-input input-sm' autocomplete='off' id='addUser' type='text' name='addUser' value='' placeholder='用户名/手机号'>");
	var ByshopId = $("<input class='nav-search-input input-sm' autocomplete='off'id='shopId' type='number' name='shopId' min='1' value='' placeholder='这里输入店铺ID'>");
	var Bycreated = $("<input  id='created' type='date'  class='form_datetime input-sm' data-date-format='yyyy-mm-dd hh:ii' style='border: 1px solid #6fb3e0;border-radius: 4px !important;' name='created'  placeholder='创建日期'>");
	var searchType = $("#searchType").val();

	// keywords 店铺名 addUser 用户名/手机号 shopId 店铺ID created 创建日期
	if (searchType == 0) {
		$("#typeViews").empty();
		$("#typeViews").append(ByShopTitle).append(i);
		shopTitle = $("#shopTitle").val().length == 0 ? "" : $("#shopTitle")
				.val();
		gotoByAjax(page, rows, type);
	} else if (searchType == 1) {
		$("#typeViews").empty();
		$("#typeViews").append(ByshopId).append(i);
		shopId = $("#shopId").val().length == 0 ? 0 : $("#shopId").val();
		gotoByAjax(page, rows, type);
	} else if (searchType == 2) {
		$("#typeViews").empty();
		$("#typeViews").append(Bycreated).append(i);
		created = $("#created").val().length == 0 ? "" : $("#created").val();
		gotoByAjax(page, rows, type);
	} else if (searchType == 3) {
		$("#typeViews").empty();
		$("#typeViews").append(ByAddUser).append(i);
		addUser = $("#addUser").val().length == 0 ? 0 : $("#addUser").val();
		gotoByAjax(page, rows, type);
	}

}

/**
 * 根据店铺id取消绑定店铺
 * 
 * @param seasId
 * @returns
 */
function deleteShopByid(ShopId) {
	var index = layer.load(2, {
		time : 10 * 1000
	});
	$.ajax({
		url : projectName + "/foolshop/deleteShopByid?id=" + ShopId,
		type : "get",
		success : function(data) {
			layer.close(index);
			window.location.reload();
		},
		error : function() {
			layer.close(index);
			layer.msg("服务器异常！材料删除失败", {
				icon : 5
			});
		}
	})
}