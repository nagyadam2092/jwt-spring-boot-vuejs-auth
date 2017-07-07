import * as types from './mutation-types'

const mutations = {
  [types.LOGIN] (state) {
    state.auth.pending = true
  },
  [types.LOGIN_SUCCESS] (state, { token }) {
    state.auth.isLoggedIn = true
    state.auth.pending = false
    state.auth.token = token
    localStorage.setItem('JWT', token)
    console.log(state)
  },
  [types.LOGIN_WRONG_CREDENTIALS] (state) {
    state.pending = false
    state.auth.isLoggedIn = false
    console.log(types.LOGIN_WRONG_CREDENTIALS, state)
  },
  [types.LOGIN_ERROR] (state) {
    state.pending = false
    state.auth.isLoggedIn = false
    console.log(types.LOGIN_ERROR, state)
  },
  [types.LOGOUT] (state) {
    state.auth.isLoggedIn = false
  }
}

export default mutations
