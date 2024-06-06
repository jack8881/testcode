<template>
    <div id="refreshContainer" class="mui-content mui-scroll-wrapper">
        <Loading v-show='ifLoading'></Loading>
        <div class="mui-scroll">
        <div class='msAuditing'>
        <div class="lh34 fs18 fw600 vertical-line msAuditing-title">
            短信审核
        </div>
        <ul class='msAuditing-content'>
            <li class='clearfix' v-for='(item,index) in audiMessage' @tap='hrefTo(index)'>
                <i class='iconfont icon-xiaoxi'></i>
                <p class='ms-con-message'>
                    {{item.content}}
                    <!--{{item.content}}-->
                </p>
                <div class='ms-con-source fl'>
                    <p>{{item.sp_name}}</p>
                    <!--item.sp_id-->
                    <p><span class='red'>{{item.allnumber}}</span>人/<span class='red'>{{item.total}}</span>条</p>
                </div>
                <b class='iconfont icon-weibiaoti-'></b>
            </li>
        </ul>
    </div>
    </div>
    </div>
</template>
<script>
    import Loading from '../common/loading.vue'
    var result = ''
    export default {
        data() {
            return {
                page: 1,
                audiMessage:[],
                ifLoading: false
            }
        },
        mounted(){
           /* mui.ready(function() {
                $('.mui-scroll').css({transform: "translate3d(0px, 0px, 0px)"});
            })*/
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

                mui.init({
                    pullRefresh : {
                        container:"#refreshContainer",
                        up : {
                            height:100,
                            auto: false,
                            contentrefresh : "正在加载...",
                            contentnomore:'没有更多数据了',
                            callback :function(){
                                that.page++;
                                console.log(that.page);
                                that.init()
                                console.log(result);
                                if (result !== 0) {
                                    $(".mui-pull-bottom-pocket").removeClass("mui-block");
                                    mui('#refreshContainer').pullRefresh().endPullupToRefresh(true);
                                    mui('#refreshContainer').pullRefresh().refresh(true);
                                } else {
                                    $(".mui-pull-bottom-pocket").removeClass("mui-block");
                                    mui('#refreshContainer').pullRefresh().endPullupToRefresh(true);
                                }
                            }
                        }
                    }

                })
            })
            that.init()
        },
        methods:{
            hrefTo(index) {
//                console.log(this.audiMessage[index].task_id)
                this.$router.push({path: '/home/msAuditingIng',query:{'task_id': this.audiMessage[index].dynamicdata}})
            },
            init() {
                let that = this
                let JSESSIONID = window.sessionStorage.getItem('JSESSIONID')
                that.ifLoading = true
                that.$axios({
                    method: 'get',
                    url: '/auditTask/app/AuditTaskList.html?JSESSIONID=' + JSESSIONID + '&page.currentPage='+that.page,
                }).then(function (res) {
                    console.log(res)
                   if(res.data.returnCode == 200) {
                       that.audiMessage = res.data.auditTaskList;
                   }
                    result = res.data.auditTaskList.length
//                
                    that.ifLoading = false
                })
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
    p {
        padding: 0;
        margin: 0;
    }
    .msAuditing {
        padding: 15px;
    }
    .msAuditing-title {
        border-bottom: 1px solid #ccc;

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
    .msAuditing-content {
    }
    .msAuditing-content li {
        border-bottom: 1px solid #ccc;
        position: relative;
        padding: 10px 0;
    }
    .msAuditing-content i {
        width: 24px;
        height: 24px;
        display: inline-block;
        position: absolute;
        font-size: 24px;
        vertical-align: middle;
        top: 50%;
        margin-top: -12px;
    }
    .ms-con-message {
        float: left;
        width: 35%;
        margin-left: 35px;
        margin-right: 15px;
    }
    .ms-con-source {
        width: 35%;
    }
    .msAuditing-content b {
        width: 20px;
        height: 20px;
        font-size: 20px;
        position: absolute;
        top: 50%;
        color: deeppink;
        margin-top: -10px;
        right: 10px;
    }
    .red {
        color: red;
    }
</style>