<template>
    <div class='accountSetting'>
        <Loading v-show='ifLoading'></Loading>
        <h3 class="accountSetting-title">
            个人资料
        </h3>
        <div class="accoutSetting-main">
            <div class="setting-photo clearfix">
                <div class="setting-pic radius-circle fl">
                    <img :src=headerIcon alt="">
                </div>
                <div class="settings fl">修改头像</div>
            </div>
            <ul class='accountSetting-userMsg'>
                <li class='clearfix'><span class='userMsg-left'>用户名</span><input type="text" v-model='username'></li>
                <li class='clearfix'><span class='userMsg-left'>所属企业</span><input type="text" v-model='companyName'></li>
                <li class='clearfix'><span class='userMsg-left'>手机号码</span><input type="text" v-model='tel'></li>
            </ul>
            <button @click='submitInfo'>确定</button>
        </div>
    </div>
</template>
<script>
    import Loading from '../common/loading.vue'
    import headerIcon from "../../img/headerIcon.png"
    export default {
        data() {
            return {
                imgSrc: '',
                username: '',
                companyName: '',
                tel: '',
                ifLoading: false,
                headerIcon:headerIcon
            }
        },
        mounted(){
            mui.ready(function() {
                $('.mui-scroll').css({transform: "translate3d(0px, 0px, 0px)"});
            })
            this.init()
        },
        methods:{
            init() {
                let that = this;
                that.ifLoading = true
                that.$axios({
                    method:'get',
                    url:'/spList/app/editSpInfo.html?JSESSIONID=' + window.sessionStorage.getItem('JSESSIONID'),
                }).then(function (res) {
                    console.log(res.data.sPinfo);
                    that.username = res.data.sPinfo.spContact_name;
                    that.companyName = res.data.sPinfo.sp_name;
                    that.tel = res.data.sPinfo.spContact_mdn;
                    that.ifLoading = false
                })
            },
            submitInfo() {
                let that = this;
                let JSESSIONID = window.sessionStorage.getItem('JSESSIONID')
                that.$axios({
                    method: 'get',
                    url: '/spList/app/saveSp.html?JSESSIONID='+ JSESSIONID + '&spContact_mdn=' + that.tel + '&spContact_name=' + that.username
                }).then(function (res) {
                    if(res.data.returnCode == 200) {
                        mui.toast(res.data.msg);
                        that.$router.push({path: '/home/sendMessage'})
                    } else {
                        mui.toast(res.data.errInfo)
                    }
                }).catch(function () {
                    mui.toast('服务器错误')
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
    body {
        background-color: #fff;
    }
    h3,p {
        padding: 0;
        margin: 0;
    }
.accountSetting {
    /*padding-top: 30px;*/
    color: #666;
}
    .accountSetting-title {
        font-weight: 600;
        font-size: 16px;
        height: 40px;
        line-height: 40px;
        background-color: rgb(242,242,242);
        padding-left: 15px;
        color: #666;
    }
    .accoutSetting-main {
        padding: 30px 15px 0 15px;
    }
    .setting-pic {
        width: 65px;
        height: 65px;
        background-color: #6699cc;
        overflow: hidden;
    }
    .setting-pic img {
        width: 100%;
        height: 100%;
        border: 0;
        border-radius: 50%;
        vertical-align: middle;
    }
    .settings {
        height: 65px;
        line-height: 65px;
        margin-left: 40px;
    }
    .accountSetting-userMsg{
        padding-top: 30px;
    }
    .accountSetting-userMsg li {
        border-bottom: 1px solid #ccc;
        padding: 10px;
    }
    .accountSetting-userMsg input {
        float: left;
        width: 60%;
        margin: 0;
        padding: 0;
        border:0;
        font-size: 16px;
    }
    .userMsg-left {
        display: inline-block;
        width: 30%;
        margin-right: 10px;
        float: left;
        height: 100%;
        line-height: 40px;
    }
    .accoutSetting-main a {
        display: block;
        width: 70%;
        margin: 0 auto;
        height: 40px;
        line-height: 40px;
        text-align: center;
        margin-top: 30px;
    }
    .accoutSetting-main button {
        border: 0;
        background-color: #6699cc;
        color:#fff;
        display: block;
        width: 70%;
        margin: 0 auto;
        height: 40px;
        text-align: center;
        max-width: 300px;
        margin-top: 30px;
    }
</style>