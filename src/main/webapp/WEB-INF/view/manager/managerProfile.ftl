<#include "managerMacro.ftl">
<@manager keywords="教务管理员信息" js=[]>
    <header class="page-header">
        <div class="container-fluid">
            <h2 class="no-margin-bottom">个人信息</h2>
        </div>
    </header>
    <section class="form">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-2"></div>
                <div class="col-lg-8">
                    <div class="client card">
                        <div class="card-body text-center">
                            <div class="client-avatar"><img src="img/avatar.jpg" alt="..."
                                                            class="img-fluid rounded-circle">
                                <div class="status bg-green"></div>
                            </div>
                            <div class="client-title">
                                <h3>${managerInfo.name}</h3><span>${managerInfo.number}</span>
                            </div>
                            <div class="client-info">
                                <div class="row">
                                    <div class="col-4"><strong>${managerInfo.department.name}</strong><br>
                                        <i class="icon-home"></i>
                                    </div>
                                    <div class="col-4"><strong>${(Session["user"].email)!"***"}</strong><br>
                                        <i class="icon-mail"></i>
                                    </div>
                                    <div class="col-4"><strong>${(Session["user"].phone)!"***"}</strong><br>
                                        <i class="icon-user"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="client-social d-flex justify-content-between">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-2"></div>
        </div>
        </div>
    </section>
</@manager>