import Vue from 'vue'
import Router from 'vue-router'
import Home from "../components/home.vue"
import SendMessage from '../components/sendMessage'
import Container from '@/components/container'
import Login from '@/components/login/login'
import MsAuditing from '../components/msAuditing/msAuditing.vue'
import MsAuditingIng from '../components/msAuditing/msAuditingIng.vue'
import MsAuditingSuccess from '../components/msAuditing/msAuditingSuccess.vue'
import ShortMessage from "../components/shortMessage/shortMessage.vue"
import AccountSetting from '../components/accountSetting/accountSetting.vue'
import SendRecord from '../components/sendRecord/sendRecord.vue'
import MessageConfirm from "../components/shortMessage/messageConfirm.vue"
import Statistics from "../components/statistics/statistics.vue"
import ReplyMessage from '../components/replyMessage/replyMessage.vue'
import  MsAuditingdefault from '../components/msAuditing/msAuditingdefault.vue'
Vue.use(Router)

export default new Router({
    routes: [
        {
            path: '/',
            name: 'container',
            component: Container
        },
        {
            path: '/login',
            name: 'login',
            component: Login
        },
        {
            path: '/accountSetting',
            name: 'accountSetting',
            component: AccountSetting
        },
        {
            path: '/home',
            component: Home,
            children:[
                {
                    path: '/home/sendMessage/',
                    name: 'sendMessage',
                    component: SendMessage
                },
                {
                    path: 'msAuditing',
                    component:MsAuditing
                },
                {
                    path: 'msAuditingIng',
                    component:MsAuditingIng
                },
                {
                    path: 'msAuditingSuccess',
                    component: MsAuditingSuccess
                },
                {
                    path: '/home/shortMessage',
                    component: ShortMessage
                },
                {
                    path: '/home/sendRecord',
                    component: SendRecord
                },
                {
                    path: '/home/messageConfirm',
                    component: MessageConfirm
                },
                {
                    path: '/home/statistics',
                    component: Statistics
                },
                {
                    path: '/home/replyMessage',
                    component: ReplyMessage
                },
                {
                    path: '/home/msAuditingdefault',
                    component: MsAuditingdefault
                }
            ]
        }
    ]
})