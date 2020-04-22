import request from '@/utils/request'

export function add(data) {
  return request({
    url: 'weitest/users/',
    method: 'post',
    data
  })
}

export function del(id) {
  return request({
    url: 'weitest/users/' + id + '/',
    method: 'delete'
  })
}

export function edit(id, data) {
  return request({
    url: 'weitest/users/' + id + '/',
    method: 'put',
    data
  })
}

export function updatePasswd(id, data) {
  return request({
    url: 'weitest/users/' + id + '/change-passwd/',
    method: 'post',
    data
  })
}

export function getUserList(name) {
  if (name) {
    return request({
      url: 'weitest/user/list/?name=' + name,
      method: 'get'
    })
  } else {
    return request({
      url: 'weitest/user/list/',
      method: 'get'
    })
  }
}

