<template>
    <div class=container>
        <div class="container-title">
            <h1>短信平台</h1>
            <p>专注于移动互联网的信息服务平台</p>
        </div>
        <div class="hrefTo"><a href="javascript:;"  @click='hrefTo'>Go</a></div>
        <div class="container-foot">
            <p>高效、快速、准确</p>
        </div>
    </div>
</template>
<script>
    export default {
        mounted() {
            this.hrefTo;
        },
        methods:{
            hrefTo() {
                this.$router.push({path: '/login'})
            }
        }
    }
</script>
<style>
    .container-title {
        margin-top: 200px;
        text-align: center;
    }
    .container-title h1 {
        font-size: 28px;
        color: #0099cc;
        margin-bottom: 30px;
    }
    .hrefTo a{
         width: 100px;
         height: 30px;
         margin: 0 auto;
         line-height: 30px;
         text-align: center;
         border: 1px solid #ccc;
         color: #0099cc;
         margin-top: 50px;
         display: block;
     }
    .hrefTo a:hover{
        width: 100px;
        height: 30px;
        margin: 0 auto;
        line-height: 30px;
        text-align: center;
        border: 1px solid #0099cc;
        color: #0099cc;
        margin-top: 50px;
        display: block;
    }
    .container-foot {
        position: fixed;
        bottom: 10px;
        text-align: center;
        left: 50%;
        margin-left: -56px;
    }
</style>