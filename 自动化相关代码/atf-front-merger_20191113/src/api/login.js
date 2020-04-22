import request from '@/utils/request'

export function login(username, password) {
  return request({
    url: 'weitest/login/',
    method: 'post',
    data: {
      username,
      password
    }
  })
}

export function getInfo() {
  return request({
    url: 'weitest/userinfo/',
    method: 'get'
  })
}

export function buildMenus() {
  return request({
    url: 'weitest/build/menus/',
    method: 'get'
  })
}
