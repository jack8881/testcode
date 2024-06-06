<template>
    <!-- 侧滑导航根容器 -->
    <div class="mui-off-canvas-wrap mui-draggable">
      <!-- 菜单容器 -->
      <aside class="mui-off-canvas-left">
        <div class="mui-scroll-wrapper bgc-fff">
          <div class="mui-scroll">
            <!-- 菜单具体展示内容 -->
            <ul class="bgc-fff" id="left-menu">
              <li @tap='goto' class='photoImg radius-circle'>
                <img :src=headerIcon alt="" id="header-icon" class="radius-circle">
              </li>
              <li class="clearfix" @tap='goto'>
                   <span class="fl">{{username}}</span>
                   <span class="mui-icon mui-icon-arrowright fr"></span>
              </li>
              <li class="item" @tap="hideLeftMenu()" v-show='isSp'>
                <router-link to="/home/shortMessage">
                  <button>
                    <i class="iconfont icon-dingwei1"></i>
                    短信发送
                  </button>
                </router-link>
              </li>
              <li class="item" @tap="hideLeftMenu()" v-show='isSp'>
                <router-link to="/home/replyMessage">
                  <button>
                    <i class="iconfont icon-duanxinyoujianfasongguanli"></i>
                    短信回复
                  </button>
                </router-link>
              </li>
              <li class="item" @tap="hideLeftMenu()" v-show='!isSp'>
                <router-link to="/home/msAuditing">
                  <button>
                    <i class="iconfont icon-shenhe"></i>
                    信息审核
                  </button>
                </router-link>
              </li>
              <li class="item" @tap="hideLeftMenu()" v-show='isSp'>
                <router-link to="/home/statistics">
                  <button>
                    <i class="iconfont icon-tongji"></i>
                    发送统计
                  </button>
                </router-link>
              </li>
              <li class="item" @tap="hideLeftMenu()" v-show='isSp'>
                <router-link  :to="{path: '/home/sendMessage', query: { isSp: isSpValue }}">
                  <button>
                    <i class="iconfont icon-xiaoxi"></i>
                    首页
                  </button>
                </router-link>
              </li>
            </ul>
          </div>
        </div>
      </aside>
      <!-- 主页面容器 -->
      <div class="mui-inner-wrap">
        <!--<div id="refreshContainer" class="mui-content mui-scroll-wrapper">-->
          <!--<div class="mui-scroll">-->
            <!-- 主界面具体展示内容 -->
            <router-view></router-view>
          <!--</div>-->
        <!--</div>-->
        <div class="mui-off-canvas-backdrop"></div>
      </div>
    </div>
</template>

<script>
  import headerIcon from "../img/headerIcon.png"
  export default {
    data () {
      return {
        msg: '',
        isSp: true,
        isSpValue:"",
        username:"",
        headerIcon:headerIcon
      }
    },
    methods:{
      goto() {
          this.$router.push({path: '/accountSetting'})
      },
      hideLeftMenu(){
          mui('.mui-off-canvas-wrap').offCanvas().toggle();
      },
      init() {
        let that = this;
        that.$axios({
          method:'get',
          url:'/spList/app/editSpInfo.html?JSESSIONID=' + window.sessionStorage.getItem('JSESSIONID'),
        }).then(function (res) {
          that.username = res.data.sPinfo.spContact_name;
        })
      }
    },
    created(){

    },

    mounted(){
      let that = this;
      that.init();
      mui('body').on('tap','a',function(){
        if(this.href!=""){
          document.location.href=this.href;
        }
      })
        var isSp = window.sessionStorage.getItem("isSp")
        that.isSpValue = isSp;
        that.isSp = isSp==1?true: false;
    }
  }
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style>
  @import "../golbal/global.css";
  ul#left-menu{
    padding: 15px;
  }
  #left-menu .item{
    line-height: 54px;
  }
  #left-menu .item button{
    border:none;
    width: 100%;
    text-align: left;
    padding: 0px!important;
    line-height: 54px;
  }
  #setting{
    color: #007aff;
    border:none;
    background: transparent;
  }
  #header-icon{
    height: 40px;
    width: 40px;
  }
  .photoImg {
    width: 65px;
    height: 65px;
    background-color: #6699cc;
    overflow: hidden;
  }
  .photoImg #header-icon {
    width: 100%;
    height: 100%;
    border: 0;
    border-radius: 50%;
    vertical-align: middle;
  }
</style>
