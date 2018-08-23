function showColor(colorId) {

	 var url="/rest/gm/service/Color/colorInfoBycolorId?colorId="+ colorId;
		$.ajax({
			type : "GET",
			url : url,
			statusCode : {
			200 : function(data) {
			$("#showColor").html('');
		
			var showColorHtml='';
			showColorHtml+=data.colorTitle;
			
            $("#showColor").append(showColorHtml);
           
				},
				400 : function() {
					$.messager.alert('提示', '请登录!该电话号码已注册');
				},
				500 : function() {
					$.messager.alert('提示', '新增用户失败!');
				}
			}
		});
	
}
function showCloth(clothId) {
	
	var url="/rest/gm/service/cloth/clothInfoByclothId?clothId="+ clothId;
	$.ajax({
		type : "GET",
		url : url,
		statusCode : {
			200 : function(data) {
				$("#showCloth").html('');
				
				var showClothHtml='';
				showClothHtml+=data.clothTitle;
				
				$("#showCloth").append(showClothHtml);
				
			},
			400 : function() {
				$.messager.alert('提示', '请登录!该电话号码已注册');
			},
			500 : function() {
				$.messager.alert('提示', '新增用户失败!');
			}
		}
	});
	
}
function  showSize(sizeId) {
	
	var url="/rest/gm/service/size/sizeInfoBysizeId?sizeId="+ sizeId;
	$.ajax({
		type : "GET",
		url : url,
		statusCode : {
			200 : function(data) {
				$("#showSize").html('');
				
				var showSizeHtml='';
				showSizeHtml+=data.sizeTitle;
				
				$("#showSize").append(showSizeHtml);
				
			},
			400 : function() {
				$.messager.alert('提示', '请登录!该电话号码已注册');
			},
			500 : function() {
				$.messager.alert('提示', '新增用户失败!');
			}
		}
	});
	
}
function showCraft(craftId) {
	
	var url="/rest/gm/service/craft/craftInfoBycraftId?craftId="+ craftId;
	$.ajax({
		type : "GET",
		url : url,
		statusCode : {
			200 : function(data) {
				$("#showCraft").html('');
				
				var showCraftHtml='';
				showCraftHtml+=data.craftTitle;
				
				$("#showCraft").append(showCraftHtml);
				
			},
			400 : function() {
				$.messager.alert('提示', '请登录!该电话号码已注册');
			},
			500 : function() {
				$.messager.alert('提示', '新增用户失败!');
			}
		}
	});
	
}
function showBill(billId) {

	var url="/rest/gm/service/bill/billInfoByBillId?billId="+ billId;
	$.ajax({
		type : "GET",
		url : url,
		statusCode : {
			200 : function(data) {
				$("#showBill").html('');
				
				var showBillHtml='';
				showBillHtml+='<a href="javascript:void(7)" onclick="showBillInfo('+billId+');">';
				showBillHtml+=data.billTitle;
				showBillHtml+='</a>';
				
				$("#showBill").append(showBillHtml);
				
			},
			400 : function() {
				$.messager.alert('提示', '请登录!该电话号码已注册');
			},
			500 : function() {
				$.messager.alert('提示', '新增用户失败!');
			}
		}
	});
	
}
function showTemplate(tpId) {
	
	var url="/rest/gm/template/templateInfoBytemplateId?tpId="+ tpId;
	$.ajax({
		type : "GET",
		url : url,
		statusCode : {
			200 : function(data) {
				$("#showTemplate").html('');
				
				var showBillHtml='';
				showBillHtml+='<a href="javascript:void(7)" onclick="showTpInfo('+tpId+');">';
				showBillHtml+=data.tpTitle;
				showBillHtml+='</a>';
				
				$("#showTemplate").append(showBillHtml);
				
			},
			400 : function() {
				$.messager.alert('提示', '请登录!该电话号码已注册');
			},
			500 : function() {
				$.messager.alert('提示', '新增用户失败!');
			}
		}
	});
	
}
function  showTextrue(textrueId) {
	var url="/rest/gm/service/textrue/textrueInfoBytextrueId?textrueId="+ textrueId;
	$.ajax({
		type : "GET",
		url : url,
		statusCode : {
			200 : function(data) {
				$("#showTextrue").html('');
				
				var showTextrueHtml='';
				showTextrueHtml+=data.textrueTitle;
				
				$("#showTextrue").append(showTextrueHtml);
				
			},
			400 : function() {
				$.messager.alert('提示', '请登录!该电话号码已注册');
			},
			500 : function() {
				$.messager.alert('提示', '新增用户失败!');
			}
		}
	});
	
}
//显示款数
function  showNum(billsId) {
	
	var url="/rest/service/bills/detail/querybilsNumDetailBybilsNumId?billId="+ billsId;
	$.ajax({
		type : "GET",
		url : url,
		statusCode : {
			200 : function(data) {
			
				$("#showNum").html('');
				var showNumHtml='';
				for (var i = 0; i < data.length; i++) {
					showNumHtml+='<a href="javascript:void(8)" style="margin-right:20px;" onclick="showNumDetail('+billsId+');">';
					showNumHtml+=data[i].billsTitle;
					showNumHtml+='</a>'
				}
				
				$("#showNum").append(showNumHtml);
				
			},
			400 : function() {
				$.messager.alert('提示', '请登录!该电话号码已注册');
			},
			500 : function() {
				$.messager.alert('提示', '新增用户失败!');
			}
		}
	});
	
}

function showBindStyleById(bindId){
	var url="/rest/gm/service/bind/style/bindStyleInfoBybindId?bindId="+ bindId;
	$.ajax({
		type : "GET",
		url : url,
		statusCode : {
			200 : function(data) {
			
				$("#showBindStyle").html('');
				var showBindStyleHtml='';
				showBindStyleHtml+='<a href="javascript:void(8)" style="margin-right:20px;" onclick="showBindStyleDetail('+data.id+');">';
				showBindStyleHtml+=data.bindTitle;
				showBindStyleHtml+='</a>'
				
				$("#showBindStyle").append(showBindStyleHtml);
				
			},
			400 : function() {
				$.messager.alert('提示', '请登录!该电话号码已注册');
			},
			500 : function() {
				$.messager.alert('提示', '新增用户失败!');
			}
		}
	});
}
