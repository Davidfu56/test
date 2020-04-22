import request from '@/utils/request'

export function getAllProject() {
  return request({
    url: 'api/projects/projects/',
    method: 'get'
  })
}

export function add(data) {
  return request({
    url: 'api/projects/projects/',
    method: 'post',
    data
  })
}

export function retrieve(id) {
  return request({
    url: 'api/projects/projects/' + id + '/',
    method: 'get'
  })
}

export function del(id) {
  return request({
    url: 'api/projects/projects/' + id + '/',
    method: 'delete'
  })
}

export function edit(id, data) {
  return request({
    url: 'api/projects/projects/' + id + '/',
    method: 'put',
    data
  })
}

export function copy(data) {
  return request({
    url: 'api/projects/projects/copy/',
    method: 'post',
    data
  })
}

export function projectlist(data) {
  return request({
    url: 'api/projects/projects/getlist/',
    method: 'get',
    data
  })
}
