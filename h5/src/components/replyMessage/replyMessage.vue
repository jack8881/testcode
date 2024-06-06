<template>
    <div id="refreshContainer" class="mui-content mui-scroll-wrapper">
    <Loading v-show='ifLoading'></Loading>
    <div class="mui-scroll">
    <div class='replyMessage'>
        <div class="replyMessage-search">
            <input type="text" placeholder='请输入要查询的关键字'>
            <i class='iconfont icon-sousuo'></i>
        </div>
        <div class="replyMessage-main">
            <h3>短信回复</h3>
            <ul class="replyMessage-content">
                <li v-for='item in replymsgList'>
                    <div class="content-top clearfix">
                        <div class="replyTime fl">
                            {{item.mobile}}
                        </div>
                       <!-- <span class="replyCount">
                           {{item.mobile}}
                        </span>-->
                        <div class="replyStatus fr">
                            <p>{{item.createtime}}</p>
                        </div>
                    </div>
                    <div class="reply-contentMsg">{{item.content}}</div>
                </li>
            </ul>
            <div class="replyAll">
                <span class='fl'>共{{replyAll}}条</span>
                <div class="replyChange fr">
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
    var result = '';
    export default {
        data() {
            return {
                replyAll: 34,
                replymsgList:[],
                page: 1,
                ifLoading: true
            }
        },
        mounted(){
           /* mui.ready(function() {
                $('.mui-scroll').css({transform: "translate3d(0px, 0px, 0px)"});
            }),*/
             this.init()
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
                    url: '/sendSms/app/replyAppList.html?JSESSIONID='+JSESSIONID+'&page.currentPage='+that.page,
                }).then(function (res) {
//                    console.log(res)
//                    console.log(res.data.replyList.length);
                    that.replymsgList = res.data.replyList
//                    console.log(that.replymsgList.length);
                    that.replyAll = res.data.smsReplyRecord.page.totalResult
                    $.each(that.replymsgList,function (i,v) {
                        v.createtime = v.createtime.split('.')[0]
                    })
//                    console.log(res.data.replyList.length);
                    result = res.data.replyList.length
                    console.log(result)
                    that.ifLoading = false
                })
            },
            prev() {
                if (this.page <= 1) {
                    mui.toast('已经是第一页啦')
                    this.page = 1;
                }  else {
                    this.page--
                    this.init();
                }
            },
            next() {
                 if (this.replymsgList.length < 5) {
                    mui.toast('已经是最后一页啦')
                    return;
                }
                this.page++;
                this.init()
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
    .replyMessage {
        padding: 15px;
    }
    .replyMessage-search{

    }
    .replyMessage-search input {
        width: 80%;
        border: 1px solid #ccc;
        border-radius: 10px;
        height: 35px;
        margin-right: 10px;
    }
    .replyMessage-search i {
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
    .replyMessage-main {
        margin-top: 20px;
    }
    .replyMessage-main h3 {
        font-size: 16px;
        border-bottom: 1px solid #ccc;
        line-height: 35px;
        height: 35px;
    }
    .replyMessage-content li {
        padding: 10px;
        border-bottom: 1px solid #ccc;
    }
    .content-top {
        font-size: 14px;
        color: #8f8f94;
        text-align: center;
    }
    .replyAll {
        margin-top: 30px;
    }
    .replyChange {
        color:blue;
    }
    .replyChange button {
        background-color: rgb(102,153,204);
        color: #fff;
    }

</style>
