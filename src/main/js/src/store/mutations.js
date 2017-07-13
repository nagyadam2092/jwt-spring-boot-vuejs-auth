import * as types from './mutation-types'

const mutations = {
  [types.LOGIN] (state) {
    state.auth.pending = true
  },
  [types.LOGIN_SUCCESS] (state, { token, username }) {
    state.auth.isLoggedIn = true
    state.auth.pending = false
    state.auth.token = token
    state.auth.username = username
    localStorage.setItem('JWT', token)
  },
  [types.LOGIN_WRONG_CREDENTIALS] (state) {
    state.pending = false
    state.auth.isLoggedIn = false
  },
  [types.LOGIN_ERROR] (state) {
    state.pending = false
    state.auth.isLoggedIn = false
  },
  [types.LOGOUT] (state) {
    localStorage.removeItem('JWT')
    state.auth.isLoggedIn = false
  }
}

export default mutations
