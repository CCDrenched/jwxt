<%@page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>排课管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="../../css/font.css">
    <link rel="stylesheet" href="../../css/xadmin.css">
    <script type="text/javascript" src="../../js/jquery.min.js"></script>
    <script type="text/javascript" src="../../lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../../js/xadmin.js"></script>

    <%--公共标签--%>
    <%@include file="/tag.jsp"%>
    <%--排课公共方法--%>
    <script type="text/javascript" src="${baseurl}/js/arrangeCourse/arrangeCommonFunction.js"></script>
</head>

<body>

<!--主体-->
<div class="x-body">
    <!--表格内容-->
    <table class="layui-table">
        <thead>
        	
        	<tr>
                <th lay-data="{field:'', width:80}">序号</th>
                <th lay-data="{field:'', width:80}">课程代码</th>
                <th lay-data="{field:'', width:120}">课程名称</th>
                <th lay-data="{field:'', width:80}">校区</th>
                <th lay-data="{field:'', width:120}">专业</th>
                <th lay-data="{field:'', width:80}">班级</th>
                <th lay-data="{field:'', width:80}">专业总人数</th>
                <th lay-data="{field:'', width:80}">总学时</th>
                <th lay-data="{field:'', width:80}">教师姓名</th>
		        <th lay-data="{field:'', width:80}" rowspan="2">操作</th>
		    </tr>

        </thead>
        <tbody>
        </tbody>
    </table>
    <!--end 表格内容-->

    <!--分页-->
    <div id="coursePage"></div>
    <!--end 分页-->
</div>


<script>
    layui.use([],function(){
        //第一次执行
        findTaskArrangeCourseAndTeacherInfo();
    });
    //查询任务课程信息
    function findTaskArrangeCourseAndTeacherInfo(currentPage,pageSize){
        $.ajax({
            url : contextPath+'/arrangeCourse/findTaskArrangeCourseAndTeacherList.action',
            data : {"arrangeTaskId":'${param.arrangeTaskId}',"currentPage":currentPage,"pageSize":pageSize},
            type : 'POST',
            dataType : 'json',
            success : showTaskArrangeCourseAndTeacherInfo
        });
    }
    function showTaskArrangeCourseAndTeacherInfo(pageInfo){
        var total = pageInfo.total;//页总数
        var pageNum = pageInfo.pageNum;//页号
        var pageSize = pageInfo.pageSize;//页大小
        var taskArrangeCourseList = pageInfo.list;
        $("tbody").html("");//清空表格中数据并重新填充数据
        for(var i=0,length_l = taskArrangeCourseList.length;i<length_l;i++){
            var index = (pageNum - 1) * pageSize + i + 1;
            var tr ="<tr><td>"
                +index+"</td><td>"
                +taskArrangeCourseList[i].courseCode+"</td><td>"
                +taskArrangeCourseList[i].courseName+"</td><td>"
                +replaceStatus(taskArrangeCourseList[i].campusCode)+"</td><td>"
                +taskArrangeCourseList[i].majorName+"</td><td>"
                +taskArrangeCourseList[i].className+"</td><td>"
                +taskArrangeCourseList[i].majorStudentsNumber+"</td><td>"
                +taskArrangeCourseList[i].totalPeriod+"</td>"
                 if(taskArrangeCourseList[i].teacherNames==null){
                    tr +="<td>--</td><td>--</td></tr>" ;
                 }else{
                     tr += "<td>"+taskArrangeCourseList[i].teacherNames+"</td>"
                     +"<td class='td-manage'><a title='点击查看排课详细信息' onclick=x_admin_show('详细信息','scheduleArrange-view.jsp?arrangeCourseId="+taskArrangeCourseList[i].arrangeCourseId+"') href='javascript:void(0);')><i class='layui-icon'>&#xe63c;</i></a>"
                     +"</td></tr>";
                 }
            $("tbody").append(tr);
        }
        //开启分页组件
        teacherCourseInfoPage(total,pageNum,pageSize);
    }
    //分页函数
    function teacherCourseInfoPage(total,pageNum,pageSize){
        /*分页js*/
        layui.use(['laypage', 'layer'], function(){
            var laypage = layui.laypage,layer = layui.layer;

            //完整功能
            laypage.render({
                elem: 'coursePage', //注意，这里的 test1 是 ID，不用加 # 号
                count: total, //数据总数，从服务端得到
                limit:pageSize,//每页显示的条数。laypage将会借助 count 和 limit 计算出分页数。
                curr:pageNum,//当前页号
                limits:[6,10,15,20],
                layout:['limit','prev', 'page', 'next','skip','count'],//显示哪些分页组件
                jump: function(obj, first){//点击页号的时候执行的函数
                    if(!first){//首次不执行(点击的时候才执行)
                        findTaskArrangeCourseAndTeacherInfo(obj.curr,obj.limit);//执行查询分页函数(这个函数必须写在这里)
                    }
                }
            });
        });
    }

</script>
</body>

</html>