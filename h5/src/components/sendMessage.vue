<!-- Created by chunmingdeng on 2017/9/3 -->
<template>
    <div id="refreshContainer" class="mui-content mui-scroll-wrapper">
        <Loading v-show="ifLoading"></Loading>
        <div class="mui-scroll">
            <div class="lh34 tac">
                <span class="iconfont icon-bell marr15"></span>
                <span>待审核：<span class="color-ff6600">{{waitingAuditingCount}}</span>条</span>
            </div>
            <header>
                <img :src=banner alt="">
            </header>
            <section class="container">
                <ul id="fun-list" class="clearfix marb15">
                    <li>
                        <router-link to="/home/shortMessage">
                            <div class="radius-circle item-center marb15 mart15" :style="{height:'40px',width:'40px',
                            background:'url('+png+')',backgroundSize:'375px auto',backgroundPosition:'-40px -64px'}"></div>
                            <div>短信发送</div>
                        </router-link>
                    </li>
                    <li v-show='!isSp'>
                        <router-link to="/home/msAuditing">
                            <div class="radius-circle item-center marb15 mart15" :style="{height:'40px',width:'40px',
                            background:'url('+png+')',backgroundSize:'375px auto',backgroundPosition:'-174px -64px'}"></div>
                            <div>信息审核</div>
                        </router-link>
                    </li>
                    <li>
                        <router-link to="/home/statistics">
                            <div class="radius-circle item-center marb15 mart15" :style="{height:'40px',width:'40px',
                            background:'url('+png+')',backgroundSize:'375px auto',backgroundPosition:'-106px -64px'}"></div>
                            <div>发送统计</div>
                        </router-link>
                    </li>
                </ul>

                <div class="fs14 fw600">最近一周发送</div>

                <ul id="lately-week-send-list" class="mart15">
                    <li @tap='hrefTo'>
                        <img :src=staticIMg alt="" class="list-img">
                        <div>
                            <div class="lh34">已发送：{{hasSend}}条</div>
                            <div class="lh34">发送人数：{{hasSendPeopleCount}}条</div>
                        </div>
                    </li>
                </ul>
            </section>
        </div>
    </div>
</template>

<script>
    import banner from "../img/header-banner.png"
    import headerIcon from "../img/headerIcon.png"
    import staticIMg from "../img/staticIMg.png"
    import png from "../img/PNG.jpg"
    import Loading from "./common/loading.vue"
    import mui from "mui"
    export default {
        data:function () {
            return{
                ifLoading:true,
                banner:banner,
                hasSend:0,
                hasSendPeopleCount:0,
                waitingAuditingCount:0,
                isSp:true,
                png:png,
                staticIMg:staticIMg
            }
        },

        mounted(){
//            console.log(window.sessionStorage.getItem("JSESSIONID"));
            this.$nextTick(function () {
                let _this = this;
                setTimeout(function () {
                    /**
                     * 获取最近一周发送信息*/
                    _this.ifLoading = true;
                    _this.$axios.get(
                            "/task/app/spTaskWeekList.html?JSESSIONID="+window.sessionStorage.getItem("JSESSIONID")
                    ).then(function (res) {
                        _this.ifLoading = false;
                        if(res.data.returnCode==200){
                            _this.hasSend = res.data.taskcount.total;
                            _this.hasSendPeopleCount = res.data.taskcount.allnumber;
                        }else{
                            mui.alert(res.data.msg);
                        }

                    }).catch(function (err) {
                        _this.ifLoading = false;
                    })
                    //isSp 为1表示企业登录   为0表示管理员登陆。
                    var isSp = window.sessionStorage.getItem("isSp")
                    _this.isSp = isSp==1?true: false;
                    /**
                     * 获取待审核数据*/
                    _this.ifLoading = true;
                    _this.$axios.get(
                            "/auditMaster/app/getAuditResultNoSendSize.html?JSESSIONID="+window.sessionStorage.getItem("JSESSIONID")
                    ).then(function (res) {
                        _this.ifLoading = false;
                        if(res.data.returnCode==200){
                            _this.waitingAuditingCount = res.data.auditResultSize;
                        }else{
                            mui.alert(res.data.msg);
                        }

                    }).catch(function (err) {
                        _this.ifLoading = false;
                    })
                },1000)
                mui('.mui-off-canvas-wrap').offCanvas('off');
                let options = {
                    scrollY: true, //是否竖向滚动
                    scrollX: false, //是否横向滚动
                    startX: 0, //初始化时滚动至x
                    startY: 0, //初始化时滚动至y
                    indicators: true, //是否显示滚动条
                    deceleration:0.0006, //阻尼系数,系数越小滑动越灵敏
                    bounce: true //是否启用回弹
                }
                mui('.mui-scroll-wrapper').scroll(options);

            })
        },
        methods:{
            hrefTo() {
                this.$router.push({path:"/home/sendRecord"})
            }
        },
        components:{
            Loading
        }
    }
</script>

<style>
    @import "../golbal/global.css";
    .container{
        padding: 15px;
    }
    #fun-list{
        box-sizing: border-box;
    }
    #fun-list li{
        width: 33%;
        text-align: center;
        float: left;
    }
    #lately-week-send-list li{
        padding-left: 115px;
        position: relative;
    }
    #lately-week-send-list .list-img{
        position: absolute;
        top:0;
        left: 0;
        display: block;
        width: 100px;
        height: 75px;
    }

</style>