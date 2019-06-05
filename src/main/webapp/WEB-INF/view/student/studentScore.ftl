<#include "studentMacro.ftl">
<@student keywords="学生成绩" js=["js/charts-custom.js"]>

    <header class="page-header">
        <div class="container-fluid">
            <h2 class="no-margin-bottom">成绩详情</h2>
        </div>
    </header>

    <section class="charts">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-close">
                            <div class="dropdown">
                                <button type="button" id="closeCard3" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false" class="dropdown-toggle"><i class="fa fa-ellipsis-v"></i>
                                </button>
                                <div aria-labelledby="closeCard3" class="dropdown-menu dropdown-menu-right has-shadow">
                                    <a href="#" class="dropdown-item remove"> <i class="fa fa-times"></i>Close</a><a
                                            href="#" class="dropdown-item edit"> <i class="fa fa-gear"></i>Edit</a>
                                </div>
                            </div>
                        </div>
                        <div class="card-header d-flex align-items-center">
                            <h3 class="h4">Score table</h3>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <#assign text>${score}</#assign>
                                <#assign json=text?eval />
                                <table class="table table-striped table-hover">
                                    <thead>
                                    <tr>
                                        <th>课程</th>
                                        <th>成绩</th>
                                        <th>类型</th>
                                        <th>教师</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <#list json as record>
                                        <tr>
                                            <td>${record.course.name}</td>
                                            <td>${record.value}</td>
                                            <td>${record.course.type}</td>
                                            <td>${record.course.teacher.name}</td>
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

</@student>
