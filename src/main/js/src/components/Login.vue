<template>
  <div class='screen'>
    <div class="box">
       <div class="ribbon"><span>© Big & Co.</span></div>
    </div>
    <img class='logo' src='../../../resources/static/logo.png' />
    <p class="title">Karika17</p>
    <form @submit.prevent='login({ username, password })'>
      <p class='error'>{{error}}</p>
      <p class='log'>{{log}}</p>
     <input type='text' placeholder='username' v-model='username'>
     <input type='password' placeholder='password' v-model='password'>
     <input type='submit' value='LOGIN'></button>
    </form>
  </div>
</template>

<script>
import * as types from '../store/mutation-types'

export default {
  name: 'login',
  data () {
    return {
      username: '',
      password: '',
      error: '',
      log: ''
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
          this.log = 401
          response.json().then(json => {
            this.error = json
          })
          this.$store.commit(types.LOGIN_WRONG_CREDENTIALS)
          this.$router.push('/')
        } else {
          this.log = 'else: ' + response.status
          response.json().then(json => {
            this.error = json
          })
          this.$router.push('/')
          this.$store.commit(types.LOGIN_ERROR)
        }
      }).catch(json => {
        this.error = 'Unable to connect server.'
      })
    }
  }
}
</script>

<!-- Add 'scoped' attribute to limit CSS to this component only -->
<style scoped>
  * {
    margin: 0;
    padding: 0;
    -moz-box-sizing: border-box;
         box-sizing: border-box;
  }

  body, html { height:100%; width:100% }

  body {
    background: #F5F5F5;
    font-family: sans-serif;
  }
  .screen {
    position: relative;
    background: $black;
    margin: 0 auto;
    width: 100%;
    min-width: 295px;
    height: 100%;
    max-height: 515px;
    min-height: 480px;
  }
  .logo {
    display: block;
    position: relative;
    width: 70%;
    margin: 0 auto;
    border-radius: 40px;
  }

  .title {
    text-align: center;
    color: white;
    -webkit-text-stroke-width: 1px;
    -webkit-text-stroke-color: black;
    font-size: 4em;
    font-family: Georgia, serif;
  }

  .error {
    color: red;
  }

  .log {
    color: blue;
  }

  input[type='text'],
    input[type='password'] {
      width: 100%;
      margin-bottom: 0.5em;
      border: 1;
      border-radius: 7px;
      height: 2.5em;
      font-size: 1.2em;
      color: hsl(0, 0%, 40%);
      padding-left: 0.5em;
    }

  input[type='password'] {
      margin-bottom: 0.1em;
    }

    input[type='submit'] {
      margin-top: 0.7em;
      background: $blue;
      background: linear-gradient(lighten($blue, 2.5%), darken($blue, 2.5%));
      border-radius: 3px;
      border: 0;
      height: 2em;
      color: #fff;
      font-family: Georgia, serif;
      font-size: 1.3em;
      font-weight: 700;
      padding: 0 0.5em;

      &:hover {
        background: linear-gradient(lighten($blue, 7.5%), lighten($blue, 2.5%));
      }
    }

    input[type='submit'] {
        margin-top: 0.7em;
        background: $blue;
        background: linear-gradient(lighten($blue, 2.5%), darken($blue, 2.5%));
        border-radius: 3px;
        border: 0;
        height: 2em;
        color: #fff;
        font-family: Georgia, serif;
        font-size: 1.3em;
        font-weight: 700;
        color: black;
        padding: 0 0.5em;
        width: 100%;

        &:hover {
          background: linear-gradient(lighten($blue, 7.5%), lighten($blue, 2.5%));
        }
      }

    .ribbon {
      position: absolute;
      right: -5px; top: -5px;
      z-index: 1;
      overflow: hidden;
      width: 75px; height: 75px;
      text-align: right;
    }
    .ribbon span {
      font-size: 10px;
      font-weight: bold;
      color: #FFF;
      text-transform: uppercase;
      text-align: center;
      line-height: 20px;
      transform: rotate(45deg);
      -webkit-transform: rotate(45deg);
      width: 100px;
      display: block;
      background: #79A70A;
      background: linear-gradient(#C9C9C9 0%, #6B6B6B 100%);
      box-shadow: 0 3px 10px -5px rgba(0, 0, 0, 1);
      position: absolute;
      top: 19px; right: -21px;
    }
    .ribbon span::before {
      content: "";
      position: absolute; left: 0px; top: 100%;
      z-index: -1;
      border-left: 3px solid #6B6B6B;
      border-right: 3px solid transparent;
      border-bottom: 3px solid transparent;
      border-top: 3px solid #6B6B6B;
    }
    .ribbon span::after {
      content: "";
      position: absolute; right: 0px; top: 100%;
      z-index: -1;
      border-left: 3px solid transparent;
      border-right: 3px solid #6B6B6B;
      border-bottom: 3px solid transparent;
      border-top: 3px solid #6B6B6B;
    }

</style>
