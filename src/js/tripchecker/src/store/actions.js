import fetch from 'isomorphic-fetch'
import * as types from './mutation-types'

const login = ({ commit }, creds) => {
  commit(types.LOGIN) // show spinner
  return fetch('http://localhost:8080/login', {
    method: 'POST',
    headers: {
      Accept: 'application/json'
//      'Content-Type': 'application/json; charset=utf-8'
    },
    body: JSON.stringify(creds)
  })
    .then((response) => {
      console.log('response: ', response)
      if (response.status === 200 && response.token) {
        console.log(response.token)
      }
      response.json().then(json => console.log)
    })
}

const logout = ({ commit }) => {
  localStorage.removeItem('token')
  commit(types.LOGOUT)
}

export default {
  [types.LOGIN]: login,
  [types.LOGOUT]: logout
}

