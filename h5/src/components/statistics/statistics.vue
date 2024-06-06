<!-- Created by chunmingdeng on 2017/9/4 -->
<template>
    <div class="mui-content mui-scroll-wrapper">
        <Loading v-show="ifLoading"></Loading>
        <div class="mui-scroll">
            <section id="short-message-container">
                <div id="title" class="lh34 fs18 fw600 vertical-line">
                    统计查询
                </div>
                <div class="mart15">
                    <!--<div class="clearfix">-->
                        <!--<div class="mui-input-row mui-radio mui-left fl" style="width: 50%" @click="changeTimeType(1)">-->
                            <!--<label>日</label>-->
                            <!--<input name="timeType" type="radio" :checked='timeType==1?"checked":""'>-->
                        <!--</div>-->
                        <!--<div class="mui-input-row mui-radio mui-left fl" style="width: 50%" @click="changeTimeType(2)">-->
                            <!--<label>月</label>-->
                            <!--<input name="timeType" type="radio" :checked='timeType==2?"checked":""'>-->
                        <!--</div>-->
                    <!--</div>-->
                    <div class="mart15 tac">
                        <span class="time-input">
                            <input type="text" @tap="chooseStartDate()" placeholder="选择开始时间" id="choose-start-date" :value="choosedStartDate">
                            <i class="iconfont icon-shijian time-input-icon"></i>
                        </span>
                        <span>-</span>
                        <span class="time-input">
                            <input type="text" @tap="chooseEndDate()" placeholder="选择结束时间" id="choose-end-date" :value="choosedEndDate">
                            <i class="iconfont icon-shijian time-input-icon"></i>
                        </span>
                        <button type="button" class="mui-btn mui-btn-primary" style="height: 40px;margin-left: 15px" @tap="sub()">查询</button>
                    </div>
                </div>
                <div class="mart15">
                    <div style="width: 100%;height: 250px;" id="main">

                    </div>
                </div>
                <!--<div class="mart15 tac">-->
                    <!--<button type="button" class="mui-btn">取消</button>-->
                    <!--<button type="button" class="mui-btn mui-btn-primary" @tap="sub()">确认提交</button>-->
                <!--</div>-->
            </section>
        </div>
    </div>
</template>

<script>
    import mui from "mui"
    import {dateFormat} from "../../golbal/global"
    import Loading from "../common/loading.vue"
    let echarts = require("echarts")

    Date.prototype.Format = function(fmt) { //author: meizz
        var o = {
            "M+" : this.getMonth()+1,                 //月份
            "d+" : this.getDate(),                    //日
            "h+" : this.getHours(),                   //小时
            "m+" : this.getMinutes(),                 //分
            "s+" : this.getSeconds(),                 //秒
            "q+" : Math.floor((this.getMonth()+3)/3), //季度
            "S"  : this.getMilliseconds()             //毫秒
        };
        if(/(y+)/.test(fmt))
            fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
        for(var k in o)
            if(new RegExp("("+ k +")").test(fmt))
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
        return fmt;
    }
    let now = new Date().Format("yyyy-MM-dd");

    export default {
        data: function () {
            return {
                ifLoading:true,
                choosedStartDate:"",
                choosedEndDate:"",
                timeType:1
            }
        },
        mounted () {
            this.choosedStartDate = now;
            this.choosedEndDate = now;
            mui.ready(function() {
                $('.mui-scroll').css({transform: "translate3d(0px, 0px, 0px)"});
            });

            //默认查询一次
            this.sub();

        },
        methods:{
            changeTimeType(type){
                this.timeType = type;
            },
            chooseStartDate(){
                let _this = this
                var dtpicker = new mui.DtPicker({
                    type: "date",//
                    beginYear: 1900,//设置开始日期
                    endYear: 2100,//设置结束日期
                    labels: ['年', '月', '日'],//设置默认标签区域提示语
                    value:_this.choosedStartDate
                });
                dtpicker.show(function(e) {
                    let orgTime = _this.choosedStartDate;
                    _this.choosedStartDate = e.value;
                    let st = new Date(_this.choosedStartDate).getTime();
                    let et = new Date(_this.choosedEndDate).getTime();
                    if(st>et){
                        mui.alert("开始时间必须小于结束时间！");
                        _this.choosedStartDate = orgTime;
                    }
                })
            },
            chooseEndDate(){
                let _this = this
                var dtpicker = new mui.DtPicker({
                    type: "date",//
                    beginYear: 1900,//设置开始日期
                    endYear: 2100,//设置结束日期
                    labels: ['年', '月', '日'],//设置默认标签区域提示语
                    value:_this.choosedEndDate
                })
                dtpicker.show(function(e) {
                    let orgTime = _this.choosedEndDate;
                    _this.choosedEndDate = e.value;
                    let st = new Date(_this.choosedStartDate).getTime();
                    let et = new Date(_this.choosedEndDate).getTime();
                    if(st>et){
                        mui.alert("结束时间必须小于开始时间！");
                        _this.choosedEndDate = orgTime;
                    }
                })
            },
            sub(){
                let _this = this;
                _this.ifLoading = true;
                this.$axios.get(
                        "/task/app/spTaskDateList.html?&JSESSIONID="+window.sessionStorage.getItem("JSESSIONID")+
                                "&createTime="+_this.choosedStartDate+"&createTime1="+this.choosedEndDate
                ).then(function (res) {
                    _this.ifLoading = false;
                    if(res.data.returnCode==200){
                        let arr = [];
                        arr.push(res.data.taskcount.arrive_succ);
                        arr.push(res.data.taskcount.arrive_fail);
                        _this.getStatics(arr)
                    }else{
                        mui.alert(res.data.msg);
                    }
                }).catch(function (err) {
                    _this.ifLoading = false;
                })
            },
            getStatics(arr){
                // 基于准备好的dom，初始化echarts实例
                var myChart = echarts.init(document.getElementById('main'));

                // 指定图表的配置项和数据
                var option = {
                    title : {
                        text: '',
                        subtext: '',
                        x:'center'
                    },
                    tooltip : {
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    },
                    legend: {
                        orient: 'vertical',
                        left: 'left',
                        data: ['成功条数','失败条数']
                    },
                    series : [
                        {
                            name: '',
                            type: 'pie',
                            radius : '55%',
                            center: ['50%', '50%'],
                            data:[
                                {value:arr[0], name:'成功条数'},
                                {value:arr[1], name:'失败条数'}
                            ],
                            itemStyle: {
                                emphasis: {
                                    shadowBlur: 10,
                                    shadowOffsetX: 0,
                                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                                }
                            }
                        }
                    ]
                };

                // 使用刚指定的配置项和数据显示图表。
                myChart.setOption(option);
            }
        },
        components:{
            Loading
        }
    }
</script>

<style>
    section{
        padding: 15px;
    }
    #choose-start-date,#choose-end-date{
        display: inline-block;
        width:130px;
        border:1px solid #a9a9a9;
        border-radius: 4px;
    }

</style>