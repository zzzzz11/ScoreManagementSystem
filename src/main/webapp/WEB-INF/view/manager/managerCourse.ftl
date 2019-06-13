<#include "managerMacro.ftl">
<@manager keywords="教务管理员信息" js=["js/edit.js"]>
    <header class="page-header">
        <div class="container-fluid">
            <h2 class="no-margin-bottom">个人信息</h2>
        </div>
    </header>
    <section class="form">
        <div class="container-fluid">
            <#-- 变量声明 -->
            <#assign text>${courses}</#assign>
            <#assign coursesJson=text?eval />
            <div class="row">
                <div class="col-lg-10 offset-1">
                    <div class="card">
                        <div class="card-body">
                            <form class="form-group">
                                <div class="form-inline">
                                    <label class="label">类型: </label>
                                    <select class="custom-select">
                                        <option>专必</option>
                                        <option>公必</option>
                                        <option>专选</option>
                                        <option>公选</option>
                                    </select>
                                </div>

                                <div class="form-inline">
                                    <label class="label">教师: </label>
                                    <select class="custom-select">
                                        <#list coursesJson as course>
                                            <option>${course.teacher.name}</option>
                                        </#list>
                                    </select>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-10 offset-1">
                    <div class="card">
                        <div class="card-close">
                            <div class="dropdown">
                                <button type="button" id="closeCard3" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false" class="dropdown-toggle">
                                    <i class="fa fa-ellipsis-v"></i>
                                </button>
                                <div aria-labelledby="closeCard3" class="dropdown-menu dropdown-menu-right has-shadow">
                                    <a href="#" class="dropdown-item remove"><i class="fa fa-times"></i>Close</a>
                                    <a href="javascript:;" class="dropdown-item edit"><i class="fa fa-gear"></i>Edit</a>
                                </div>
                            </div>
                        </div>
                        <div class="card-header d-flex align-items-center">
                            <h4 class="h4">Profile</h4>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-hover">
                                    <thead>
                                    <tr>
                                        <th>课程</th>
                                        <th>分数</th>
                                        <th>绩点</th>
                                        <th>排名</th>
                                        <th>类型</th>
                                        <th>教师</th>
                                        <th>是否通过</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <#list coursesJson as course>
                                        <tr>
                                            <td>${course.name}</td>
                                            <td>${course.credit}</td>
                                            <td>${course.type}</td>
                                            <td>${course.period}</td>
                                            <td>${course.teacher.name}</td>
                                        </tr>
                                    </#list>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</@manager>