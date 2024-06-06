<template>
    <div class=login>
        <div class="login-title">
            <div class="login-bgc">
               <!-- <a href="#"></a>
                短信发送5秒到达-->
                <img src="../../assets/login-banner.png" alt="">
            </div>
        </div>
        <div class="login-way clearfix">
            <div class="login-user" :class='{active:userClick}' @click='userActive'>管理员登录</div>
            <div class="login-company" :class='{active:companyClick}' @click='companyActive'>企业登录</div>

        </div>
        <usercmp v-show='userClick'></usercmp>
        <conpanycmp v-show='companyClick'></conpanycmp>
    </div>
</template>
<script>
    import usercmp from './usercomponent.vue'
    import conpanycmp from './companycomponent.vue'
    export default {
        data() {
            return {
                userClick: true,
                companyClick: false
            }
        },
        methods: {
            userActive(){
                this.userClick = true;
                this.companyClick = false;
            },
            companyActive() {
                this.userClick = false;
                this.companyClick = true;
            }
        },
        components : {
            usercmp,
            conpanycmp
        }
    }
</script>
<style>
    @import '../../golbal/global.css';
    body {
        background-color: #fff;
    }
    .login {

    }
    .login-title .login-bgc img{
        /*margin: 0;
        padding: 0;
        height: 100%;
        width: 100%;
        line-height: 65px;
        font-size: 24px;
        color: #fff;
        text-align: center;*/
        display: inline-block;
        width: 100%;
        vertical-align: bottom;
    }
    .login-title {
        width: 100%;
        /*height: 65px;*/
        background-color: #6699cc;
        overflow: hidden;
    }
    .login-title a {
        display: inline-block;
        width: 60px;
        height: 50px;
        background: url("../../assets/login-title.png");
        vertical-align: middle;
        margin-right: 30px;
    }
    .login-way {
        margin-top: 50px;
        /*height: 50px;*/
        line-height: 50px;
        /*border-top: 1px solid #6699cc;*/
        padding: 0 50px;
    }
    .login-user, .login-company {
        float: left;
        width: 50%;
        text-align: center;
        font-size: 18px;
        color: #666;
        cursor: pointer;
    }
    .active {
        border-bottom: 3px solid #6699cc;
    }
</style>