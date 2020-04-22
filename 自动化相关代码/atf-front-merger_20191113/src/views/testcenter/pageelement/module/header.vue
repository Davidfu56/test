<template>
  <div class="head-container">
    <!-- 搜索 -->
    <el-input v-model="query.value" clearable placeholder="输入关键字搜索" style="width: 200px;" class="filter-item" @keyup.enter.native="toQuery"/>
    <el-select v-model="query.project" clearable placeholder="所属项目" class="filter-item" style="width: 90px" @change="toQuery">
      <el-option v-for="item in projects" :key="item.id" :label="item.name" :value="item.id"/>
    </el-select>
    <el-button class="filter-item" size="mini" type="primary" icon="el-icon-search" @click="toQuery">搜索</el-button>
    <!-- 新增 -->
    <div style="display: inline-block;margin: 0px 2px;">
      <el-button
        v-if="checkPermission(['admin','pageelement_all','pageelement_create'])"
        class="filter-item"
        size="mini"
        type="primary"
        icon="el-icon-plus"
        @click="$refs.form.dialog = true">新增</el-button>
      <eForm ref="form" :projects="projects" :is-add="true"/>
    </div>
    <!-- 导出 -->
    <el-button
      v-if="checkPermission(['admin','pageelement_all'])"
      :loading="downloadLoading"
      size="mini"
      class="filter-item"
      type="primary"
      icon="el-icon-download"
      @click="download">导出</el-button>
  </div>
</template>

<script>
import checkPermission from '@/utils/permission' // 权限判断函数
import eForm from './form'
// 查询条件
export default {
  components: { eForm },
  props: {
    projects: {
      type: Array,
      required: true
    },
    query: {
      type: Object,
      required: true
    }
  },
  data() {
    return {
      downloadLoading: false
    }
  },
  methods: {
    checkPermission,
    // 去查询
    toQuery() {
      this.$parent.page = 1
      this.$parent.init()
    },
    // 新增
    download() {
      this.downloadLoading = true
      import('@/vendor/Export2Excel').then(excel => {
        const tHeader = ['ID', '所属项目', '所属页面', '元素名称', '描叙', '查找方式', '元素', '元素下标']
        const filterVal = ['id', 'project.name', 'page_name', 'element_name', 'element_alias', 'element_by', 'element_locate', 'element_index']
        const data = this.formatJson(filterVal, this.$parent.data)
        excel.export_json_to_excel({
          header: tHeader,
          data,
          filename: 'page-element'
        })
        this.downloadLoading = false
      })
    },
    // 数据转换
    formatJson(filterVal, jsonData) {
      return jsonData.map(v => filterVal.map())
    }
  }
}
</script>
