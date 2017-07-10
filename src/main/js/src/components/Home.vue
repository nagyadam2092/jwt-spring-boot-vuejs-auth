<template>
  <div class="hello">
    Homeo
    <button v-on:click="logout">logout</button>
    <button v-on:click="fetchExample">fetch example</button>
    <ul v-for="trip in trips">
      <li>{{trip.name}}</li>
    </ul>
  </div>
</template>

<script>
import fetch from 'isomorphic-fetch'
import * as types from '../store/mutation-types'

export default {
  name: 'hello',
  data () {
    return {
      trips: []
    }
  },
  methods: {
    logout () {
      this.$store.dispatch(types.LOGOUT)
    },
    fetchExample () {
      fetch('/api/tripnames', {
        method: 'GET',
        headers: {
          Authorization: 'Bearer ' + this.$store.getters.getToken
        }
      }).then((response) => {
        response.json().then((trips) => {
          console.log(trips)
          this.trips = trips
        })
      })
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
