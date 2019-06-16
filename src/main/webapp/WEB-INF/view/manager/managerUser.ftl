<#include "managerMacro.ftl">
<@manager keywords="教务管理员信息" js=["js/edit.js"]>
    <header class="page-header">
        <div class="container-fluid">
            <h2 class="no-margin-bottom">用户管理</h2>
        </div>
    </header>
    <section class="form">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-8 offset-2">
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
                                                        aria-expanded="false"> Action <span class="caret"></span>
                                                </button>
                                                <div class="dropdown-menu" x-placement="bottom-start"
                                                     style="position: absolute; will-change: transform; top: 0; left: 0; transform: translate3d(0px, 38px, 0px);">
                                                    <button onclick="searchName()" class="dropdown-item">用户名</button>
                                                    <button onclick="searchType()" class="dropdown-item">类型</button>
                                                    <div class="dropdown-divider"></div>
                                                    <button onclick="void(0)" class="dropdown-item">模糊</button>
                                                </div>
                                            </div>
                                            <input type="text" class="form-control" name="content">
                                        </div>
                                    </form>
                                </div>
                                <!-- 添加用户 -->
                                <div class="col-sm-1 offset-sm-1">
                                    <button data-toggle="dropdown" type="button"
                                            class="btn btn-success dropdown-toggle"
                                            aria-expanded="false"><strong>添加</strong>
                                    </button>
                                    <div class="dropdown-menu" x-placement="bottom-start"
                                         style="position: absolute; will-change: transform; top: 0; left: 0; transform: translate3d(0px, 38px, 0px);">
                                        <button type="button" data-toggle="modal" data-target="#addTeacher"
                                                class="dropdown-item">教师
                                        </button>
                                        <button type="button" data-toggle="modal" data-target="#addStudent"
                                                class="dropdown-item">学生
                                        </button>
                                        <button type="button" data-toggle="modal" data-target="#addManager"
                                                class="dropdown-item">管理员
                                        </button>
                                    </div>
                                </div>
                                <div id="addTeacher" tabindex="-1" role="dialog"
                                     aria-labelledby="addTeacherTitle"
                                     class="modal fade text-left" style="display: none;" aria-hidden="true">
                                    <div role="document" class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 id="addTeacherTitle" class="modal-title">添加教师信息</h4>
                                                <button type="button" data-dismiss="modal" aria-label="Close"
                                                        class="close"><span aria-hidden="true">×</span></button>
                                            </div>
                                            <form action="${ctx}/manager/add/teacher" method="post">
                                                <div class="modal-body">
                                                    <div class="form-group">
                                                        <label>名字</label>
                                                        <input name="name" type="text" placeholder="Teacher's Name"
                                                               class="form-control">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>工号</label>
                                                        <input name="number" type="text" placeholder="Number"
                                                               class="form-control">
                                                    </div>
                                                    <div class="row">
                                                        <div class="form-group col-lg-6">
                                                            <label>所属学院</label>
                                                            <select name="deptId" class="form-control">
                                                                <#if depts??>
                                                                    <#assign depts_text>${depts}</#assign>
                                                                    <#assign deptsJson=depts_text?eval />
                                                                    <#list deptsJson as dept>
                                                                        <option value="${dept.id}">${dept.name}</option>
                                                                    </#list>
                                                                </#if>
                                                            </select>
                                                        </div>
                                                        <div class="form-group col-lg-6">
                                                            <label>职称</label>
                                                            <input name="title" type="text"
                                                                   placeholder="Teacher's Title"
                                                                   class="form-control">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" data-dismiss="modal"
                                                            class="btn btn-secondary">
                                                        取消
                                                    </button>
                                                    <button type="submit" class="btn btn-success">确定</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div id="addStudent" tabindex="-1" role="dialog"
                                     aria-labelledby="addStudentTitle"
                                     class="modal fade text-left" style="display: none;" aria-hidden="true">
                                    <div role="document" class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 id="addStudentTitle" class="modal-title">添加学生信息</h4>
                                                <button type="button" data-dismiss="modal" aria-label="Close"
                                                        class="close"><span aria-hidden="true">×</span></button>
                                            </div>
                                            <form action="${ctx}/manager/add/student" method="post">
                                                <div class="modal-body">
                                                    <div class="form-group">
                                                        <label>名字</label>
                                                        <input name="name" type="text" placeholder="Student's Name"
                                                               class="form-control">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>学号</label>
                                                        <input name="number" type="text"
                                                               placeholder="Number"
                                                               class="form-control">
                                                    </div>
                                                    <div class="row">
                                                        <div class="form-group col-lg-9">
                                                            <label>专业</label>
                                                            <input id="minput" type="text"
                                                                   list="mlist" onchange="contactMajorId()"
                                                                   placeholder="Major" class="form-control">
                                                            <datalist id="mlist">
                                                                <#if majors??>
                                                                    <#assign majors_text>${majors}</#assign>
                                                                    <#assign majorsJson=majors_text?eval />
                                                                    <#list majorsJson as major>
                                                                        <option value=${major.name} data-id=${major.id}></option>
                                                                    </#list>
                                                                </#if>
                                                            </datalist>
                                                            <input id="majorId" name="majorId" value="1" hidden>
                                                        </div>
                                                        <div class="form-group col-lg-3">
                                                            <label>班别</label>
                                                            <select name="clazz" class="form-control">
                                                                <option>A班</option>
                                                                <option>B班</option>
                                                                <option>C班</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" data-dismiss="modal"
                                                            class="btn btn-secondary">
                                                        取消
                                                    </button>
                                                    <button type="submit" class="btn btn-success">确定</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div id="addManager" tabindex="-1" role="dialog"
                                     aria-labelledby="addManagerTitle"
                                     class="modal fade text-left" style="display: none;" aria-hidden="true">
                                    <div role="document" class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 id="addManagerTitle" class="modal-title">添加管理员信息</h4>
                                                <button type="button" data-dismiss="modal" aria-label="Close"
                                                        class="close"><span aria-hidden="true">×</span></button>
                                            </div>
                                            <form action="${ctx}/manager/add/manager" method="post">
                                                <div class="modal-body">
                                                    <div class="row">
                                                        <div class="form-group col-lg-6">
                                                            <label>名字</label>
                                                            <input name="name" type="text" placeholder="Name"
                                                                   class="form-control">
                                                        </div>
                                                        <div class="form-group col-lg-6">
                                                            <label>工号</label>
                                                            <input name="number" type="text" placeholder="Number"
                                                                   class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>所在学院</label>
                                                        <select name="deptId" class="form-control">
                                                            <#list deptsJson as dept>
                                                                <option value="${dept.id}">${dept.name}</option>
                                                            </#list>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>邮箱</label>
                                                        <input name="email" type="email" placeholder="Email Address"
                                                               class="form-control">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>手机号</label>
                                                        <input name="phone" type="text" placeholder="Phone Number"
                                                               class="form-control">
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" data-dismiss="modal"
                                                            class="btn btn-secondary">
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
                                        <th>账号</th>
                                        <th>用户名</th>
                                        <th>角色</th>
                                        <th>手机</th>
                                        <th>邮箱</th>
                                        <th>创建时间</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <#-- 变量声明 -->
                                    <#if users??>
                                        <#assign users_text>${users}</#assign>
                                        <#assign usersJson=users_text?eval />
                                        <#list usersJson as user>
                                            <tr>
                                                <td>${user.accountNumber}</td>
                                                <td>${user.userName}</td>
                                                <td>${user.userType}</td>
                                                <td></td>
                                                <td></td>
                                                <td>${user.createTime}</td>
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
        </div>
    </section>

    <script>
        function searchName() {
            $("#search").attr("action", "${ctx}/managerInfo/search/user/name").submit();
        }

        function searchType() {
            $("#search").attr("action", "${ctx}/managerInfo/search/user/type").submit();
        }

        function contactMajorId() {
            let mid = $("#mlist option[value='" + $('#minput').val() + "']").attr('data-id');
            $("#majorId").attr("value", mid);
        }
    </script>
</@manager>