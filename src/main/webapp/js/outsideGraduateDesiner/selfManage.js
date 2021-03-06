/*页面加载查询申请的详细信息*/

$(function(){
    var selfManageId = getAddressParameter("id");
    //alert(selfManageId);
    layui.use(['layer','form'], function(){
        var layer = layui.layer;
        var form = layui.form;
        /*发送ajax请求查询*/
        $.ajax({
            url:contextPath+"/outGraduateDesiner/selectODGSelfAggreement.do",
            type:"post",
            data:{"selfManageId":selfManageId},
            dataType:"json",
            success:function(result){
                var isCommit = result.remark;
                if(isCommit=="01"||isCommit=="21"){
                    $(".saveAndCommit").css("display","none");
                    $(".studentSign").css("display","none");
                }
                //alert(JSON.stringify(result));
                $("#collegeName").val(result.collegename);
                $("#studentName1").val(result.oGDInfo.studentname);
                $("#studentName2").html(result.oGDInfo.studentname);
                $("#studentIdCard").val(result.studentidcard);
                $("#majorClass").html(result.oGDInfo.majorclass);
                //alert(result.schoolsign);
                if(result.schoolsign!=null&&result.schoolsign!=""){
                    $("#schoolUrl").attr("src",result.schoolsign);
                }
                $("#schoolSignDate").val(Format(new Date(result.schoolsigndate),'yyyy-MM-dd'));
                if(result.studentsign!=null&&result.studentsign!=""){
                    $("#stusignUrl").attr("src",result.studentsign);
                }
                $("#studentSignDate").val(Format(new Date(result.studentsigndate),'yyyy-MM-dd'));

                form.render();   //更新渲染
            },
            error:function () {
                layer.msg('查询信息出错',{time:2000}, function(){
                    var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                    parent.layer.close(index);
                });
            }
        });
    });
});
/*学生签名*/
function studentSign() {
    var aggreementID = getAddressParameter("id");
    var userId = $("#userID").val();
    //alert(aggreementID);
    layer.prompt({
        formType: 1,
        value: '',
        title: '请输入签名密码',
        //area: ['800px', '350px'] //自定义文本域宽高
    }, function (value, index, elem) {
        //alert(value);
        $.ajax({
            url:contextPath+"/aggreement/studentSign.do",
            type:"post",
            data:{"userID":userId,
                "signPassword":value,
                "aggreementID":aggreementID
            },
            dataType:"json",
            success: function(result){
                var status = result.status;
                if(status==1){
                    //alert(result.signUrl);
                    $("#stusignUrl").attr("src",result.signUrl);
                    $("#stuapplydate").val(Format(new Date(),"yyyy-MM-dd"));
                    layer.close(index);
                }
                if(status==0){
                    layer.close(index);
                    layer.msg(result.signUrl);
                }
                if(status==2){
                    layer.close(index);
                    layer.msg(result.signUrl);
                }
                if(status==3){
                    layer.close(index);
                    layer.msg("数据库异常",function(){
                        x_admin_close();
                    });
                }
            },
            error:function () {
                alert("签字失败");
            }
        });
    });
}
