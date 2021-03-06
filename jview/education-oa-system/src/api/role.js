import request from '@/utils/request'

// 获取角色列表
export function getRoleList() {
  return request({
    url: '/role',
    method: 'get'
  })
}

// 修改角色状态
export function updateRoleStatus(roleInfo) {
  return request({
    url: `/role`,
    method: 'put',
    data: roleInfo
  })
}

// 添加角色
export function addRole(data) {
  return request({
    url: `/role`,
    method: 'post',
    data
  })
}

export function deleteRoleById(id) {
  return request({
    url: `/role/${id}`,
    method: 'delete'
  })
}
