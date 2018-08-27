// 截取，得到项目名称
var pathName = window.document.location.pathname;
var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
var layer = layui.layer; //定义layer框架对象
$(function() {
	trShowOrHidden(arr, oldType);
	// 获取所有店铺信息
	getShopList();
	getFoolType();
	// 还原菜品名称边框颜色
	$("#foolTitle").css("border", "1px solid #d5d5d5");

	$("#foolTitle").focus(function() {
		$(this).css("border", "1px solid #d5d5d5");
	})

	//$("#ddlregtype").find("option:selected").text();

})
// 添加的所有材料数据；
var foolseasInfoArray = [];
// 记录已添加并展示在页面上的材料 ，通过tr的id和材料名称方便进行删除(材料名称是唯一的，不允许重复)
var foolseasTrIdAndsTitle = [];
// 菜品小图的路径；
var imgUrldd = '';
var arr = [ "sTitle", "sWeight", "sSel", "sMsg", "sBtn" ];
// 方便一键清空 定义一个变量
var foolseasInfo = [ "seasTitle", "seasWeigetKg", "seasSelect", "seasMsg" ];
// 菜品材料tr的ID变量。
var foolseasNums = 0;
// 菜品材料视图选项
var oldType = "hidden";
var foolTitleIsOK = false;
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
	if (checkFormInfo() && foolTitleIsOK) {
		var index = layer.load(2, {time: 10*1000});
		var foolTitle = $("#foolTitle").val();
		var foolMakeTime = $("#foolMakeTime").val();
		var foolPrice = $("#foolPrice").val();
		var foolShopId = $("#foolShopId").val();
		var foolMsg = $("#foolMsg").val();
		var foolMenuInfo = {
			"foolTitle" : foolTitle,
			"foolMakeTime" : foolMakeTime,
			"foolPrice" : foolPrice,
			"foolShopId" : foolShopId,
			"foolImgTitle" : imgUrldd,
			"foolMsg" : foolMsg
		};
		var f = {
			"foolseasInfoArray" : foolseasInfoArray,
			"foolMenuInfo" : foolMenuInfo
		};
		$.ajax({
			url : projectName + '/user/addFoolMenuLibrary',
			type : 'POST',
			data : JSON.stringify(f),
			async : 'true',
			contentType : "application/json; charset=utf-8",
			success : function(result) {
				layer.close(index);
				layer.msg('菜品添加成功', {icon: 6});
				formRestInfo("#menuForm");
				trShowOrHidden(arr, "hidden");
				// 关闭添加页面
				top.Dialog.close();
			},
			error : function() {
				layer.msg('菜品添加失败， 请稍后重试！！！', {icon: 6});
			}
		})

	}
}

/**
 * 检查form表单信息是否完整
 * 
 * @returns
 */
function checkFormInfo() {
	if ($("#foolTitle").val() == "") {
		$("#foolTitle").tips({
			side : 3,
			msg : '请输入名称',
			bg : '#AE81FF',
			time : 2
		});
		$("#foolTitle").focus();
		return false;
	}
	if ($("#foolMakeTime").val() == "") {
		$("#foolMakeTime").tips({
			side : 3,
			msg : '请输入制作时间',
			bg : '#AE81FF',
			time : 2
		});
		$("#foolMakeTime").focus();
		return false;
	}
	if ($("#foolPrice").val() == "0" || $("#foolPrice").val() == "") {
		$("#foolPrice").tips({
			side : 3,
			msg : '请输入菜品价格',
			bg : '#AE81FF',
			time : 2
		});
		$("#foolPrice").focus();
		return false;
	}
	// 材料
	if ($.trim(foolseasInfoArray).length == 0) {
		$("#addFoolSeasBtn").tips({
			side : 3,
			msg : '请添加菜品需要的材料',
			bg : '#AE81FF',
			time : 2
		});
		$("#addFoolSeasBtn").focus();
		return false;
	}
	// 判断是否上传图片
	if ($.trim(imgUrldd).length == 0) {
		$("#foolImgTitle").tips({
			side : 3,
			msg : '请添加菜品小图',
			bg : '#AE81FF',
			time : 2
		});
		$("#addFoolSeasBtn").focus();
		return false;
	}
	return true;
}

/**
 * 检查菜品名称是否存在 如果存在则不允许再次添加
 * 
 * @param foolTitle
 * @returns
 */
function checkfoolTitle(foolTitle) {
	if (foolTitle != null && foolTitle != "") {
		$.ajax({
			url : projectName + '/user/getFoolMenuLibraryTitle?foolTitle='
					+ $(foolTitle).val(),
			type : "get",
			success : function(data) {
				if (data.foolTitle == undefined
						|| data.foolTitle != $(foolTitle).val()) {
					foolTitleIsOK = true;
				} else {
					$("#foolTitle").tips({
						side : 3,
						msg : '菜品名重复',
						bg : '#AE81FF',
						time : 2
					});
					$("#foolTitle").focus();
					$("#foolTitle").css("border", "1px solid red");
					foolTitleIsOK = false;
				}
			},
			error : function() {
				foolTitleIsOK = false;
			}
		})
	}
}
/**
 * 重置form表单信息
 * 
 * @param ele
 * @returns
 */
function formRestInfo(ele) {
	$(ele)[0].reset();
	foolseasNums = 0;
	// 清除材料数据
	$(".seasinfo").each(function() {
		$(this).remove();
	})
	// 将图片部分内容隐藏
	$("#foolImgViews").hide();
	// 将数组清空
	foolseasInfoArray.splice(0, foolseasInfoArray.length);
	// 还原菜品名称边框颜色
	$("#foolTitle").css("border", "1px solid #d5d5d5");
}

/**
 * 获取所有饭店店铺信息
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
		$("#foolImgViews").show();
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
 * 添加材料并展示在页面上
 * 
 * @returns
 */
function addFoolseasInfo() {
// 判断是否可以进行添加进foolseasInfoArray数组中
	var isOkPull = false;
	var seasTitle, seasWeigetKg, seasSelect, seasMsg;
	$.each(foolseasInfo, function(index, v) {
		var foolseasInfo = [ "seasTitle", "seasWeigetKg", "seasSelect",
				"seasMsg" ];
		// 排除下拉框与备注（备注可以为空）
		if (checkInputTextIsNull()
				&& checkInputTextIsExist($("#" + foolseasInfo[0]).val())) {
			seasTitle = $("#" + foolseasInfo[0]).val();
			seasWeigetKg = $("#" + foolseasInfo[1]).val();
			seasSelect = $("#" + foolseasInfo[2]).val();
			seasMsg = $("#" + foolseasInfo[3]).val();
			isOkPull = true;
		} else {
			isOkPull = false;
		}

	})
	var seas = {
		"seasTitle" : seasTitle,
		"seasWeigetKg" : seasWeigetKg,
		"seasSelect" : seasSelect,
		"seasMsg" : seasMsg
	}
	// 将封装的对象添加到数组中

	if (isOkPull) {
		$("#addFoolSeasTR")
				.after(
						$("<tr class='seasinfo' id=f" + foolseasNums + "></tr>")
								.append(
										$("<td colspan='10'></td>")
												.append(
														"材料名："
																+ seas.seasTitle
																+ "&nbsp;&nbsp;&nbsp;&nbsp;重量："
																+ seasWeigetKg
																+ "kg&nbsp;&nbsp;&nbsp;&nbsp;材料类型："
																+ $(
																		'#seasSelect option:selected')
																		.text()
																+ (seasMsg == '' ? ''
																		: "&nbsp;&nbsp;&nbsp;&nbsp;备注："
																				+ seasMsg)
																+ "&nbsp;&nbsp;&nbsp;&nbsp;"
																+ "<span class='glyphicon glyphicon-remove' onclick='deleteFoolseas(this)' title='删除' ></span>")));
		foolseasInfoArray.push(seas);
		var aa = {
			"id" : "f" + foolseasNums,
			"seasTitle" : seas.seasTitle
		};
		foolseasTrIdAndsTitle.push(aa);
		clearInputText();
	}
	// 清空文本
	foolseasNums++;
}

/**
 * 清空文本框数据
 * 
 * @returns
 */
function clearInputText() {
	$.each(foolseasInfo, function(index, v) {
		if ($("#" + v).is("input")) {
			$("#" + v).val("");
		} else if ($("#" + v).is("select")) {
			// 设置为默认选中的选项
			$("#" + v).val("0");
		}
	})
}

/**
 * 查看文本框数据是否为空
 * 
 * @returns
 */
function checkInputTextIsNull() {
	var f = [ "seasTitle", "seasWeigetKg" ];
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
	if (isReturn)
		return false;
	return true;
}

/**
 * 查看文本框数据是否已经存在 利用underscore.js中的 _.groupBy来进行遍历并进行判断是否存在
 * 
 * @param a
 * @returns
 */
function checkInputTextIsExist(a) {
	collection = _.groupBy(foolseasInfoArray, 'seasTitle');
	var isReturn = false;// 标识是否跳出方法
	for ( var i in collection) {
		if (collection[i].length >= 1) {
			_.map(collection[i], function(ele) {
				if (JSON.stringify(a) == JSON.stringify(ele.seasTitle)) {
					$("#seasTitle").tips({
						side : 3,
						msg : '材料名已经存在',
						bg : '#AE81FF',
						time : 2
					});
					$("#seasTitle").focus();
					isReturn = true;
				}
			})
		} else {
			isReturn = false;
		}
	}
	;
	if (isReturn)
		return false;
	return true;
}

/**
 * 根据id删除材料数据
 * 
 * @param _this
 * @returns
 */
function deleteFoolseas(_this) {
	// 获取祖先元素的id
	var id = $(_this).parent().parent().attr('id');
	$("#" + id).remove();
	var _valById = undefined;
	// 循环得到删除的对象，并在foolseasInfoArray中清除
	for (var j = 0; j < foolseasTrIdAndsTitle.length; j++) {
		if (id == foolseasTrIdAndsTitle[j].id) {
			_valById = foolseasTrIdAndsTitle[j].seasTitle;
		}
	}
	var seasTitle = "seasTitle";
	removeByValue(foolseasInfoArray, seasTitle, _valById);
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
 * 获取菜品类型
 */	
function getFoolType() {
	        var index = layer.load();
	        $.ajax({
	            url: projectName + '/fool/getFoolType',
	            type: 'get',
	            success: function (result) {
	                layer.close(index);
	                // 将查询出来的菜品类型进行遍历插入到foolType选项栏中
	                $.each(result, function (n, value) {
	                    $("#foolType").append(
	                        $("<option></option>").text(value.type).val(value.id));
	                })
	            },
	            error: function () {
	                layer.msg('获取所有菜品类型失败， 请稍后重试！！！', {icon: 6});
	            }
	        })
}