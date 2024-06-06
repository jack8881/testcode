<template>
    <div class='companycpm'>
        <div class="company-login">
            <input type="text" class='company-name' v-model="spid" placeholder='请输入企业编号'>
            <input type="text" placeholder='请输入用户名' v-model="companyname" class='userlogin-name'>
            <input type="password" placeholder='请输入密码' v-model="pw" class='userlogin-psw'>
            <button class='user-login-btn' @tap="logins">登录</button>
        </div>
    </div>
</template>
<script>
    export default {
        data() {
            return {
                spid: '',
                companyname: '',
                pw: ''
            }
        },
        methods: {
            logins() {
                let that = this
                that.$axios({
                    method:'get',
//                    url:'/app/login.html?spid=1013&userName=huaihua&password=123456',
                    url:'/app/login.html?spid='+that.spid+'&userName='+that.companyname+'&password=' + that.pw,
                }).then(function (res) {
                    if (res.data.returnCode == 200) {
                        window.sessionStorage.setItem('isSp',res.data.isSp)
                        window.sessionStorage.setItem('JSESSIONID', res.data.JSESSIONID)
                        that.$router.push({path: '/home/sendMessage',query:{'isSp':res.data.isSp}})

                    } else {
                        mui.alert(res.data.errInfo,'登录失败','确定')
                    }
                }).catch(function () {
                    mui.toast('服务器错误')
                })
            }
        }
    }
</script>
<style>
    @import "../../../static/svgIcon/iconfont.css";
    .companycpm {
        padding: 30px;
        position: relative;
    }
    .company-login {
        /*height: 150px;*/
        /*padding: 0 10px;*/
    }
    .company-login .userlogin-name ,  .company-login .userlogin-psw, .company-login .company-name{
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
        line-height: 46px;
        width: 46px;
        height: 46px;
        font-size: 46px;
    }
</style>