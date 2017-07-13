import fetch from 'isomorphic-fetch'
import * as types from './mutation-types'
import router from '../router'

const login = ({ commit }, creds) => {
  commit(types.LOGIN) // show spinner
  return fetch('/api/login', {
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

const sendCoordinates = ({ getters }) => {
  const token = getters.getToken
  console.log(token)
  return fetch('/api/coordinate', {
    method: 'POST',
    headers: {
      Authorization: 'Bearer ' + token
    }
  })
}

export default {
  [types.LOGIN]: login,
  [types.LOGOUT]: logout,
  [types.SEND_COORDINATES]: sendCoordinates
}

