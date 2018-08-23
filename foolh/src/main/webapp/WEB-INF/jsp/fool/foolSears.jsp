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
body {
	z-index: 100000;
}

[v-cloak] {
	display: none;
}
</style>
</head>

<!-- 添加材料的modal -->
<div class="modal fade bs-example-modal-sm"  id="seasModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
	<div class="modal-dialog ">
		<div class="modal-content">
		 <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">添加材料</h4>
         </div>
			<div class="modal-body">
									
				<tr id="sTitle">
					<td style="width:79px;text-align: center;padding-top: 13px;">材料名:</td>
					<td><input type="text"  class="form-control"  name="seasTitle" id="seasTitle" value="${fs.seasTitle }" placeholder="材料名" onkeyup="value=value.replace(/[^\u4E00-\u9FA5]/g,'')" /></td>
				</tr>
				
				<tr id="sWeight">
					<td style="width:79px;text-align: center;padding-top: 13px;">重量:</td>
					<td><input  type="number"  class="form-control"  name="seasWeigetKg" id="seasWeigetKg"  min="0" placeholder="单位：kg" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" /></td>
				</tr>
				
				<tr id="sSel">
					<td style="width:79px;text-align: center;padding-top: 13px;">材料类型:</td>
					<td>
						<select class="form-control" name="seasSelect" id="seasSelect">
								<option selected="selected" value="0">主料</option>
								<option value="1">配料</option>
								<option value="2">调料</option>
								<option value="3">其他</option>
						</select>
					</td>
				</tr>
				
				<tr id="sMsg">
					<td style="width:79px;text-align: center;padding-top: 13px;">菜品备注:</td>
					<td><input  type="text"  class="form-control" name="seasMsg" id="seasMsg"  min="0" placeholder="备注" onkeyup="value=value.replace(/[^\u4E00-\u9FA5]/g,'')" /></td>
				</tr>
				
			 </div>
		 	 <div class="modal-footer">
               <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
               <button type="button" class="btn btn-primary" onclick="addFoolseasInfo();">提交更改</button>
           	 </div>
		</div>
	</div>
</div>



<!-- 消息模态框（Modal） -->
<div class="modal fade bs-example-modal-sm" id="msgModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-body">没有菜品材料！！</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#seasModal" onclick="addFoolSeasView()">添加材料</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<!-- /.modal -->




<!-- 材料列表的modal -->
<div class="modal fade bs-example-modal-sm"  id="seasModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
	<div class="modal-dialog ">
		<div class="modal-content">
		 <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">添加材料</h4>
         </div>
			<div class="modal-body">
				<c:if test="${foolLibrarySeasList != []}">
									<table id="dynamic-table"
										class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th class="center" style="width: 50px;">序号</th>
												<th class='center'>材料名称</th>
												<th class='center'>材料类型</th>
												<th class='center'>重量</th>
												<th class='center'>创建时间</th>
												<th class='center'>更新时间</th>
												<th class='center'>备注</th>
												<th class='center'>操作</th>
											</tr>
										</thead>
										<tbody id="foolList">
											<!-- 开始循环 -->
											<c:forEach items="${foolLibrarySeasList }" var="seas">
												<tr>
													<td class='center'>${seas.id}</td>
													<td class="center">${seas.seasTitle }</td>
													<td class="center">
															<!-- 0：主料，1.配料，2.调料，3.其它搭配的 --> 
															<c:if test="${seas.seasSelect ==0}"><span class="red" >主料</span></c:if>
															<c:if test="${seas.seasSelect ==1}">配料</c:if>
															<c:if test="${seas.seasSelect ==2}">调料</c:if>
															<c:if test="${seas.seasSelect ==3}">其他</c:if>
													</td>
													<td calss="center" style="text-align: center;">${seas.seasWeigetKg}kg/${seas.seasWeigetCatty} 斤</td>
													<td calss="center" style="text-align: center;"><span>${seas.created}</span></td>
													<td calss="center" style="text-align: center;"><span>${seas.updated}</span></td>
													<td calss="center" style="text-align: center;">${seas.seasMsg}</td>
													<td calss="center " style="text-align: center;">
															<a class="green"><i title="修改" class="ace-icon fa fa-pencil-square-o bigger-130"></i></a> 
															<a class="red"><i title="删除" class="ace-icon fa fa-trash-o bigger-130"></i></a>
													</td>
												</tr>
											</c:forEach>

										</tbody>
									</table>
								</c:if>
			 		</div>
		 	 <div class="modal-footer">
               <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
               <button type="button" class="btn btn-primary" onclick="addFoolseasInfo();">提交更改</button>
           	 </div>
		</div>
	</div>
</div>	



<body class="no-skin">
	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div>
						<div class="row" id="zhongxingss">
							<div class="col-xs-12">
								
								<c:if test="${foolLibrarySeasList != []}">
									<table id="dynamic-table"
										class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th class="center" style="width: 50px;">序号</th>
												<th class='center'>材料名称</th>
												<th class='center'>材料类型</th>
												<th class='center'>重量</th>
												<th class='center'>创建时间</th>
												<th class='center'>更新时间</th>
												<th class='center'>备注</th>
												<th class='center'>操作</th>
											</tr>
										</thead>
										<tbody id="foolList">
											<!-- 开始循环 -->
											<c:forEach items="${foolLibrarySeasList }" var="seas">
												<tr>
													<td class='center'>${seas.id}</td>
													<td class="center">${seas.seasTitle }</td>
													<td class="center">
															<!-- 0：主料，1.配料，2.调料，3.其它搭配的 --> 
															<c:if test="${seas.seasSelect ==0}"><span class="red" >主料</span></c:if>
															<c:if test="${seas.seasSelect ==1}">配料</c:if>
															<c:if test="${seas.seasSelect ==2}">调料</c:if>
															<c:if test="${seas.seasSelect ==3}">其他</c:if>
													</td>
													<td calss="center" style="text-align: center;">${seas.seasWeigetKg}kg/${seas.seasWeigetCatty} 斤</td>
													<td calss="center" style="text-align: center;"><span>${seas.created}</span></td>
													<td calss="center" style="text-align: center;"><span>${seas.updated}</span></td>
													<td calss="center" style="text-align: center;">${seas.seasMsg}</td>
													<td calss="center " style="text-align: center;">
															<a class="green"><i title="修改" class="ace-icon fa fa-pencil-square-o bigger-130"></i></a> 
															<a class="red"><i title="删除" class="ace-icon fa fa-trash-o bigger-130"></i></a>
													</td>
												</tr>
											</c:forEach>

										</tbody>
									</table>
								</c:if>

									<!-- /.col -->
							</div>

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
	<script type="text/javascript" src="static/js/myjs/fool/foolList.js"></script>

	<!-- inline scripts related to this page -->
	<script type="text/javascript">
		
		$(function(){
			if (${foolLibrarySeasList == []}) {
					$("#msgModal").modal({
						show:true,
						 backdrop:'static'
					});
			}
			
			diagClose();
			
		})
	
		$(top.hangge());
		
		//返回
		function goback(id){
			window.location.href="<%=basePath%>address.do?id=" + id;
		}

		//   时间格式化
		function dateFormat(time) {
			var date = new Date(time);
			var year = date.getFullYear();
			/* 在日期格式中，月份是从0开始的，因此要加0
			 * 使用三元表达式在小于10的前面加0，以达到格式统一  如 09:11:05
			 * */
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
		}
		
		
		function addFoolSeasView(){
			$("#msgModal").modal("hide");
		}
		
		function diagClose(){
			if($('body').hasClass('modal-open')){
				diag.close();
			}
		}
		
	</script>

</body>
</html>