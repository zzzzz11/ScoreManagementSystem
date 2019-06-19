<#include "managerMacro.ftl">
<@manager keywords="教务管理员信息" js=[]>
    <header class="page-header">
        <div class="container-fluid">
            <h2 class="no-margin-bottom">教师管理</h2>
        </div>
    </header>

    <section class="form">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-2"></div>
                <div class="col-lg-8">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-7">
                                    <form action="${ctx}/manager/searchTeacher" class="form-group" method="post">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <button type="submit"
                                                        class="btn btn-outline-secondary"
                                                        aria-expanded="false"><span class="icon-search"></span>
                                                </button>
                                            </div>
                                            <input type="text" class="form-control" name="content">
                                        </div>
                                    </form>
                                </div>
                            </div>

                            <div class="table-responsive">
                                <table class="table table-striped table-hover">
                                    <thead>
                                    <tr>
                                        <th>名字</th>
                                        <th>工号</th>
                                        <th>职称</th>
                                        <th>所属学院</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <#-- 变量声明 -->
                                    <#if teachers??>
                                        <#assign text>${teachers}</#assign>
                                        <#assign teachersJson=text?eval />
                                        <#list teachersJson as teacher>
                                            <tr>
                                                <td>${teacher.name}</td>
                                                <td>${teacher.number}</td>
                                                <td>${teacher.title}</td>
                                                <td>${teacher.dept.name}</td>
                                            </tr>
                                        </#list>
                                    </#if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2"></div>
            </div>
        </div>
    </section>
</@manager>
