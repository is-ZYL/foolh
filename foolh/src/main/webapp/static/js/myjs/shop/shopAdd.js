// 截取，得到项目名称
var pathName = window.document.location.pathname;
var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
var layer = layui.layer; //定义layer框架对象
$(function() {
	// 将图片部分内容隐藏
	$("#shopImgViews").hide();
})
// 店铺执照图片路径；
var imgUrldd = '';
$(top.hangge());

// 返回
function goback(id) {
	window.location.href = projectName+"/address.do?id=" + id;
}

/**
 * 菜品添加
 * 
 * @returns
 */
function save() {
	if (checkInputTextIsNull() && checkImgIsOk()) {
		var index = layer.load(2, {time: 10*1000});
		var shopTitle = $("#shopTitle").val();
		var shopMsg = $("#shopMsg").val();
		var shopAddress = $("#shopAddress").val();
		var shopType = $("#shopType").val();
		var shopImg = imgUrldd;
		var shopPhone = $("#shopPhone").val();
		var shopBossName = $("#shopBossName").val();
		var shopSendTime = $("#shopSendTime_1").val()+"-"+$("#shopSendTime_2").val();
		var foolShop = {"shopTitle":shopTitle,"shopMsg":shopMsg,"shopAddress":shopAddress,"shopType":shopType,"shopImg":shopImg,"shopPhone":shopPhone,"shopBossName":shopBossName,"shopSendTime":shopSendTime};
		
		$.ajax({
			url : projectName + '/foolshop/addShop',
			type : 'POST',
			data :JSON.stringify(foolShop),
			async : 'true',
			contentType : "application/json; charset=utf-8",
			success : function(result) {
				layer.close(index);
				layer.msg('店铺添加成功', {icon: 6});
				formRestInfo("#menuForm");
				trShowOrHidden(arr, "hidden");
				$("#addSendTime").css("display","none");
				// 关闭添加页面
				top.Dialog.close();
			},
			error : function() {
				layer.msg('店铺添加失败， 请稍后重试！！！', {icon: 6});
			}
		})

	}
}

/**
 * 判断是否上传图片
 * @returns
 */
function checkImgIsOk(){
	if ($.trim(imgUrldd).length == 0) {
		$("#shopImg").tips({
			side : 3,
			msg : '请添加店铺执照小图',
			bg : '#AE81FF',
			time : 2
		});
		$("#shopImg").focus();
		return false;
	}
	return true;
}
/**
 * 重置form表单信息
 * 
 * @param ele
 * @returns
 */
function formRestInfo(ele) {
	$(ele)[0].reset();
	// 将图片部分内容隐藏
	$("#shopImgViews").hide();
}


/**
 * 获取所有店铺信息
 * 
 * @returns
 */
function getShopList() {
	var index = layer.load(1);
	$.ajax({
		url : projectName + '/foolshop/getShopLists',
		type : 'get',
		data : {
			'rows' : '20',
			'page' : '1',
			'type' : '100'
		},
		async : 'true',
		dataType : "json",
		success : function(result) {
			layer.close(index); 
			// 将查询出来的店铺进行遍历插入到foolShopId选项栏中
			$.each(result.rows, function(n, value) {
				$("#foolShopId").append(
						$("<option></option>").text(
								"店铺名: " + value.shopTitle + " 店铺id: "
										+ value.id).val(value.id));
			})
		},
		error : function() {
			layer.msg('获取所有店铺信息失败， 请稍后重试！！！', {icon: 6});
		}
	})
}

/**
 * 上传图片
 * 
 * @returns
 */
function toImgEdit() {
	top.jzts();
	var diag = new top.Dialog();
	diag.Drag = true;
	diag.Title = "新增广告图片";
	diag.URL = projectName + '/page/AD/Ad_addImage';
	diag.Width = 800;
	diag.Height = 755;
	diag.Modal = true; // 有无遮罩窗口
	diag.ShowMaxButton = true; // 最大化按钮
	diag.ShowMinButton = true; // 最小化按钮
	diag.CancelEvent = function() { // 关闭事件
		var pdtMinImg = localStorage.getItem("pdtMinImg");
		if (pdtMinImg == null) {
			diag.close();
			strs=undefined;
			return;
		}
		var strs = new Array(); // 定义一数组
		strs = pdtMinImg.split(",");
		var imgUrl = strs[0];
		imgUrldd = imgUrl;
		// 在这里改访问地址 先设置为本地地址 上线时需要改
		var a = imgUrlsss;
		// var a ="http://image.xnxs.com/";
		$("#shopImgViews").show();
		$("#xhImgMin").attr('src', "/file/" + imgUrl);
		strs=undefined;
		diag.close();
	};
	diag.show();
 }

/**
 * 显示或隐藏tr
 * 
 * @param trs
 * @param isType
 * @returns
 */
function  trShowOrHidden(trs, isType) {
	  $.each(trs, function(index, value) {
		if (isType == "show") {
			$("#" + value).show();
			$("#addFoolSeasBtn").addClass("glyphicon-zoom-out");
			$("#addFoolSeasBtn").removeClass("glyphicon-zoom-in");
		} else if (isType == "hidden") {
			$("#" + value).hide();
			$("#addFoolSeasBtn").removeClass("glyphicon-zoom-out");
			$("#addFoolSeasBtn").addClass("glyphicon-zoom-in");
		}
	});

	if (isType == "show") {
		oldType = "hidden";
		clearInputText();
	} else if (isType == "hidden") {
		clearInputText();
		oldType = "show";
	}
}


/**
 * 查看文本框数据是否为空/
 * 
 * @returns
 */
function checkInputTextIsNull() {
	var f = [ "shopTitle", "shopAddress","shopPhone","shopMsg","shopBossName"];
	var isReturn = false;// 标识是否跳出方法
	$.each(f, function(index, v) {
		if ($("#" + v).val() == "" || $.trim($("#" + v).val()).length == 0) {
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
	
	if($("#shopType").val() == 0){
		$("#shopType").tips({
			side : 3,
			msg : '请选择店铺类型',
			bg : '#AE81FF',
			time : 4
		});
		$("#shopType").focus();
		isReturn = true;
	}
	if($("#shopType").val() != 0 &&$("#shopType").val() != 1 && $("#shopSendTime_1").val() == "" && $("#shopSendTime_2").val() == ""){
		$("#shopSendTime").tips({
			side : 3,
			msg : '请选择店铺送货时间',
			bg : '#AE81FF',
			time : 4
		});
		$("#shopSendTime").focus();
		isReturn = true;
	}
	
	if (isReturn)
		return false;
	return true;
}

/**
 * 根据数组对象中的属性值删除对象
 * 
 * @param arr
 * @param attr
 * @param value
 * @returns
 */
function removeByValue(arr, attr, value) {// 数组，属性，属性值
	for (var j = 0; j < arr.length; j++) {
		// 不能知道arr[j].attr属性，原因未知，
		if (arr[j].seasTitle == value) {
			// 执行删除
			arr.splice(j, 1);
			break;
		}
	}
}
/**
 * 店铺设置送货时间
 * @param value
 * @returns
 */
function setSendTime(value){
	if (value != 0 && value != 1) {
		$("#addSendTime").css("display","table-row");
	}else{
		$("#addSendTime").css("display","none");
	}
}