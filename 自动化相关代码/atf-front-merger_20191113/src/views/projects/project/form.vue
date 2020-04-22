<template>
  <div class="formpage">
    <el-form ref="form" :model="form" :rules="rules" label-position="top" size="small">
      <sticky>
        <el-form-item>
          <div style="display: inline-block;margin: 0px 0px;float: right">
            <el-button v-if="checkPermission(['admin','project_all','project_edit']) && button == 'edit.vue' && $route.path === '/projects/project/detail'" type="primary" @click="edit">编辑</el-button>
            <el-button v-if="checkPermission(['admin','project_all','project_edit']) && button == 'save' && $route.path === '/projects/project/detail'" type="success" @click="doSubmit">保存</el-button>
            <el-button v-if="checkPermission(['admin','project_all','project_edit']) && button == 'save' && $route.path === '/projects/project/detail'" type="warning" @click="cancel">取消</el-button>
            <el-button v-if="checkPermission(['admin','project_all','project_edit']) && button == 'edit.vue' && $route.path === '/projects/project/detail'" @click="closeTag">返回</el-button>
            <el-button v-if="checkPermission(['admin','project_all','project_create']) && button == 'save' && $route.path === '/projects/project/create'" type="success" @click="doSubmit">保存</el-button>
            <el-button v-if="checkPermission(['admin','project_all','project_create']) && button == 'save' && $route.path === '/projects/project/create'" @click="closeTag">返回</el-button>
          </div>
        </el-form-item>
      </sticky>
      <p class="warn-content">基础配置</p>
      <el-card class="box-card">
        <el-row>
          <el-col :span="12">
            <el-form-item label="项目名称" prop="name">
              <el-input v-model="form.name" :readonly="is_Readonly" style="width: 300px;" />
            </el-form-item>
            <el-form-item label="项目描叙" prop="alias">
              <el-input v-model="form.alias" :readonly="is_Readonly" style="width: 300px;" />
            </el-form-item>
            <el-form-item label="项目类型" prop="project_type">
              <el-select v-model="form.project_type" :disabled="is_Readonly" style="width: 300px;" placeholder="请选择项目类型">
                <el-option v-for="item in project_types" :key="item.key" :label="item.value" :value="item.key"/>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="项目子类型" prop="repo_mode">
              <el-select v-model="form.repo_mode" :disabled="is_Readonly" style="width: 300px;" placeholder="请选择项目子类型">
                <el-option v-for="item in repo_modes" :key="item.key" :label="item.value" :value="item.key"/>
              </el-select>
            </el-form-item>
            <el-form-item v-if="$route.path === '/deploy/projects/detail'" label="所有者" prop="owner">
              <el-input v-model="form.owner" disabled="disabled" style="width: 300px;"/>
            </el-form-item>
          </el-col>
        </el-row>
      </el-card>
      <p class="warn-content">基础配置</p>
      <el-card class="box-card">
        <el-row>
          <el-col :span="12">
            <el-form-item>
              <el-tooltip class="item" effect="dark" placement="top">
                <div slot="content"><span>测试需要的apk文件<br/>例如：微信apk</span></div>
                <span class="x-info">app文件<i class="el-icon-info"></i></span>
              </el-tooltip>
              <el-input v-model="form.apk_path" :readonly="is_Readonly" style="width: 300px;"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item>
              <el-tooltip class="item" effect="dark" placement="top">
                <div slot="content"><span>UI自动化基础配置参数<br/>例：capabilities参数</span></div>
                <span class="x-info">UI自动化基础配置参数<i class="el-icon-info"></i></span>
              </el-tooltip>
              <codemirror v-model="form.ui_capabilities" :options="cmOptions" class="x-code" ></codemirror>
            </el-form-item>
          </el-col>
        </el-row>
      </el-card>
    </el-form>
  </div>
</template>

<script>
import checkPermission from '@/utils/permission'
// codemirror
import { codemirror } from 'vue-codemirror'
import 'codemirror/lib/codemirror.css'
import 'codemirror/theme/monokai.css'
import 'codemirror/addon/hint/show-hint.css'
import 'codemirror/addon/hint/show-hint.js'
import 'codemirror/mode/shell/shell.js'
import Sticky from '@/components/Sticky'
import { getKey } from '@/api/dict'
import { getDeviceList } from '@/api/device'
import { add, edit, retrieve } from '@/api/project'
import { isvalidChinaese } from '@/utils/validate'
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
  components: { codemirror, Sticky },
  data() {
    return {
      is_Readonly: true,
      cmOptions: {
        tabSize: 12,
        styleActiveLine: false,
        lineNumbers: true,
        line: true,
        mode: 'text/x-sh',
        lineWrapping: false,
        theme: 'monokai',
        readOnly: true
      },
      loading: false,
      button: 'edit.vue',
      form: {
        name: '',
        alias: '',
        project_type: '',
        apk_path: '',
        ui_capabilities: '',
        repo_mode: '',
        owner: ''
      },
      project_types: [],
      repo_modes: [],
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
        ]
      }
    }
  },
  created() {
    getKey('PROJECT_TYPE', 'REPO_TYPE').then(res => {
      this.project_types = res[0].PROJECT_TYPE.filter(t => t.key !== 'all')
      this.repo_modes = res[1].REPO_TYPE
    })
    // this.getHost()
    if (this.$route.path === '/deploy/projects/detail') {
      this.$nextTick(() => {
        this.init()
      })
    } else {
      this.button = 'save'
      this.is_Readonly = false
      this.cmOptions.readOnly = false
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
      this.cmOptions.readOnly = true
    },
    edit() {
      this.button = 'save'
      this.is_Readonly = false
      this.cmOptions.readOnly = false
    },
    doSubmit() {
      this.$refs['form'].validate((valid) => {
        if (valid) {
          this.loading = true
          if (this.$route.path === '/deploy/projects/detail') {
            edit(this.form.id, this.form).then(res => {
              this.resetForm()
              this.$message({
                showClose: true,
                type: 'success',
                message: '修改成功!',
                duration: 2500
              })
              this.loading = false
              this.cmOptions.readOnly = true
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
        name: '',
        alias: '',
        project_type: '',
        apk_path: '',
        ui_capabilities: '',
        repo_mode: '',
        owner: ''
      }
    },
    getHost() {
      getDeviceList('Linux').then(res => {
        const _this = this
        res.forEach(function(data, index) {
          data.id = data.id.toString()
          const host = { key: data.id, label: data.ip }
          _this.transfer_data.push(host)
        })
      })
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
  .x-info {
    height: 18px;
    line-height: 18px;
    color: #303133;
    cursor: pointer;
    border-bottom: 1px solid #ebeef5;
    font-size: 14px;
    font-weight: 500;
    -webkit-transition: border-bottom-color .3s;
    transition: border-bottom-color .3s;
    outline: 0;
    margin: 10px;
  }
  .x-div {
    margin-left: 10px;
  }
  .el-transfer {
    margin: 30px;
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
  .vue-codemirror >>> .CodeMirror {
    border: 1px solid #eee;
    height: 150px;
    width: 400px;
  }
  .x-code {
    padding: 10px;
    line-height: 20px;
  }
</style>

