<#include "teacherMacro.ftl">
<@teacher keywords="教师课程查看" js=["js/edit.js"]>

    <header class="page-header">
        <div class="container-fluid">
            <h2 class="no-margin-bottom">成绩详情</h2>
        </div>
    </header>

    <script type="text/javascript">
        function edit() {
            var mod = document.getElementById("btn").parentElement.parentElement.children[2];
            mod.innerHTML = "<input type=text />"
            document.getElementById("btn").parentElement.innerHTML = "<button id=\"btn\" class=\"btn btn-primary\" onclick=\"modify();\">修改</button>";
        }

        function modify() {
            var mod = document.getElementById("btn").parentElement.parentElement.children[2];
            mod.innerHTML = "修改后的值"
            document.getElementById("btn").parentElement.innerHTML = "<button id=\"btn\" class=\"btn btn-primary\" onclick=\"edit();\">编辑</button>";
        }
    </script>

    <section class="charts">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">

                    <div class="card">
                        <table class="table table-striped table-hover">
                            <thead>
                            <tr>
                                <th>学号</th>
                                <th>姓名</th>
                                <th>成绩</th>
                                <th>绩点</th>
                                <th>排名</th>
                                <th>是否及格</th>
                                <th>审核状态</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>16369001</td>
                                <td>甲</td>
                                <td>61</td>
                                <td></td>
                                <td></td>
                                <td>是</td>
                                <td></td>
                                <td>
                                    <button id="btn" class="btn btn-primary" onclick="edit();">编辑</button>
                                </td>
                            </tr>
                            <tr>
                                <td>16369002</td>
                                <td>乙</td>
                                <td>59</td>
                                <td></td>
                                <td></td>
                                <td>否</td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>16369011</td>
                                <td>丙</td>
                                <td>69</td>
                                <td></td>
                                <td></td>
                                <td>是</td>
                                <td></td>
                                <td></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>
    </section>
</@teacher>