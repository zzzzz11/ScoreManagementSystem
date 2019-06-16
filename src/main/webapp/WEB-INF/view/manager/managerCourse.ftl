<#include "managerMacro.ftl">
<@manager keywords="教务管理员信息" js=["js/edit.js"]>
    <header class="page-header">
        <div class="container-fluid">
            <h2 class="no-margin-bottom">课程管理</h2>
        </div>
    </header>

    <section class="form">
        <div class="container-fluid">
            <div class="col-lg-10 offset-1">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <!-- 查询功能 -->
                            <div class="col-sm-7">
                                <form action="" id="search" class="form-group" method="post">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <button data-toggle="dropdown" type="button"
                                                    class="btn btn-outline-secondary dropdown-toggle"
                                                    aria-expanded="false"> 查询 <span class="caret"></span>
                                            </button>
                                            <div class="dropdown-menu" x-placement="bottom-start"
                                                 style="position: absolute; will-change: transform; top: 0; left: 0; transform: translate3d(0px, 38px, 0px);">
                                                <button onclick="searchTeacher()" class="dropdown-item">教师</button>
                                                <button onclick="searchType()" class="dropdown-item">类型</button>
                                                <div class="dropdown-divider"></div>
                                                <button onclick="void(0)" class="dropdown-item">模糊</button>
                                            </div>
                                        </div>
                                        <input type="text" class="form-control" name="content">
                                    </div>
                                </form>
                            </div>
                            <!-- 添加课程 -->
                            <button type="button" data-toggle="modal" data-target="#addCourse"
                                    class="col-sm-1 offset-sm-1 btn btn-primary"
                                    style="height: fit-content"><strong>新课程</strong>
                            </button>
                            <!-- 创建新课程 -->
                            <div id="addCourse" tabindex="-1" role="dialog" aria-labelledby="addCourseTitle"
                                 class="modal fade text-left" style="display: none;" aria-hidden="true">
                                <div role="document" class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 id="addCourseTitle" class="modal-title">添加课程信息</h4>
                                            <button type="button" data-dismiss="modal" aria-label="Close"
                                                    class="close"><span aria-hidden="true">×</span></button>
                                        </div>
                                        <form action="${ctx}/manager/add/course" method="post">
                                            <div class="modal-body">
                                                <div class="form-group">
                                                    <label>名称</label>
                                                    <input name="name" type="text" placeholder="Course Name"
                                                           class="form-control">
                                                </div>
                                                <div class="row">
                                                    <div class="form-group col-lg-6">
                                                        <label>教师</label>
                                                        <input name="teacherName" type="text"
                                                               placeholder="Teacher's Name"
                                                               class="form-control">
                                                    </div>
                                                    <div class="form-group col-lg-6">
                                                        <label>类型</label>
                                                        <select name="type" class="form-control">
                                                            <option>专必</option>
                                                            <option>公必</option>
                                                            <option>专选</option>
                                                            <option>公选</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="form-group col-lg-6">
                                                        <label>学分</label>
                                                        <input name="credit" type="number" placeholder="Credit"
                                                               class="form-control">
                                                    </div>
                                                    <div class="form-group col-lg-6">
                                                        <label>学时</label>
                                                        <input name="period" type="number" placeholder="Period"
                                                               class="form-control">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" data-dismiss="modal" class="btn btn-secondary">
                                                    取消
                                                </button>
                                                <button type="submit" class="btn btn-success">确定</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 表格 -->
                        <div class="table-responsive">
                            <table class="table table-striped table-hover">
                                <thead>
                                <tr>
                                    <th>名称</th>
                                    <th>教师</th>
                                    <th>类型</th>
                                    <th>学分</th>
                                    <th>学时</th>
                                </tr>
                                </thead>
                                <tbody>
                                <#-- 变量声明 -->
                                <#if courses??>
                                    <#assign text>${courses}</#assign>
                                    <#assign coursesJson=text?eval />
                                    <#list coursesJson as course>
                                        <tr>
                                            <td>${course.name}</td>
                                            <td>${course.teacher.name}</td>
                                            <td>${course.type}</td>
                                            <td>${course.credit}</td>
                                            <td>${course.period}</td>
                                        </tr>
                                    </#list>
                                </#if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script>
        function searchTeacher() {
            $("#search").attr("action", "${ctx}/managerInfo/search/course/teacher").submit();
        }

        function searchType() {
            $("#search").attr("action", "${ctx}/managerInfo/search/course/type").submit();
        }
    </script>
</@manager>