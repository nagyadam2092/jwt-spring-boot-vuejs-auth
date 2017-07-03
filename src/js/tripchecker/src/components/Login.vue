<template>
  <form @submit.prevent='login({ username, password })'>
   <input type='text' placeholder='username' v-model='username'>
   <input type='password' placeholder='password' v-model='password'>
   <button type='submit'>Login</button>
  </form>
</template>

<script>
import { LOGIN } from '../store/mutation-types'

export default {
  name: 'login',
  data () {
    return {
      username: '',
      password: ''
    }
  },
  methods: {
    login () {
      console.log('ohai')
      console.log(this.$store.dispatch)
      this.$store.dispatch(LOGIN, {
        username: this.username,
        password: this.password
      }).then(() => {
        // this.$router.push('/home')
        console.log('oh')
      })
    }
  }
}
</script>

<!-- Add 'scoped' attribute to limit CSS to this component only -->
<style scoped>
</style>
