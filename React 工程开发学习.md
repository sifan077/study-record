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
    <title>React</title>
</head>

<body>
    <div id="root">

    </div>
</body>

</html>
```

2. 在src文件夹下创建名为App.js的文件，写入如下代码：

```jsx
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

```jsx
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

```jsx
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

```jsx
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

## 3.Axios使用

### 3.1 Axios安装引入

使用Axios需要先安装依赖，安装命令如下：

```javascript
npm install axios
npm install react-axios
```

安装完成后，可以在js文件开头使用如下语句导入:

```javascript
import axios from 'axios';
```

### 3.2 发送get请求

发送get请求如下:

```javascript
axios.get(url)                   // url为发送请求至何处
  .then(function (response) {
    console.log(response.data); // 接收到服务器的回应后执行的操作
  })
  .catch(function (error) {
    console.log(error);         // 发生错误后执行的操作
  });


```

发送带参数的get请求:

```javascript
axios.get(url, { 
  params: {   // params出填写需要发送的参数，为json写法
    id: 1
  }
})
  .then(function (response) {
    console.log(response.data);
  })
  .catch(function (error) {
    console.log(error);
  });
```

### 3.3 发送post请求

发送post请求如下:

```javascript
axios.post(url)
  .then(function (response) {
    console.log(response.data);
  })
  .catch(function (error) {
    console.log(error);
  });
```

发送带参数的post请求:

```javascript
axios.post(url,  //直接拼一个json发送
  {
    "aid": 2
  }
)
  .then(function (response) {
    console.log(response.data);
  })
  .catch(function (error) {
    console.log(error);
  });
```

## 4.路由的使用

### 4.1 路由的基本使用

使用路由需要引入 react-route-dom 依赖，引入方法如下，先使用包管理工具安装:

```javascript
npm install react-router-dom 
```

再在js开头导入即可使用，导入语句如下:

```javascript
import {
	BrowserRouter,
	Routes,
	Route
} from "react-router-dom";
```

基本的使用方式：

```jsx
<BrowserRouter>
		<Routes>
			<Route path="/" element={<组件 />} />
			<Route path="expenses" element={<组件1 />} />
			<Route path="invoices" element={<组件2 />} />
		</Routes>
	</BrowserRouter>
```

### 4.2 路由嵌套

需要在父组件中添加一个  <Outlet/> 来作为渲染子组件的地方。

```jsx
<BrowserRouter>
		<Routes>
			<Route path="/" element={<App />}>      //子级路由写在父级路由标签中
				<Route path="expenses" element={<组件1 />} />
				<Route path="invoices" element={<组件2 />} />
			</Route>
		</Routes>
	</BrowserRouter>
```

### 4.3 url传递参数

```jsx
<BrowserRouter>
		<Routes>
			<Route path="/" element={<App />}>
				<Route path="invoices" element={<Invoices />} >
					<Route path = ":invoiceId" element={<Invoice/>}/>     
                    //此处的路由实现url传递参数，别的组件实现根据参数进行不同的渲染
				</Route>
				<Route path="*" element={<main>This is nothing here</main>} />
			</Route>
		</Routes>
	</BrowserRouter>
```

### 4.4 链接高亮

实现链接高亮，需要把Link换为NavLink 并编写css，如下所示:

```jsx
 // normal string
<NavLink className="red" />

// function
<NavLink className={({ isActive }) => isActive ? "red" : "blue"} />
```

### 4.5 url搜索参数

搜索参数就类似于url参数，但是他们在url中所处的位置不同。

不是由`/`分隔，他们出现在一个`?`之后，类似于这样的形式 "/login?success=1"`or`"/shoes?brand=nike&sort=asc&sortby=price

需要导入 useSearchParams，react router 提供了 useSearchParams 用于读取和操作搜索参数。

```jsx
let invoices = getInvoices();
let [searchParams, setSearchParams] = useSearchParams(); 



<div style={{ display: "flex" }}>
      <nav
        style={{
          borderRight: "solid 1px",
          padding: "1rem"
        }}
      >
        <label>根据姓名查找:</label>
        <input
          value={searchParams.get("filter") || ""}   // 输入内容
          onChange={event => {                       //输入内容后
            let filter = event.target.value;         //获取内容
            if (filter) {                            //若存在则调用  setSearchParams 方法
              setSearchParams({ filter });              
            } else {
              setSearchParams({});
            }
          }}
        />
        {invoices            
          .filter(invoice => {                    //根据条件过滤集合
            let filter = searchParams.get("filter");
            if (!filter) return true;
            let name = invoice.name.toLowerCase();
            return name.startsWith(filter.toLowerCase());
          }).map(invoice => (                    //遍历生成链接
            <NavLink
              style={({ isActive }) => ({
                display: "block",
                margin: "1rem 0",
                color: isActive ? "red" : ""
              })}
              to={`/invoices/${invoice.number}`}
              key={invoice.number}
            >
              {invoice.name}
            </NavLink>
          ))}
```

以上这种写法会导致点击链接后，过滤条件就会消失，所以改进一下,导入  useLocation ，类似于 `useSearchParams`, `useLocation` 也会返回一个location告诉我们一些信息。就类似于下面的格式

```jsx
function QueryNavLink({ to, ...props }) {
  let location = useLocation();
  return <NavLink to={to + location.search} {...props} />;
} // 把上面代码的 Navlink组件全部换为 QueryNavLink 组件即可
```

### 4.6 编程式导航

 添加一个删除数据的方法：

```jsx
export function deleteInvoice(number) {
  invoices = invoices.filter(
    invoice => invoice.number !== number
  );
}
```

添加一个删除按钮：

```jsx
<button
          onClick={() => {
            deleteInvoice(invoice.number);
            navigate("/invoices");
          }}
        >
          Delete
        </button>
```

## 5. Redux使用

redux对于javascript应用而言是一个可预测状态的容器，即它是一个数据流框架。

先声明一个`state`状态：

```js
const stateData = {
    count: 0
};

const stateData = {
    flag: true
};
```

声明`action`用来描述发生了什么：

```js
export const increaseAction = {
    type: 'increase'
}

export const decreaseAction = {
    type: 'decrease'
}

export const changeFlagAction = {
    type: "change"
}
```

分别使用不同的状态声明`reducer`:

```js
const stateData = {
    count: 0
};
const countReducer = (state = stateData, action) => {
    switch (action.type) {
        case 'increase':
            return {count: state.count + 1};
        case 'decrease':
            return {count: state.count - 1}
        default:
            return state;
    }
}

export default countReducer;

const stateData = {
    flag: true
};

const setFlagReducer = (state = stateData, action) => {
    switch (action.type) {
        case "change":
            return {flag: !state.flag};
        default:
            return state;
    }
}

export default setFlagReducer;
```

使用`combineReducers`合并reducer，使用`createStore`创建`store`:

```js
const reducer = combineReducers({
    countReducer: countReducer,
    flagReducer: flagReducer
});

const store = createStore(reducer);


export default store;
```

在`index.js`中引入`store`和`Provider`:

```jsx
const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
    <Provider store={store}>
        <ConfigProvider locale={zhCN}>
            <App/>
        </ConfigProvider>
    </Provider>
);
```

声明一个组件渲染：

```jsx
import React from 'react';

class Counter extends React.Component {
    render() {
        const {count, onIncreaseClick, onDecreaseClick, flag, onChangeFlagClick} = this.props;

        return (
            <div>
                <span>{count}</span>
                <br/>
                <button type="button" onClick={onIncreaseClick}>Increase</button>
                <br/>
                <button type="button" onClick={onDecreaseClick}>Decrease</button>
                <br/>
                {
                    flag ? <h1>True</h1> : <h1>False</h1>
                }
                <button type="button" onClick={onChangeFlagClick}>changeFlag</button>


            </div>
        )
    }
}

export default Counter;
```

在`App.js`中把变量和`action`方法传入渲染组件：

```jsx
const mapStateToProps = (state) => ({
    count: state.countReducer.count,
    flag: state.flagReducer.flag
})

const mapDispatchToProps = (dispatch) => ({
    onIncreaseClick: () => dispatch(increaseAction),
    onDecreaseClick: () => dispatch(decreaseAction),
    onChangeFlagClick: () => dispatch(changeFlagAction)
})

const App = connect(
    mapStateToProps,
    mapDispatchToProps
)(Counter)

export default App;
```

最简单的直接在组件中使用：

```jsx
import React from 'react';
import {useSelector, useDispatch} from "react-redux";
import {increaseAction, decreaseAction} from "./store/action";

// redux简单使用

function ReApp(props) {
    const count = useSelector((state => state.countReducer.count));
    const dispatch = useDispatch()
    return (
        <div>
            <div>{count}</div>
            <button onClick={() => {
                dispatch(increaseAction);
            }}>+
            </button>
            <button onClick={() => {
                dispatch(decreaseAction);
            }}>-
            </button>
        </div>
    );
}

export default ReApp;
```

### 5.1 不同的组件中使用同一个`store`状态

```jsx
import React from 'react';
import {useSelector, useDispatch} from "react-redux";
import {increaseAction, decreaseAction} from "../store/action";
import Split from "./Split";

// redux简单使用

function ReApp(props) {
    const count = useSelector((state => state.countReducer.count));
    const dispatch = useDispatch()
    return (
        <div>
            <div>{count}</div>
            <button onClick={() => {
                dispatch(increaseAction);
            }}>+
            </button>
            <button onClick={() => {
                dispatch(decreaseAction);
            }}>-
            </button>
            <hr/>
            <Split/>
        </div>
    );
}

export default ReApp;
```



```jsx
import React from 'react';
import {useSelector} from "react-redux";

const MyComponent = () => {
    const count = useSelector((state => state.countReducer.count));
    return (
        <div>
            <h1>另一个组件的count:{count}</h1>
        </div>
    );
};

export default MyComponent;

```



