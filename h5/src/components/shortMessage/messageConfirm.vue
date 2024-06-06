<!-- Created by chunmingdeng on 2017/9/4 -->
<template>
    <div class="mui-content mui-scroll-wrapper">
        <Loading v-show="ifLoading"></Loading>
        <div class="mui-scroll" style="padding: 15px">
            <div id="title" class="lh34 fs18 fw600 vertical-line">
                发送确认
            </div>
            <div class="mart15">
                <span class="marr15">过滤<span class="color-ff6600">{{filterPeopleCount}}</span>人</span>
                <div class="color-a9a9a9">（无效号码：<span class="color-ff6600">0</span>人、
                    限制号码：<span class="color-ff6600">0</span>人、
                    黑名单：<span class="color-ff6600">{{blacklist}}</span>人、
                    非白名单：<span class="color-ff6600">0</span>人）</div>
            </div>
            <div class="mart15">
                <span class="marr15">可发送人数：<span class="color-ff6600">{{canSendPeopleCount}}</span>人</span>
                <span class="">可发送条数：<span class="color-ff6600 marr15">{{canSendMessageCount}}</span></span>
                <div class="color-a9a9a9">移动：{{mobilenumber}}人、联通{{unicomnumber}}人、电信{{telecomnumber}}人</div>
            </div>
            <div class="mart15">
                <img src="" alt="">
                <span class="fw600" v-show="!ifNeedAudit">本条任务：将免审发送</span>
                <span class="fw600" v-show="ifNeedAudit">本条任务：需进行审核</span>
            </div>
            <div class="mart15 tac">
                <!--<button type="button" class="mui-btn">取消</button>-->
                <button type="button" class="mui-btn border-col-6699D5 bac-6699D5 color-fff" @click="sub">确认提交</button>
            </div>
        </div>
    </div>
</template>

<script>
    import Loading from "../common/loading.vue"
    export default {
        data: function () {
            return {
                ifLoading:false,
                filterPeopleCount:0,
                blacklist:0,
                canSendPeopleCount:0,
                canSendMessageCount:0,
                unicomnumber:0,
                mobilenumber:0,
                telecomnumber:0,
                ifNeedAudit:true,
            }
        },
        mounted(){
            mui.ready(function() {
                $('.mui-scroll').css({transform: "translate3d(0px, 0px, 0px)"});
            });

            let sureSendInfo = JSON.parse(window.sessionStorage.getItem("sureSendInfo"));
            this.blacklist = sureSendInfo.blacklist;
            this.filterPeopleCount = sureSendInfo.blacklist;
            this.canSendPeopleCount = sureSendInfo.allNumber;
            this.canSendMessageCount = sureSendInfo.total;
            this.mobilenumber = sureSendInfo.mobilenumber;
            this.unicomnumber = sureSendInfo.unicomnumber;
            this.telecomnumber = sureSendInfo.telecomnumber;
            this.ifNeedAudit = sureSendInfo.isAudit==2?true:false;


        },
        methods:{
            sub(){
                let _this = this;
                _this.ifLoading = true;
                this.$axios.get(
                    "/sendSms/app/sureSend.html?JSESSIONID="+window.sessionStorage.getItem('JSESSIONID')+
                    "&task_id="+JSON.parse(window.sessionStorage.getItem("sureSendInfo")).id
                ).then(function (res) {
                    _this.ifLoading = false;
                    if(res.data.returnCode==200){
                        _this.$router.push({path:"/home/sendRecord"});
                    }else{
                        mui.alert(res.data.msg);
                    }
                }).catch(function (err) {
                    _this.ifLoading = false;
                    mui.toast("服务器错误")
                })
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
    #title{
        border-bottom:1px solid #d9d9d9;
    }
    .form-item-row{
        padding-left: 75px;
        position: relative;
    }
    .item-row-title{
        position: absolute;
        top:0;
        left: 0;
    }
</style>