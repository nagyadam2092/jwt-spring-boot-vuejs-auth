import fetch from 'isomorphic-fetch'
import * as types from './mutation-types'
import router from '../router'

const login = ({ commit }, creds) => {
  commit(types.LOGIN) // show spinner
  return fetch('http://localhost:8080/login', {
    method: 'POST',
    headers: {
      Accept: 'application/json'
    },
    body: JSON.stringify(creds)
  })
}

const logout = ({ commit }) => {
  commit(types.LOGOUT)
  localStorage.removeItem('JWT')
  router.push('/login')
}

export default {
  [types.LOGIN]: login,
  [types.LOGOUT]: logout
}

