import request from '@/utils/request'

export function add(data) {
  return request({
    url: 'api/testcases/testcase/',
    method: 'post',
    data
  })
}

export function retrieve(id) {
  return request({
    url: 'api/testcases/testcase/' + id + '/',
    method: 'get'
  })
}

export function del(id) {
  return request({
    url: 'api/testcases/testcase/' + id + '/',
    method: 'delete'
  })
}

export function edit(id, data) {
  return request({
    url: 'api/testcases/testcase/' + id + '/',
    method: 'put',
    data
  })
}

export function copy(data) {
  return request({
    url: 'api/testcases/testcase/copy/',
    method: 'post',
    data
  })
}

export function testcaselist(data) {
  return request({
    url: 'api/testcases/testcase/getlist/',
    method: 'get',
    data
  })
}
