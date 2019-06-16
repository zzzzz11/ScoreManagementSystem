<#include "managerMacro.ftl">
<@manager keywords="教务管理员信息" js=["js/edit.js"]>
    <header class="page-header">
        <div class="container-fluid">
            <h2 class="no-margin-bottom">教师管理</h2>
        </div>
    </header>

    <section class="form">
        <div class="container-fluid">
            <div class="col-lg-10 offset-1">
                <div class="card">
                    <div class="card-body">
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
        </div>
    </section>
</@manager>
