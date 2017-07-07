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
      }).then((response) => {
        if (response.status === 200) {
          response.json().then(json => {
            this.$store.commit(types.LOGIN_SUCCESS, json)
            this.$router.push('/home')
          })
        } else if (response.status === 401) {
          this.$store.commit(types.LOGIN_WRONG_CREDENTIALS)
        } else {
          this.$store.commit(types.LOGIN_ERROR)
        }
      })
    }
  }
}
</script>

<!-- Add 'scoped' attribute to limit CSS to this component only -->
<style scoped>
</style>
