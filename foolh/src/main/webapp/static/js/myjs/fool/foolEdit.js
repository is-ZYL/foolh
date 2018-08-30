// 截取，得到项目名称
var pathName=window.document.location.pathname;
var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);

var a=0;//判断是处于编辑状态还是查看状态  1、查看； 2、编辑；
var foolTitleIsOK= false; //判断修改的菜品名称是否合格  true可以更改
var foolTypeList=[];
$(function () {
/**
 * 将表单中的数据设置为禁止编辑
 */
$("form input").attr("disabled","disabled");
$("form select").attr("disabled","disabled");
/**
 * 获得焦点  还原边框颜色
 */
$("#foolTitle").focus(function(){
	$(this).css("border","1px solid #d5d5d5");
})
//获取所有店铺信息
getShopList();
getFoolType();
})

$(top.hangge());

//返回
function goback(id){
	window.location.href=projectName+"/address.do?id="+id;
}

/**
 * 更新数据
 * @returns
 */
function update(){
	a++;
	$("#edit").text("更新");
//将除id以外的输入框属性改为可写(注：id不可更改)
$("form input[id != 'id1']").attr("disabled",false);
$("form select").attr("disabled",false);
if("${fm.foolMsg}" == "" || $("#foolMsg").val() == "无"){
	$("#foolMsg").val("");
};
if($("#edit").text() == "更新" && a >= 2 ){
	if (checkInfoIsChanged()) {
		  $.ajax({
            url:projectName+'/user/updateFoolMenu',
            type:'POST',
            data:$("#foolMenuUpdate").serialize(),
            async:'true',
            success:function(result) {
            	alert("菜品更新成功");
            	//关闭编辑页面
            	top.Dialog.close();
            	parent.location.reload();
            },error:function(){
				alert("菜品更新异常， 请稍后重试！！！");
		        } 
	        }) 		
		}
	}
	
}

/**
 * 获取所有店铺信息
 * @returns
 */
function getShopList(){
	$.ajax({
        url:projectName+'/foolshop/getShopLists',
        type:'get',
        data:{'rows':'20','page':'1','type':'100'},
        async:'true',
        dataType:"json",
        success:function(result) {
        	//将查询出来的店铺进行遍历插入到foolShopId选项栏中
        	 $.each(result.rows,function(n,value) {
        		$("#foolShopId").append($("<option></option>").text("店铺名: " +value.shopTitle + " 店铺id: " + value.id).val(value.id));
        		})
        },error:function(){
			alert("获取店铺异常， 请稍后重试！！！");
        }
    })
	}

/**
 * 检查菜品名称是否存在 如果存在则不允许再次添加
 * @param foolTitle
 * @returns
 */
function checkfoolTitle(foolTitle){
	var result = $(foolTitle).val();
	var resultByht = "${fm.foolTitle }";
		if (result != null && result != "" && result != resultByht ) {
			$.ajax({
				url:projectName+'/user/getFoolMenuLibraryTitle?foolTitle='+$(foolTitle).val(),
				type:"get",
				success:function(data){
					if(data.foolTitle == undefined || data.foolTitle != $(foolTitle).val()){
						foolTitleIsOK = true;
						$("#foolTitle").css("border","1px solid #d5d5d5");
					}else{
						$("#foolTitle").tips({
							side : 3,
							msg : '菜品名重复',
							bg : '#AE81FF',
							time : 2
						});
						$("#foolTitle").css("border","1px solid red");
						foolTitleIsOK = false;
					}
				},
				error:function(){
					foolTitleIsOK =  false;
				}
			})
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
						$("#foolType").append($("<option></option>").text(value.type).val(value.id));
	                })
	                $("#foolType").val($("#foolId").val());
	            },
	            error: function () {
	                layer.msg('获取所有菜品类型失败， 请稍后重试！！！', {icon: 6});
	            }
	        })
}
//$("#foolType").append($("<option></option>").text(val).val(id));
function getFoolTypeVal(id){// 根据菜品类型id获取当前类型的值
	var val;
	if (foolTypeList.length >0) {
		$.each(menuList.foolType,function(a,b){
			if (b.id === id) {
				val = b.type;
				return;
			}
		})
	} 
	return val;
}
