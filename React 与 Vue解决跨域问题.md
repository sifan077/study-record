# React 与 Vue解决跨域问题

### 1. React解决跨域

1. 第一步，使用 `npm i http-proxy-middleware`安装中间件；
2. 第二步，在src文件夹下创建`setProxy.js`文件，写入如下代码:

   ```javascript
   // setupProxy.js
   const {createProxyMiddleware} = require('http-proxy-middleware');

   module.exports = function (app) {
       app.use(
           '/api',
           createProxyMiddleware({
               target: 'https://print404.top', // 请求的后端的地址
               changeOrigin: true,
               pathRewrite: {'^/api': ''}
           })
       );
   };
   ```

3. 第三步，配置`axios`的`baseUR`,创建`http.js`作为`axios`的配置文件，写入如下基本配置,:

   ```javascript
   import axios from "axios";
   
   
   axios.defaults.baseURL = "/api";
   axios.defaults.withCredentials = true
   axios.defaults.timeout = 100000
   // axios请求拦截器
   axios.interceptors.request.use(
       config => {
           return config
       },
       error => {
           return Promise.reject(error)
       }
   )
   // axios响应拦截器
   axios.interceptors.response.use(
       function (response) {
           return response
       },
       function (error) {
           return Promise.reject(error)
       }
   )
   ```


4. 第四步，在`index.js`引入`axios`的配置文件；

5. 第五步，使用如下代码测试结果是否能正常打印:

   ```javascript
       useEffect(
           () => {
               axios.get('/').then(res => console.log(res.data))
           }, [])
   ```

   

### 2. Vue3解决跨域

1. 第一步，在`src`文件夹下找到或者创建`vue.config.js`文件，写入如下内容:

   ```javascript
   const {defineConfig} = require('@vue/cli-service')
   module.exports = defineConfig({
       devServer: {
           proxy: {
               '/api': {
                   target: 'http://localhost:8080/',  // target host
                   ws: true,  // proxy websockets
                   changeOrigin: true,  // needed for virtual hosted sites
                   pathRewrite: {
                       '^/api': ''  // rewrite path
                   }
               },
           }
       }
   })
   
   ```

2. 第二步，配置`axios`,基本同上；

3. 第三步，测试代码如下，点击按钮正常打印即为可以跨域请求:

   ```vue
   <template>
     <div>
       <h1>测试跨域问题</h1>
       <el-button @click="clickDemo">ajax</el-button>
     </div>
   </template>
   
   <script setup>
   import axios from "axios";
   
   const clickDemo = () => {
     axios.get("/").then(res => {
       console.log(res.data)
     }).catch(error => {
       console.log(error)
     })
   }
   </script>
   
   ```

   

