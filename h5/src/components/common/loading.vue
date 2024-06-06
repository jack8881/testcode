<!-- Created by chunmingdeng on 2017/9/11 -->
<template>
    <div id="loading">
        <div id="loading-center">
            <div id="loading-center-absolute">
                <div class="object" id="object_one"></div>
                <div class="object" id="object_two"></div>
                <div class="object" id="object_three"></div>
                <div class="object" id="object_four"></div>
                <div class="object" id="object_five"></div>
                <div class="object" id="object_six"></div>
                <div class="object" id="object_seven"></div>
                <div class="object" id="object_eight"></div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data: function () {
            return {}
        }
    }
</script>

<style>
    #loading{
        background-color: #000;
        opacity: .2;
        height: 100%;
        width: 100%;
        position: fixed;
        z-index: 1000;
        margin-top: 0px;
        top: 0px;
    }
    #loading-center{
        width: 100%;
        height: 100%;
        position: relative;
    }
    #loading-center-absolute {
        position: absolute;
        left: 50%;
        top: 50%;
        height: 50px;
        width: 50px;
        transform: translate(-50%,-50%);
        -moz-border-radius: 50% 50% 50% 50%;
        -webkit-border-radius: 50% 50% 50% 50%;
        border-radius: 50% 50% 50% 50%;

    }
    .object{
        width: 6px;
        height: 6px;
        background-color: #FFF;
        position: absolute;
        transform: translate(-50%,-50%);
        -moz-border-radius: 50% 50% 50% 50%;
        -webkit-border-radius: 50% 50% 50% 50%;
        border-radius: 50% 50% 50% 50%;
        -webkit-animation: animate 0.8s infinite;
        animation: animate 0.8s infinite;
    }


    /*#object_one {*/
        /*top: 19px;*/
        /*left: 19px;*/

    /*}*/
    /*#object_two {*/
        /*top: 0px;*/
        /*left: 65px;*/
        /*-webkit-animation-delay: 0.1s;*/
        /*animation-delay: 0.1s;*/

    /*}*/
    /*#object_three {*/
        /*top: 19px;*/
        /*left: 111px;*/
        /*-webkit-animation-delay: 0.2s;*/
        /*animation-delay: 0.2s;*/

    /*}*/
    /*#object_four {*/
        /*top: 65px;*/
        /*left: 130px;*/
        /*-webkit-animation-delay: 0.3s;*/
        /*animation-delay: 0.3s;*/
    /*}*/
    /*#object_five {*/
        /*top: 111px;*/
        /*left: 111px;*/
        /*-webkit-animation-delay: 0.4s;*/
        /*animation-delay: 0.4s;*/
    /*}*/
    /*#object_six {*/
        /*top: 130px;*/
        /*left: 65px;*/
        /*-webkit-animation-delay: 0.5s;*/
        /*animation-delay: 0.5s;*/
    /*}*/
    /*#object_seven {*/
        /*top: 111px;*/
        /*left: 19px;*/
        /*-webkit-animation-delay: 0.6s;*/
        /*animation-delay: 0.6s;*/
    /*}*/
    /*#object_eight {*/
        /*top: 65px;*/
        /*left: 0px;*/
        /*-webkit-animation-delay: 0.7s;*/
        /*animation-delay: 0.7s;*/
    /*}*/
    #object_one {
        top: 15%;
        left: 15%;

    }
    #object_two {
        top: 0;
        left: 50%;
        -webkit-animation-delay: 0.1s;
        animation-delay: 0.1s;

    }
    #object_three {
        top: 15%;
        left: 85%;
        -webkit-animation-delay: 0.2s;
        animation-delay: 0.2s;

    }
    #object_four {
        top: 50%;
        left: 100%;
        -webkit-animation-delay: 0.3s;
        animation-delay: 0.3s;
    }
    #object_five {
        top: 85%;
        left: 85%;
        -webkit-animation-delay: 0.4s;
        animation-delay: 0.4s;
    }
    #object_six {
        top: 100%;
        left: 50%;
        -webkit-animation-delay: 0.5s;
        animation-delay: 0.5s;
    }
    #object_seven {
        top: 85%;
        left: 15%;
        -webkit-animation-delay: 0.6s;
        animation-delay: 0.6s;
    }
    #object_eight {
        top: 50%;
        left: 0%;
        -webkit-animation-delay: 0.7s;
        animation-delay: 0.7s;
    }



    @-webkit-keyframes animate {

        25% {
            -ms-transform: scale(1.5);
            -webkit-transform: scale(1.5);
            transform: scale(1.5);
        }


        75% {
            -ms-transform: scale(0);
            -webkit-transform: scale(0);
            transform: scale(0);
        }


    }

    @keyframes animate {
        50% {
            -ms-transform: scale(1.5,1.5);
            -webkit-transform: scale(1.5,1.5);
            transform: scale(1.5,1.5);
        }

        100% {
            -ms-transform: scale(1,1);
            -webkit-transform: scale(1,1);
            transform: scale(1,1);
        }

    }
</style>