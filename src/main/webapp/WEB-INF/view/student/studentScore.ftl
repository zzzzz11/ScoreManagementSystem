<#include "studentMacro.ftl">
<@student keywords="学生成绩" js=["js/mycharts.js"]>

    <!-- 模块标题 -->
    <header class="page-header">
        <div class="container-fluid">
            <h2 class="no-margin-bottom">成绩详情</h2>
        </div>
    </header>

    <!-- 内容区 -->
    <section class="charts">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <!-- 课程成绩 -->
                    <div class="card">
                        <div class="card-close">
                            <div class="dropdown">
                                <button type="button" id="closeCard3" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false" class="dropdown-toggle"><i class="fa fa-ellipsis-v"></i>
                                </button>
                                <div aria-labelledby="closeCard3" class="dropdown-menu dropdown-menu-right has-shadow">
                                    <a href="#" class="dropdown-item remove"> <i class="fa fa-times"></i>Close</a>
                                    <a href="#" class="dropdown-item edit"> <i class="fa fa-gear"></i>Edit</a>
                                    <a href="javascript:void(0)" class="dropdown-item edit" onclick="exportExcel()"><i
                                                class="fa fa-gear"></i>export
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="card-header d-flex align-items-center">
                            <h3 class="h4">成绩查询</h3>
                        </div>

                        <div class="card-body">
                            <!-- 查询表单 -->
                            <div class="d-inline-flex">
                                <form class="form-inline">
                                    <div class="form-group mr-3">
                                        <label>培养方案：</label>
                                        <select class="form-control" name="">
                                            <option>主修</option>
                                            <option>辅修</option>
                                            <option>双学位</option>
                                        </select>
                                    </div>

                                    <div class="form-group mr-3">
                                        <label>学年：</label>
                                        <select class="form-control" name="">
                                            <option>2018-2019</option>
                                            <option>2017-2018</option>
                                            <option>2016-2017</option>
                                        </select>
                                    </div>

                                    <div class="form-group mr-3">
                                        <label>学期：</label>
                                        <select class="form-control" name="">
                                            <option>第一学期</option>
                                            <option>第二学期</option>
                                        </select>
                                    </div>
                                    <button type="submit" class="btn btn-primary">查询</button>
                                </form>
                            </div>
                            <div class="d-inline-flex ml-5">
                                <div class="mb-3">
                                    <div class="list-inline-item">
                                        <input id="checkboxCustom1" type="checkbox" value="" class="checkbox-template">
                                        <label for="checkboxCustom1">专必</label>
                                    </div>
                                    <div class="list-inline-item">
                                        <input id="checkboxCustom2" type="checkbox" value="" class="checkbox-template">
                                        <label for="checkboxCustom2">公必</label>
                                    </div>
                                    <div class="list-inline-item">
                                        <input id="checkboxCustom3" type="checkbox" value="" class="checkbox-template">
                                        <label for="checkboxCustom3">专选</label>
                                    </div>
                                    <div class="list-inline-item">
                                        <input id="checkboxCustom4" type="checkbox" value="" class="checkbox-template">
                                        <label for="checkboxCustom4">公选</label>
                                    </div>
                                </div>
                            </div>

                            <div class="table-responsive">
                                <#assign text>${score}</#assign>
                                <#assign json=text?eval />
                                <table id="table" class="table table-striped table-hover">
                                    <thead>
                                    <tr>
                                        <th>课程</th>
                                        <th>类型</th>
                                        <th>教师</th>
                                        <th>分数</th>
                                        <th>绩点</th>
                                        <th>排名</th>
                                        <th>学年</th>
                                        <th>学期</th>
                                        <th>考试方式</th>
                                        <th>是否通过</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <#list json as record>
                                        <tr>
                                            <td>${record.course.name}</td>
                                            <td>${record.course.type}</td>
                                            <td>${record.course.teacher.name}</td>
                                            <td>${record.value}</td>
                                            <#assign credit>${record.value/20}</#assign>
                                            <td>${credit}</td>
                                            <td>${record.crank} / ${record.course.studentCount!""}</td>
                                            <td>${record.course.year} - ${record.course.year?eval + 1}</td>
                                            <td>${record.course.term!""}</td>
                                            <td>${record.course.testForm!""}</td>
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
                    <!-- 学分详情 -->
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
                            <h3 class="h4">学分详情</h3>
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
                    <!-- 学分详情 -->
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
                            <h3 class="h4">学分详情</h3>
                        </div>

                        <div class="container">
                            <table class="table table-hover" style="text-align: center;">
                                <thead>
                                <tr>
                                    <th scope="col" style="width:10%;">类型</th>
                                    <th scope="col" style="width:10%;">平均学分绩点</th>
                                    <th scope="col" style="width:10%;">应修学分</th>
                                    <th scope="col" style="width:10%;">已修学分</th>
                                    <th scope="col" style="width:10%;">已获学分</th>
                                    <th scope="col" style="width:10%;">未获学分</th>
                                    <th scope="col" style="width:20%;">完成度</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row">公必</th>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>
                                        <div class="progress" style="height: 20px;">
                                            <div class="progress-bar progress-bar-striped" role="progressbar"
                                                 aria-valuenow="60"
                                                 aria-valuemin="0" aria-valuemax="100" style="width: 40%;">
                                                40% 完成
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">专必</th>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>
                                        <div class="progress" style="height: 20px;">
                                            <div class="progress-bar progress-bar-striped" role="progressbar"
                                                 aria-valuenow="60"
                                                 aria-valuemin="0" aria-valuemax="100" style="width: 40%;">
                                                40% 完成
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">公选</th>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>
                                        <div class="progress" style="height: 20px;">
                                            <div class="progress-bar progress-bar-striped" role="progressbar"
                                                 aria-valuenow="60"
                                                 aria-valuemin="0" aria-valuemax="100" style="width: 40%;">
                                                40% 完成
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">专选</th>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>
                                        <div class="progress" style="height: 20px;">
                                            <div class="progress-bar progress-bar-striped" role="progressbar"
                                                 aria-valuenow="60"
                                                 aria-valuemin="0" aria-valuemax="100" style="width: 40%;">
                                                40% 完成
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">总览</th>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>
                                        <div class="progress" style="height: 20px;">
                                            <div class="progress-bar progress-bar-striped" role="progressbar"
                                                 aria-valuenow="60"
                                                 aria-valuemin="0" aria-valuemax="100" style="width: 40%;">
                                                40% 完成
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>

                    </div>
                    <!-- 可视化 -->
                    <div class="row">
                        <div class="col-lg-6">
                            <!-- 线图 -->
                            <div class="line-chart-example card">
                                <div class="card-close">
                                    <div class="dropdown">
                                        <button type="button" id="closeCard1" data-toggle="dropdown"
                                                aria-haspopup="true" aria-expanded="false" class="dropdown-toggle"><i
                                                    class="fa fa-ellipsis-v"></i>
                                        </button>
                                        <div aria-labelledby="closeCard1"
                                             class="dropdown-menu dropdown-menu-right has-shadow">
                                            <a href="#" class="dropdown-item remove"> <i
                                                        class="fa fa-times"></i>Close</a><a href="#"
                                                                                            class="dropdown-item edit">
                                                <i class="fa fa-gear"></i>Edit</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-header d-flex align-items-center">
                                    <h3 class="h4">各学期绩点走势</h3>
                                </div>
                                <div class="card-body">
                                    <div class="chartjs-size-monitor"
                                         style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
                                        <div class="chartjs-size-monitor-expand"
                                             style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
                                            <div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div>
                                        </div>
                                        <div class="chartjs-size-monitor-shrink"
                                             style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
                                            <div style="position:absolute;width:200%;height:200%;left:0; top:0"></div>
                                        </div>
                                    </div>
                                    <canvas id="gpaTrend" width="642" height="321"
                                            class="chartjs-render-monitor"
                                            style="display: block; width: 642px; height: 321px;"></canvas>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <!-- 饼图 -->
                            <div class="pie-chart-example card">
                                <div class="card-close">
                                    <div class="dropdown">
                                        <button type="button" id="closeCard7" data-toggle="dropdown"
                                                aria-haspopup="true" aria-expanded="false" class="dropdown-toggle"><i
                                                    class="fa fa-ellipsis-v"></i>
                                        </button>
                                        <div aria-labelledby="closeCard7"
                                             class="dropdown-menu dropdown-menu-right has-shadow">
                                            <a href="#" class="dropdown-item remove"> <i
                                                        class="fa fa-times"></i>Close</a><a href="#"
                                                                                            class="dropdown-item edit">
                                                <i class="fa fa-gear"></i>Edit</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-header d-flex align-items-center">
                                    <h3 class="h4">成绩分布</h3>
                                </div>
                                <div class="card-body">
                                    <div class="chartjs-size-monitor"
                                         style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
                                        <div class="chartjs-size-monitor-expand"
                                             style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
                                            <div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div>
                                        </div>
                                        <div class="chartjs-size-monitor-shrink"
                                             style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
                                            <div style="position:absolute;width:200%;height:200%;left:0; top:0"></div>
                                        </div>
                                    </div>
                                    <canvas id="scoreDistribute" width="350" height="340"
                                            class="chartjs-render-monitor"
                                            style="display: block; width: 350px; height: 340px;"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script>
        function exportExcel() {
            $("#table").table2excel({
                // 不被导出的表格行的CSS class类
                exclude: ".noExl",
                // 导出的Excel文档的名称
                name: "Excel Document Name",
                // Excel文件的名称
                filename: "test",
                //文件后缀名
                fileext: ".xls",
                //是否排除导出图片
                exclude_img: false,
                //是否排除导出超链接
                exclude_links: false,
                //是否排除导出输入框中的内容
                exclude_inputs: false
            })
        }
    </script>
</@student>
