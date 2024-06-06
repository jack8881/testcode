<template>
    <div id="refreshContainer" class="mui-content mui-scroll-wrapper">
        <Loading v-show='ifLoading'></Loading>
        <div class="mui-scroll">
            <div class='sendRecord'>
                <div class="sendRecord-search">
                    <input type="text" placeholder='请输入要查询的关键字'>
                    <i class='iconfont icon-sousuo'></i>
                </div>
                <div class="sendRecord-main">
                    <h3>发送记录</h3>
                    <ul class="sendRecord-content">
                        <li v-for='item in sendmsgList'>
                            <div class="content-top clearfix">
                                <div class="sendTime fl">
                                    <!--createTime-->
                                    <p>{{item.createTime}}</p>
                                </div>
                                <span class="sendCount">
                                    {{item.allnumber}}人/{{item.total}}条
                                 </span>
                                <div class="sendStatus fr">
                                    <span v-show='item.status == 0' class='red'>待发送</span>
                                    <span v-show='item.status == 1' class='red'>待审核</span>
                                    <span v-show='item.status == 2' class='red'>发送失败</span>
                                    <span v-show='item.status == 4' class='green'>发送成功</span>
                                    <span v-show='item.status == 12' class='blue'>未确认</span>
                                </div>
                            </div>
                            <!--content-->
                            <div class="send-contentMsg">{{item.content}}</div>
                        </li>
                    </ul>
                    <div class="sendAll clearfix">
                        <span class='fl'>共{{sendAll}}条</span>
                        <div class="sendChange fr">
                            <button @click="prev" class="border-none">上一页</button>
                            <button @click="next" class="border-none">下一页</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
    import Loading from '../common/loading.vue'
    import '../../golbal/global.css'
    var result = ''
    export default {
        data() {
            return {
                sendAll: 34,
                sendmsgList:[],
                page: 1,
                ifLoading: true
            }
        },
        mounted(){
          /*  mui.ready(function() {
                $('.mui-scroll').css({transform: "translate3d(0px, 0px, 0px)"});
            })*/
            this.init();
            let that = this
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
            })
        },
        methods:{
            init() {
                let that = this;
                let JSESSIONID = window.sessionStorage.getItem('JSESSIONID')
                that.ifLoading = true
                that.$axios({
                    method: 'get',
                    url: '/task/app/spTaskListInfo.html?JSESSIONID='+JSESSIONID+'&page.currentPage='+that.page,
                }).then(function (res) {
                    console.log(res)
                    that.sendmsgList = res.data.taskList
                    that.sendAll = res.data.taskInfo.page.totalResult;
//                    console.log(that.sendmsgList);
                    $.each(that.sendmsgList,function (i,v) {
                        v.createTime = v.createTime.split('.')[0]
                    })
                    result = res.data.taskList.length
                    that.ifLoading = false
                }).catch(function () {
                    that.ifLoading = false
                })
            },
            prev() {
                if (this.page <= 1) {
                    mui.toast('已经是第一页啦')
                    this.page = 1;
                    return;
                }  else {
                    this.page--
                    this.init();
                }
            },
            next() {
                if (this.sendmsgList.length < 5) {
                    mui.toast('已经是最后一页啦')
                    return;
                } else {
                    this.page++;
                    this.init()
                }
            }
        },
        components:{
            Loading
        }
    }
</script>
<style>
@import '../../golbal/global.css';
@import '../../../static/svgIcon/iconfont.css';
h3, p {
    padding: 0;
    margin: 0;
}
.sendRecord {
    padding: 15px;
}
    .sendRecord-search{

    }
    .sendRecord-search input {
        width: 80%;
        border: 1px solid #ccc;
        border-radius: 10px;
        height: 35px;
        margin-right: 10px;
    }
    .sendRecord-search i {
        font-size: 20px;
        width: 30px;
        height: 30px;
        line-height: 30px;
        text-align: center;
        display: inline-block;
        border: 1px solid #ccc;
        vertical-align: middle;
        border-radius: 50%;
        background-color: #999;
        color: #fff;
    }
    .sendRecord-main {
        margin-top: 20px;
    }
    .sendRecord-main h3 {
        font-size: 16px;
        border-bottom: 1px solid #ccc;
        line-height: 35px;
        height: 35px;
    }
    .sendRecord-content li {
        padding: 10px;
        border-bottom: 1px solid #ccc;
    }
    .content-top {
        font-size: 14px;
        color: #8f8f94;
        text-align: center;
    }
    .red {
        color:red;
    }
    .blue {
        color: blue;
    }
    .sendAll {
        margin-top: 30px;
    }
    .sendChange {
        color:blue;
    }
    .sendChange span:first-of-type {
        margin-right: 20px;
    }
    .sendChange button {
        background-color: rgb(102,153,204);
        color: #fff;
        border: 0;
    }
    .sendStatus span {
        font-size: 12px;
    }
    .green {
        color: green;
    }
</style>