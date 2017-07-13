<template>
  <div class='hello'>
    Homeo
    <button v-on:click='logout'>logout</button>
    <button v-on:click='fetchExample'>fetch example</button>
    <div>lat: {{lat}}</div>
    <div>long: {{lng}}</div>
  </div>
</template>

<script>
  import fetch from 'isomorphic-fetch'
  import * as types from '../store/mutation-types'

  export default {
    name: 'hello',
    data () {
      return {
        trips: [],
        lat: 0.0,
        lng: 0.0
      }
    },
    mounted () {
      navigator.geolocation.watchPosition((pos) => {
        const lat = pos.coords.latitude
        const lng = pos.coords.longitude
        this.lat = lat
        this.lng = lng
        fetch('/api/userlocation', {
          method: 'POST',
          header: {
            Authorization: 'Bearer ' + this.$store.getters.getToken
          },
          body: {
            lat,
            lng,
            username: this.$store.getters.username
          }
        })
      })
    },
    methods: {
      logout () {
        this.$store.dispatch(types.LOGOUT)
      },
      fetchExample () {
        navigator.geolocation.getCurrentPosition((pos) => {
          console.log(pos)
        })
        fetch('http://www.example.com')
        console.log('hi')
      }
    }
  }
</script>

<!-- Add 'scoped' attribute to limit CSS to this component only -->
<style scoped>
</style>
