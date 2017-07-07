import Vue from 'vue'
import Router from 'vue-router'
import Home from '@/components/Home'
import Login from '@/components/Login'
import store from '../store'

const requireAuth = (to, from, next) => {
  console.log(from)
  console.log(to)
  console.log(next)
  console.log(store)
  console.log('store.getters.isLoggedIn(): ', store.getters.isLoggedIn)
  if (store.getters.isLoggedIn) {
    next()
  }
}

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      alias: '/login',
      name: 'Login',
      component: Login
    },
    {
      path: '/home',
      name: 'Home',
      component: Home,
      beforeEnter: requireAuth
    }
  ]
})
