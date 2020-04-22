<template>
  <div class="app-container">
    <eHeader :projects="projects" :query="query"/>
    <!--表格渲染-->
    <el-table v-loading="loading" :data="data" size="small" border style="width: 100%;">
      <el-table-column label="序号" width="60" align="center">
        <template slot-scope="scope">
          <div>{{ scope.$index + 1 }}</div>
        </template>
      </el-table-column>
      <el-table-column prop="project.name" label="所属项目" width="100px" align="center"/>
      <el-table-column prop="page_name" label="所属页面" width="100px" align="center"/>
      <el-table-column prop="element_name" label="元素名称" align="center"/>
      <el-table-column prop="element_alias" label="描叙" width="100px" align="center"/>
      <el-table-column prop="element_by" label="查找方式" width="100px" align="center"/>
      <el-table-column prop="element_locate" label="元素" width="150px" align="center"/>
      <el-table-column prop="element_index" label="元素下标" width="80px" align="center"/>
      <el-table-column label="操作" width="200px" align="center">
        <template slot-scope="scope">
          <edit v-if="checkPermission(['admin','pageelement_all','pageelement_edit'])" :data="scope.row" :projects="projects" :sup_this="sup_this"/>
          <el-popover
            v-if="checkPermission(['admin','pageelement_all','pageelement_delete'])"
            :ref="scope.row.id"
            placement="top"
            width="180">
            <p>确定删除本条数据吗？</p>
            <div style="text-align: right; margin: 0">
              <el-button size="mini" type="text" @click="$refs[scope.row.id].doClose()">取消</el-button>
              <el-button :loading="delLoading" type="primary" size="mini" @click="subDelete(scope.row.id)">确定</el-button>
            </div>
            <el-button slot="reference" type="danger" size="mini">删除</el-button>
          </el-popover>
        </template>
      </el-table-column>
    </el-table>
    <!--分页组件-->
    <el-pagination
      :total="total"
      style="margin-top: 8px;"
      layout="total, prev, pager, next, sizes"
      @size-change="sizeChange"
      @current-change="pageChange"/>
  </div>
</template>

<script>
import checkPermission from '@/utils/permission'
import initData from '@/mixins/initData'
import { del } from '@/api/pageelement'
import { parseTime } from '@/utils/index'
import { projectlist } from '@/api/project'
import eHeader from './module/header'
import edit from './module/edit'

export default {
  components: { eHeader, edit },
  mixins: [initData],
  data() {
    return {
      projects: [], delLoading: false, sup_this: this
    }
  },
  created() {
    this.getProjects()
    this.$nextTick(() => {
      this.init()
    })
  },
  methods: {
    parseTime,
    checkPermission,
    beforeInit() {
      this.url = 'api/pageelements/'
      const sort = 'id'
      const query = this.query
      const value = query.value
      this.params = { page: this.page, size: this.size, ordering: sort }
      if (value) { this.params['search'] = value }
      return true
    },
    subDelete(id) {
      this.delLoading = true
      del(id).then(res => {
        this.delLoading = false
        this.$refs[id].doClose()
        this.init()
        this.$message({
          showClose: true,
          type: 'success',
          message: '删除成功!',
          duration: 2500
        })
      }).catch(err => {
        this.delLoading = false
        this.$refs[id].doClose()
        console.log(err)
      })
    },
    getProjects() {
      projectlist().then(res => {
        const projectl = res.map(item => {
          return { ...item, label: item.name }
        })
        this.projects = projectl
      })
    }
  }
}
</script>

<style scoped>

</style>
