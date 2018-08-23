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
// 设置关键字搜索初始默认值 店铺名，店铺创建时间，店铺类型，店铺ID，店铺老板名称/手机号
var helpTitle = "", created = "", is_check = "";
$(top.hangge());
/**
 * 批量删除店铺
 * 
 * @returns
 */
function delHelps() {
	if (!$(":input[name='ids']").is(":checked")) {
		layer.msg("未选择任何帮助", {
			icon : 6
		});
		$("#zcheckbox").tips({
			side : 3,
			msg : '点这里全选',
			bg : '#AE81FF',
			time : 2
		});
	} else {
		layer.confirm("确定要删除选中帮助吗?", function(result) {
			let ids = [];
			$("#helpList").find(":input[name='ids']:checked").each(function() {
				ids.push($(this).val());
			})
			if (result && ids.length != 0) {
				var url = projectName + "/help/delHelps?ids=" + ids;
				$.ajax({
					url : url,
					type : "post",
					success : function(data) {
						layer.msg("删除成功", {icon :6});
						// 成功，刷新当前页面
						gotoByAjax(page, rows, type);
					},
					error : function() {
						layer.msg("服务器异常，请稍后再试", {icon :5});
						gotoByAjax(page, rows, type);
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
	let index = layer.load(2, {
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
				.append($("<input type='number' id='toGoPage' style='width:55px;height:34px;text-align:center;margin-top:1px' min='1' placeholder='页码'/>")
				.append("末页"));
		// 跳转页面的按钮
		var inputNumsButton = $("<li></li>")
				.append($("<a style='float:right;height:34px;' class='btn btn-mini btn-success' onclick='gotoPage();'></a>")
				.append("跳转"));
		// 总共条数
		var totalInfo = $("<li></li>").append(
				$("<a></a>").append("共").append($("<font color='red'>" + result.total + "</font>"))
						.append("条"));
		// 总共页数
		var pageNumsInfo = $("<li></li>").append($("<a></a>").append("共" + result.pages + "页"));
		// 每页显示条数选择框
		var pageSizeChoose = $("<li></li>")
				.append($("<select title='显示条数'  id='changeCount' style='margin-left:1px;height:34px;'  onchange='changeCount(this.value)'></select>")
				.append("<option selected='selected' value='10'>10</option><option value='20'>20</option><option value='30'>30</option><option value='40'>40</option><option value='50'>50</option><option value='60'>60</option><option value='70'>70</option><option value='80'>80</option><option value='90'>90</option><option value='100'>100</option>"));
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
		ul.append(nextPage).append(lastPage).append(pageNumsInfo).append(pageSizeChoose).append(inputNums).append(inputNumsButton);
		layer.close(index);
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
		layer.msg("请选择正确的页码！！!",{icon:6});
		$("#toGoPage").val("");
	}
}
/**
 * 请求建议数据
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
		helpTitle = $("#helpTitle").val().length == 0 ? "" : $("#helpTitle").val();
		// 获取过后将其他关键字值进行初始化
		created = "";
	} else if (searchType == 1) {
		created = $("#created").val().length == 0 ? "" : $("#created").val();
		helpTitle = "";
	} 
	is_check = $("#is_check").val();
	var allInfo = [ page, rows, type, helpTitle, is_check, created];
	$.ajax({
		url : projectName + '/help/getHelpList?allInfo=' + allInfo,
		type : 'GET',
		success : function(d) {
			layer.close(index);
			// Vue.set(target,key，value); 可通过此方式直接进行对vue里面的数据更新或者覆盖
			// target：要更改的数据源(可以是对象或者数组) key：要更改的具体数据(可以是字符串和数字) value ：重新赋的值
			menuList.list = d.list;
			menuList.rows = rows;
			menuList.page = page;
			menuList.total = d.total;
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
		index:{}
	},
	created : function() {
		var _this = this;
		gotoByAjax(_this.page, _this.rows, _this.type);
	},
	methods : { 
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
		changeHelpStatus:function(status,id,e){
		 layer.confirm('确认更改审核状态？', function(index){
			$.ajax({
				url:projectName+"/help/changeHelpStatus",
				data:{"helpStatus":status,"id":id},
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
		},checkUserByID:function(id){//查看用户信息
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="用户详情";
			 diag.URL = projectName+'/user/view?USER_ID='+id;
			 diag.Width = 469;
			 diag.Height = 510;
			 diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			 diag.show();
		},delHelp:function(id){
			var url = projectName + "/help/delHelp?id=" + id;
			$.ajax({
				url : url,
				type : "post",
				success : function(data) {
					layer.msg("删除成功", {icon :6});
					// 成功，刷新当前页面
					gotoByAjax(page, rows, type);
				},
				error : function() {
					layer.msg("服务器异常，请稍后再试", {icon :5});
					gotoByAjax(page, rows, type);
				}
			});
		},showTextIfOut:function(e){
			let _this =this;
			var dom = e.currentTarget;
			console.log($(dom).text());
			_this.index = layer.tips($(dom).text(),$(dom),{
				 tips: [3, '#0FA6D8'], //设置tips方向和颜色 类型：Number/Array，默认：2 tips层的私有参数。支持上右下左四个方向，通过1-4进行方向设定。如tips: 3则表示在元素的下面出现。有时你还可能会定义一些颜色，可以设定tips: [1, '#c00']
				 tipsMore: false, //是否允许多个tips 类型：Boolean，默认：false 允许多个意味着不会销毁之前的tips层。通过tipsMore: true开启
				 time:0 //2秒后销毁，还有其他的基础参数可以设置。。。。这里就不添加了  0表示不销毁
			})
		},closeTips:function(){
			let _this =this;
		   layer.close(_this.index); //销毁tips
		   _this.index ={};
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
	var ByHelpTitle = $("<input class='nav-search-input input-sm' autocomplete='off' id='helpTitle' type='text' name='helpTitle' value='' placeholder='这里输入帮助标题'>");
	var Bycreated = $("<input  id='created' type='date'  class='form_datetime input-sm' data-date-format='yyyy-mm-dd hh:ii' style='border: 1px solid #6fb3e0;border-radius: 4px !important;' name='created'  placeholder='创建日期'>");
	var searchType = $("#searchType").val();

	// keywords 店铺名 addUser 用户名/手机号 shopId 店铺ID created 创建日期
	if (searchType == 0) {
		$("#typeViews").empty();
		$("#typeViews").append(ByHelpTitle).append(i);
		helpTitle = $("#helpTitle").val().length == 0 ? "" : $("#helpTitle").val();
		gotoByAjax(page, rows, type);
	}else if (searchType == 1) {
		$("#typeViews").empty();
		$("#typeViews").append(Bycreated).append(i);
		created = $("#created").val().length == 0 ? "" : $("#created").val();
		gotoByAjax(page, rows, type);
	}

}