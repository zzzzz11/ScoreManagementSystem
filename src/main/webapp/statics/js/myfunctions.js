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
            if (isCheck) $(record).hide();
            if (!isCheck) $(record).show();
        }
    });
});

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
