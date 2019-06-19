//获取url中的参数
function getUrlParam(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
    var r = window.location.search.substr(1).match(reg);  //匹配目标参数
    if (r != null) return unescape(r[2]);
    return null; //返回参数值
}

function exportExcel(id) {
    $(id).table2excel({
        // 不被导出的表格行的CSS class类
        exclude: ".noExl",
        // 导出的Excel文档的名称
        name: "Excel Document Name",
        // Excel文件的名称
        filename: "test",
        //文件后缀名
        fileext: ".xls",
        //是否排除导出图片
        exclude_img: false,
        //是否排除导出超链接
        exclude_links: false,
        //是否排除导出输入框中的内容
        exclude_inputs: false
    })
}

function sendFeedback(btn) {
    if (!confirm("确定提交意见?")) return false;
    let area = $(btn).parents(".card").find(".ql-editor");
    let content = area.html();

    $.ajax({
        async: false,
        type: "POST",
        url: `../feedback`,
        data: {content: content},
        dataType: "text",
        success: function (data) {
            alert(data);
            window.location.reload();
        },
        error: function (data) {
            alert(data);
            window.location.reload();
        }
    });
}

// 点击edit使表单可编辑
$(".edit").click(function () {
    $(this).parents(".card").find("fieldset[disabled='disabled']").removeAttr("disabled");
});

$(".typeFilter").change(function () {
    let isCheck = $(this).prop("checked");
    let courseType = $(this).find("+label").text();

    let table = $(this).parents(".card-body").find("table");
    table.find("tr").each(function () {
        let record = $(this).children();

        if (record[1].innerText === courseType) {
            if (isCheck) $(record).show();
            if (!isCheck) $(record).hide();
        }
    });
});

$(".export").click(function () {
    $(this).parents(".card").find("table")
        .table2excel({
            // 不被导出的表格行的CSS class类
            exclude: ".noExl",
            // 导出的Excel文档的名称
            name: "Excel Document Name",
            // Excel文件的名称
            filename: "test",
            //文件后缀名
            fileext: ".xls",
            //是否排除导出图片
            exclude_img: false,
            //是否排除导出超链接
            exclude_links: false,
            //是否排除导出输入框中的内容
            exclude_inputs: false
        })
});

try {
    $('#editTable').SetEditable({
        $addButton: $('#add')
    });
} catch (ignored) {
}

$('#submitScore').click(function () {
    if (!confirm("确定提交成绩?")) return false;

    let cols = $(this).parents(".table-responsive").find("table").find("tr").find("td");
    let cid = parseInt(getUrlParam("cid"));
    let result = [];

    let n = 0;
    cols.each(function () {

        if ($(this).hasClass("snumber")) {
            let snumber = $(this).text();
            result.push({"snumber": snumber});
        }
        if ($(this).hasClass("score-value")) {
            result[n].score = $(this).text();
        }
        if ($(this).hasClass("gpa")) {
            result[n].cid = cid;
            result[n++].gpa = $(this).text();
        }

    });

    let url = window.location.href;
    let role = "";
    if (url.includes("teacher")) role = "teacher";
    else if (url.includes("manager")) role = "manager";

    $.ajax({
        async: false,
        type: "POST",
        url: `../${role}/submitScore`,
        data: {scores: JSON.stringify(result)},
        dataType: "json",
        success: function (data) {
            alert(data.responseText);
            window.location.reload();
        },
        error: function (data) {
            alert(data.responseText);
            window.location.reload();
        }
    });
});

