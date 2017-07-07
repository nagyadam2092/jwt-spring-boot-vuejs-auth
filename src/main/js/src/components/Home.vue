<template>
  <div class="hello">
    Homeo
    <button v-on:click="logout">logout</button>
  </div>
</template>

<script>
import * as types from '../store/mutation-types'

export default {
  name: 'hello',
  data () {
    return {
      msg: ''
    }
  },
  methods: {
    logout () {
      this.$store.dispatch(types.LOGOUT)
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
