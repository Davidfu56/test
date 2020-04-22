<template>
  <div class="formpage">
    <el-form ref="form" :model="form" label-position="top" size="mini">
      <sticky>
        <el-form-item>
          <div style="display: inline-block;margin: 0px 0px;float: right">
            <el-button v-if="checkPermission(['admin','testcase_all','testcase_edit']) && button == 'edit.vue' && $route.path === '/testcenter/testcase/detail'" type="primary" @click="edit">编辑</el-button>
            <el-button v-if="checkPermission(['admin','testcase_all','testcase_edit']) && button == 'save' && $route.path === '/testcenter/testcase/detail'" type="success" @click="doSubmit">保存</el-button>
            <el-button v-if="checkPermission(['admin','testcase_all','testcase_edit']) && button == 'save' && $route.path === '/testcenter/testcase/detail'" type="warning" @click="cancel">取消</el-button>
            <el-button v-if="checkPermission(['admin','testcase_all','testcase_edit']) && button == 'edit.vue' && $route.path === '/testcenter/testcase/detail'" @click="closeTag">返回</el-button>
            <el-button v-if="checkPermission(['admin','testcase_all','testcase_create']) && button == 'save' && $route.path === '/testcenter/testcase/create'" type="success" @click="doSubmit">保存</el-button>
            <el-button v-if="checkPermission(['admin','testcase_all','testcase_create']) && button == 'save' && $route.path === '/testcenter/testcase/create'" @click="closeTag">返回</el-button>
          </div>
        </el-form-item>
      </sticky>
      <p class="warn-content">用例配置</p>
      <el-card class="box-card">
        <el-row>
          <el-col :span="12">
            <el-form-item label="所属项目">
              <el-select v-model="form.project" :disabled="is_Readonly" style="width: 300px;" placeholder="请选择项目">
                <el-option v-for="item in projects" :key="item.id" :label="item.name" :value="item.id"/>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="功能模块">
              <el-input v-model="form.case_model" :readonly="is_Readonly" style="width: 300px;" placeholder="请输入功能模块"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="用例标题">
              <el-input v-model="form.case_title" :readonly="is_Readonly" style="width: 300px;" placeholder="请输入用例标题"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="用例类型">
              <el-input v-model="form.case_type" :readonly="is_Readonly" style="width: 300px;" placeholder="请输入用例类型"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="前置条件">
              <el-select v-model="form.case_setUp" disabled="is_Readonly" style="width: 300px;" placeholder="请选择前置条件">
                <el-option v-for="item in testcases" :key="item.id" :label="item.case_title" :value="item.id"/>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="后置条件">
              <el-select v-model="form.case_tearDown" disabled="is_Readonly" style="width: 300px;" placeholder="请选择后置条件">
                <el-option v-for="item in testcases" :key="item.id" :label="item.case_title" :value="item.id"/>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
      </el-card>
      <p class="warn-content">步骤配置</p>
      <el-card class="box-card">
        <el-row>
          <el-col :span="12">
          </el-col>
          <el-col :span="12">
          </el-col>
        </el-row>
      </el-card>
    </el-form>
  </div>
</template>

<script>
import checkPermission from '@/utils/permission'
import '@riophae/vue-treeselect/dist/vue-treeselect.css'
import Sticky from '@/components/Sticky'
import { add, edit, retrieve, testcaselist } from '@/api/testcase'
import { isvalidChinaese } from '@/utils/validate'
import { projectlist } from '@/api/project'

var validChinaese = (rule, value, callback) => {
  if (!value) {
    callback(new Error('请输入项目英文名称'))
  } else if (!isvalidChinaese(value)) {
    callback(new Error('不能输入中文'))
  } else {
    callback()
  }
}
export default {
  components: { Sticky },
  data() {
    return {
      is_Readonly: true,
      loading: false,
      button: 'edit.vue',
      form: {
        project: '',
        case_model: '',
        case_title: '',
        case_type: '',
        case_setUp: '',
        case_tearDown: ''
      },
      projects: [],
      testcases: [],
      rules: {
        name: [
          { required: true, trigger: 'blur', validator: validChinaese }
        ],
        alias: [
          { required: true, message: '请输入项目描叙', trigger: 'blur' }
        ],
        project_type: [
          { required: true, message: '请选择项目类型', trigger: 'blur' }
        ],
        repo_mode: [
          { required: true, message: '请选择模式', trigger: 'blur' }
        ],
        owner: [
          { required: true, message: '请选择所有者', trigger: 'blur' }
        ]
      }
    }
  },
  created() {
    projectlist().then(res => {
      const projectl = res.map(item => {
        return { ...item, label: item.name }
      })
      this.projects = projectl
    })
    testcaselist().then(res => {
      const testcasel = res.map(item => {
        return { ...item, label: item.case_title }
      })
      this.testcases = testcasel
    })
    if (this.$route.path === '/testcenter/testcase/detail') {
      this.$nextTick(() => {
        this.init()
      })
    } else {
      this.button = 'save'
      this.is_Readonly = false
    }
  },
  methods: {
    checkPermission,
    init() {
      retrieve(this.$route.query.id).then(res => {
        this.form = res
      })
    },
    filterMethod(query, item) {
      return item.label.indexOf(query) > -1
    },
    closeTag() {
      this.$store.dispatch('delView', this.$store.state.tagsView.visitedViews.slice(-1)[0])
      this.$router.go(-1)
    },
    cancel() {
      this.button = 'edit.vue'
      this.is_Readonly = true
    },
    edit() {
      this.button = 'save'
      this.is_Readonly = false
    },
    doSubmit() {
      this.$refs['form'].validate((valid) => {
        if (valid) {
          this.loading = true
          if (this.$route.path === '/testcenter/testcase/detail') {
            edit(this.form.id, this.form).then(res => {
              this.resetForm()
              this.$message({
                showClose: true,
                type: 'success',
                message: '修改成功!',
                duration: 2500
              })
              this.loading = false
              this.button = 'edit.vue'
              this.init()
            }).catch(err => {
              this.loading = false
              console.log(err.response.data.detail)
            })
          } else {
            add(this.form).then(res => {
              this.resetForm()
              this.$message({
                showClose: true,
                type: 'success',
                message: '添加成功!',
                duration: 2500
              })
              this.loading = false
              this.closeTag()
            }).catch(err => {
              this.loading = false
              console.log(err.response.data.detail)
            })
          }
        }
      })
    },
    resetForm() {
      this.$refs['form'].resetFields()
      this.form = {
        project: '',
        case_model: '',
        case_title: '',
        case_type: '',
        case_setUp: '',
        case_tearDown: ''
      }
    }
  }
}
</script>

<style scoped>
  .formpage{
    margin: 30px;
  }
  .warn-content{
    padding: 0.5rem;
    font-size: 15px;
  }
  .el-transfer >>> .el-transfer-panel{
    border: 1px solid #ebeef5;
    border-radius: 4px;
    overflow: hidden;
    background: #fff;
    display: inline-block;
    vertical-align: middle;
    width: 350px;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    position: relative;
  }
</style>

