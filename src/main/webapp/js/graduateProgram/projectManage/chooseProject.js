/*查询*/
layui.use('form', function(){
    var form = layui.form;

    //监听提交
    form.on('submit(sreach)', function(data){
        layer.alert(JSON.stringify(data.field), {
            title: '最终的提交信息'
        });
        //清空当前页和页号
        $("input[name='pageSize']").val('');
        $("input[name='currentPage']").val('');
        //调用查询方法
        findTaskNoticeBaseInfo();
        return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
    });
});

$(function () {
    findTaskNoticeBaseInfo();//初始化课题表格

    findChooseProjectInfo();//初始化已选择课题信息
    
    findIsChoose();//查询是否提交。
});

/**初始化课题表格信息*/
function findTaskNoticeBaseInfo(){
    $.ajax({
        url : contextPath+ '/chooseProject/getProject_ACInfo.do',
        data : $("#y_form").serialize(),
        type : 'POST',
        dataType : 'json',
        async:true,
        success : showTaskNoticeBaseInfo
    });
}

//查询成功后执行
function showTaskNoticeBaseInfo(pageInfo){
    // console.log(pageInfo) //测试是否有值
    var total = pageInfo.total;//页总数
    var pageNum = pageInfo.pageNum;//页号
    var pageSize = pageInfo.pageSize;//页大小
    var baseInfoList = pageInfo.list;
    $("#y_tbody").html("");//清空表格中数据并重新填充数据
    for(var i=0,length_l = baseInfoList.length;i<length_l;i++){
        var index = (pageNum - 1) * pageSize + i + 1;
        var tr =
            '<tr><td><button class="layui-btn layui-btn-warm layui-btn-sm" onclick="chooseProject(this,'+ pageInfo[i].teacherTitleID + ')">选择</button></td>' +
            '<td>'+ pageInfo[i].teacherName + '</td>' +
            '<td>'+ pageInfo[i].titlename + '</td>' +
            '<td>'+ pageInfo[i].projectType + '</td>' +
            '<td>'+ pageInfo[i].titleOrigin + '</td>' +
            '<td>'+ pageInfo[i].reqireStudentNum + '</td>' +
            '<td class="td-manage">' +
            '    <a title="详细信息" onclick="x_admin_show(\'详细信息\',\'chooseProject-view.jsp?teacherTitleID='+ pageInfo[i].teacherTitleID + '\')" href="javascript:;">' +
            '        <i class="layui-icon">&#xe63c;</i>' +
            '    </a>' +
            '</td></tr>';
        $("#y_tbody").append(tr);
    }

    //开启分页组件
    noticeInfoListPage(total,pageNum,pageSize);
}

//分页函数
function noticeInfoListPage(total,pageNum,pageSize){
    /*分页js*/
    layui.use(['laypage', 'layer'], function(){
        var laypage = layui.laypage,layer = layui.layer;

        //完整功能
        laypage.render({
            elem: 'y_page', //注意，这里的 test1 是 ID，不用加 # 号
            count: total, //数据总数，从服务端得到
            limit:pageSize,//每页显示的条数。laypage将会借助 count 和 limit 计算出分页数。
            curr:pageNum,//当前页号
            limits:[6,10,15,20],
            layout:['limit','prev', 'page', 'next','skip','count'],//显示哪些分页组件
            jump: function(obj, first){//点击页号的时候执行的函数
                //obj包含了当前分页的所有参数，比如：
                // console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
                // console.log(obj.limit); //得到每页显示的条数

                $("[name='currentPage']").val(obj.curr);//向隐藏域设置当前页的值
                $("[name='pageSize']").val(obj.limit);//向隐藏域设置当前页的大小
                if(!first){//首次不执行(点击的时候才执行)
                    findTaskNoticeBaseInfo();//执行查询分页函数(这个函数必须写在这里)
                }
            }
        });
    });
}

//初始化已选择课题信息
function findChooseProjectInfo() {
    //获取学生信息
    var studentID = "";
    $.ajax({
        url : contextPath+ '/chooseProject/getChooseProjectInfo.do',
        data : studentID,
        type : 'POST',
        dataType : 'json',
        async:true,
        success : function () {

        }
    });
}

/* 选择课题*/
function chooseProject(obj,titleId) {
    var chooseTr = $(obj).parents("tr");
    //判断该条数据是否选择
    var choose_titleID = $("#choose_tbody").find(".choose_titleID");
    choose_titleID.each(function () {
        if ($(this).val() == titleId) {
            layui.alert("该课题已选择！");
            return false;
        }
    });

    if (choose_titleID.length == 2) {
        layui.alert("只能选择两个课题！");
        return false;
    }

    var tr = "";
    //判断已经选择了的课题数量
    if (choose_titleID.length == 0) {
        tr =
            '<tr><td>第一志愿' +
            '    <input type="hidden" class="choose_titleID" value="'+ titleId +'">' +
            '</td><td>' +
            chooseTr.find("td:eq(1)").text() + '</td><td>' +
            chooseTr.find("td:eq(2)").text() + '</td><td>' +
            chooseTr.find("td:eq(3)").text() + '</td><td>' +
            chooseTr.find("td:eq(4)").text() + '</td><td>' +
            chooseTr.find("td:eq(5)").text() + '</td><td>' +
            '<td class="td-manage">' +
            '    <a title="详细信息" onclick="x_admin_show(\'详细信息\',\'chooseProject-view.jsp?teacherTitleID=\'+ titleId+ \')" href="javascript:;">' +
            '        <i class="layui-icon">&#xe63c;</i>' +
            '    </a>' +
            '    <a title="删除" onclick="member_del(this,\'要删除的id\')" href="javascript:;">' +
            '        <i class="layui-icon">&#xe640;</i>' +
            '    </a>' +
            '</td></tr>'
    } else if (choose_titleID.length == 1) {
        tr =
            '<tr><td>第二志愿</td><td><input type="hidden" class="choose_titleID" value="\'+ titleId +\'">' +
            chooseTr.find("td:eq(1)").text() + '</td><td>' +
            chooseTr.find("td:eq(2)").text() + '</td><td>' +
            chooseTr.find("td:eq(3)").text() + '</td><td>' +
            chooseTr.find("td:eq(4)").text() + '</td><td>' +
            chooseTr.find("td:eq(5)").text() + '</td><td>' +
            '<td class="td-manage">' +
            '    <a title="详细信息" onclick="x_admin_show(\'详细信息\',\'chooseProject-view.jsp?teacherTitleID=\'+ titleId+ \')" href="javascript:;">' +
            '        <i class="layui-icon">&#xe63c;</i>' +
            '    </a>' +
            '    <a title="删除" onclick="member_del(this,\'要删除的id\')" href="javascript:;">' +
            '        <i class="layui-icon">&#xe640;</i>' +
            '    </a>' +
            '</td></tr>'
    }
    //把这条数据复制到下边
    $("#choose_tbody").append(tr);
    
}

/*用户-删除*/
function member_del(obj, id) {
    layer.confirm('确认要删除吗？', function (index) {
        //发异步删除数据
        $(obj).parents("tr").remove();
        if ($(".choose_titleID").length == 1) {
            $(".choose_titleID").parents("tr").find("td:eq(0)").text("第一志愿")
        }
        layer.msg('已删除!', {icon: 1, time: 1000});
    });
}

//保存
function chooseProject_save() {
    var choose_titleIDs = $("#choose_tbody").find(".choose_titleID");

    var choose_titleIDstr = "";
    if (choose_titleIDs == 0) {
        layui.alert("请先选择课题！")
    } else if (choose_titleIDs == 1) {
        choose_titleIDstr = choose_titleIDs.text()
    } else {
        choose_titleIDstr = choose_titleIDs.eq(0).text() + "," + choose_titleIDs.eq(1).text();
    }

    $.ajax({
        url : contextPath+ '/chooseProject/saveChooseProject.do',
        data : choose_titleIDstr,
        type : 'POST',
        dataType : 'json',
        async:true,
        success : function(data) {
            if (data == "success") {
                layui.alert("保存成功")
            }
        }
    });
}

//提交
function chooseProject_submit() {
    var choose_titleIDs = $("#choose_tbody").find(".choose_titleID");

    if (choose_titleIDs != 0) {
        layui.alert("请选择两个课题进行提交！")
    }

    layer.confirm("提交之后将不能更改,确认提交?",function (index) {
        var choose_titleIDstr = choose_titleIDs.eq(0) + "," + choose_titleIDs.eq(1);

        $.ajax({
            url: contextPath + '/chooseProject/submitChooseProject.do',
            data: choose_titleIDstr,
            type: 'POST',
            dataType: 'json',
            async: true,
            success: function (data) {
                if (data == "Success") {
                    layui.alert("保存成功")
                }
            }
        });
    })
}

/**查询是否提交*/
function findIsChoose(){
    $.ajax({
        url : contextPath+ '/chooseProject/findIsChoose.do',
        type : 'POST',
        dataType : 'json',
        async:true,
        success : function (data) {
            
        }
    });
}


//点击关闭其他，触发事件
function closeOther() {
    var closeTable = $(".layui-tab-title", parent.document).children("li");
    closeTable.each(function () {
        if ($(this).attr("class") == "") {
            $(this).children("i").trigger("click");
        }
    })
}