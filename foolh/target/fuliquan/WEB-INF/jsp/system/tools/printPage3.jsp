<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<style >
    @page {
      size: auto;  /* auto is the initial value */
      margin: 0mm; /* this affects the margin in the printer settings */
    }
</style>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>工单详细信息</title>
<script type="text/javascript">
	function printdiv() {
		window.print();
	}
</script>
</head>
<body>
	<input name="b_print" type="button" class="ipt"
		onClick="printdiv();" value=" Print ">
	<div id="div_print">
		<h5 style="Color: Red">The Div dfgsdfgsfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfg</h5>
	</div>
</body>
</html>
</body>
</html>