<template>
  <div>
    <el-button size="mini" type="success" @click="to">编辑</el-button>
    <eForm ref="form" :projects="projects" :sup_this="sup_this" :is-add="false"/>
  </div>
</template>
<script>
import eForm from './form'
export default {
  components: { eForm },
  props: {
    projects: {
      type: Array,
      required: true
    },
    data: {
      type: Object,
      required: true
    },
    // index.vue 的this 可用于刷新数据
    sup_this: {
      type: Object,
      required: true
    }
  },
  methods: {
    to() {
      const _this = this.$refs.form
      let did = null
      if (this.data.project !== null) {
        did = this.data.project.id
      }
      _this.form = {
        id: this.data.id,
        page_name: this.data.page_name,
        element_name: this.data.element_name,
        element_alias: this.data.element_alias,
        element_by: this.data.element_by,
        element_locate: this.data.element_locate,
        project: did,
        element_index: this.data.element_index }
      _this.dialog = true
    }
  }
}
</script>

<style scoped>
  div{display: inline-block;margin-right: 3px;}
</style>
