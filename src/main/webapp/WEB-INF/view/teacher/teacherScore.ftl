<#include "teacherMacro.ftl">
<@teacher keywords="教师成绩提交" js=["js/bootstable.js"]>

    <header class="page-header">
        <div class="container-fluid">
            <a href="${ctx}/teacher/course">课程信息</a> / 成绩详情
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
                                    <a href="#" class="dropdown-item remove"> <i class="fa fa-times"></i>Close</a>
                                    <a href="javascript:void(0)" class="dropdown-item edit"
                                       onclick="exportExcel('#scoreAudit')"><i
                                                class="fa fa-gear"></i>Export
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="card-header d-flex align-items-center">
                            <h3 class="h4">成绩查看</h3>
                        </div>

                        <div class="card-body">
                            <div class="table-responsive">
                                <#if scores??>
                                    <#assign scoreText = scores>
                                    <#assign scoreJson = scoreText?eval>
                                    <#if isCheck = false>
                                        <table id="editTable" class="table table-striped table-hover">
                                            <thead>
                                            <tr>
                                                <th>学号</th>
                                                <th>姓名</th>
                                                <th>成绩</th>
                                                <th>绩点</th>
                                                <th>专业</th>
                                                <th>课程学分</th>
                                                <th>审核状态</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <#list scoreJson as score>
                                                <tr>
                                                    <td class="snumber">${score.student.number}</td>
                                                    <td>${score.student.name}</td>
                                                    <#if score.value??>
                                                        <td class="score-value">${score.value}</td>
                                                        <td class="gpa">${(score.value - 50)/10}</td>
                                                    <#else>
                                                        <td>未登记</td>
                                                        <td>未登记</td>
                                                    </#if>
                                                    <td>${score.student.major.name}</td>
                                                    <td>${score.course.credit}</td>
                                                    <td>未通过</td>
                                                </tr>
                                            </#list>
                                            </tbody>
                                        </table>
                                    <#else>
                                        <table id="scoreAudit" class="table table-striped table-hover">
                                            <thead>
                                            <tr>
                                                <th>学号</th>
                                                <th>姓名</th>
                                                <th>成绩</th>
                                                <th>绩点</th>
                                                <th>专业</th>
                                                <th>学分</th>
                                                <th>审核状态</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <#list scoreJson as score>
                                                <tr>
                                                    <td>${score.student.number}</td>
                                                    <td>${score.student.name}</td>
                                                    <td>${score.value}</td>
                                                    <td>${(score.value - 50)/10}</td>
                                                    <td>${score.student.major.name}</td>
                                                    <td>${score.course.credit}</td>
                                                    <td>已通过</td>
                                                </tr>
                                            </#list>
                                            </tbody>
                                        </table>
                                    </#if>
                                </#if>
                                <#if isCheck = false>
                                    <button class="btn btn-primary" id="submitScore">提交成绩</button>
                                </#if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</@teacher>