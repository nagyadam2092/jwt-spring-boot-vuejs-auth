<template>
  <form @submit.prevent='login({ username, password })'>
   <input type='text' placeholder='username' v-model='username'>
   <input type='password' placeholder='password' v-model='password'>
   <button type='submit'>Login</button>
  </form>
</template>

<script>
import * as types from '../store/mutation-types'

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
      this.$store.dispatch(types.LOGIN, {
        username: this.username,
        password: this.password
      }).then((data) => {
        // this.$router.push('/home')
        console.log('oh', data)
      })
    }
  }
}
</script>

<!-- Add 'scoped' attribute to limit CSS to this component only -->
<style scoped>
</style>
