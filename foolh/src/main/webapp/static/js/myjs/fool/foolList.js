// 截取，得到项目名称
var pathName=window.document.location.pathname;
var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);


//初始化所有数据
var pageInfo ={};
var page =1;
var rows =10;
var type =100;
var total =0;
var list = []; //菜品list数据
var diag;//弹窗
var foolseas= [];//所有材料信息
var foolIdBySeas;//材料id
//设置关键字搜索初始默认值 关键字，菜品创建时间，菜品类型（公共/私有），菜品ID，店铺ID
var keywords="", created="", is_check="", foolId=0,foolShopId=0;

$(function(){
	$("#ImgModal").modal("hide");
})


$(top.hangge());
/**
 * 新增菜品
 * @returns
 */
function addfool(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=false;
			 diag.Title ="编辑";
			 diag.URL = projectName+'/page/fool/add';
			 diag.Width = 450;
			 diag.Height = 552;
			 diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			 diag.show();
		}
//批量删除菜品
function delFools(){
	if (!$(":input[name='ids']").is(":checked") ) {
		layer.msg("未选择任何菜品", {icon: 6});
		$("#zcheckbox").tips({
				side : 3,
				msg : '点这里全选',
				bg : '#AE81FF',
				time : 2
			});
	}else{
	 bootbox.confirm("确定要删除选中菜品吗?", function(result) {
		 var ids = [];
		 $("#foolList").find(":input[name='ids']:checked").each(function(){
			 ids.push($(this).val());
		 })
		 if(result && ids.length != 0) {
			var url = projectName+"/fool/DeletefoolMenuLibrarys?ids="+ids;
			$.ajax({
				url:url,
				type:"get",
				success:function(data){
					//成功，刷新当前页面
					window.location.reload();
				},
				error:function(){
					layer.msg("服务器异常，请稍后再试", {icon: 6});
					window.location.reload();
				}
			});
		} 
	}); 
	}
}
/**
 * 构建分页条
 * @param result
 * @returns
 */
function build_page_nav(result) {
	var index = layer.load(2, {time: 10*1000});
	// 判断result是否为空
	//(JSON.stringify(result));
	if (!$.isEmptyObject(result)) {
	var firstPage = $("<li></li>").append($("<a></a>").append("首页"));
	var upPage = $("<li></li>").append($("<a></a>").append("&laquo;"));
	var nextPage = $("<li></li>").append($("<a></a>").append("&raquo;"));
	var lastPage = $("<li></li>").append($("<a></a>").append("末页"));
	// 跳转页面的输入框
	var inputNums = $("<li></li>").append($("<input type='number' id='toGoPage' style='width:55px;height:34px;text-align:center;margin-top:1px' min='1' placeholder='页码'/>").append("末页"));
	// 跳转页面的按钮
	var inputNumsButton = $("<li></li>").append($("<a style='float:right;height:34px;' class='btn btn-mini btn-success' onclick='gotoPage();'></a>").append("跳转"));
	// 总共条数
	var totalInfo = $("<li></li>").append($("<a></a>").append("共").append($("<font color='red'>"+result.total+"</font>")).append("条"));
	// 总共页数
	var pageNumsInfo = $("<li></li>").append($("<a></a>").append("共"+result.pages+"页"));
	// 每页显示条数选择框
	var pageSizeChoose = $("<li></li>").append($("<select title='显示条数'  id='changeCount' style='margin-left:1px;height:34px;'  onchange='changeCount(this.value)'></select>").append("<option selected='selected' value='10'>10</option><option value='20'>20</option><option value='30'>30</option><option value='40'>40</option><option value='50'>50</option><option value='60'>60</option><option value='70'>70</option><option value='80'>80</option><option value='90'>90</option><option value='100'>100</option>"));
	
		var ul = $("#pageNums");
		//先清空之前的数据
		ul.empty();
		var nums = result.navigatepageNums;

		//总条数、首页 和 上一页
		ul.append(totalInfo).append(firstPage).append(upPage);

		// 判断是否为第一页 为true则禁用 为false则添加点击事件
		if (result.isFirstPage == true) {
			upPage.addClass("disabled");
			firstPage.addClass("disabled");
		} else {
			firstPage.click(function() {
				gotoByAjax(1,rows,type);
			});
			upPage.click(function() {
				gotoByAjax(result.prePage,rows,type);
			});
		}

		// 判断是否为最后一页 为true则禁用 为false则添加点击事件
		if (result.isLastPage == true) {
			nextPage.addClass("disabled");
			lastPage.addClass("disabled");
		} else {
			nextPage.click(function() {
				gotoByAjax(result.nextPage,rows,type);
			});
			lastPage.click(function() {
				gotoByAjax(result.lastPage,rows,type);
			});
		}
		
		$.each(nums, function(index, item) {
			var numLi;
			if (result.pageNum == item) {
				numLi= $("<li></li>").addClass("active").append(
						$("<a></a>").append(item));
			} else {
				 numLi = $("<li></li>").append(
						$("<a ></a>").append(item));
			}
			numLi.click(function() {
				gotoByAjax(item,rows,type);
			})
			if (result.pageNum != item) {
			// 给每个li添加点击事件  onclick='gotoByAjax("+item+","+rows+","+type+");'
			}
			ul.append(numLi);
		});
		// 下一页 、末页、页数、每页展示数据的条数、跳转页面输入框及跳转按钮
		ul.append(nextPage).append(lastPage).append(pageNumsInfo).append(pageSizeChoose).append(inputNums).append(inputNumsButton);
		layer.close(index);
	} else {

	}
}
/**
 * 更改每页显示条数
 * @param value
 * @returns
 */
function changeCount(value) {
	$("#zcheckbox").attr("checked",false);
	//将选中的全部取消
	$("input[name='ids']:checkbox").each(function() {   
        $(this).prop("checked", false);  
  });
	gotoByAjax(1,value,type);
	$("#changeCount").val(value);
	menuList.rows = value;
	rows = value;
}
/**
 * 跳转到指定页码去
 * @returns
 */
function gotoPage() {
	var pageNum = $("#toGoPage").val();
	//判断输入的内容是否合格  不能是当前页，为空 ，以及大于最后一页的数
	if (pageNum != ""  && $.trim(pageNum).legth != 0 && pageNum != pageInfo.pageNum  && pageNum <= pageInfo.lastPage) {
		gotoByAjax(pageNum,rows,type);
	}else{
		layer.msg("请选择正确的页码！！!", {icon: 6});
		$("#toGoPage").val("");
	}
}
/**
 * 请求菜品数据
 * @param page
 * @param rows
 * @param type
 * @returns
 */
function gotoByAjax(page, rows, type) {
	var searchType = $("#searchType").val();
	if (searchType == "") {
		keywords = $("#nav-search-input").val().length == 0 ? "" : $("#nav-search-input").val();
		//获取过后将其他关键字值进行初始化
		foolShopId=0; foolId=0;created="";
	} else if (searchType == 1) {
		foolId = $("#foolId").val().length == 0 ? 0 : $("#foolId").val();
		keywords="";foolShopId=0;created="";
	}else if (searchType == 2) {
		created = $("#created").val().length == 0 ? "" : $("#created").val();
		foolId=0; keywords="";foolShopId=0;
	} else if (searchType == 3) {
		foolShopId = $("#foolShopId").val().length == 0 ? 0 : $("#foolShopId").val();
		foolId=0; keywords="";created="";
	}
	is_check =$("#is_check").val();
	var allInfo = [page,rows,type,keywords,is_check,created,foolId,foolShopId];
	/*
	 * 第二种办法 ：相对有点臃肿 不灵活
	var url;
	if (searchType == "") {
		url = projectName + '/fool/getFoolMenuLibraryList?page=' + page + '&rows=' + rows+ '&type=' + type+'&keywords='+$.trim(keywords)+'&is_check='+is_check;
	} else if (searchType == 1) {
		url= projectName + '/fool/getFoolMenuLibraryList?page=' + page + '&rows=' + rows+ '&type=' + type+'&foolId='+foolId+'&is_check='+is_check;
	} else if (searchType == 2) {
		url= projectName + '/fool/getFoolMenuLibraryList?page=' + page + '&rows=' + rows+ '&type=' + type+'&is_check='+is_check+'&created='+created;
	} else if (searchType == 3) {
		url= projectName + '/fool/getFoolMenuLibraryList?page=' + page + '&rows=' + rows+ '&type=' + type+'&is_check='+is_check+'&foolShopId='+foolShopId;
	}*/
	$.ajax({
		url : projectName + '/fool/getFoolMenuLibraryList?allInfo='+allInfo,
		type : 'GET',
		success : function(d) {
			//Vue.set(target,key，value); 可通过此方式直接进行对vue里面的数据更新或者覆盖 
			//target：要更改的数据源(可以是对象或者数组)  key：要更改的具体数据(可以是字符串和数字) value ：重新赋的值
			menuList.list = d.list;
			menuList.rows=rows;
			menuList.page=page;
			menuList.total=d.total;;
			pageInfo = d;
			total = d.total;
			list = d.list;
			build_page_nav(d);
			$("#changeCount").val(rows);
		},
		error : function() {
			console.log("服务异常" + 222)
		}
	})
}

var menuList =	new Vue({
	el: '#zhongxingss',
	data:{
		 list:[],
		 page:1,
		 rows:10,
		 type:100,
		 total:0,
		 i:true
	},
created:function(){
	var _this=this;
		gotoByAjax(_this.page, _this.rows, _this.type);
		$("#changeCount").val(rows);
},
methods:{
	editmenu:function(id){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="菜品详情";
		 diag.URL = projectName+'/fool/foolMenuEdit?foolMenuID='+id;
		 diag.Width = 469;
		 diag.Height = 510;
		 diag.CancelEvent = function(){ //关闭事件
			diag.close();
		 };
		 diag.show();
	},
	delmenu:function(id){
		 bootbox.confirm("确定要删除此菜品吗?", function(result){
				 if(result) {
					var url = projectName+"/fool/DeletefoolMenuLibrary?id="+id;
					$.ajax({
						url:url,
						data:id,
						type:"get",
						success:function(data){
							//成功，刷新当前页面
							window.location.reload();
						},
						error:function(){
							("服务器异常，请稍后再试");
							window.location.reload();
						}
					});
				} 
			}); 		
	},
	chooseAll:function(){
		if($("#zcheckbox").is(":checked")){
			 $("input[name='ids']:checkbox").each(function(){ 
	              $(this).prop("checked", true);  
	        });
		}else{
			$("input[name='ids']:checkbox").each(function() {   
	              $(this).prop("checked", false);  
	        });
		}
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
	},checkFoolSeasByFoolId:function(id){
		checkFoolSeasByFoolId(id);
	},showImgTitle:function(id){
		$.ajax({
			url:projectName+"/fool/getFoolImgTitleByid?id="+id,
			type:"get",
			success:function(data){
				$("#foolImgTitleShow").attr("src","/file/"+data.foolImgTitle);
				$("#ImgModal").modal("show");
			},error:function(){
				layer.msg("获取菜品小图异常！！！", {icon: 6});
			}
		})
	} 
	//   时间格式化
 	,dateFormat:function(time) {
	    var date=new Date(time);
	    var year=date.getFullYear();
	    /* 在日期格式中，月份是从0开始的，因此要加0
	     * 使用三元表达式在小于10的前面加0，以达到格式统一  如 09:11:05
	     * */
	    var month= date.getMonth()+1<10 ? "0"+(date.getMonth()+1) : date.getMonth()+1;
	    var day=date.getDate()<10 ? "0"+date.getDate() : date.getDate();
	    var hours=date.getHours()<10 ? "0"+date.getHours() : date.getHours();
	    var minutes=date.getMinutes()<10 ? "0"+date.getMinutes() : date.getMinutes();
	    var seconds=date.getSeconds()<10 ? "0"+date.getSeconds() : date.getSeconds();
	    // 拼接
	    return year+"-"+month+"-"+day+" "+hours+":"+minutes+":"+seconds;
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
 * @param id
 * @returns
 */
function checkFoolSeasByFoolId(id){
	//将用户点击获取到的id保存  方便进行添加操作
	foolIdBySeas = id;
	$.ajax({
		url: projectName+'/foolseas/getFoolSeasListByFoolId?foolId='+id,
		type:"get",
		success:function(data){
			if (data.length == 0) {
				$("#msgModal").modal("show");
			}else{
				$("#seasModal").modal("show");
				 foolseas.foolseasList = data;
			}
		},error:function(){
			layer.msg("查询菜品异常！！！ 请稍后重试", {icon: 6});
		}
		
	})
	
}



var foolseas = new Vue({
	el: '#seasModal',
	data:{
		foolseasList:[],
	},methods:{
	//   时间格式化
	 	dateFormat:function(time) {
		    var date=new Date(time);
		    var year=date.getFullYear();
		    /* 在日期格式中，月份是从0开始的，因此要加0
		     * 使用三元表达式在小于10的前面加0，以达到格式统一  如 09:11:05
		     * */
		    var month= date.getMonth()+1<10 ? "0"+(date.getMonth()+1) : date.getMonth()+1;
		    var day=date.getDate()<10 ? "0"+date.getDate() : date.getDate();
		    var hours=date.getHours()<10 ? "0"+date.getHours() : date.getHours();
		    var minutes=date.getMinutes()<10 ? "0"+date.getMinutes() : date.getMinutes();
		    var seconds=date.getSeconds()<10 ? "0"+date.getSeconds() : date.getSeconds();
		    // 拼接
		    return year+"-"+month+"-"+day+" "+hours+":"+minutes+":"+seconds;
		},
		deleteFoolSeasByid:function(id){
			deleteFoolSeasByid(id);
		}
	}
})


/**
 * 改变关键字类型
 * @returns
 */
function changeSearchType(){
	var i = $("<i class='ace-icon fa fa-search nav-search-icon'></i>")
	var BykeyWord = $("<input class='nav-search-input input-sm' autocomplete='off' id='nav-search-input' type='text' name='keywords' value='' placeholder='这里输入菜名'>");
	var Byid = $("<input class='nav-search-input input-sm' autocomplete='off'id='foolId' type='number' name='foolId' min='1' value='' placeholder='这里输入菜品ID'>");
	var ByShopId = $("<input class='nav-search-input input-sm' autocomplete='off'id='foolShopId' type='number' name='foolShopId' min='1' value='' placeholder='这里输入店铺ID'>");
	var Bycreated = $("<input  id='created' type='date'  class='form_datetime input-sm' data-date-format='yyyy-mm-dd hh:ii' style='border: 1px solid #6fb3e0;border-radius: 4px !important;' name='created'  placeholder='创建日期'>");
	var searchType = $("#searchType").val();
	 if (searchType == "") {
		$("#typeViews").empty();
		$("#typeViews").append(BykeyWord).append(i);
		 keywords = $("#nav-search-input").val().length==0 ? "":$("#nav-search-input").val();
		gotoByAjax(page, rows, type);
	} else if (searchType == 1) {
		$("#typeViews").empty();
		$("#typeViews").append(Byid).append(i);
		foolId = $("#foolId").val().length == 0 ? 0:$("#foolId").val();
		gotoByAjax(page, rows, type);
	} else if (searchType == 2) {
		$("#typeViews").empty();
		$("#typeViews").append(Bycreated).append(i);
		 created = $("#created").val().length==0 ? "":$("#created").val();
		gotoByAjax(page, rows, type);
	}else if (searchType == 3) {
		$("#typeViews").empty();
		$("#typeViews").append(ByShopId).append(i);
		 foolShopId = $("#foolShopId").val().length == 0 ? 0:$("#foolShopId").val();
		gotoByAjax(page, rows, type);
	}
	
	
}
/**
 * 点击添加材料 隐藏消息框 并显示添加材料的模态框
 * @returns
 */
function addFoolSeasView(){
	$("#msgModal").modal("hide");
	$("#seasModal").modal("hide");
}
/**
 * 点击添加材料 隐藏消息框 并显示添加材料的模态框
 * @returns
 */
function showFoolSeasView(){
	$("#seasModal").modal("show");
	$("#addseasModal").modal("hide");
}

/**
 * 查询当前菜品的材料名是否存在，存在则不允许添加
 * @returns
 */
function checkFoolSeasTitleIsOk(foolSeasTitle){
	var isOK = false;
	if(foolSeasTitle.length != 0 || foolSeasTitle != ""){
	$.ajax({
		url:projectName+"/foolseas/getFoolSeasLibraryTitle?foolId="+foolIdBySeas+"&seasTitle="+$("#seasTitle").val(),
		type:"get",
		success:function(data){
			if ( data.length != 0 || data.seasTitle != undefined  ) {
				$("#seasTitle").tips({
					side : 3,
					msg : '材料名重复，不允许再次添加',
					bg : '#AE81FF',
					time : 2
				});
				$("#seasTitle").focus();
				isOK = false;
			}
		},error:function(){
			layer.msg("获取材料名异常！！！ 请稍后再试", {icon: 6});
		}
	})
	}
	if (isOK)
	return false;
	return true;
}

/**
 * 添加菜品所需材料
 * @returns
 */
function addFoolseas(){
	if(checkInputTextIsNull()){
		var seasTitle = $("#seasTitle").val();
		var seasWeigetKg = $("#seasWeigetKg").val();
		var seasSelect = $("#seasSelect").val();
		var seasMsg = $("#seasMsg").val();
		var fs = {"foolId":foolIdBySeas,"seasTitle":seasTitle,"seasWeigetKg":seasWeigetKg,"seasSelect":seasSelect,"seasMsg":seasMsg};
		$.ajax({
			url:projectName+'/foolseas/addFoolSeasLibraryByMenuId',
			type:"post",
			data:fs,
			success:function(data){
				layer.msg("添加成功", {icon: 6});
				$('#foolseasMenu')[0].reset();
				$("#addSeasModal").modal("hide");
				$("#seasModal").modal("show");
				
			},error:function(){
				layer.msg("服务器异常", {icon: 6});
			}
			
		})	
	}
	
}

/**
 * 查看文本框数据是否为空
 * @returns
 */
function checkInputTextIsNull() {
	var f = [ "seasTitle", "seasWeigetKg" ];
	var isReturn = false;//标识是否跳出方法
	$.each(f, function(index, v) {
		if ($("#" + v).val() == ""|| $.trim($("#" + v).val()).length == 0) {
			$("#" + v).tips({
				side : 3,
				msg : '不能为空',
				bg : '#AE81FF',
				time : 4
			});
			$("#" + v).focus();
			isReturn = true;
		}
	});
	if (isReturn)
	return false;
	return true;
}

/**
 * 根据材料id删除材料 并返回该菜品的材料list数据
 * @param seasId
 * @returns
 */
function deleteFoolSeasByid(seasId){
	$.ajax({
		url:projectName+"/foolseas/deleteFoolseasByid?id="+seasId+"&foolId="+foolIdBySeas,
		type:"get",
		success:function(data){
			foolseas.foolseasList = data;
		},error:function(){
			layer.msg("服务器异常！材料删除失败", {icon: 6});
		}
	})
	
}