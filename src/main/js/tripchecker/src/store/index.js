import Vue from 'vue'
import Vuex from 'vuex'
import actions from './actions'
import * as getters from './getters'
import mutations from './mutations'

Vue.use(Vuex)

const state = {
  auth: {
    isLoggedIn: false,
    pending: false,
    token: null
  }
}

const options = {
  state,
  mutations,
  actions,
  getters
}

const store = new Vuex.Store(options)

export default store
