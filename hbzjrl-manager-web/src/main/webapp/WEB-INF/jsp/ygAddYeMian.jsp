<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>张杰人力内部后台</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <script type="text/javascript" src="https://cdn.staticfile.org/jquery/3.6.0/jquery.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/stvle.css">
    <link href="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/js/bootstrap.bundle.min.js"></script>
</head>
<script>
    $(document).ready(function () {
        var time = new Date();
        var day = ("0" + (time.getDate() + 1)).slice(-2);
        var day1 = ("0" + time.getDate()).slice(-2);
        var month = ("0" + (time.getMonth() + 1)).slice(-2);
        var today = time.getFullYear() + "-" + (month) + "-" + (day);
        if (today==time.getFullYear()+'-01-32'){
            today=time.getFullYear()+'-02-01'
        }else if (time.getFullYear() % 4==0&&today==time.getFullYear()+'-02-30'){
            today=time.getFullYear()+'-03-01'
        } else if (time.getFullYear() % 4==1&&today==time.getFullYear()+'-02-29'){
            today=time.getFullYear()+'-03-01'
        }else if (today==time.getFullYear()+'-03-32'){
            today=time.getFullYear()+'-04-01'
        }else if (today==time.getFullYear()+'-04-31'){
            today=time.getFullYear()+'-05-01'
        }else if (today==time.getFullYear()+'-05-32'){
            today=time.getFullYear()+'-06-01'
        }else if (today==time.getFullYear()+'-06-31'){
            today=time.getFullYear()+'-07-01'
        }else if (today==time.getFullYear()+'-07-32'){
            today=time.getFullYear()+'-08-01'
        }else if (today==time.getFullYear()+'-08-32'){
            today=time.getFullYear()+'-09-01'
        }else if (today==time.getFullYear()+'-09-31'){
            today=time.getFullYear()+'-10-01'
        }else if (today==time.getFullYear()+'-10-32'){
            today=time.getFullYear()+'-11-01'
        }else if (today==time.getFullYear()+'-11-31'){
            today=time.getFullYear()+'-12-01'
        }else if (today==time.getFullYear()+'-12-32'){
            today=(today==(time.getFullYear()+1)+'-01-01')
        }
        $('#goTime').val(today);
        var createTimeToday = time.getFullYear() + "-" + (month) + "-" + (day1);
        $('#createTime').val(createTimeToday);
    });
</script>
<script type="text/javascript">
    $(function () {
        //图片被点击后拉起文件选择框
        $('#imgBtn').click(function () {
            $('#currImg').click();
        });
        //选取文件后回显当前显示图片
        $('#currImg').change(function (e) {
            //当前选择的文件
            var currImg = e.target.files[0];
            //生成一个图片路径(使用URL.createObjectURL将选择的图片生成一个路径)
            var imgSrc = URL.createObjectURL(currImg);
            //更换原图片路径，回显图片
            $('#imgBtn').attr('src', imgSrc);
        });
    })
    function coursePptChange(){
        var MyTest = document.getElementById("file").files[0];
        var reader = new FileReader();
        reader.readAsDataURL(MyTest);
        reader.onload = function(theFile) {
            var image = new Image();
            image.src = theFile.target.result;
            image.onload = function(){
                if(this.width > 2208 || this.height >1242){
                    $.messager.alert("系统提示信息","ppt图片的最大宽度为 2208 像素，最大高度为 1242 像素！","info");
                    $("#file").val("");
                    return false;
                }
            };
        };
    }
</script>
<body>
<nav class="menu-wrap">
    <div class="menu">
        <ul>
            <li>
                <a href="${pageContext.request.contextPath}/ygShowAll">
                    <i class="fa fa-home fa-lg"></i>
                    <span class="nav-text">首页</span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/">
                    <i class="fa fa-user fa-lg"></i>
                    <span class="nav-text">财务</span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/">
                    <i class="fa fa-envelope-o fa-lg"></i>
                    <span class="nav-text">待定</span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/">
                    <i class="fa fa-heart-o fa-lg"></i>
                    <span class="nav-text">待定</span>
                </a>
            </li>
            <li></li>
            <li></li>
            <li>
                <span class="nav-text"><h1>共${count}人</h1></span>
            </li>
            <%-- 吗不够再加li--%>
        </ul>
    </div>
</nav>
<header>
    <div class="px-3 py-2 border-bottom mb-3">
        <div>
           <span style="float: right">
               <button onClick="window.location.href='${pageContext.request.contextPath}/tiaoZhuanYgAddShouDong'"
                       class="btn btn-primary">手动添加员工信息</button>
           </span>
        </div>
    </div>
</header>
<style type="text/css">
    body {
        background: #ced4da;
    }
    * {
        margin: 0;
        padding: 0;
    }
    div.add {
        /*width: 100px;*/
        /*height: 100px;*/
        position: fixed;
        top: 6%;
        left: 60%;
    }
    div.addHuiXian {
        position: fixed;
        top: 6%;
        left: 20%;
    }
    /*模态框利用轮播,添加半透明遮罩层*/
    .modal{
        position: absolute;
        background: rgba(0,0,0,0.0);
    }
</style>

<form action="${pageContext.request.contextPath}/addYgTuPian" method="post" enctype="multipart/form-data">
    <div class="addHuiXian">
        <!-- 文件选择框 默认关闭 点击图片后调出 -->
        <input type="file" name="file" id="currImg" οnchange="coursePptChange()"  accept="image/jpeg, image/png, image/jpg" style="display: none;"/>
    </div>
    <div class="add">

        <table class="table table-hover">
            <thead>
            <tr>
                <th>身份证添加员工</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td colspan="2">
                    <div class="addHuiXian">
                        <!-- 把图片当作按钮，点击后调出文件选择框 -->
                        <img id="imgBtn"   src="${pageContext.request.contextPath}" width="500px" height="auto"  style="margin-top:1vh; background: blue">
                    </div>

                </td>
            </tr>
            <tr>
                <td>渠道</td>
                <td><input name="whereHome"   value="张杰人力"/></td>
            </tr>
            <tr>
                <td>手机</td>
                <td><input name="phone"    placeholder="手机号"/></td>
            </tr>
            <%-- 默认取第二天的值--%>
            <tr>
                <td>出发日期</td>
                <td>
                    <input name="goTime" id="goTime"  type="date"/>
                </td>
            </tr>
            <tr>
                <td>企业</td>
                <td><input name="factory" placeholder="工厂名字" required/></td>
            </tr>
            <tr>
                <td>合同日期</td>
                <td>
                    <select name="workTime">
                        <option value="长期">长期</option>
                        <option value="1个月">1个月</option>
                        <option value="2个月">2个月</option>
                        <option selected="selected" value="3个月">3个月</option>
                        <option value="6个月">6个月</option>
                        <option value="15天">15天</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>发车</td>
                <td><input name="byCar"   value="自发车"/></td>
            </tr>
            <tr>
                <td>发车补助</td>
                <td><input name="workerCarPrice"    value="0.0"/></td>
            </tr>
            <tr>
                <td>员工单价</td>
                <td><input name="workerPrice"    placeholder="员工单价"/></td>
            </tr>
            <tr>
                <td>员工备注</td>
                <td><input name="wokerRemarks"    value="无"/></td>
            </tr>
            <tr>
                <td>代理</td>
                <td><input name="whose"    placeholder="哪个代理" value="直招"/></td>
            </tr>
            <tr>
                <td>代理单价</td>
                <td><input name="whosePrice"    placeholder="代理单价/总利润"/></td>
            </tr>
            <tr>
                <td>代理备注</td>
                <td><input name="whoseRemarks"   value="无"/></td>
            </tr>
            <tr>
                <td>总价</td>
                <td><input name="totalPrice"  placeholder="输入总价/总利润"/></td>
            </tr>
            <tr>
                <td>登记时间</td>
                <td><input id="createTime" name="createTime" type="date"/></td>
            </tr>
            </tbody>

            <tfoot>
            <th>
                <button type="reset" id="reset" class="btn  btn-danger" style="float: left">重写</button>
            </th>
            <th>
                <button type="submit" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#myModal" style="float:right">
                    提交
                </button>
            </th>
            </tfoot>
        </table>
        <!-- 模态框利用轮播,添加半透明遮罩层 -->
        <div class="modal fade" id="myModal">
            <div class="modal-dialog modal-fullscreen">
                <div id="demo" class="carousel slide" data-bs-ride="carousel">
                    <div class="spinner-grow text-muted"></div>
                    <div class="spinner-grow text-primary"></div>
                    <div class="spinner-grow text-success"></div>
                    <div class="spinner-grow text-info"></div>
                    <div class="spinner-grow text-warning"></div>
                    <div class="spinner-grow text-danger"></div>
                    <div class="spinner-grow text-secondary"></div>
                    <div class="spinner-grow text-dark"></div>
                    <div class="spinner-grow text-light"></div>
                </div>
            </div>
        </div>
    </div>
</form>
</body>
</html>