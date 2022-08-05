# Vue3 学习

### 入门的 TodoList 小案例

1. 最上方是一个输入框，可以输入任务添加，本质是一个表单；
2. 中间是对任务的遍历展示，任务后面跟着完成按钮，点击即可完成；
3. 最后是完成所有任务。

```vue
<template>
    <form @submit="addTodo">
        <input type="text" v-model="todo.todo">
        <input type="submit" value="添加">
    </form>

    <ul>
        <template :key="item" v-for="(item, index) in lists.list">
            <li v-if="item.complete">
                {{ item.task }}
                <button @click="delTodo(index)">完成</button>
            </li>
        </template>

    </ul>
    <hr>
    <button @click="clear">清楚所有任务</button>
</template>

<script setup>
import { reactive } from "vue";

let todo = reactive({ todo: "" });
let lists = reactive({ list: [{ task: "吃饭", complete: true }, { task: "睡觉", complete: true }] })
const addTodo = (event) => {
    event.preventDefault();
    lists.list.push({ task: todo.todo, complete: true });
}
const delTodo = (index) => {
    lists.list[index].complete = false;
}
const clear = () => {
    lists.list = lists.list.map((item) => {
        item.complete = false;
        return item;
    })
}
</script>

<style scoped>
</style>
```

* `@submit`可以指定表单提交时执行的方法；
* ` v-model="todo.todo"`把表单输入与下面声明的`reactive`响应式变量绑定；
* `<ul :key="item" v-for="(item,index) in lists.list">`使用`v-for`遍历，在其标签内部可以访问到`item`和`index`;
* `<li v-if="item.complete">`决定是否显示出来；
*   `<button @click="delTodo(index)">完成</button>`点击完成按钮去将指定位置任务完成；
* ` event.preventDefault();`去除默认行为，提交表单将不会刷新页面。

------



## 1. vue 语法基础

### 1.1 双括号{{}}

文本中插入声明的值：使用双大括号写法：即 {{msg}}

```vue
<template>
  <hr>
  <h1>{{ a }}</h1>
</template>

<script setup>

let a = 1;
</script>

<style scoped>
</style>
```

### 1.2 v-html

文本插槽默认是文本，如果渲染成html，需要使用`v-html`指令,容易不安全，所以一般不采用；

### 1.3 v-bind

双括号不能给HTML的标签中的属性使用，所以需要使用`v-bind`指令:

```vue
<template>
  <h1>v-bind的两种写法</h1>
  <hr>
  <img :src="imgSrc" alt="1"/>  
  <hr>
  <img v-bind:src="imgSrc" alt="1"/>
  <hr>
  <div v-bind="obj"></div>
</template>

<script setup>
const imgSrc = 'http://qoss.print404.top/typroa/1654749338806.jpg'
const obj = {
  id: "1234456",
  class: "demo"
}
</script>

<style scoped>
</style>
```

`v-bind`可以简写为`:`

### 1-4 v-if

可以使用`v-if`来决定是否显示内容：

```vue
<template>
  <h1>v-if的使用</h1>
  <hr>
  <h1 v-if="flag">flag:{{ flag }}</h1>
  <h1 v-if="flag2">flag:{{ flag2 }}</h1>

</template>

<script setup>
const flag = false;
const flag2 = true;
</script>

<style scoped>
</style>
```

使用`v-if`和`v-else`做一个简单的切换场景：

```vue
<template>
  <hr>
  <button v-if="state.flag" @click="change">显示</button>
  <button v-else @click="change">隐藏</button>
  <hr>
  <h1 v-if="state.flag">我来了</h1>
  <h1 v-else-if="!state.flag">我走了</h1>
</template>

<script setup>

import {ref} from "vue";

const state = ref({flag: true})

const change = () => {
  state.value.flag = !state.value.flag
}
</script>

<style scoped>
</style>
```

### 1-5 v-on

`v-on`指令用来监听dom的事件，可以简写为`@`:

```vue
<template>
  <hr>
  <h1>Vue v-on 的两种写法</h1>
  <button v-if="state.flag" @click="change">隐藏</button>
  <button v-if="!state.flag" v-on:click="change">显示</button>
  <hr>
  <h1 v-if="state.flag">我出来了！！！！！！！！！！</h1>


</template>

<script setup>
import {ref} from "vue";

const state = ref({flag: true})
const change = () => {
  state.value.flag = !state.value.flag;
}
</script>

<style scoped>
</style>
```

### 1-6 修饰符

修饰符是以点开头的特殊后缀，表明指令需要以一些特殊的方式被绑定。例如 `.prevent` 修饰符会告知 `v-on` 指令对触发的事件调用 `event.preventDefault()`：

```vue
<form @submit.prevent="onSubmit">...</form>
```

表单调用方法会取消默认的方式。

### 1-7 v-show

基本同`v-if`指令,不同之处在于 `v-show` 会在 DOM 渲染中保留该元素；`v-show` 仅切换了该元素上名为 `display` 的 CSS 属性。

`v-show` 不支持在 ` <template>`元素上使用，也没有 `v-else` 来配合。

### 1-8 v-for

 `v-for` 指令基于一个数组来渲染一个列表。`v-for` 指令需要一种特殊的语法形式 `item in items`，其中 `items` 是源数据的数组，而 `item` 是迭代项的**别名**：

```vue
<template>
  <hr>
  <ul>
    <template v-for="(item,index) in todos" :key="index">
      <li v-if="!item.done">{{ index }}===>{{ item.task }}</li>
    </template>
  </ul>
  <hr>
</template>

<script setup>
const todos = [
  {task: "吃饭", done: false},
  {task: "睡觉", done: false},
  {task: "打豆豆", done: false},
  {task: "喝水", done: true}
]
</script>

<style scoped>
</style>
```



------



## 2. 响应式基础

使用 `reactive()`或者`ref` 函数创建一个响应式对象或数组：

```javascript
import { reactive,ref } from 'vue'

const state = reactive({ count: 0 })
const state2 = ref({count : 0})
```

简单的计数器demo,代码如下：

```vue
<template>
  <button @click="add">ref:{{ refState.count }}</button>
  <br>
  <br>
  <button @click="add2">reactive:{{ reactiveState.count }}</button>
</template>

<script setup>
import {ref, reactive} from "vue";

const refState = ref({count: 0});
const add = () => {
  refState.value.count++;
}
const reactiveState = reactive({count: 0});
const add2 = () => {
  reactiveState.count++;
}

</script>

<style scoped>

</style>
```

  在 Vue 中，状态都是默认深层响应式的。这意味着即使在更改深层次的对象或数组，你的改动也能被检测到。

而在React中，状态只是浅层响应式，如果对数组进行操作，需要展开才能被检测到。

------



## 3. Class 与 Style 绑定

可以使用`:class`来决定标签的class:

```vue
<template>
  <hr>
  <div :class="{ demo: state.flag }">111111</div>
</template>

<script setup>
import {ref} from "vue";

const state = ref({flag: true})

</script>

<style scoped>
</style>
```

其中的`demo`是类名，其根据`state.flag`来决定是否显示出来。

绑定的对象也可以写成如下:

```vue
const classObject = reactive({
  active: true,
  'text-danger': false
})

<div :class="classObject"></div>
```

数组写法:

```vue
<div :class="[activeClass, errorClass]"></div>
```

会渲染成:

```vue
<div class="active text-danger"></div>
```

在数组中使用三目运算符:

```vue
<div :class="[isActive ? activeClass : '', errorClass]"></div>
// isActive是一个布尔值，当其为true是会添加 activeClass，errorClass 会一直添加
```



可以使用`style`来绑定样式,使用如下:

```vue
<template>
  <hr>
  <div :style="{color:col,fontsize:fontSize+'px'}">111111</div>
</template>

<script setup>

let col = 'red';
let fontSize = 30;


</script>

<style scoped>
</style>
```

也可以使用对象的声明方式:

```vue
let obj = {
  color: "red",
  fontsize: '30px'
}

 <div :style=obj>111111</div>
```

当提供数组时，仅会取最后一个值:

```vue
<div :style="{ display: ['-webkit-box', '-ms-flexbox', 'flex'] }"></div>

<div style="display:flex"></div>
```

------

## 4. 表单输入绑定

使用`v-model`来绑定输入框，输入框输入内容，响应式变量就会更新:

```vue
<template>
  <hr>
  <input v-model="user.name" placeholder="请输入用户名">
  <br>
  <br>
  <input v-model="user.msg" placeholder="请输入消息">
  <h1>name:{{ user.name }}</h1>
  <h1>msg:{{ user.msg }}</h1>
</template>

<script setup>
import {reactive} from "vue";

const user = reactive({
  name: "",
  msg: ""
})
</script>

<style scoped>
</style>
```

单一的复选框返回的数值是布尔类型，多个复选框返回的是数组，里面是复选框的`value`:

```vue
<template>
  <hr>
  <div>Checked names: {{ user.checked }}</div>
  <input type="checkbox" id="jack" value="Jack" v-model="user.checked">
  <label for="jack">Jack</label>

  <input type="checkbox" id="john" value="John" v-model="user.checked">
  <label for="john">John</label>

  <input type="checkbox" id="mike" value="Mike" v-model="user.checked">
  <label for="mike">Mike</label>
  <br>
  <div>ming is checked:{{ user.isCheck }}</div>
  <input type="checkbox" id="ming" value="ming" v-model="user.isCheck">
  <label for="ming">ming</label>

</template>

<script setup>
import {reactive} from "vue";

const user = reactive({
  checked: [],
  isCheck: false
})
</script>

<style scoped>
</style>
```

## 5. 组件通信

普通的组件通信:

```vue
<template>
  <hr>
  <h1>Hello,Vue</h1>
  <MyDemo msg="645465"/>
</template>

<script setup>
import MyDemo from "@/components/MyDemo";
</script>

<style scoped>
</style>



<template>
  <h1>Hello,{{ props.msg }}</h1>
</template>

<script setup>
// eslint-disable-next-line no-undef
const props = defineProps(['msg'])
</script>

<style scoped>

</style>
```

## 6. Vuex的简单使用

### 6.1 最简单的Vuex

1. 在store文件夹下出出创建`index.js`文件如下：

     ```javascript
import {createStore} from 'vuex'

const store = createStore({
    state() {
        return {
            count: 0,
            flag: false,
        }
    },
    mutations: {
        increment(state) {
            state.count++;
        },
        change(state) {
            state.flag = !state.flag;
        }
    }
})
export default store;
     ```

* 其中`state`中声明的为需要管理的状态变量；
* `mutations`中是对状态做出一些更改的方法；

2. 在`main.js`中引入`store`状态，并且使用`app.use(store)`使用状态；

3. 在组件中使用状态和更改状态,代码如下:

   ```vue
   <template>
     <button @click="add">{{ store.state.count }}</button>
     <br>
     <button @click="change">改变</button>
     <h1 v-if="store.state.flag">Hello,Vuex</h1>
   </template>
   
   <script setup>
   import store from '../store'
   
   const change = () => {
     store.commit('change');
     console.log(store.state.flag);
   }
   const add = () => {
     store.commit('increment');
     console.log(store.state.count)
   }
   </script>
   <style scoped>
   </style>
   ```

   * 导入store变量，即可通过`store.state`来获取状态变量；
   * 使用`store.commit()`方法即可调用`mutations`中的方法改变状态变量；