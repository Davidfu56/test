import request from '@/utils/request'

// 获取所有的菜单树
export function getMenuTree() {
  return request({
    url: 'weitest/menu/tree/',
    method: 'get'
  })
}

export function add(data) {
  return request({
    url: 'weitest/menus/',
    method: 'post',
    data
  })
}

export function del(id) {
  return request({
    url: 'weitest/menus/' + id + '/',
    method: 'delete'
  })
}

export function edit(id, data) {
  return request({
    url: 'weitest/menus/' + id + '/',
    method: 'put',
    data
  })
}

export function retrieve(id) {
  return request({
    url: 'weitest/menus/' + id + '/',
    method: 'get'
  })
}

export function save(id, data) {
  return request({
    url: 'weitest/menus/' + id + '/',
    method: 'patch',
    data
  })
}
