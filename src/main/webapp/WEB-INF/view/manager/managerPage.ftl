<#include "managerMacro.ftl">
<@manager keywords="管理员管理界面查看" js=["js/edit.js"]>

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
                            <h3 class="h4">待处理申请</h3>
                        </div>


                        <div class="card-body">
                            <div class="table-responsive">

                                <table class="table table-striped table-hover">
                                    <thead>
                                    <tr>
                                        <th>课程号</th>
                                        <th>开课时间</th>
                                        <th>课程名</th>
                                        <th>学分</th>
                                        <th>课程类型</th>
                                        <th>学时</th>
                                        <th>考试类型</th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                            </td>
                                            <td>
                                                <a class="btn btn-primary" href="${ctx}/manager/detail">查看详情</a>
                                            </td>
                                        </tr>
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