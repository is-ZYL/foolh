// 截取，得到项目名称
var pathName=window.document.location.pathname;
var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);

var a=0;//判断是处于编辑状态还是查看状态  1、查看； 2、编辑；
var foolTitleIsOK= false; //判断修改的菜品名称是否合格  true可以更改
$(function () {
	/**
	 * 将表单中的数据设置为禁止编辑
	 */
	$("form input").attr("disabled","disabled");
	$("form select").attr("disabled","disabled");
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
if("${foolShop.shopMsg}" == "" || $("#shopMsg").val() == "无"){
	$("#shopMsg").val("");
};
if($("#edit").text() == "更新" && a >= 2 ){
	if (checkInfoIsChanged()) {
		  $.ajax({
            url:projectName+'/foolshop/updateFoolShop',
            type:'POST',
            data:$("#foolMenuUpdate").serialize(),
            async:'true',
            success:function(result) {
            	layer.msg("店铺更新成功",{icon:6});
            	//关闭编辑页面
            	var rows = window.parent.rows;
            	var page = window.parent.page;
            	var type = window.parent.type;
            	alert(rows+"----"+page+"----"+type);
            	top.Dialog.close();
            	//刷新父窗口对象（用于单开窗口）
            	window.opener.location.reload(); 
            },error:function(){
            	layer.msg("店铺更新异常， 请稍后重试！！！");
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

