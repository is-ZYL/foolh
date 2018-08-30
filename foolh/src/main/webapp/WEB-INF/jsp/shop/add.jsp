<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">

<!-- jsp文件头和头部 -->
<%@ include file="../system/index/top.jsp"%>
<style type="text/css">
body {
	z-index: 100000;
}
.my-container{
	max-width:500px;
	margin: 0 auto;
}
</style>
</head>

<body>


	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content my-container">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="page-header">
							<h1>
								<small>
									<i class="ace-icon fa fa-angle-double-right"></i>
									新增
								</small>
							</h1>
					</div>
					
					<div class="row">
						<div class="col-xs-12">
								<form class="form-horizontal"  action="<%=basePath%>foolshop/addShop" name="menuForm" id="menuForm" method="post" >
									<div id="zhongxin" style="padding-top: 13px;">
									<table  id="table_report" class="table table-striped table-bordered table-hover">
									
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;"> 店铺名称:</td>
											<td><input type="text" class="form-control" name="shopTitle" id="shopTitle"  onkeyup="value=value.replace(/[^\u4E00-\u9FA5]/g,'')" placeholder="这里输入店铺名称"  /></td>
										</tr>
										
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;"> 店铺执照: </td>
											<td><button type="button" class="btn btn-info btn-mini form-control glyphicon glyphicon-plus" style="outline:none;opacity: 0.5;" name="shopImg" id="shopImg" onclick="toImgEdit();" >添加店铺执照</button></td>
										</tr>

										<!-- 菜品小图回显 -->
										<tr id="shopImgViews" style="display: none">
											<td style="width:79px;text-align: right;padding-top: 13px;"></td>
											<td>
												<center>
													<img  id="xhImgMin"  alt="店铺小图" src="" width="240" height="100px" style="border:1px solid red;">
												</center>
											</td>
										</tr>
										
										
										
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;"> 老板姓名: </td>
											<td><input type="text" class="form-control" name="shopBossName" id="shopBossName" placeholder="老板姓名"  onkeyup="value=value.replace(/^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\d{8}$/g,'')"/></td>
										</tr>
										
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;"> 联系电话: </td>
											<td><input type="text" class="form-control" name="shopPhone" id="shopPhone" placeholder="默认为添加用户电话"  onkeyup="value=value.replace(/^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\d{8}$/g,'')"/></td>
										</tr>
										
										
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;"> 店铺介绍: </td>
											<td><input type="text" class="form-control" name="shopMsg" id="shopMsg"  placeholder="请填写店铺介绍"  /></td>
										</tr>
										
										<tr>
											<td style="width:79px;text-align: center;padding-top: 13px;"> 店铺类型:</td>
											<td>
												<select class="col-xs-10 col-sm-5 form-control" name="shopType" onchange="setSendTime(this.value)" id="shopType">
											  		<option selected="selected" value="0">请选择店铺类型</option>
											  		<option value="1">饭店</option>
													<option value="2">蔬菜配送</option>
													<option value="3">水果</option>
													<option value="4">调料干杂</option>
													<option value="5">水产</option>
													<option value="6">海鲜</option>
													<option value="7">其它</option>
												</select>
											</td>
										</tr>
										
										<tr id="addSendTime" style="display: none">
											<td style="width:79px;text-align: right;"> 送货时间: </td>
											<td id="shopSendTime"><input style="height: 30px;text-align: center;" type="time" name="shopSendTime" id="shopSendTime_1" required/>  至   <input type="time" style="height: 30px;text-align: center;" name="shopSendTime" id="shopSendTime_2" required/></td>
										</tr>
										
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;"> 店铺地址: </td>
											<td id="r-result">
												<input type="text" class="form-control" name="shopAddress" id="shopAddress"  placeholder="请输入地点/可点击地图选择" /> 
											 </td>
										</tr>
										<tr>
											<td colspan="10000">
												<div id="map_show"></div>
											<div id="icon_header"></div>
											<div id="searchResultPanel" style="display:none;"></div>
											</td>
										</tr>
										
										<tr>
											<td style="text-align: center;" colspan="10">
												<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
												<a class="btn btn-mini btn-danger" id="swfContainer" onclick="formRestInfo('#menuForm')">重置</a>
											</td>
										</tr>
									</table>
									</div>
									<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
								</form>
						</div>
						<!-- /.col -->
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
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript" src="static/underscore-min.js"></script>
	<script type="text/javascript" src="static/imgUrl.js"></script>
	<script type="text/javascript" src="static/js/myjs/shop/shopAdd.js"></script>
	<!--引入百度地图API-->
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=iBM9rbzTH2dMZW7MbYMYmFgb"></script>
 <script>
 	var point ;//地址经纬度
 	
    function AddMap(){
        //设置地图容器高度
        var screenH=window.innerHeight;
        var headerH=this.elById("icon_header").offsetHeight;
        this.elById("map_show").style.height=screenH-headerH+"px";
    }

    /**
     * @param el 地图初始化容器
     * @param p  初始化坐标点
     */
    AddMap.prototype.init=function(el,p){
        var point={
            lng:116.404113,
            lat:39.914965
        };
        if(p && p.lng && p.lat){
            point.lng=p.lng;
            point.lat=p.lat;
        }
        this.m = new BMap.Map(el);      //实例化地图
        this.p = new BMap.Point(point.lng,point.lat);

        this.m.enableContinuousZoom();    //启用地图惯性拖拽
        this.m.enableScrollWheelZoom();   //启用滚轮放大缩小
        this.m.centerAndZoom(this.p, 12);  //设置地图显示中间点、地图显示级别

        this.addMaker(this.p);
        this.search();               //搜索
        this.getLocation();
        this.getAdress();
    };
    var gc = new BMap.Geocoder();
    //获取坐标点位置
    AddMap.prototype.getLocation=function(){
        var _this=this;
        var confirm=this.elById("shopAddress");
        confirm.addEventListener("click",function(e){
            var makerPoint=_this.makerPoint();
            gc.getLocation(makerPoint, function(rs){    
                var addComp = rs.addressComponents;
                $("#shopAddress").val(addComp.province + addComp.city + addComp.district + addComp.street + addComp.streetNumber);
                alert(point);
            });  
        });
    };
    
    //点击地图通过逆解析获取详细地址信息
    AddMap.prototype.getAdress = function(){
    	this.m.addEventListener("click", function(e){
    		gc.getLocation(e.point, function(rs){    
                var addComp = rs.addressComponents;
                $("#shopAddress").val(addComp.province + addComp.city + addComp.district + addComp.street + addComp.streetNumber);
                window.point = e.point.lng+","+e.point.lat; //保存经纬度
                alert(point);
            })
    	});
	}
    AddMap.prototype.elById=function(id) {
        return document.getElementById(id);
    };

    //添加坐标显示
    AddMap.prototype.addMaker=function(location){
        var mk = new BMap.Marker(location);
        mk.enableDragging();        //marker可拖拽
        mk.enableMassClear();
        this.m.addOverlay(mk); //在地图中添加marker
        this.makerPoint=function(){
            return mk.getPosition(); //返回当前坐标
        };

    };

    //搜索
    AddMap.prototype.search=function(){
        var _this=this;
        var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
                {
                    "input" : "shopAddress",
                    "location" : _this.m
                }
        );
        ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
            var _value = e.item.value;
            myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
            _this.elById("searchResultPanel").innerHTML ="onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;
            _this.setPlace(_this.m);
        });
    };

   
    
    //定位到具体位置
    AddMap.prototype.setPlace=function(m){
        var _this=this;
        m.clearOverlays();    //清除地图上所有覆盖物
        function myFun(){
            var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
            m.centerAndZoom(pp, 15);  //设置地图显示中间点、地图显示级别
            _this.addMaker(pp);
        }
        var local = new BMap.LocalSearch(m, { //智能搜索
            onSearchComplete: myFun
        });
        local.search(myValue);
    };

    var mapInclude=new AddMap();

    //初始化地图
    //需传入容器DOM（id），可传坐标点定位
    mapInclude.init("map_show",{lng:104.072247,lat:30.663436});

</script>

</body>
 </html>