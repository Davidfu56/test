import request from '@/utils/request'

// 获取所有的organization
export function getOrganizationTree() {
  return request({
    url: 'weitest/organization/tree/',
    method: 'get'
  })
}

// 获取所有的user
export function getOrganizationUserTree() {
  return request({
    url: 'weitest/organization/user/tree/',
    method: 'get'
  })
}

export function add(data) {
  return request({
    url: 'weitest/organizations/',
    method: 'post',
    data
  })
}

export function del(id) {
  return request({
    url: 'weitest/organizations/' + id + '/',
    method: 'delete'
  })
}

export function edit(id, data) {
  return request({
    url: 'weitest/organizations/' + id + '/',
    method: 'put',
    data
  })
}
