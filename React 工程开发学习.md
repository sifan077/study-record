# React 工程开发学习

## 1. 创建React项目

首先安装React脚手架，使用 npm的国内镜像源提高下载速度，使用如下命令安装脚手架：

```bash
cnpm install -g create-react-app
```

在使用如下命令创建项目：

```javascript
 create-react-app react项目名字
```

在项目目录中使用如下命令启动项目:

```javascript
npm start 
```

## 2. React 项目的基本配置

可以把项目中 public文件夹和src文件夹下的文件全部删除，这样项目会无法启动，我们需要做如下操作：

1. 在public文件夹下创建名为index.html 的文件，并且写入如下代码：

```html
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <div id="root">

    </div>
</body>

</html>
```

2. 在src文件夹下创建名为App.js的文件，写入如下代码：

```javascript
import React, { Component } from 'react'

export default class App extends Component {
    render() {
        return (
            <div>
               HelloWorld!
            </div>
        )
    }
}
```

3. 在src文件夹下创建名为index.js的文件，写入如下代码：

```javascript
// 引入react核心库
import React from "react";
// 引入ReactDOM
import  ReactDOM  from "react-dom";
//引入App组件
import App from './App'

//渲染App组件到页面
ReactDOM.render(<App/>,document.getElementById('root'))
```

这样一个最简单的HelloWorld就配置好了，运行npm start即可在浏览器看到效果。



### 2.1 基本的组件

我们在src文件夹下创建一个 components 文件夹来放各种组件，在里面创建各个子文件夹来放不同的组件。

创建一个不同的HelloWorld：

1. 在commponents文件夹下创建一个Hello文件夹
2. 创建一个名为Hello.js的文件和一个名为Hello.css文件
3. 编写Hello.js如下：

```css
.title{
    background-color: aqua;
}
```

4. 编写Hello.js如下：

```javascript
import React,{Component} from "react";
//导入React核心库和React组件
import './Hello.css'
//导入css文件修饰，必须带.css后缀
export default class Hello extends Component{
    render(){
        return(
            <div className='title'>
                HelloWorld!
            </div>
        )
    }
}
```

5. 更改App.js里的render如下，使其返回Hello组件

```javascript
import React, { Component } from 'react'

import Hello from "./components/Hello/Hello";
// 引入Hello组件

export default class App extends Component {
    render() {
        return (
            <div>
              <Hello /> 
             // 使其返回Hello组件
            </div>
        )
    }
}
```

### 2.2 css module 模块化css

使用模块化css，css module，拿Hello.css举例，需要把Hello.css重命名为Hello.moudule.css, 引用的时候，要用对象的形式,

其引用大概如下代码所示：

```javascript
import React,{Component} from "react";

// import './Hello.css'
// 原本导入的css
import hello from './Hello.module.css'
// css module后按照对象的方式导入css

export default class Hello extends Component{
    render(){
        return(
           // <div className='title'>  原本的className注入
            <div className={hello.title}> //className 注入
                HelloWorld!
            </div>
        )
    }
}
```

