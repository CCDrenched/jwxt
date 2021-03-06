/*页面加载查询申请的详细信息*/

$(function(){
    var sureID = getAddressParameter("id");
    //alert(sureID);
    layui.use(['layer','form'], function(){
        var layer = layui.layer;
        /*发送ajax请求查询*/
        $.ajax({
            url:contextPath+"/outGraduateDesiner/selectODGSureBook.do",
            type:"post",
            data:{"sureID":sureID},
            dataType:"json",
            success:function(result){
                var isCommit = result.iscommit;
                if(isCommit=="01"||isCommit=="21"){
                    $(".saveAndCommit").css("display","none");
                    $(".studentSign").css("display","none");
                }
                //alert(JSON.stringify(result));
                if(result.studentsignurl!=null&&result.studentsignurl!=""){
                    $("#stusignUrl").attr("src",result.studentsignurl);
                    $("#studentApplyTime").val(Format(new Date(result.signtime),'yyyy-MM-dd'));
                }

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
    var sureBookId = getAddressParameter("id");
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
            url:contextPath+"/oGDAttachment/studentSign.do",
            type:"post",
            data:{"userID":userId,
                "signPassword":value,
                "sureBookId":sureBookId
            },
            dataType:"json",
            success: function(result){
                var status = result.status;
                if(status==1){
                    $("#studentUrl").attr("src",result.signUrl);
                    $("#studentApplyTime").val(Format(new Date(),"yyyy-MM-dd"));
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
