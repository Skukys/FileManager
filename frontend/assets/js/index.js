import folder from './components/folder.js'
import createUser from './components/createUser.js'
import login from './components/login.js'

import {request} from "./api.js";

window.app = new Vue({
    el:"#app",
    components:{
        folder, createUser, login
    },
    data(){
        return {
            createFolderData:{
                open: false,
                name: 'NewFolder',
            },
            page: 'home',
            login: 'user',
            opFolder: {},
            auth: false,
            admin: false,
            treeData: {}
        }
    },
    mounted(){
        if(localStorage.token) {
            this.auth = true
            if (localStorage.admin === 'true') this.admin = true
            this.getFolderTree(1)
            this.getFolder(1)
        }
    },
    methods:{
        async createFolder(){
            let res = await request('POST', `/folder/${this.opFolder.id}`, this.createFolderData)
            this.createFolderData.open = false
            this.createFolderData.name = ''
            this.getFolder(this.opFolder.id)
            this.getFolderTree(1)
        },
        loadFile(){
            let input = document.querySelector('#addFile')
            input.click()
            input.addEventListener('change', (event)=>{
                console.log(event)
            })
        },
        setPage(name){
            this.page = name
        },
        async logout(){
            let res = await request('DELETE', '/logout')
            if(res.status === 200){
                this.auth = false
                this.admin = false
                localStorage.clear()
            }
        },
        async getFolderTree(id){
            let res = await request('GET', `/folder/show/${id}`)
            this.treeData = res.json.body
        },
        async getFolder(id){
            let resOpen = await request('GET', `/folder/${id}`)
            this.opFolder = resOpen.json.body
        }
    },
})
