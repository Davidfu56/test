<template>
  <div class="app-container">
    <div class="head-container">
      <!-- 搜索 -->
      <el-input v-model="query.case_title" clearable placeholder="输入用例标题搜索" style="width: 200px;" class="filter-item" @keyup.enter.native="toQuery"/>
      <el-select v-model="query.project" clearable placeholder="所属项目" class="filter-item" style="width: 90px" @change="toQuery">
        <el-option v-for="item in projects" :key="item.id" :label="item.name" :value="item.id"/>
      </el-select>
      <el-select v-model="query.flag" clearable placeholder="状态" class="filter-item" style="width: 90px" @change="toQuery">
        <el-option v-for="item in enabledTypeOptions" :key="item.key" :label="item.display_name" :value="item.key"/>
      </el-select>
      <el-button class="filter-item" size="mini" type="primary" icon="el-icon-search" @click="toQuery">搜索</el-button>
      <!-- 新增 -->
      <el-button v-if="checkPermission(['admin','testcase_all','testcase_create'])" :projects="projects" class="filter-item" size="mini" type="primary" icon="el-icon-plus" @click="toCreate">新增</el-button>
      <!-- 导出 -->
      <el-button v-if="checkPermission(['admin','testcase_all'])" :loading="downloadLoading" size="mini" class="filter-item" type="primary" icon="el-icon-download" @click="download">导出</el-button>
    </div>
    <!--表格渲染-->
    <div class="tab-container">
      <el-table v-loading="loading" :data="data" size="small" border style="width: 100%;">
        <el-table-column label="序号" width="60" align="center">
          <template slot-scope="scope">
            <div>{{ scope.$index + 1 }}</div>
          </template>
        </el-table-column>
        <el-table-column prop="id" label="用例编号" width="100px" align="center"/>
        <el-table-column prop="project" label="所属项目" width="100px" align="center"/>
        <el-table-column prop="case_model" label="功能模块" align="center"/>
        <el-table-column prop="case_title" label="用例标题" align="center"/>
        <el-table-column prop="case_type" label="用例类型" width="100px" align="center"/>
        <el-table-column prop="owner" label="所有者" width="100px" align="center"/>
        <el-table-column label="状态" width="50px">
          <template slot-scope="scope">
            <span>{{ scope.row.flag ? '启用':'禁用' }}</span>
          </template>
        </el-table-column>
        <el-table-column label="操作" width="200px" align="center">
          <template slot-scope="scope">
            <el-button v-if="checkPermission(['admin','testcase_all','testcase_list'])" :projects="projects" size="mini" type="primary" @click="toDetail(scope.row.id)">详情</el-button>
            <div style="display: inline-block;margin: 0px 1px;">
              <el-button v-if="checkPermission(['admin','testcase_all'])" size="mini" type="primary" @click="toCopy(scope.row.id)">复制</el-button>
            </div>
            <el-popover
              v-if="checkPermission(['admin','testcase_all','testcase_delete'])"
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
    </div>
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
import { del, copy } from '@/api/testcase'
import { parseTime } from '@/utils/index'
import { projectlist } from '@/api/project'

export default {
  mixins: [initData],
  data() {
    return {
      projects: [],
      enabledTypeOptions: [
        { key: 'True', display_name: '启用' },
        { key: 'False', display_name: '禁用' }
      ],
      delLoading: false,
      downloadLoading: false,
      query: {
        project: undefined,
        test_title: undefined,
        flag: undefined
      }
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
      this.url = 'api/testcases/testcase/'
      const sort = 'id'
      this.params = this.query
      this.params['page'] = this.page
      this.params['size'] = this.size
      this.params['ordering'] = sort
      return true
    },
    toQuery() {
      this.page = 1
      this.init()
    },
    // 新增
    toCreate() {
      this.$router.push({
        path: 'testcase/create'
      })
    },
    // 详情
    toDetail(id) {
      this.$router.push({
        path: 'testcase/detail',
        query: { id: id }
      })
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
    toCopy(id) {
      this.$confirm('是否复制本项目?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        const form = { id: id }
        copy(form).then(res => {
          this.delLoading = false
          console.log(this)
          this.init()
          this.$message({
            showClose: true,
            type: 'success',
            message: '复制成功!',
            duration: 2500
          })
        }).catch(err => {
          this.delLoading = false
          console.log(err)
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '取消操作'
        })
      })
    },
    getProjects() {
      projectlist().then(res => {
        const projectl = res.map(item => {
          return { ...item, label: item.name }
        })
        this.projects = projectl
      })
    },
    download() {
      this.downloadLoading = true
      import('@/vendor/Export2Excel').then(excel => {
        const tHeader = ['用例编号', '所属项目', '功能模块', '用例标题', '用例类型', '所有者', '状态']
        const filterVal = ['id', 'project.name', 'case_model', 'case_title', 'case_type', 'owner', 'flag']
        const data = this.formatJson(filterVal, this.data)
        excel.export_json_to_excel({
          header: tHeader,
          data,
          filename: 'testcase'
        })
        this.downloadLoading = false
      })
    },
    formatJson(filterVal, jsonData) {
      return jsonData.map(v => filterVal.map(j => {
        if (j === 'timestamp') {
          return parseTime(v[j])
        } else {
          return v[j]
        }
      }))
    }
  }
}
</script>

<style scoped>

</style>
