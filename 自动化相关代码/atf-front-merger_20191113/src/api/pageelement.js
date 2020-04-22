import request from '@/utils/request'

export function add(data) {
  return request({
    url: 'api/pageelements/',
    method: 'post',
    data
  })
}

export function retrieve(id) {
  return request({
    url: 'api/pageelements/' + id + '/',
    method: 'get'
  })
}

export function del(id) {
  return request({
    url: 'api/pageelements/' + id + '/',
    method: 'delete'
  })
}

export function edit(id, data) {
  return request({
    url: 'api/pageelements/' + id + '/',
    method: 'put',
    data
  })
}

export function copy(data) {
  return request({
    url: 'api/pageelements/copy/',
    method: 'post',
    data
  })
}
