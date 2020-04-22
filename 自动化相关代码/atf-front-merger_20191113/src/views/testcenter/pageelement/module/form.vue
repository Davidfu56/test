<template>
  <el-dialog :append-to-body="true" :visible.sync="dialog" :title="isAdd ? '新增元素' : '编辑元素'" width="850px">
    <el-form ref="form" :model="form" :rules="rules" size="small" label-width="80px">
      <el-row>
        <el-col :span="12">
          <el-form-item label="所属项目">
            <treeselect v-model="form.project" :options="projects" style="width: 300px;" placeholder="请选择项目" />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="所属页面" prop="page_name">
            <el-input v-model="form.page_name" style="width: 300px;"/>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item label="元素名称" prop="element_name">
            <el-input v-model="form.element_name" style="width: 300px;" placeholder="请输入元素名称" />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="描叙" prop="element_alias">
            <el-input v-model="form.element_alias" style="width: 300px;"/>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item label="查找方式" prop="element_by">
            <el-input v-model="form.element_by" style="width: 300px;"/>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="元素" prop="element_locate">
            <el-input v-model="form.element_locate" style="width: 300px;"/>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item label="元素下标" prop="element_index">
            <el-input v-model="form.element_index" style="width: 300px;"/>
          </el-form-item>
        </el-col>
      </el-row>
    </el-form>
    <div slot="footer" class="dialog-footer">
      <el-button type="text" @click="cancel">取消</el-button>
      <el-button :loading="loading" type="primary" @click="doSubmit">确认</el-button>
    </div>
  </el-dialog>
</template>

<script>
import { add, edit } from '@/api/pageelement'
import Treeselect from '@riophae/vue-treeselect'
import '@riophae/vue-treeselect/dist/vue-treeselect.css'
import { isvalidChinaese } from '@/utils/validate'
var validChinaese = (rule, value, callback) => {
  if (!value) {
    callback(new Error('请输入英文名称'))
  } else if (!isvalidChinaese(value)) {
    callback(new Error('不能输入中文'))
  } else {
    callback()
  }
}
export default {
  name: 'Form',
  components: { Treeselect },
  props: {
    projects: {
      type: Array,
      required: true
    },
    isAdd: {
      type: Boolean,
      required: true
    },
    sup_this: {
      type: Object,
      default: null
    }
  },
  data() {
    return {
      dialog: false,
      loading: false,
      form: { project: null, page_name: '', element_name: '', element_alias: '', element_by: '', element_locate: '', element_index: null },
      rules: {
        page_name: [
          { required: true, trigger: 'blur', validator: validChinaese }
        ],
        element_name: [
          { required: true, max: 10, trigger: 'blur', validator: validChinaese }
        ],
        element_by: [
          { required: true, message: '查找方式不能为空', trigger: 'blur' }
        ],
        element_locate: [
          { required: true, message: '元素定位不能为空', trigger: 'blur' }
        ],
        element_index: [
          { message: '请输入元素下标', trigger: 'blur' }
        ]
      }
    }
  },
  methods: {
    cancel() {
      this.resetForm()
    },
    doSubmit() {
      this.$refs['form'].validate((valid) => {
        if (valid) {
          this.loading = true
          if (this.isAdd) {
            this.doAdd()
          } else this.doEdit()
        } else {
          return false
        }
      })
    },
    doAdd() {
      add(this.form).then(res => {
        this.resetForm()
        this.$message({
          showClose: true,
          type: 'success',
          message: '元素添加成功',
          duration: 2500
        })
        this.loading = false
        this.$parent.$parent.init()
      }).catch(err => {
        this.loading = false
        console.log(err)
      })
    },
    doEdit() {
      edit(this.form.id, this.form).then(res => {
        this.resetForm()
        this.$message({
          showClose: true,
          type: 'success',
          message: '修改成功!',
          duration: 2500
        })
        this.loading = false
        this.sup_this.init()
      }).catch(err => {
        this.loading = false
        console.log(err)
      })
    },
    resetForm() {
      this.dialog = false
      this.$refs['form'].resetFields()
      this.roleIds = []
      this.form = { project_name: null, page_name: '', element_name: '', element_alias: '', element_by: '', element_locate: '', element_index: null }
    }
  }
}
</script>

<style scoped>

</style>
