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

                        <div class="form-inline" style="margin-left:30px;margin-top:20px;">
                            <div class="form-inline" style="margin-right:30px;">
                                <label for="" size="20">培养方案:&#160;&#160;&#160;&#160;</label>
                                <select class="form-control" name="" id="">
                                    <option>主修</option>
                                    <option>辅修</option>
                                    <option>双学位</option>
                                </select>
                            </div>

                            <div class="form-inline" style="margin-right:30px;">
                                <label for="">学年:&#160;&#160;&#160;&#160;</label>
                                <select class="form-control" name="" id="">
                                    <option>2018-2019</option>
                                    <option>2017-2018</option>
                                    <option>2016-2017</option>
                                </select>
                            </div>

                            <div class="form-inline" style="margin-right:30px;">
                                <label for="">学期:&#160;&#160;&#160;&#160;</label>
                                <select class="form-control" name="" id="">
                                    <option>第一学期</option>
                                    <option>第二学期</option>
                                </select>
                            </div>

                            <button type="button" class="btn btn-primary">查询</button>
                        </div>

                        <div>
                            <div class="form-check form-check-inline">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="checkbox" name="" id=""
                                           value="option1"> 公必
                                </label>
                                <label class="form-check-label">
                                    <input class="form-check-input" type="checkbox" name="" id=""
                                           value="option2"> 专必
                                </label>
                                <label class="form-check-label">
                                    <input class="form-check-input" type="checkbox" name="" id=""
                                           value="option3"> 专选
                                </label>
                                <label class="form-check-label">
                                    <input class="form-check-input" type="checkbox" name="" id=""
                                           value="option4"> 公选
                                </label>
                            </div>
                        </div>

                        <div class="card-body">
                            <div class="table-responsive">
                                <#assign text>${score}</#assign>
                                <#assign json=text?eval />
                                <table class="table table-striped table-hover">
                                    <thead>
                                    <tr>
                                        <th>课程</th>
                                        <th>类型</th>
                                        <th>教师</th>
                                        <th>学年</th>
                                        <th>学期</th>
                                        <th>原始成绩</th>
                                        <th>最终成绩</th>
                                        <th>特殊原因</th>
                                        <th>绩点</th>
                                        <th>考试性质</th>
                                        <th>是否通过</th>
                                        <th>教学班排名</th>
                                        <th>年级专业排名</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <#list json as record>
                                        <tr>
                                            <td>${record.course.name}</td>
                                            <td>${record.course.type}</td>
                                            <td>${record.course.teacher.name}</td>
                                            <td>${record.course.year}</td>
                                            <td>${record.course.term}</td>
                                            <td>${record.value}</td>
                                            <td>${record.value}</td>
                                            <td></td>
                                            <#assign credit>${record.value/20}</#assign>
                                            <td>${credit}</td>
                                            <td>${record.course.test_form}</td>
                                            <#assign isPassed>${record.identity}</#assign>
                                            <td>
                                                <#if isPassed=="1">
                                                    不及格
                                                <#else>
                                                    及格
                                                </#if>
                                            </td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                    </#list>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
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

                        <table class="table table-bordered ranking-all ng-scope" ng-repeat="item in creditSituationList"
                               style="text-align: center">
                            <tbody>
                            <tr>
                                <td rowspan="2" style="    vertical-align: middle;">课程类别</td>
                                <td colspan="3" class="ng-binding">2018-2019学年第一学期完成情况</td>
                                <td colspan="3">全部完成情况</td>
                                <!--<td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>
                                <td>{{item.}}</td>-->
                            </tr>
                            <tr>
                                <td>已修学分</td>
                                <td>已获学分</td>
                                <td>平均学分绩点</td>
                                <td>已修学分</td>
                                <td>已获学分</td>
                                <td>平均学分绩点</td>
                            </tr>
                            <tr>
                                <td>公必</td>
                                <td class="ng-binding">0.0</td>
                                <td class="ng-binding">0.0</td>
                                <td class="ng-binding">0.000</td>
                                <td class="ng-binding">30.0</td>
                                <td class="ng-binding">30.0</td>
                                <td class="ng-binding">3.083</td>
                            </tr>
                            <tr>
                                <td>专必</td>
                                <td class="ng-binding">10.0</td>
                                <td class="ng-binding">10.0</td>
                                <td class="ng-binding">3.270</td>
                                <td class="ng-binding">47.0</td>
                                <td class="ng-binding">47.0</td>
                                <td class="ng-binding">3.198</td>
                            </tr>
                            <tr>
                                <td>公选</td>
                                <td class="ng-binding">2.0</td>
                                <td class="ng-binding">2.0</td>
                                <td class="ng-binding">3.800</td>
                                <td class="ng-binding">16.0</td>
                                <td class="ng-binding">16.0</td>
                                <td class="ng-binding">3.825</td>
                            </tr>
                            <tr>
                                <td>专选</td>
                                <td class="ng-binding">15.0</td>
                                <td class="ng-binding">15.0</td>
                                <td class="ng-binding">3.533</td>
                                <td class="ng-binding">25.0</td>
                                <td class="ng-binding">25.0</td>
                                <td class="ng-binding">3.048</td>
                            </tr>
                            <tr>
                                <td>合计</td>
                                <td class="ng-binding">27.0</td>
                                <td class="ng-binding">27.0</td>
                                <td class="ng-binding">3.456</td>
                                <td class="ng-binding">118.0</td>
                                <td class="ng-binding">118.0</td>
                                <td class="ng-binding">3.222</td>
                            </tr>
                            <tr>
                                <td>必修、专选平均绩点|排名/总人数</td>
                                <td colspan="2" class="ng-binding">3.428</td>
                                <td class="ng-binding">57/87</td>
                                <td colspan="2" class="ng-binding">3.127</td>
                                <td class="ng-binding">60/87</td>
                            </tr>
                            </tbody>
                        </table>

                    </div>
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

                        <div class="container">
                            <div class="row" style:="font-size:12px;">
                                <div class="col-1">类型</div>
                                <div class="col-2">平均学分绩点</div>
                                <div class="col-1">应修学分</div>
                                <div class="col-1">已修学分</div>
                                <div class="col-1">已获学分</div>
                                <div class="col-1">未获学分</div>
                                <div class="col-5">完成度</div>
                            </div>
                            <div class="row">
                                <div class="col-1">公必</div>
                                <div class="col-2">0</div>
                                <div class="col-1">0</div>
                                <div class="col-1">0</div>
                                <div class="col-1">0</div>
                                <div class="col-1">0</div>
                                <div class="col-5">
                                    <div class="progress">
                                        <div class="progress-bar" role="progressbar" aria-valuenow="60"
                                             aria-valuemin="0" aria-valuemax="100" style="width: 40%;">
                                            <span class="sr-only">40% 完成</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-1">专必</div>
                                <div class="col-2">0</div>
                                <div class="col-1">0</div>
                                <div class="col-1">0</div>
                                <div class="col-1">0</div>
                                <div class="col-1">0</div>
                                <div class="col-5">
                                    <div class="progress">
                                        <div class="progress-bar" role="progressbar" aria-valuenow="60"
                                             aria-valuemin="0" aria-valuemax="100" style="width: 40%;">
                                            <span class="sr-only">40% 完成</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-1">公选</div>
                                <div class="col-2">0</div>
                                <div class="col-1">0</div>
                                <div class="col-1">0</div>
                                <div class="col-1">0</div>
                                <div class="col-1">0</div>
                                <div class="col-5">
                                    <div class="progress">
                                        <div class="progress-bar" role="progressbar" aria-valuenow="60"
                                             aria-valuemin="0" aria-valuemax="100" style="width: 40%;">
                                            <span class="sr-only">40% 完成</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-1">专选</div>
                                <div class="col-2">0</div>
                                <div class="col-1">0</div>
                                <div class="col-1">0</div>
                                <div class="col-1">0</div>
                                <div class="col-1">0</div>
                                <div class="col-5">
                                    <div class="progress">
                                        <div class="progress-bar" role="progressbar" aria-valuenow="60"
                                             aria-valuemin="0" aria-valuemax="100" style="width: 40%;">
                                            <span class="sr-only">40% 完成</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-1">总览</div>
                                <div class="col-2">0</div>
                                <div class="col-1">0</div>
                                <div class="col-1">0</div>
                                <div class="col-1">0</div>
                                <div class="col-1">0</div>
                                <div class="col-5">
                                    <div class="progress">
                                        <div class="progress-bar" role="progressbar" aria-valuenow="60"
                                             aria-valuemin="0" aria-valuemax="100" style="width: 40%;">
                                            <span class="sr-only">40% 完成</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="line-chart-example card">
                                <div class="card-close">
                                    <div class="dropdown">
                                        <button type="button" id="closeCard1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-ellipsis-v"></i>
                                        </button>
                                        <div aria-labelledby="closeCard1" class="dropdown-menu dropdown-menu-right has-shadow">
                                            <a href="#" class="dropdown-item remove"> <i class="fa fa-times"></i>Close</a><a href="#" class="dropdown-item edit"> <i class="fa fa-gear"></i>Edit</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-header d-flex align-items-center">
                                    <h3 class="h4">Line Chart Example</h3>
                                </div>
                                <div class="card-body"><div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"><div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div></div><div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:200%;height:200%;left:0; top:0"></div></div></div>
                                    <canvas id="lineChartExample" width="642" height="321" class="chartjs-render-monitor" style="display: block; width: 642px; height: 321px;"></canvas>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="pie-chart-example card">
                                <div class="card-close">
                                    <div class="dropdown">
                                        <button type="button" id="closeCard7" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-ellipsis-v"></i>
                                        </button>
                                        <div aria-labelledby="closeCard7" class="dropdown-menu dropdown-menu-right has-shadow">
                                            <a href="#" class="dropdown-item remove"> <i class="fa fa-times"></i>Close</a><a href="#" class="dropdown-item edit"> <i class="fa fa-gear"></i>Edit</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-header d-flex align-items-center">
                                    <h3 class="h4">Doughnut Chart Example</h3>
                                </div>
                                <div class="card-body"><div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"><div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div></div><div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:200%;height:200%;left:0; top:0"></div></div></div>
                                    <canvas id="doughnutChartExample" width="350" height="340" class="chartjs-render-monitor" style="display: block; width: 350px; height: 340px;"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>
</@student>
