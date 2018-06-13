<%@page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<%@include file="/tag.jsp" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>****表</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport"
		  content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
	<link rel="stylesheet" href="../../../lib/layui/css/layui.css">
	<link rel="stylesheet" href="../../../css/font.css">
	<link rel="stylesheet" href="${baseurl}/lib/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${baseurl}/lib/bootstrapFileinput/css/default.css">
	<link rel="stylesheet" href="${baseurl}/lib/bootstrapFileinput/css/fileinput.css">
	<%--<script type="text/javascript" src="../../../js/jquery.min.js"></script>--%>
	<script type="text/javascript" src="${baseurl}/lib/bootstrapFileinput/jquery1.11.o.min.js"></script>
	<script>window.jQuery || document.write('<script src="js/jquery-1.11.0.min.js"><\/script>')</script>

	<script src="${baseurl}/lib/bootstrapFileinput/js/fileinput.js" type="text/javascript"></script>
	<!--简体中文-->
	<script src="${baseurl}/lib/bootstrapFileinput/js/locales/zh.js" type="text/javascript"></script>
	<!--繁体中文-->
	<script src="${baseurl}/lib/bootstrapFileinput/js/locales/zh-TW.js" type="text/javascript"></script>
	<script src="${baseurl}/lib/bootstrapFileinput/js/bootstrap.min.js" type="text/javascript"></script>


	<script type="text/javascript" src="../../../lib/layui/layui.js" charset="utf-8"></script>
	<script type="text/javascript" src="../../../js/xadmin.js"></script>

	<%--S       BZY      --%>
	<%@include file="/tag.jsp"%>
	<script type="text/javascript" src="../../../js/public/dateUtil.js"></script>
	<script type="text/javascript" src="../../../js/outsideGraduateDesiner/util.js"></script>
	<script type="text/javascript" src="../../../js/outsideGraduateDesiner/loadInfo.js"></script>
	<%--E       BZY      --%>
	<style>
		input
	</style>
</head>

<body>

<div class="x-body" style="margin:20px auto 50px auto; width:95%;">
	<div class="layui-tab">
		<ul class="layui-tab-title">
			<li class="layui-this">校外毕业设计申请</li>
			<li>校外实践课题申请</li>
			<li>请假申请</li>
			<li>任务书</li>
			<li>自我管理协议书</li>
			<li>保证书</li>
			<li>附件</li>
		</ul>



		<%--  x校外毕设申请的基本信息表   --%>
		<div class="layui-tab-content">
			<!--基本信息申请表-->
			<div class="layui-tab-item layui-show" id="Applyinfo">
				<form action="" class="layui-form" disabled="true">
					<table class="table table-bordered ">
						<caption style="text-align: center;">
							<h1>太原科技大学计算机科学与技术学院</h1>
							<h3>学生校外毕业设计（包括实习）申请表</h3>
						</caption>
						<tbody>
						<%--基本信息申请表--%>
						<tr>
							<td>学生姓名</td>
							<td>
								<input type="text" class="form-control studentname" readonly="true" name="studentname">
							</td>
							<td>性别</td>
							<td>
								<input type="text" class="form-control sex" readonly="true"  name="sex">

							</td>
							<td>专业班级</td>
							<td>
								<input type="text" class="form-control majorclass" readonly="true"  name="majorclass">
							</td>
						</tr>
						<tr>
							<td>指导教师</td>
							<td>
								<input type="text" class="form-control inteachername" readonly="true"  name="inteachername">
							</td>
							<td>接收单位名称</td>
							<td colspan="3">
								<input type="text" name="receiveUnit"  class="form-control receiveUnit" readonly>
							</td>
						</tr>
						<tr id="student">
							<td>学生申请原因</td>
							<td colspan="3">

								<textarea readonly cols="100" rows="4" class="form-control applyreason"  name="applyreason"></textarea>
							</td>
							<td>
								<div style="height: 40px;">申请人签名</div>
								<hr />
								<div style="height: 10px;">申请时间</div>

							</td>

							<td colspan="1">
								<div style="height: 40px;">
									<img src="../../../images/info.jpg" width="165px" height="50px" class="url stusignurl"  name="stusignurl"/>
									<%--<input onclick="studentSign()"  class="layui-btn" type="button" value="签名"></input>--%>

								</div>
								<hr />
								<input type="datetime"  class="form-control applydate stuapplydate"  name="stuapplydate" readonly>
							</td>

						</tr>

						<!--家长意见-->
						<tr class="0">
							<td>家长意见</td>
							<td colspan="3">
								<div>
									<input type="radio" name="opinion" class="agree" value="1" title="同意"/>
									<input type="radio" name="opinion" calss="disagree" value="0" title="不同意"/>
								</div>
								<textarea readonly cols="100" rows="3" class="form-control advice"></textarea>
							</td>
							<td><div style="height: 40px;">家长签名</div>
								<hr />
								<div>签字时间</div>
							</td>
							<td colspan="1">
								<div style="height: 40px;">
									<img src="../../../images/info.jpg" width="170px" height="50px" class="url" name="parentsurl"/>
									<%--<input onclick="parentsSign()" type="button" class="layui-btn"  style="float: right; width: 65px;" value="签名"></input>--%>
								</div>
								<hr />
								<input type="datetime" readonly class="form-control applydate" name="parentsapplydate">
							</td>

						</tr>
						<!--指导教师意见-->
						<tr class="1">
							<td>指导教师意见</td>
							<td colspan="3">
								<div>
									<input type="radio" name="opinion1" class="agree" value="1" title="同意" />
									<input type="radio" name="opinion1" class="disagree" value="0" title="不同意"/>
								</div>
								<textarea readonly cols="100" rows="3" class="form-control advice"></textarea>
							</td>
							<td><div style="height: 50px;">指导教师签名</div>
								<hr />
								<div>签字时间</div>

							</td>

							<td colspan="1">
								<div style="height: 50px;">
									<img src="../../../images/info.jpg" width="170px" height="50px" class="url"/>
									<%--<button type="button" onclick="inteacherSign()" class="layui-btn"  style="float: right;">签名</button>--%>
								</div>
								<hr />
								<input type="datetime"  readonly class="form-control applydate">
							</td>

						</tr>
						<!--学生部门意见-->
						<tr class="2">
							<td>学生部门意见</td>
							<td colspan="3">
								<div>
									<input type="radio" name="opinion2" class="agree" value="" title="同意"/>
									<input type="radio" name="opinion2" class="disagree" value="" title="不同意"/>
								</div>
								<textarea readonly cols="100" rows="3" class="form-control advice"></textarea>
							</td>
							<td><div style="height: 50px;">主管书记签名</div>
								<hr />
								<div>签字时间</div>

							</td>

							<td colspan="1">
								<div style="height: 50px;">
									<img src="../../../images/info.jpg" width="170px" height="50px" class="url"/>
									<%--<button type="button" class="layui-btn"  style="float: right;">签名</button>--%>
								</div>
								<hr />
								<input type="datetime" readonly class="form-control applydate">
							</td>

						</tr>
						<!--教研室意见-->
						<tr class="3">
							<td>教研室意见</td>
							<td colspan="3">
								<div>
									<input type="radio" name="opinion3" class="agree" value="1" title="同意"/>
									<input type="radio" name="opinion3" class="disagree" value="0" title="不同意"/>
								</div>
								<textarea readonly cols="100" rows="3" class="form-control advice"></textarea>
							</td>
							<td><div style="height: 50px;">教研室主任签名</div>
								<hr />
								<div>签字时间</div>

							</td>

							<td colspan="1">
								<div style="height: 50px;">
									<img src="../../../images/info.jpg" width="170px" height="50px" class="url"/>
									<%--<button type="button" class="layui-btn"  style="float: right;">签名</button>--%>
								</div>
								<hr />
								<input type="datetime"  readonly class="form-control applydate">
							</td>

						</tr>
						<!--计算机学院意见-->
						<tr class="4">
							<td>计算机学院意见</td>
							<td colspan="3">
								<div>
									<input type="radio" name="opinion4" class="agree" value="" title="同意"/>
									<input type="radio" name="opinion4" class="disagree" value="" title="不同意"/>
								</div>
								<textarea readonly cols="100" rows="3" class="form-control advice"></textarea>
							</td>
							<td><div style="height: 50px;">主管院长签名</div>
								<hr />
								<div>签字时间</div>

							</td>

							<td colspan="1">
								<div style="height: 50px;">
									<img src="../../../images/info.jpg" width="170px" height="50px" class="url"/>
									<%--<button type="button" class="layui-btn" id="test1" style="float: right;">签名</button>--%>
								</div>
								<hr />
								<input type="datetime"  readonly class="form-control applydate">
							</td>
						</tr>
						</tbody>
					</table>
				</form>
			</div>
			<!--基本申请表结束-->



			<!--校外实践课题申请-->
			<div class="layui-tab-item" id="title">
				<form action="" class="layui-form" id="form" method="post">
					<table class="table table-bordered ">
						<caption style="text-align: center;">
							<h1>太原科技大学计算机科学与技术学院</h1>
							<h3>校外实践课题申请表</h3>
							<div style="float: right">
								<label class="layui-form-label">
									时间：
								</label>
								<div class="layui-input-inline" style="width: 135px">
									<input type="datetime"  readonly  class="form-control applyDate">
								</div>
							</div>

						</caption>
						<tbody>
						<tr>
							<td rowspan="8">课程情况</td>
							<td>课程名称</td>
							<td colspan="6">
								<input   type="text" readonly class="outgradesignapplyid" name="outgradesignapplyid" style="display: none">
								<input  class="form-control courseName" readonly type="text" id="courseName" name="coursename">
							</td>
						</tr>
						<tr>
							<td colspan="1">学生姓名 </td>
							<td colspan="2"><input type="text" class="form-control studentName" id="studentName" readonly></td>
							<td colspan="1">专业
							<td colspan="2"><input type="text" class="form-control studentMajor" id="studentMajor" readonly></td>
							</td>

						</tr>
						<tr>
							<td colspan="1">班级 </td>
							<td colspan="2"><input type="text" class="form-control majorClass" id="majorClass" readonly></td>
							<td colspan="1">学号
							<td colspan="2"><input type="text" class="form-control studentNum" id="studentNum" readonly></td>
							</td>
						</tr>
						<tr>
							<td>校外单位</td>
							<td colspan="7">
								<input  class="form-control outUnitName" readonly  type="text" id="outUnitName" name="outunitname">
							</td>
						</tr>
						<tr>
							<td colspan="1">单位地址 </td>
							<td colspan="2"><input type="text" readonly  class="form-control outUnitAddr" id="outUnitAddr" name="outunitaddr"></td>
							<td colspan="1">联系方式
							<td colspan="2"><input type="text" readonly class="form-control outUnitPhone" id="outUnitPhone" name="outunitphone"></td>
							</td>
						</tr>
						<tr>
							<td colspan="1">学生联系方式 </td>
							<td colspan="2"><input type="text" readonly class="form-control studentPhone" id="studentPhone" name="studentphone"></td>
							<td colspan="1">学生家长联系方式
							<td colspan="2"><input type="text" readonly class="form-control stuParentPhone" id="stuParentPhone" name="stuparentphone"></td>
							</td>
						</tr>
						<tr>
							<td colspan="1">校内导师 </td>
							<td colspan="2"><input type="text" readonly class="form-control inTeacherName" id="inTeacherName"  readonly></td>
							<td colspan="1">导师联系方式
							<td colspan="2"><input type="text" readonly class="form-control inTeacherPhone" id="inTeacherPhone" name="inteacherphone"></td>
							</td>
						</tr>
						<tr>
							<td colspan="1">校外导师 </td>
							<td colspan="2"><input type="text" readonly class="form-control outTeacherName" id="outTeacherName" name="outteachername"></td>
							<td colspan="1">导师联系方式
							<td colspan="2"><input type="text" readonly class="form-control outTeacherPhone" id="outTeacherPhone" name="outteacherphone"></td>
							</td>
						</tr>
						<tr>
							<td>课题简介</td>
							<td colspan="6">
								<textarea readonly class="layui-textarea form-control courseDescription" id="courseDescription" name="coursedescription"></textarea>
							</td>
						</tr>
						<tr>
							<td>实践内容</td>
							<td colspan="6">
								<textarea  readonly class="layui-textarea form-control testContent" id="testContent" name="testcontent"></textarea>
							</td>
						</tr>
						<tr>
							<td>实践要求</td>
							<td colspan="6">
								<textarea  readonly class="layui-textarea form-control testStandard" id="testStandard" name="teststandard"></textarea>
							</td>
						</tr>
						<tr>
							<td>成果形式</td>
							<td colspan="6">
								<div class="layui-inline">
									<label for="L_pass" class="layui-form-label">
										A
									</label>
									<input type="radio" name="resulttype" lay-skin="primary" title="论文" class="radio1" value="论文">
								</div>
								<div class="layui-inline">
									<label for="L_pass" class="layui-form-label">
										B
									</label>
									<input type="radio" name="resulttype" lay-skin="primary" title="软件" class="radio2" value="软件">
								</div>
								<div class="layui-inline">
									<label for="L_pass" class="layui-form-label">
										C
									</label>
									<input type="radio" name="resulttype" lay-skin="primary" title="实物制作" class="radio3" value="实物制作">
								</div>
								<div class="layui-inline">
									<label for="L_pass" class="layui-form-label">
										D
									</label>
									<input type="radio" name="resulttype" lay-skin="primary" title="报告" class="radio4" value="报告">
								</div>
								<div class="layui-inline">
									<label for="L_pass" class="layui-form-label">
										E
									</label>
									<input type="radio" name="resulttype" lay-skin="primary" title="其它" class="radio5" value="其他">
								</div>
							</td>
						</tr>

						<tr class="1">
							<td>校内导师审批签字</td>
							<td colspan="3">
								<div>
									<input type="radio" name="opinion1" class="agree"  title="同意"/>
									<input type="radio" name="opinion1" class="disagree"  title="不同意"/>
								</div>
								<textarea readonly  cols="100" rows="3" class="form-control advice" ></textarea>
							</td>
							<td><div style="height: 50px;">导师签名</div>
								<hr />
								<div>签字时间</div>

							</td>

							<td colspan="3" >
								<div style="height: 50px; width: 230px;">
									<img src="../../../images/info.jpg" width="150px" height="50px" class="url"/>
									<%--<input onclick="tutorSign()" value="签名" type="button" class="layui-btn" style="float: right;"></input>--%>
								</div>
								<hr />
								<input type="datetime"  readonly  class="form-control applydate">
							</td>

						</tr>
						<tr class="2">
							<td>教研室主任审批签字</td>
							<td colspan="3" >
								<div>
									<input type="radio" name="opinion2" class="agree" value="" title="同意"/>
									<input type="radio" name="opinion2" class="disagree" value="" title="不同意"/>
								</div>
								<textarea readonly  cols="100" rows="3" class="form-control advice"></textarea>
							</td>
							<td><div style="height: 50px;">主任签名</div>
								<hr />
								<div>签字时间</div>
							</td>
							<td colspan="3">
								<div style="height: 50px; width:230px;">
									<img src="../../../images/info.jpg" width="150px" height="50px" class="url"/>
									<%--<input type="button" value="签字" class="layui-btn"  style="float: right;"></input>--%>
								</div>
								<hr />
								<input type="datetime"  readonly  class="form-control applydate">
							</td>
						</tbody>
					</table>
				</form>
			</div>
			<!--校外实践课题结束-->



			<!--请假申请-->
			<div class="layui-tab-item" id="leave">
				<form action="" class="layui-form">
					<table class="table table-bordered ">
						<caption style="text-align: center;">
							<h1>计算机科学与技术学院毕业生请假申请表</h1>
						</caption>
						<tbody>
						<tr>
							<td width="115px">学生姓名</td>
							<td width="300px">
								<input type="text" class="form-control studentName"  readonly>
							</td>
							<td width="120px">学号</td>
							<td>
								<input type="text" class="form-control studentNum"  readonly>
							</td>
							<td>专业</td>
							<td>
								<input type="text" class="form-control studentMajor"  readonlys readonly>
							</td>
						</tr>
						<tr>
							<td>请假起止日期</td>
							<td>
								<input id="applytimeRange" readonly  type="text" name="startAndEndTime" placeholder="点击选择请假日期" autocomplete="off" class="form-control applytimeRange" >
							</td>
							<td>请假天数</td>
							<td colspan="3">
								<input type="text" readonly class="form-control leaveDays" id="leaveDays" name="leavedays" readonly/>
							</td>
						</tr>


						<tr>
							<td>请假去向</td>
							<td >
								<input type="text" readonly class="form-control leaveAddress" id="leaveAddress" name="leaveaddress">
							</td>
							<td>个人联系电话</td>
							<td colspan="3">
								<input type="text" readonly class="form-control studentTel" value="" id="studentTel" name="studenttel">
							</td>

						</tr>
						<!--家长意见-->
						<tr>
							<td>家庭地址</td>
							<td >
								<input type="text" readonly class="form-control homeAddress" id="homeAddress" name="homeaddress">
							</td>
							<td>家庭联系电话</td>
							<td colspan="3">
								<input type="text" readonly class="form-control homeTel" id="homeTel" name="hometel">

							</td>
						</tr>
						<tr>
							<td>请假事由</td>
							<td colspan="5" >
								<textarea readonly  cols="100" rows="3" class="form-control leaveReason" id="leaveReason" name="leavereason"></textarea>
							</td>

						</tr>

						<tr class="1">
							<td width="50px">辅导员意见</td>
							<td colspan="2" width="700px">
								<div>
									<input type="radio" name="opinion1" class="agree" value="1" title="同意"/>
									<input type="radio" name="opinion1" class="disagree" value="0" title="不同意"/>
								</div>
								<textarea readonly  cols="100" rows="3" class="form-control advice"></textarea>
							</td>
							<td width="100px" >
								<div style="height: 50px; width: 100px;">辅导员签名</div>
								<hr />
								<div>签字时间</div>

							</td>

							<td colspan="2">
								<div style="height: 50px;">
									<img src="../../../images/info.jpg" width="160px" height="50px" class="url"/>
									<%--<button type="button" class="layui-btn"  style="float: right;">签名</button>--%>
								</div>
								<hr />
								<input type="datetime"  readonly  class="form-control applydate">
							</td>

						</tr>
						<tr class="2">
							<td width="50px">指导教师意见</td>
							<td colspan="2" width="700px">
								<div>
									<input type="radio" name="opinion2" class="agree" value="1" title="同意"/>
									<input type="radio" name="opinion2" class="disagree" value="0" title="不同意"/>
								</div>
								<textarea readonly  cols="100" rows="3" class="form-control advice"></textarea>
							</td>
							<td colspan="1">
								<div style="height: 50px;">指导教师签名</div>
								<hr />
								<div>签字时间</div>

							</td>

							<td colspan="2">
								<div style="height: 50px;">
									<img src="../../../images/info.jpg" width="160px" height="50px" class="url"/>
									<%--<button type="button" class="layui-btn"  style="float: right;">签名</button>--%>
								</div>
								<hr />
								<input type="datetime"  readonly  class="form-control applydate">
							</td>

						</tr>

						<!--教研室意见-->
						<tr class="3">
							<td width="50px">教研室意见</td>
							<td colspan="2" width="700px">
								<div>
									<input type="radio" name="opinion3" class="agree" value="1" title="同意"/>
									<input type="radio" name="opinion3" class="disagree" value="0" title="不同意"/>
								</div>
								<textarea readonly   cols="100" rows="3" class="form-control advice"></textarea>
							</td>
							<td colspan="1">
								<div style="height: 50px;">指导教师签名</div>
								<hr />
								<div>签字时间</div>
							</td>

							<td colspan="2">
								<div style="height: 50px;">
									<img src="../../../images/info.jpg" width="160px" height="50px" class="url"/>
									<%--<button type="button" class="layui-btn"  style="float: right;">签名</button>--%>
								</div>
								<hr />
								<input type="datetime" readonly  class="form-control applydate">
							</td>

						</tr>
						<!--系意见-->
						<tr class="4">
							<td width="50px">系主任意见</td>
							<td colspan="2" width="700px">
								<div>
									<input type="radio" name="opinion4" class="agree" value="1" title="同意"/>
									<input type="radio" name="opinion4" class="disagree" value="0" title="不同意"/>
								</div>
								<textarea readonly  cols="100" rows="3" class="form-control advice"></textarea>
							</td>
							<td colspan="1">
								<div style="height: 50px;">系主任签名</div>
								<hr />
								<div>签字时间</div>
							</td>

							<td colspan="2">
								<div style="height: 50px;">
									<img src="../../../images/info.jpg" width="160px" height="50px" alt="待签字" class="url"/>
									<%--<button type="button" class="layui-btn"  style="float: right;">签名</button>--%>
								</div>
								<hr />
								<input type="datetime"  readonly  class="form-control applydate">
							</td>

						</tr>
						<!--学生工作副书记-->
						<tr class="5">
							<td width="50px">学生工作副书记意见</td>
							<td colspan="2" width="700px">
								<div>
									<input type="radio" name="opinion5" class="agree" value="1" title="同意"/>
									<input type="radio" name="opinion5" class="disagree" value="0" title="不同意"/>
								</div>
								<textarea readonly  cols="100" rows="3" class="form-control advice"></textarea>
							</td>
							<td colspan="1">
								<div style="height: 50px;">签名</div>
								<hr />
								<div>签字时间</div>

							</td>

							<td colspan="2">
								<div style="height: 50px;">
									<img src="../../../images/info.jpg" width="160px" height="50px" class="url"/>
									<%--<button type="button" class="layui-btn" style="float: right;">签名</button>--%>
								</div>
								<hr />
								<input type="datetime" readonly  class="form-control applydate">
							</td>

						</tr>
						<!--主管院长-->
						<tr class="6">
							<td width="50px">主管院长意见</td>
							<td colspan="2" width="700px">
								<div>
									<input type="radio" name="opinion4" class="agree" value="1" title="同意"/>
									<input type="radio" name="opinion4" class="disagree" value="0" title="不同意"/>
								</div>
								<textarea readonly  cols="100" rows="3" class="form-control advice"></textarea>
							</td>
							<td colspan="1">
								<div style="height: 50px;">主管院长签名</div>
								<hr />
								<div>签字时间</div>
							</td>

							<td colspan="2">
								<div style="">
									<img src="../../../images/info.jpg" width="160px" height="50px" class="url"/>
									<%--<button type="button" class="layui-btn"  style="float: right;">签名</button>--%>
								</div>
								<hr />
								<input type="datetime"  readonly  class="form-control applydate">
							</td>
						</tr>
						<tr>
							<td>销假日期</td>
							<td  width="100px">
								<input type="text" id="applytimeCancel" class="form-control applytimeCancel"  name="cancelLeaveDate"/>
							</td>
							<td width="100px">超假时间</td>
							<td width="450px" colspan="3">
								<input type="text"  id="applytimeOut"  placeholder="选择超假时间日期范围" autocomplete="off" class="form-control applytimeOut">
							</td>
						</tr>
						</tbody>
					</table>
				</form>
			</div>


			<!--任务书-->
			<div class="layui-tab-item" id="assignment">
				<form action="" class="layui-form" disabled="true" id="form1">
					<table class="table table-bordered ">
						<input type="text" id="id" name="assignmentID" style="display: none">
						<caption style="text-align: center;">
							<h1>任务书</h1>
						</caption>
						<caption>
							<p>学院：<span class="collegename1"></span></p>
						</caption>
						<tbody>

						<tr>
							<td>学生姓名</td>
							<td>
								<input type="text" class="form-control studentname11" readonly="true">
							</td>
							<td>学号</td>
							<td>
								<input type="text" class="form-control studentnum1" readonly="true">
							</td>
						</tr>
						<tr>
							<td>专业班级</td>
							<td>
								<input type="text" class="form-control majorclass1" readonly="true" >
							</td>
							<td>同组人</td>
							<td>
								<input type="text" class="form-control samegroup" name="samegroup">
							</td>
						</tr>
						<tr>
							<td>任务下发时间</td>
							<td>
								<input type="text" class="form-control starttime" name="starttime"/>
							</td>
							<td>任务完成时间</td>
							<td>
								<input type="text" class="form-control endtime" name="endtime"/>
							</td>
						</tr>
						<tr>
							<td>设计论文题目</td>
							<td colspan="3">
								<input type="text" class="form-control title1" name="title">
							</td>
						</tr>
						<tr>
							<td>设计目的和要求</td>
							<td colspan="3">
								<textarea name="request" cols="100" rows="4" class="form-control request" ></textarea>
							</td>
						</tr>
						<tr>
							<td>设计主要内容</td>
							<td colspan="3">
								<textarea name="content" cols="100" rows="4" class="form-control content" ></textarea>
							</td>
						</tr>
						<tr>
							<td>设计提交资料</td>
							<td colspan="3">
								<textarea cols="100" rows="4" class="form-control submitfile"  name="submitfile"></textarea>
							</td>
						</tr>

						<tr>
							<td>学生签名</td>
							<td>
								<div style="height: 40px;">
									<img src="../../../images/info.jpg" width="170px" height="50px" class="studentsign"/>
									<%--<input onclick="studentSign()" type="button" class="layui-btn"  style="float: right; width: 65px;" value="签名"></input>--%>
								</div>
							</td>

							<td>指导教师签名</td>
							<td>
								<div style="height: 40px;">
									<img src="../../../images/info.jpg" width="170px" height="50px" class="jiaoshi"/>
								</div>
							</td>
						</tr>

						<tr>
							<td>系主任签名</td>
							<td>
								<div style="height: 40px;">
									<img src="../../../images/info.jpg" width="170px" height="50px" class="xizhuren"/>

								</div>
							</td>

							<td>主管院长签名</td>
							<td>
								<div style="height: 40px;">
									<img src="../../../images/info.jpg" width="170 px" height="50px" class="yuanzhang"/>
								</div>
							</td>
						</tr>

						</tbody>
					</table>
					<span>说明：一式两份，一份装订入学生毕业设计（论文）内，一份交学院（直属系）。</span>
				</form>
			</div>

			<!--自我管理协议书-->
			<div class="layui-tab-item" id="aggreement">
				<form action="" class="layui-form">
					<table class="table table-bordered ">
						<caption style="text-align: center;">
							<h1>计算机科学与技术学院</h1>
							<h3>学生实施校外实践课程自我管理协议书</h3>
						</caption>
						<tbody>
						<tr>
							<td>甲方：</td>
							<td colspan="5">
								<input  class="form-control collegeName" type="text" id="collegeName" name="collegeName" disabled="">
							</td>
						</tr>
						<tr>
							<td colspan="1">乙方：学生： </td>
							<td colspan="2">
								<input type="text" class="form-control studentName1" id="studentName1" name="studentName" value="" disabled="">
							</td>
							<td colspan="1">身份证号</td>
							<td colspan="2"><input type="text" class="form-control studentIdCard" id="studentIdCard" name="studentIdCard" disabled=""></td>


						</tr>
						<tr>
							<td colspan="6">
								<div class="layui-form-item">
									<div class="layui-inline">
										学生&nbsp;&nbsp;&nbsp;<span class="studentName2" style="color: red"></span>&nbsp;&nbsp;&nbsp;
										（以下称乙方）为我院&nbsp;&nbsp;&nbsp;<span class="majorClass" style="color: red"></span>&nbsp;&nbsp;&nbsp;
										班学生，学业进入本科毕业实习、毕业设计期间时，
										因个人原因向甲方提出实施校外实践课程申请，
										现将乙方实施校外实践课程期间甲乙双方相关权利义务协议如下：

									</div>
								</div>
							</td>

						</tr>
						<tr>
							<td>一、共识</td>
							<td colspan="5">
								甲乙双方就以下事项达成共识：<br>
								1、乙方自行从事校外实践课程期间，已脱离甲方之管理。<br>
								2、乙方实施校外实践课程，应当审慎提出申请，确信在此期间能够在实施校外实践课程指导教师指导下完成相关教学环节的任务。<br>
								3、在此期间，甲方应当尽可能对乙方的学习、生活进行积极干预，乙方亦应当给予充分之尊重，然而出于现实考虑，此项干预不应当视为甲方的管理行为。
							</td>
						</tr>
						<tr>
							<td>二、甲方权利义务</td>
							<td colspan="5">
								1、甲方应当认真审核乙方的实施校外实践课程申请，做到规范审批。<br>
								2、甲方做好对乙方的安全教育工作，但甲方不对乙方有单独进行教育之义务。<br>
								3、甲方应当抽查乙方学习、生活情况，同时，每次抽查仅对该次抽查时间点负责。<br>
								4、若乙方违反本协议所规定之义务或其他校规校纪，甲方有权决定取消其实施校外实践课程的资格，相关各项损失由乙方个人承担。
							</td>
						</tr>
						<tr>
							<td>三、乙方权利义务</td>
							<td colspan="5">
								1、本协议履行期间，乙方可自行决定住宿地点，但应将住宿地点及联系电话的及时告知甲方；如住宿地点及联系电话发生变动，应在一个工作日内向甲方说明；联系电话做到24小时开通。<br>
								2、本协议履行期间，乙方应自觉遵守国家法律法规、学校规章制度，任何情况下，乙方在住宿地点均不得私接电源、乱拉电线，不使用危险电器（压力锅、热得快等），不酗酒、抽烟，保持室内外卫生。<br>
								3、乙方应当及时完成各项学习任务，按照甲方要求积极参加学校、学院、班级组织的集体活动，不从事有损于学校、学院、班级形象的行为。<br>
								4、乙方保证所提交实施校外实践课程申请材料的真实性，申请材料为本协议及其他甲方要求乙方提供之材料。其中，涉及到家长或其他与乙方具有利益关系之第三人之签名，乙方应以书面保证其真实，并作为本协议必须之附件，排除家长或其他与乙方具有利益关系之第三人认为虚假签名之主张。<br>
								5、本协议履行期间，除因甲方故意及重大过失外，乙方人身、财产安全由乙方自行负责。本条所称重大过失，仅指学校设施、设备存在之安全隐患造成的乙方人身、财产损失。<br>
								6、任何情况下，甲方对乙方自杀、自残行为不负任何责任。<br>
								7、乙方有权享受甲方提供给其他学生的教育和其他待遇。
							</td>
						</tr>
						<tr>
							<td>四、其他说明</td>
							<td colspan="5">
								1、此协议一式二份，签字成立生效。甲、乙各执一份。<br>
								2、本协议已由甲方详细向乙方进行说明，乙方对于协议内容已有完全之认识并同意。<br>
								3、其他未尽事宜，双方以书面形式另行协商约定。<br>
							</td>
						</tr>
						<tr>
							<td>甲方签章</td>
							<td colspan="3">
								<div style="height: 50px; width: 230px;">
									<img src="../../../images/info.jpg"  width="150px" height="50px" class="schoolUrl"/>
									<%--<input onclick="tutorSign()" value="签名" type="button" class="layui-btn"  ></input>--%>
								</div>
								<hr />
								<input type="datetime" readonly class="form-control schoolSignDate" id="schoolSignDate">
								<!--<textarea name="" cols="100" rows="3" class="form-control"></textarea>-->
							</td>
							<td width="100px">乙方签章  </td>
							<td colspan="3">
								<div style="height: 50px; width: 230px;">
									<img src="../../../images/info.jpg" width="150px" height="50px" class="stusignUrl"/>
									<%--<input onclick="studentSign()" value="签名" type="button" class="layui-btn"></input>--%>
								</div>
								<hr />
								<input type="datetime"  class="form-control studentSignDate" id="studentSignDate" readonly>
							</td>
						</tr>

						</tbody>
					</table>
				</form>

			</div>


			<!--保证书-->
			<div class="layui-tab-item" id="sureBook">
				<form action="" class="layui-form">
					<table class="table table-bordered ">
						<caption style="text-align: center;">
							<h1>保 证 书</h1>
						</caption>
						<tbody>

						<tr>
							<td colspan="6">
								<div class="layui-form-item">
									<div class="layui-inline">
										<label>本人进入四年级本科课程设计、毕业实习、毕业设计期间时，因个人原因向学院提出进行校外实践课程申请，特就如下事项做出承诺：</label><br>
										1、本人年满18周岁，具备完全行为能力，对于实施校外实践课程自我管理协议书内容有正确之认识，同意双方签字之法律意义。<br>
										2、本人承诺提交的申请校外实践课程材料的真实性，对于要求家长或或其他与本人具有利益关系之第三人同意之事项，本人已与家长或或其他与本人具有利益关系之第三人充分沟通，并取得其同意，其签字真实有效，可排除家长或或其他与本人具有利益关系之第三人关于虚假签名之主张。<br>
										3、实施校外实践课程自我管理协议书，本人已与家长及其他与本人具有利益关系之第三人充分沟通，本人认为，家长及其他与本人具有利益关系之第三人已经完全认可协议之内容并愿意一同履行本协议书。

										<![endif]-->

									</div>
								</div>
							</td>

						</tr>


						<tr>
							<td>保证人</td>
							<td colspan="3">
								<div style="height: 50px; width: 230px;">
									<img src="../../../images/info.jpg" width="150px" height="50px" class="studentUrl"/>
									<%--<input onclick="studentSign()" value="签名" type="button" class="layui-btn"></input>--%>
								</div>
								<hr />
								<input type="datetime" id="studentApplyTime" readonly  class="form-control studentApplyTime">
								<!--<textarea name="" cols="100" rows="3" class="form-control"></textarea>-->
							</td>


						</tr>

						</tbody>
					</table>
				</form>
			</div>


			<!--附件信息-->
			<div class="layui-tab-item" id="attachments">
				<form action="" class="layui-form">
					<table class="table table-bordered ">
						<caption style="text-align: center;">
							<h1>附件</h1>
						</caption>
						<tbody>
						<tr>
							<td>
								<div class="layui-form-item" id="head">
									<div class="layui-inline">
										<label>附件类型：</label>
										<input type="text" class="form-control types" id="types" readonly>
									</div>
								</div>
							</td>
						</tr>

						<tr>
							<td colspan="6">
								<div class="layui-form-item">
									<div class="layui-inline">
										<div class="upload-img-box" id="td-content">

										</div>
									</div>
								</div>
							</td>

						</tr>

						</tbody>
					</table>
				</form>
			</div>

		</div>
	</div>
</div>




</div>

<script>
    function checkSave(){
        layer.alert("保存成功！")
    }
    function checkCommit(){
        layer.confirm("您确定提交本次审核信息吗？",function(){
            x_admin_close()
        })
    }
    //上传签名
    function studentSign(){
        layer.prompt({
            formType: 1,
            value: '',
            title: '请输入签名密码',
            //area: ['800px', '350px'] //自定义文本域宽高
        }, function(value, index, elem){
            if(value==''){

            }else{
                layer.close(index);
            }
        })
    }
</script>
</body>

</html>