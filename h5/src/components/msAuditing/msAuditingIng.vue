<template>
    <div id="refreshContainer" class="mui-content mui-scroll-wrapper">
        <Loading v-show='ifLoading'></Loading>
    <div class="mui-scroll">
    <div class='msAuditingIng'>
        <div class="lh34 fs18 fw600 vertical-line msAuditing-title">
            短信审核
        </div>
        <div class="msAudtingIng-content">
            <div class="msAudtingPerson">
                <i class='iconfont icon-dingwei'></i>
                <span class='lh34'>审核人： {{auditingIngPerson}}</span>
            </div>
            <div class="msAudtingIngContent clearfix">
                <div class='fl ms-aud-left'>审核内容：</div>
                <div class='fl ms-aud-right'>
                    {{auditingIngContent}}
                </div>
            </div>
            <div class="msAudtingIngSituaton clearfix">
                <div class='fl ms-aud-left'>发送情况：</div>
                <div class='fl ms-aud-right'>
                    <span class='marr15 red'>{{personCount}}人</span> <span class='red'>{{messageCout}}条</span>
                </div>
            </div>
            <div class="msAudtingIngImfo clearfix">
                <div class='fl ms-aud-left'>基本信息：</div>
                <div class='fl ms-aud-right'>
                    <span class='marr15'>{{auditingIngImfo.number}}</span> <span>{{auditingIngImfo.name}}</span>
                </div>
            </div>
            <div class="msAudtingIngReason clearfix">
                <div class='fl ms-aud-left'>备注原因：</div>
                <div class='fl ms-aud-right'>
                    <textarea v-model='auditingIngReason'></textarea>
                </div>
            </div>
        </div>
        <div class="msAudtingIng-submit">
           <button class='msAudtingIngPass' @click='mssuccess'>通过</button>
            <button class='msAudtingIngFail' @click='msdefault'>不通过</button>
        </div>
    </div>
    </div>
    </div>
</template>
<script>
    import Loading from '../common/loading.vue'
    export default {
        data() {
            return {
                auditingIngPerson: 'admin',
                auditingIngContent: '',
                personCount: '',
                messageCout: '',
                auditingIngImfo: {
                    number: '',
                    name: ''
                },
                auditingIngReason: '',
                task_id: '',
                ifLoading: false
            }
        },
        mounted(){
            let that = this;
            that.task_id = that.$route.query.task_id;
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
            that.init()
        },
        methods: {
            init() {
                let JSESSIONID = window.sessionStorage.getItem('JSESSIONID')
                let that = this;
                that.ifLoading = true
                that.$axios({
                    method: 'get',
                    url:'auditTask/app/auditDetail.html?JSESSIONID='+ JSESSIONID +'&task_id=' + that.task_id
                }).then(function (res) {
//                    console.log(res);
                    if(res.data.returnCode == 200) {
                        var data = res.data.taskInfo
                        that.auditingIngContent = data.content
                        that.personCount = data.allnumber
                        that.messageCout = data.total
                        that.auditingIngImfo.number = data.sp_id
                        that.auditingIngImfo.name = data.sp_name
                    }
                    that.ifLoading = false
                })
            },
            mssuccess() {
                let that = this;
                let JSESSIONID = window.sessionStorage.getItem('JSESSIONID')
                that.ifLoading = false
                that.$axios({
                    method: 'get',
                    url: 'auditTask/app/AuditSuccess.html?JSESSIONID='+ JSESSIONID +'&task_id=' + that.task_id
                }).then(function (res) {
                    console.log(res)
                    if( res.data.returnCode == 200) {
                        that.$router.push({path: '/home/msAuditingSuccess'})
                    }
                })
            },
            msdefault() {
                let that = this;
                let JSESSIONID = window.sessionStorage.getItem('JSESSIONID')
                that.$axios({
                    method: 'get',
                    url: 'auditTask/app/toAuditFail.html?JSESSIONID='+ JSESSIONID +'&task_id=' + that.task_id + '&audit_desc=' + that.auditingIngReason
                }).then(function (res) {
                    console.log(res)
                    if( res.data.returnCode == 200) {
                        that.$router.push({path: '/home/msAuditingdefault'})
                    }
                })
            }
        },
        components:{
            Loading
        }
    }
</script>
<style>
    p {
        padding: 0;
        margin: 0;
    }
    .msAuditingIng {
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
    .msAudtingIng-content {
        padding: 20px 15px 0 15px;
        font-size: 14px;
    }
    .msAudtingIng-content > div {
        margin-bottom: 15px;
    }
    .msAudtingPerson i {
        width: 27px;
        height: 35px;
        display: inline-block;
        font-size: 35px;
        vertical-align: middle;
        margin-right: 20px;
    }
    .ms-aud-left {
        width: 30%;
    }
    .ms-aud-right{
        width: 70%;
    }
    .red {
        color: red;
    }
    .msAudtingIngReason textarea {
        width: 100%;
        height: 150px;
        padding: 10px;
    }
    .msAudtingIng-submit {
        text-align: center;
    }
    .msAudtingIng-submit a {
        width: 30%;
        color: #fff;
        display: inline-block;
        margin-right: 20px;
    }
    .msAudtingIng-submit button {
        width: 30%;
        color: #fff;
    }
    .msAudtingIng-submit a button {
        width: 100%;
        color: #fff;
    }
    .msAudtingIngPass {
        margin-right: 20px;
        background-color: #6699cc;
    }
    .msAudtingIngFail {
        background-color: rgb(215,215,215);
    }
</style>