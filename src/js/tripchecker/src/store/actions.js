import * as types from './mutation-types'

const login = ({ commit }, creds) => {
  commit(types.LOGIN) // show spinner
  const data = new FormData()
  data.append('json', JSON.stringify(creds))
  console.log(creds)
  return fetch('http://localhost:8080/login', {
    method: 'POST',
//    mode: 'cors',
    data: data
  })
    .then((data) => {
      console.log(data)
      data.json().then(json => console.log)
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

