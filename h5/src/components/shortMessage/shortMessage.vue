<!-- Created by chunmingdeng on 2017/9/4 -->
<template>
    <div>
        <Loading v-show="ifLoading"></Loading>
        <div class="mui-content mui-scroll-wrapper">
            <div class="mui-scroll" style="padding: 15px">
                <div id="title" class="lh34 fs18 fw600 vertical-line">
                    短信发送
                </div>
                <div class="lh34 form-item-row h34 picker-item mart15">
                    <span class="item-row-title">发送对象</span>
                    <!--<input type="text" @click="choosePeople" :value="choosedPeopleName" placeholder="请选择发送对象">-->
                    <input type="text" @click="rightLeft" :value="checkedValues" placeholder="请选择发送对象" readonly="readonly">
                </div>
                <div class="form-item-row picker-item mart15">
                    <span class="item-row-title">短信内容</span>
                    <textarea class="fs14" v-model="word"  :value="word" maxlength="1000" rows="8"
                              placeholder="【短信签名】请输入短信内容，模板发送可免审核，节省等待时间"></textarea>
                    <div>
                        已输入<span class="color-ff6600">{{wordCount}}</span>/70,最多1000字，
                        计<span class="color-ff6600">1</span>条短信<i></i>
                    </div>
                    <div class="color-ff0808 fs12 mart15"><i></i>注意：当前内容已超过70字，会产生多条收费，避免多收费，请再次确认短信内容长度</div>
                </div>
                <div class="form-item-row picker-item mart15 clearfix">
                    <span class="item-row-title lh34">定时发送</span>
                    <!--<input type="checkbox" @click="choosePeople()">-->
                    <div class="mui-input-row mui-checkbox mui-left fl lh34" @click="changeBooksend">
                        <label>定时发送</label>
                        <input name="checkbox1" type="checkbox" :checked="booksendStatus">
                    </div>
                    <span class="time-input">
                    <input type="text" placeholder="请选择时间" style="width: 180px" @click="chooseTime()" :value="choosedDate">
                    <i class="iconfont icon-shijian time-input-icon"></i>
                </span>
                </div>
                <div class="mart15 tac">
                    <button type="button" class="mui-btn">取消</button>
                    <button type="button" class="mui-btn bac-6699D5 border-col-6699D5 color-fff" @click="sub()">确认提交</button>
                </div>
            </div>
        </div>
        <div id="rightLeft">
                    <!-- 主界面具体展示内容 -->
                    <header class="mui-bar mui-bar-nav">
                        <!--<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>-->
                        <a id='cancel' class="mui-btn mui-btn-link mui-pull-left">取消</a>
                        <h1 class="mui-title">选择人员</h1>
                        <a id='done' class="mui-btn mui-btn-link mui-pull-right mui-btn-blue mui-disabled">完成</a>
                    </header>
                    <div class="mui-content">
                        <div id='list' class="mui-indexed-list">
                            <div class="mui-indexed-list-search mui-input-row mui-search">
                                <input type="search" class="mui-input-clear mui-indexed-list-search-input" placeholder="搜索人员">
                            </div>
                            <div class="mui-indexed-list-bar" style="display: none">
                                <a>A</a>
                                <a>B</a>
                                <a>C</a>
                                <a>D</a>
                                <a>E</a>
                                <a>F</a>
                                <a>G</a>
                                <a>H</a>
                                <a>I</a>
                                <a>J</a>
                                <a>K</a>
                                <a>L</a>
                                <a>M</a>
                                <a>N</a>
                                <a>O</a>
                                <a>P</a>
                                <a>Q</a>
                                <a>R</a>
                                <a>S</a>
                                <a>T</a>
                                <a>U</a>
                                <a>V</a>
                                <a>W</a>
                                <a>X</a>
                                <a>Y</a>
                                <a>Z</a>
                            </div>
                            <div class="mui-indexed-list-alert"></div>
                            <div class="mui-indexed-list-inner">
                                <div class="mui-indexed-list-empty-alert">没有数据</div>

                                <div class="mui-content mui-scroll-wrapper">
                                    <div class="mui-scroll">
                                        <ul class="mui-table-view">
                                            <!--<li data-value="AKU" data-tags="AKeSu" class="mui-table-view-cell mui-indexed-list-item mui-checkbox mui-left">-->
                                            <!--<input type="checkbox" />阿克苏机场</li>-->
                                            <li v-for="item in memberList" v-if="item.mdn!=undefined" :data-tags=item.name
                                                    :data-value=item.mdn
                                                    class="mui-table-view-cell mui-indexed-list-item mui-checkbox mui-left">
                                                <input type="checkbox" />{{item.name}}
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
        </div>
    </div>
</template>

<script>
    import mui from "mui"
    import Loading from "../common/loading.vue"
    document.title = "短信发送";
    export default {
        data:function () {
            return {
                ifLoading:true,
                choosedPeopleId:"",
                word:"",
                wordCount:0,
                choosedDate:"",
                memberList:[],
                checkedValues:"",
                booksendStatus:false,
            }
        },
        mounted(){
            this.$nextTick(function () {

                mui.ready(function() {

                    mui('.mui-off-canvas-wrap').offCanvas('off');
                    let options = {
                        scrollY: true, //是否竖向滚动
                        scrollX: false, //是否横向滚动
                        startX: 0, //初始化时滚动至x
                        startY: 0, //初始化时滚动至y
                        indicators: true, //是否显示滚动条
                        deceleration: 0.0006, //阻尼系数,系数越小滑动越灵敏
                        bounce: true //是否启用回弹
                    }
                    mui('.mui-scroll-wrapper').scroll(options);

                });


                let _this = this;
                _this.ifLoading = true;
                this.$axios.get(
                        "/contact/app/findContactMdnByParentIdAndSpId.html?JSESSIONID="+window.sessionStorage.getItem("JSESSIONID")
                ).then(function (res) {
                    _this.ifLoading = false;
                    if(res.data.returnCode==200){
                        _this.memberList = res.data.nodeStr;
                        _this.$nextTick(function () {
                            _this.initList();
                        })
                    }else{
                        mui.alert(res.data.msg);
                        _this.initList();
                    }
                }).catch(function (err) {
                    _this.ifLoading = false;
                    _this.initList();
                })
            })
//            mui.ready(function() {
//                $('.mui-scroll').css({transform: "translate3d(0px, 0px, 0px)"});
//            })

        },
        methods:{
            chooseTime(){
                let _this = this;
                var dtpicker = new mui.DtPicker({
                    type: "dateTime",//设置日历初始视图模式
                    beginYear: 2015,//设置开始日期
                    endYear: 2020,//设置结束日期
                    labels: ['年', '月', '日', '时', '分'],//设置默认标签区域提示语
                })
                dtpicker.show(function(e) {
                    var time = e.y.value+"-"+e.m.value+"-"+e.d.value+" "+e.h.value+":"+e.i.value+":00"
                    _this.choosedDate = time;
                })
            },
            changeBooksend(){
                this.booksendStatus = !this.booksendStatus;
            },
            sub(){
                let _this = this;
                if(_this.booksendStatus){
                    if(_this.choosedDate==""){
                        mui.alert("请选择定时发送时间！");
                        return;
                    }
                }
                let params = {
                    JSESSIONID:window.sessionStorage.getItem("JSESSIONID"),
                    content:_this.word,
                    booksend:_this.booksendStatus?"1":"",
                    booksendTime:_this.choosedDate,
                    sendMobiles:_this.checkedValues,
                    signature:"此处为中文"
                }
                var str = "?"
                var arr = [];
                for(var i in params){
                    arr.push(i+"="+params[i]);
                }
                str += arr.join("&");
                _this.ifLoading = true;
                _this.$axios.get(
                        "/sendSms/app/send.html"+str
                ).then(function (res) {
                    _this.ifLoading = false;
                    if(res.data.returnCode==200){
                        window.sessionStorage.setItem("sureSendInfo",JSON.stringify(res.data))
                        _this.$router.push({path:"/home/messageConfirm"})
                    }else{
                        mui.alert(res.data.msg)
                    }
                }).catch(function (err) {
                    _this.ifLoading = false;
                    mui.alert("请求发生错误啦！")
                })
            },
            rightLeft(){
                mui.init();
                $("#rightLeft").toggleClass("right-to-left");
            },
            initList(){
                let _this = this;
                mui.init();
                var header = document.querySelector('header.mui-bar');
                var list = document.getElementById('list');
                var done = document.getElementById('done');
                var cancel = document.getElementById('cancel');
                //calc hieght
                list.style.height = (document.body.offsetHeight - header.offsetHeight) + 'px';
                //create
                window.indexedList = new mui.IndexedList(list);
                //done event
                done.addEventListener('tap', function() {
                    var checkboxArray = [].slice.call(list.querySelectorAll('input[type="checkbox"]'));
                    var checkedText = [];
                    var checkedValues = [];
                    checkboxArray.forEach(function(box) {
                        if (box.checked) {
                            checkedText.push(box.parentNode.innerText);
                            checkedValues.push(box.parentNode.getAttribute('data-value'));
                        }
                    });
                    _this.checkedValues = checkedValues.join(";")
//                    mui.init();
                    $("#rightLeft").toggleClass("right-to-left");
                }, false);
                //cancel event
                cancel.addEventListener('tap', function() {
                    $("#rightLeft").toggleClass("right-to-left");
                }, false);
                mui('.mui-indexed-list-inner').on('change', 'input', function() {
                    var count = list.querySelectorAll('input[type="checkbox"]:checked').length;
                    var value = count ? "完成(" + count + ")" : "完成";
                    done.innerHTML = value;
                    if (count) {
                        if (done.classList.contains("mui-disabled")) {
                            done.classList.remove("mui-disabled");
                        }
                    } else {
                        if (!done.classList.contains("mui-disabled")) {
                            done.classList.add("mui-disabled");
                        }
                    }
                });
            }
        },
        watch: {
            word: function (val) {
                this.wordCount = val.length;
            }
        },
        components:{
            Loading
        }
    }
</script>

<style>
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
    .picker-item input{
        /*border:none;*/
        /*border-bottom: 1px solid #d9d9d9;*/
        /*line-height: 34px;*/
        /*height:34px ;*/
    }
    input[name=checkbox1]:before{
        font-size: 20px!important;
    }
    input[name=checkbox1]{
        /*top: 0!important;*/
        right:0!important;
        left: 0!important;
    }
    .mui-checkbox.mui-left label, .mui-radio.mui-left label{
        padding-left: 25px!important;
    }
    .mui-input-row label{
        padding:0px 15px!important;
    }

    #rightLeft{
        position: fixed;
        top:0;
        left: 100%;
        width: 100%;
        height: 100%;
        z-index: 2;
        background: #fff;
    }
    #rightLeft:before{
        content: "";
        position: absolute;
        top:0;
        left: 0;
        width: 100%;
        height: 100%;
        z-index: -1;
    }
    .right-to-left{
        animation: moveLeftToRight .3s linear;
        animation-iteration-count:1;
        animation-fill-mode:forwards;
    }
    @keyframes moveLeftToRight {
        0%  {left:100%}
        100% {left:0%}
    }
    @-webkit-keyframes moveLeftToRight {
        from {left:100%}
        to {left:0%}
    }

    .mui-indexed-list-inner .mui-scroll-wrapper{
        top:35px!important;
    }
</style>