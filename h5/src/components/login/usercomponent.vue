<template>
    <div class='usercpm'>
        <div class="user-login">
            <input type="text" placeholder='请输入用户名' v-model="username" class='userlogin-name'>
            <input type="password" placeholder='请输入密码' v-model="password" class='userlogin-psw'>
            <button class='user-login-btn' @click="login">
                登录
            </button>
        </div>
    </div>
</template>
<script>
    export default {
        data() {
            return {
                username: '',
                password: ''
            }
        },
        methods: {
            login() {
                let that = this
                that.$axios({
                    method:'get',
                    url:'/app/managerlogin.html?userName='+that.username+'&password=' + that.password,
                }).then(function (res) {
                    if (res.data.returnCode == 200) {
                        window.sessionStorage.setItem('isSp',res.data.isSp)
                        window.sessionStorage.setItem('JSESSIONID', res.data.JSESSIONID)
                        that.$router.push({path: '/home/msAuditing'})
                    } else {
                        mui.alert(res.data.errInfo,'登录失败','确定')
                    }
                }).catch(function(err) {
                    mui.toast('服务器错误')
                })
            }
        }
    }
</script>
<style>
    @import "../../golbal/global.css";
    .usercpm {
        padding: 30px;
        position: relative;
    }
    .user-login {
        /*height: 150px;*/
        /*padding: 0 10px;*/
    }
    .user-login .userlogin-name ,  .user-login .userlogin-psw{
        padding-left: 35px;
        font-size: 14px;
        border: none;
        border-bottom: 1px solid #6699cc;
    }
    .user-login-btn {
        padding: 0;
        display: block;
        width: 250px;
        height: 50px;
        line-height: 50px;
        text-align: center;
        font-size: 18px;
        margin: 0 auto;
        background-color: #6699cc;
        border: 0;
        color: #fff;
        border-radius: 10px;
        margin-top: 30px;
        max-width: 200px;
    }
    .user-login-btn a {
        display: block;
        width: 100%;
        height: 100%;
        color: #fff;
        text-decoration: none;
    }
    .login-er {
        /*position: absolute;*/
        /*right: 20px;*/
        /*top: 5px;*/
        width: 46px;
        height: 46px;
        line-height: 46px;
        font-size: 46px;
    }
</style>