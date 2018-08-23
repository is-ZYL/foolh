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

<style type="text/css">
#dialog-add, #dialog-message, #dialog-comment {
	width: 100%;
	height: 100%;
	position: fixed;
	top: 0px;
	z-index: 99999999;
	display: none;
}

.commitopacity {
	position: absolute;
	width: 100%;
	height: 10000px;
	background: #7f7f7f;
	filter: alpha(opacity = 50);
	-moz-opacity: 0.5;
	-khtml-opacity: 0.5;
	opacity: 0.5;
	top: 0px;
	z-index: 99999;
}

.commitbox {
	width: 100%;
	margin: 0px auto;
	position: absolute;
	top: 120px;
	z-index: 99999;
}

.commitbox_inner {
	width: 96%;
	height: 255px;
	margin: 6px auto;
	background: #efefef;
	border-radius: 5px;
}

.commitbox_top {
	width: 100%;
	height: 253px;
	margin-bottom: 10px;
	padding-top: 10px;
	background: #FFF;
	border-radius: 5px;
	box-shadow: 1px 1px 3px #e8e8e8;
}

.commitbox_top textarea {
	width: 95%;
	height: 195px;
	display: block;
	margin: 0px auto;
	border: 0px;
}

.commitbox_cen {
	width: 95%;
	height: 40px;
	padding-top: 10px;
}

.commitbox_cen div.left {
	float: left;
	background-size: 15px;
	background-position: 0px 3px;
	padding-left: 18px;
	color: #f77500;
	font-size: 16px;
	line-height: 27px;
}

.commitbox_cen div.left img {
	width: 30px;
}

.commitbox_cen div.right {
	float: right;
	margin-top: 7px;
}

.commitbox_cen div.right span {
	cursor: pointer;
}

.commitbox_cen div.right span.save {
	border: solid 1px #c7c7c7;
	background: #6FB3E0;
	border-radius: 3px;
	color: #FFF;
	padding: 5px 10px;
}

.commitbox_cen div.right span.quxiao {
	border: solid 1px #f77400;
	background: #f77400;
	border-radius: 3px;
	color: #FFF;
	padding: 4px 9px;
}

.uploadBtn {
	background: #ffffff;
	border: 1px solid #cfcfcf;
	color: #565656;
	padding: 0 18px;
	display: inline-block;
	border-radius: 3px;
	margin-left: 10px;
	cursor: pointer;
	font-size: 14px;
	float: left;
}

.uploadBtn:hover {
	background: #f0f0f0;
}

.uploadBtn {
	background: #00b7ee;
	color: #fff;
	border-color: transparent;
}

.uploadBtn:hover {
	background: #00a2d4;
}

.uploadBtn.disabled {
	pointer-events: none;
	opacity: 0.6;
}
</style>

</head>
<body >

	<!-- 编辑邮箱  -->
	<!-- <div id="dialog-add">
		<div class="commitopacity"></div>
		<div class="commitbox">
			<div class="commitbox_inner">
				<div class="commitbox_top">
					<textarea name="EMAILs" id="EMAILs"
						placeholder="请选输入对方邮箱,多个请用(;)分号隔开" title="请选输入对方邮箱,多个请用(;)分号隔开"></textarea>
					<div class="commitbox_cen">
						<div class="left" id="cityname"></div>
						<div class="right">
							<span class="save" onClick="saveEmail()">保存</span>&nbsp;&nbsp;<span
								class="quxiao" onClick="cancel_pl()">取消</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div> -->

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container" >
		<!-- /section:basics/sidebar -->
		<div class="main-content" >
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row" >
						<div class="col-xs-12">
							<div class="span12">
								<div class="widget-box">
									<div class="widget-body" >
										<div class="widget-main">
											<div class="step-content row-fluid position-relative">
												<div id="zhongxin">
													<textarea name="CONTENT" id="CONTENT" style="display: none"></textarea>
													<table style="width: 100%;" id="xtable">
														
														<tr style="margin-top: 8px;">
															<td>
																用户姓名:<input type="text" value="" maxlength="32"placeholder="这里输入用户姓名"  id="name"
																style="width: 300px; margin-left: 20px;" />
															</td>
														</tr>
														<tr style="margin-top: 8px;">
															<td>
																广告标题:<input type="text" value="" maxlength="32"placeholder="这里输入广告标题"  id="title"
																style="width: 300px; margin-left: 20px;margin-top: 8px;" />
															</td>
														</tr>
														<tr style="margin-top: 8px;">
															<td>
																广告类别：
																<select id= "type" style="width: 300px; margin-left: 8px;margin-top: 8px;">
																	<option value="1">banner</option>
																	<option value="2">券中间广告</option>
																	<option value="3">联系我们h5页面</option>
																	<option value="4">产品中间广告</option>	
																</select>
															</td>
														</tr>
														<tr style="margin-top: 8px;">
															<td>
																广告说明:<input type="text" value="" maxlength="32"placeholder="这里输入广告说明"  id="msg"
																style="width: 300px; margin-left: 20px;margin-top: 8px;" />
															</td>
														</tr>
														<tr style="margin-top: 8px;">
															<td>
																广告排序:<input type="number" value="" min=1, maxlength="32" oninput="javascript:this.value=this.value.replace(/[^\d]/g,'')"
																			placeholder="这里输入广告排序"  id="sort" style="width: 300px; margin-left: 20px;margin-top: 8px;" />
															</td>
														</tr>
														<tr style="margin-top: 8px;">
															<td>
																<form  method="post" id="file" action="" enctype="multipart/form-data">
																    <div>
																    <h6>选择一个HTML文件:<h6>
																    <input id="htmlFile" type="file" accept=".html" name="uploadFile" style="width:200px;" />
																	</div>
																</form>
															</td>
														</tr> 
														<tr style="margin-top: 8px;">
															<td style="padding-top: 10px;">广告图片:<input
																type="hidden" name="PDT_MIN_IMG" id="PDT_MIN_IMG"
																value="" maxlength="150"
																style="width: 200px; margin-left: 20px;" />
																<div class="btn btn-mini btn-primary"
																	style="margin-left: 15px;" onclick="toImgEdit();">上传广告展示图</div>
															</td>
														</tr>
														<tr style="margin-top: 8px;">
															<td style="padding-top: 10px;"><img id="xhImgMin"  width="180" height="180" style="margin-left: 220px;margin-bottom: 20px;margin-top: -30px; "></td>
														</tr>
														<tr id="buzhidao">
															<td style="padding-top: 10px;">
																<div v-for="(x,index) in imgUrl"
																	style="position: relative; display: inline-block">
																	<img :src="aa+x" id="pdtImgMin" width="100" height="100"
																		style="margin-left: 20px;"> <a
																		@click="del(index)"
																		style="position: absolute; top: 0; right: 0"
																		class="btn btn-mini btn-danger"> <i
																		class="ace-icon fa fa-trash-o bigger-120"></i>
																	</a>
																</div>
															</td>
														</tr>
															<tr>
																<td style="text-align: center;margin-top: 10px;" colspan="10"><a
																	class="btn btn-mini btn-primary" onclick="save();">保存</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																	<a class="btn btn-mini btn-danger"
																	onclick="top.Dialog.close();">取消</a>
																</td>
															</tr>
				
														
													</table>
												</div>
												<div id="zhongxin2" class="center" style="display: none">
													<br />
													<br />
													<br />
													<br />
													<br />
													<img src="static/images/jiazai.gif" /><br />
													<h4 class="lighter block green">提交中...</h4>
												</div>
											</div>
										</div>
										<!--/widget-main-->
									</div>
									<!--/widget-body-->
								</div>
							</div>
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
	<!-- ace scripts -->
	<!-- 编辑框-->
	<script type="text/javascript" charset="utf-8">window.UEDITOR_HOME_URL = "<%=path%>/plugins/ueditor/";
	</script>
	<script type="text/javascript" charset="utf-8"
		src="plugins/ueditor/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8"
		src="plugins/ueditor/ueditor.all.js"></script>
	<!-- 编辑框-->
	<script src="static/vue.js"></script>
	<script src="static/vue-resource.js"></script>
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script src="static/ace/js/ace/ace.js"></script>
	<!--引入属于此页面的js -->
	<script type="text/javascript" src="static/js/myjs/toolEmail.js"></script>
	<script type="text/javascript" src="plugins/webuploader/webuploader.js"></script>
	<script type="text/javascript" src="plugins/webuploader/jquery.js"></script>
	<script type="text/javascript" src="plugins/webuploader/upload.js"></script>
	<script type="text/javascript" src="static/IMGurl.js"></script>
	<script type="text/javascript">
	
	   var pdt=localStorage.getItem("pdtId");
	   
	   var shopnames = new Vue({
		   el:'#shopname',
		   data:{
			   shop:{},
			   typeName:{},
			   selecteShop:''
		   },
		   
		  <%--  created:function(){			 
			  var urls="<%=basePath%>shop/getListShop"
			  this.$http.get(urls).then(function(data){
                   this.shop = data.body;
 		 
			  },function(response){
                    console.info(response);
                });
		   }, --%>
		   methods:{
			   changeshopname:function(){
		        	  var ids = this.selecteShop;
		        	 
		              var url2="<%=basePath%>product/type/getListTypeByParentId?id="+ids;
			          this.$http.get(url2).then(function(data){
			       	       this.typeName=data.body;
			       	    pdtType.options=data.body;		       	   
			       	   },function(response){
			       	         console.info(response);
			       	    });
		          }
		   }
	   });
	   
	   var pdtBanner= new Vue({  
	        el: '#PDT_BANNER_ID',  
	        data: {  
	          selected: '1',
	          options: []
	        },
	        created:function(){
	        	console.log(this.options)
	        	
	        	 var url="<%=basePath%>banner/getBannerByPage";
	        	 this.$http.get(url).then(function(data){
	        		 	var json=data.body;
	                    this.options=json.rows
	                   
	                },function(response){
	                   console.info(response);
	               });
	        }
	      }); 
	  
	  var buzhidao = new Vue({
		   el:'#buzhidao',
		   data:{
			   imgUrl:[],
			   aa:imgUrlsss
			   
			   
		   },
		   methods:{
			   del(index){
				   this.imgUrl.splice(index,1)
			   }
		   }
	   }); 
	   var pdtType= new Vue({  
	        el: '#PDT_TYPE_ID',  
	        data: {  
	          selected: '',
	          selectede:'',
	          colour : '',
	          sizes : '',
	          options: [],
	          opti:[],
	          pdt:{},
	          colours :[],
	          size : []	          
	        },
	        created:function(){
	        },
	        methods:{
	        }
	      })  
	   	
	  	 var imgUrldd='';
		function toImgEdit() {		   
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增广告图片";
			 diag.URL = '<%=basePath%>page/AD/Ad_addImage';
			 diag.Width = 800;
			 diag.Height = 755;
			 diag.Modal = true;				//有无遮罩窗口
			 diag. ShowMaxButton = true;	//最大化按钮
		     diag.ShowMinButton = true;		//最小化按钮
			 diag.CancelEvent = function(){ //关闭事件
		        var pdtMinImg=localStorage.getItem("pdtMinImg");
		        if(pdtMinImg==null){
		        	diag.close();
		        	return ;
		        }
		        var strs= new Array(); //定义一数组
				strs=pdtMinImg.split(",");
				var imgUrl=strs[0];				
				imgUrldd=imgUrl;
				// 在这里改访问地址  先设置为本地地址  上线时需要改
				var a = imgUrlsss;
				// var a ="http://image.xnxs.com/";
				//alert(a+imgUrl);
				$("#xhImgMin").attr('src',a+imgUrl);
				 diag.close();
			 };
			 diag.show();
		}
		
	  //上传HTML文件
		<%-- 	  function uploadFiles(){  
		// 	var uploadFile = $('#excelFile').get(0).files[0];
			var uploadFile = new FormData($("#file")[0]);
			console.log(uploadFile);
			if("undefined" != typeof(uploadFile) && uploadFile != null && uploadFile != ""){
				//alert("调用");
				$.ajax({
					url:'<%=path%>/app/user/postHTML',
					type:'POST',
					data:uploadFile,
					async: false,  
					cache: false, 
					contentType: false, //不设置内容类型
					processData: false, //不处理数据
					success:function(data){
						console.log(data);
						alert("上传成功");
					},
					error:function(){
						alert("上传失败！");
					}
				})
			}else {
				alert("选择的文件无效！请重新选择");
			}
		}    --%> 
	   
		
   	//保存
		function save() {
			//获取富文本编辑器里面的内容
			var name = $("#name").val();
			var title = $("#title").val();
			var type = $("#type").val();
			var msg = $("#msg").val();
			var sort = $("#sort").val();
			var ImgUrl=imgUrldd;
			//alert(ImgUrl);
			var formData = new FormData();
			//var uploadFile = new FormData($("#file")[0]);
			var uploadFile = $('#htmlFile').get(0).files[0];
			console.log(uploadFile);
			var file = $("#htmlFile").val();
			var html= GetFileExt(file);
			if (html!=".html") {
				alert("请选择正确格式的HTML文件");
				return false;
			}
			formData.append("uploadFile",uploadFile);
			formData.append("name", name);
			formData.append("adTitle", title);
			formData.append("adType", type);
			formData.append("adMsg", msg);
			formData.append("adSort", sort);
			formData.append("adImg", ImgUrl);
			//formData.append("photo", pdtMinImg);
			$.ajax({
					url:'<%=path%>/back/addAd',
					type:'POST',
					data:formData,
					async: false,  
					cache: false, 
					contentType: false, //不设置内容类型
					processData: false, //不处理数据
					success:function(data){
						console.log(data);
						alert('添加成功')
						window.location.href="about:blank";
					 	top.Dialog.close();
					},
					error:function(){
						alert('添加失败');
					}
				}) 
		}
   		//取文件名
		function getFileName(path){
			var pos1 = path.lastIndexOf('/');
			var pos2 = path.lastIndexOf('\\');
			var pos = Math.max(pos1, pos2)
			if( pos<0 )
			return path;
			else
			return path.substring(pos+1);
			}
		//取文件后缀名
	       function GetFileExt(filepath) {
	           if (filepath != "") {
	               var pos = "." + filepath.replace(/.+\./, "");
	               return pos;
	           }
	       }
	   
		function yanzhengjine(obj) {

		    var id = obj.id;
		    var val = obj.value;
		    var regStrs = [['^0(\\d+)$', '$1'], ['[^\\d\\.]+$', ''], ['\\.(\\d?)\\.+', '.$2'], ['^(\\d+\\.\\d{2}).+', '$1']];
		    for ( i = 0; i < regStrs.length; i++) {
		        var reg = new RegExp(regStrs[i][0]);
		        obj.value = obj.value.replace(reg, regStrs[i][1]);
		    }

		}
		
	       //localStorage.removeItem("name");

		
		

		
		

		function getLocalTimeHMS(date2) {
			var date = new Date(date2);
			var Y = date.getFullYear() + '-';
			var M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1)
					: date.getMonth() + 1)
					+ '-';
			var D = date.getDate() + ' ';
			var h = date.getHours() + ':';
			var m = date.getMinutes() + ':';
			var s = date.getSeconds();
			return Y + M + D + h + m + s;

		}
		/*关闭窗口*/
		function CloseWebPage() {     
		    if (navigator.userAgent.indexOf("MSIE") > 0) {     
		        if (navigator.userAgent.indexOf("MSIE 6.0") > 0) {     
		            window.opener = null; window.close();     
		        }     
		        else {     
		            window.open('', '_top'); window.top.close();     
		        }     
		    }     
		    else if (navigator.userAgent.indexOf("Firefox") > 0) {     
		        window.location.href = 'about:blank '; //火狐默认状态非window.open的页面window.close是无效的    
		        //window.history.go(-2);     
		    }     
		    else {     
		        window.opener = null;      
		        window.open('', '_self', '');     
		        window.close();     
		    }     
		}  
	</script>
</body>
</html>