// 点击edit使表单可编辑
$(".edit").click(function () {
    $(this).parents(".card").find("fieldset[disabled='disabled']").removeAttr("disabled");
});