// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import mui from 'mui'
import axios from 'axios'
mui.init()
Vue.config.productionTip = false
axios.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=UTF-8';//配置请求头
// axios.defaults.baseURL = 'http://10.0.52.37:8080/sms-app';
axios.defaults.baseURL = 'http://10.0.0.107:9101/sms-app-h5';
Vue.prototype.$axios = axios;
new Vue({
    el:'#app',
    router,
    template: '<App/>',
    components: { App },
    mounted (){

    }
});
