/**
 * @author: LL
 * @createtime: 2018/5/8 17:52
 * @description:安排课程的js
 */
//初始化加载需要使用的layui模块
layui.use(['layer', 'form', 'element'], function(){
    $ = layui.jquery;
    var layer = layui.layer
        ,form = layui.form
        ,element = layui.element;
    //初始化表格
    findArrangeCourseTaskInfo();
    //初始化专业下拉框
    findMajorNameAndIdForSelect(form);
    //查询按钮事件过滤器
    form.on('submit(search)', function(data){
        //清空当前页和页号
        $("input[name='pageSize']").val('');
        $("input[name='currentPage']").val('');
        //调用查询方法
        findArrangeCourseTaskInfo();
        return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
    });
});

//查询排课任务基本信息
function findArrangeCourseTaskInfo(){
    $.ajax({
        url : contextPath+'/arrangeCourse/findArrangeCourseTaskList.action',
        data : $("form").serialize(),
        type : 'POST',
        dataType : 'json',
        async:true,
        success : showArrangeCourseTaskInfo
    });
}
function showArrangeCourseTaskInfo(pageInfo){
    //console.log(pageInfo) //测试是否有值
    var total = pageInfo.total;//页总数
    var pageNum = pageInfo.pageNum;//页号
    var pageSize = pageInfo.pageSize;//页大小
    var arrangeCourseTaskList = pageInfo.list;
    $("tbody").html("");//清空表格中数据并重新填充数据
    for(var i=0,length_l = arrangeCourseTaskList.length;i<length_l;i++){
        var index = (pageNum - 1) * pageSize + i + 1;
        var tr ="<tr><td><input type='radio' name='taskRadio' value='"+arrangeCourseTaskList[i].arrangeTaskId+"'/>"
            +"<input type='hidden' name='sel_academicYear' value='"+arrangeCourseTaskList[i].academicYear+"'>"
            +"<input type='hidden' name='sel_term' value='"+arrangeCourseTaskList[i].term+"'>"
            +"<input type='hidden' name='sel_taskStatus' value='"+arrangeCourseTaskList[i].taskStatus+"'></td><td>"
            +index+"</td><td>"
            +arrangeCourseTaskList[i].noticeBookName+"</td><td>"
            +arrangeCourseTaskList[i].majorName+"</td><td>"
            +arrangeCourseTaskList[i].academicYear+"</td><td>"
            +termStatusReplace(arrangeCourseTaskList[i].term)+"</td><td>"
            +arrangeCourseTaskList[i].taskCreateTime+"</td><td>"
            +arrangeCourseTaskList[i].taskReceiptName+"</td><td>"
            +checkNull(arrangeCourseTaskList[i].taskReceiptTime)+"</td><td>"
            +arrangeCourseTaskList[i].taskStatus+"</td>"
            +"<td class='td-manage'><a title='点击查看排课详情' onclick=x_admin_show('排课','scheduleArrange-detail.jsp?arrangeTaskId="+arrangeCourseTaskList[i].arrangeTaskId+"') href='javascript:void(0);')><i class='layui-icon'>&#xe63c;</i></a>"
            +"<a title='点击查看教师排课信息' onclick=x_admin_show('教师排课信息','scheduleArrange-teacherCourseInfo.jsp?academicYear="+arrangeCourseTaskList[i].academicYear+"&term="+arrangeCourseTaskList[i].term+"&academicId="+arrangeCourseTaskList[i].academicId+"') href='javascript:void(0);')><i class='layui-icon'>&#xe606;</i></a>"
            +"</td></tr>"
        $("tbody").append(tr);
    }
    //开启分页组件
    arrangeCourseTaskInfoListPage(total,pageNum,pageSize);
}

//分页函数
function arrangeCourseTaskInfoListPage(total,pageNum,pageSize){
    /*分页js*/
    layui.use(['laypage', 'layer'], function(){
        var laypage = layui.laypage,layer = layui.layer;

        //完整功能
        laypage.render({
            elem: 'arrangePage', //注意，这里的 test1 是 ID，不用加 # 号
            count: total, //数据总数，从服务端得到
            limit:pageSize,//每页显示的条数。laypage将会借助 count 和 limit 计算出分页数。
            curr:pageNum,//当前页号
            limits:[6,10,15,20],
            layout:['limit','prev', 'page', 'next','skip','count'],//显示哪些分页组件
            jump: function(obj, first){//点击页号的时候执行的函数
                $("[name='currentPage']").val(obj.curr);//向隐藏域设置当前页的值
                $("[name='pageSize']").val(obj.limit);//向隐藏域设置当前页的大小
                if(!first){//首次不执行(点击的时候才执行)
                    findArrangeCourseTaskInfo();//执行查询分页函数(这个函数必须写在这里)
                }
            }
        });
    });
}

//根据历史排课记录安排按钮
function allotCourse_history(){
    var checked = $("[name='taskRadio']:checked").length>0?true:false;
    if(!checked){
        layer.alert('请先选择需要安排课程的任务！');
        return;
    }
    var sel_taskStatus = $("[name='taskRadio']:checked ~ input[name='sel_taskStatus']").val();
    if (!(sel_taskStatus == "待排课" || sel_taskStatus == "审核不通过")) {
        layer.alert('该排课任务已经结束，不能进行排课操作！');
        return;
    }
    var arrangeTaskId = $("[name='taskRadio']:checked").val();//获取单选框的值
    var academicYear = $("[name='taskRadio']:checked + input[name='sel_academicYear']").val();
    var term = $("[name='taskRadio']:checked ~ input[name='sel_term']").val();
    x_admin_show('根据历史记录排课','./scheduleArrange-history.jsp?arrangeTaskId='+arrangeTaskId+'&academicYear='+academicYear+'&term='+term);
}

//提交审核按钮事件
function commitToCheck(){
    var checked = $("[name='taskRadio']:checked").length>0?true:false;
    if(!checked){
        layer.alert('请先选择需要提交审核的任务！');
        return;
    }
    var sel_taskStatus = $("[name='taskRadio']:checked ~ input[name='sel_taskStatus']").val();
    if (sel_taskStatus == "待审核" || sel_taskStatus == "审核通过") {
        layer.alert('该排课任务已经提交审核！');
        return;
    }
    var arrangeTaskId = $("[name='taskRadio']:checked").val();//获取单选框的值
    var count = getNotArrangeCourseCount(arrangeTaskId);
    if(count>0){
        layer.alert('该排课任务还有尚未安排的课程，不能进行提交审核的操作！');
        return;
    }
    layer.confirm('您确认要提交此次课设分配信息进行审核吗？提交审核后将不能进行修改！',function(){
        changeTaskStatus(arrangeTaskId,"5");
    });
}
//手动排课
function arrangeCourse(){
    var checked = $("[name='taskRadio']:checked").length>0?true:false;
    if(!checked){
        layer.alert('请先选择需要手动排课的任务！');
        return;
    }
    var sel_taskStatus = $("[name='taskRadio']:checked ~ input[name='sel_taskStatus']").val();
    if (sel_taskStatus == "待审核" || sel_taskStatus == "审核通过") {
        layer.alert('该排课任务已经提交审核,不能进行排课！');
        return;
    }
    var arrangeTaskId = $("[name='taskRadio']:checked").val();//获取单选框的值
    layer.confirm('您确认要为该排课任务手动排课吗？',function(index){
        x_admin_show('排课','scheduleArrange-handArrange.jsp?arrangeTaskId='+arrangeTaskId)
        layer.close(index);
    });
}

//导出排课信息
function arrangeCourseExport(){
    var checked = $("[name='taskRadio']:checked").length>0?true:false;
    if(!checked){
        layer.alert('请先选择需要导出排课信息的任务！');
        return;
    }
    var sel_taskStatus = $("[name='taskRadio']:checked ~ input[name='sel_taskStatus']").val();
    if (sel_taskStatus != "审核通过") {
        layer.alert('该排课任务还未通过审核，不能进行导出！');
        return;
    }
    var arrangeTaskId = $("[name='taskRadio']:checked").val();//获取单选框的值
    layer.confirm('您确认要导出排课信息吗？',function(index){
        window.location.href=contextPath+"/arrangeCourse/exportArrangeCourseInfo.action?arrangeCourseTaskId="+arrangeTaskId
        layer.close(index);
    });
}
//查询没有排课的数量
function getNotArrangeCourseCount(arrangeTaskId){
    var count = 0;
    $.ajax({
        url : contextPath+'/arrangeCourse/getNotArrangeCourseCount.action',
        data : {"arrangeTaskId":arrangeTaskId},
        type : 'POST',
        dataType : 'json',
        async:false,
        success : function(response){
            count = response;
        }
    });
    return count;
}