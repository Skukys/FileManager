import {request} from "../api.js";

export default {
    data(){
        return {
            loginData: {
                password: 'Qwaszxe12',
                login: 'administrateur'
            },
            error: {
                show:false,
                errors: [],
            }
        }
    },
    methods:{
        async login(){
            let res = await request('POST', '/authorization', this.loginData)
            if(res.status === 401 || res.status === 422){
                this.error.show = true
                this.error.errors = res.json.body
            }
            if(res.status === 200){
                localStorage.token = res.json.body.token
                this.error.show = false
                this.$root.auth = true
                if(this.loginData.login === 'administrateur') {
                    this.$root.admin = true
                    localStorage.admin = true
                }
                this.$root.setPage('home')
            }
        }
    },
    //language=vue
    template: `
    <div class="login flex">
      <div class="login__content flex">
        <h1 class="login__header">Login</h1>
        <ul class="errors" v-if="error.show">
          <li class="error" v-for="error in error.errors">{{error}}</li>
        </ul>
        <div class="login__form flex">
          <input type="text" placeholder="Login" class="login__input" v-model="loginData.login">
          <input type="password" placeholder="Password" class="login__input" v-model="loginData.password">
          <button @click="login">Войти</button>
        </div>
      </div>
    </div>
    `
}