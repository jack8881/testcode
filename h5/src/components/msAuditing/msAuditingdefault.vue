<template>
    <div id="refreshContainer" class="mui-content mui-scroll-wrapper">
        <div class="mui-scroll">
            <div class='msAuditingdefault'>
                <div class="lh34 fs18 fw600 vertical-line msAuditing-title">
                    短信审核
                </div>
                <div class='default'>
                    <i class='iconfont icon-cha'></i>
                    <span>审核不通过</span>
                </div>
                <router-link to='/home/msAuditing'><button class='aud-return'>返回</button></router-link>
            </div>
        </div>
    </div>
</template>
<script>
    export default {
        mounted(){
            mui.ready(function() {
                $('.mui-scroll').css({transform: "translate3d(0px, 0px, 0px)"});
            })
            this.$nextTick(function () {
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

                mui.init({
                    pullRefresh : {
                        container:"#refreshContainer",
                        up : {
                            height:100,
                            auto: false,
                            contentrefresh : "正在加载...",
                            contentnomore:'没有更多数据了',
                            callback :function(){

                            }
                        }
                    }

                })
            })
        }
    }
</script>
<style>
    @import '../../golbal/global.css';
    @import '../../../static/svgIcon/iconfont.css';
    p {
        padding: 0;
        margin: 0;
    }
    .msAuditingdefault {
        padding: 15px;
        text-align: center;
    }
    .msAuditing-title {
        border-bottom: 1px solid #ccc;
        text-align: left;
    }

    .msAuditing-title i {
        display: block;
        width: 3px;
        height: 20px;
        background-color: #6699cc;
        position: absolute;
        top: 35px;
        left: 10px;
    }
    .default {
        padding-top: 100px;
        text-align: center;
        font-size: 18px;
        color: red;
    }
    .msAuditingdefault .default i {
        width: 30px;
        height: 30px;
        font-size: 30px;
        margin-right: 40px;
        vertical-align: middle;
        color: red;
    }
    .aud-return {
        width: 100px;
        height: 35px;
        text-align: center;
        background-color: #6699cc;
        color:#fff;
        margin-top: 50px;
    }
</style>