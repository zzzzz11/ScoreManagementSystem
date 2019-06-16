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
                                </div>
                            </div>
                        </div>
                        <div class="card-header d-flex align-items-center">
                            <h3 class="h4">成绩查询</h3>
                        </div>

                        <!-- 查询表单 -->
                        <form class="form-inline" method="post" action="" style="margin-left:30px;margin-top:20px;">
                            <div class="form-inline" style="margin-right:30px;">
                                <label for="" size="20">培养方案:&#160;&#160;&#160;&#160;</label>
                                <select class="form-control" name="" id="">
                                    <option>主修</option>
                                    <option>辅修</option>
                                    <option>双学位</option>
                                </select>
                            </div>

                            <div class="form-inline" style="margin-right:30px;">
                                <label for="" size="20">课程类型:&#160;&#160;&#160;&#160;</label>
                                <select class="form-control" name="" id="">
                                    <option>专必</option>
                                    <option>公必</option>
                                    <option>专选</option>
                                    <option>公选</option>
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

                            <button type="submit" class="btn btn-primary">查询</button>
                        </form>

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
                                        <th>分数</th>
                                        <th>绩点</th>
                                        <th>排名</th>
                                        <th>学年</th>
                                        <th>学期</th>
                                        <th>考试方式</th>
                                        <th>是否通过</th>
                                    </tr>
                                    </thead>
                                    <tbody id="tbody">
                                    </tbody>
                                </table>
                                <div>
                                    <ul class="pagination" id="pagination" style="justify-content: center"></ul>
                                </div>
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
                                    <canvas id="testLine" width="642" height="321"
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
                                    <h3 class="h4">大学成绩分布图</h3>
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
                                    <canvas id="doughnutChartExample" width="350" height="340"
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
        var page = 1;
        //当前页，默认等于1
        var pageSize = 1;
        var json = ${text};
        var jsonObj = eval(json);

        function loadPagination() {
            var s = "";
            //用于分页标签嵌入
            var minPage = 1;
            //最小页码
            var maxPage = 1;
            //最大页码
            var totalRecord = jsonObj.length;
            var maxPage = totalRecord / pageSize;
//加载上一页
            s += "<li class='page-item' id='prePage'><a class='page-link'>&laquo;</a></li>";


//        加载分页列表
            for (var i = page - 4; i < page + 5; i++) {
                //i代表列表的页数
                if (i >= minPage && i <= maxPage) {
                    if (i == page) {
                        s += " <li class='page-item active'><a class='page-link'>" + i + "</a></li>"
                    } else {
                        s += " <li class='page-item'><a class='page-link'>" + i + "</a></li>";
                    }
                }
            }
            //        加载下一页
            s += "<li class='page-item' id='nextPage'><a class='page-link'>&raquo;</a></li>";
            load();
            $("#pagination").html(s);
            //给列表加上点击事件
            $(".page-item").click(function () {
                //改变当前页数
                //把点击的页数，扔给page（当前页）
                page = $(this).text();
//            page获取了当前页，重新加载以下方法
                //调用load方法
                load();
                //把加载数据封装成一个方法
                loadPagination();
                //加载分页信息方法
            })
            //上一页点击事件
            $("#prePage").click(function () {
                //改变当前页
                if (page > 1) {
                    //如果不是第一页
                    page = parseInt(page) - 1;
                }
                //            page获取了当前页，重新加载以下方法
                //调用load方法
                load();
                //把加载数据封装成一个方法
                loadPagination();
                //加载分页信息方法
            })
            //下一页点击事件
            $("#nextPage").click(function () {
//            alert(maxPage);
                if (page < maxPage) {
                    //如果不是最后一页
                    page = parseInt(page) + 1;
                }
                //            page获取了当前页，重新加载以下方法
                //调用load方法
                load();
                //把加载数据封装成一个方法
                loadPagination();
                //加载分页信息方法
            });
        };
        window.onload = loadPagination;

        function load() {
            //有page传进来
            console.log(jsonObj);
            var str = "";
            for(var i=(page-1)*pageSize;i<(page-1)*pageSize+pageSize;i++){
                let identity=jsonObj[i].identity;
                let isPassed="不及格";
                if(identity=0)
                    isPassed="及格";
                let score=parseFloat(jsonObj[i].value);
                let credit=score/20;
                str=str+"<tr><td>"+jsonObj[i].course.name+"</td>"+"<td>"+jsonObj[i].course.type+"</td>"
                +"<td>"+jsonObj[i].course.teacher.name+"</td>"+"<td>"+jsonObj[i].value+"</td>"
                +"<td>"+credit+"</td>"+"<td></td>" +"<td>"+jsonObj[i].course.year+"</td>" +"<td>"+jsonObj[i].course.term+"</td>"
                +"<td></td>"+"<td>"+isPassed+"</td></tr>"
            }
            console.log(str);
            $("#tbody").html(str);
        }
    </script>
</@student>
