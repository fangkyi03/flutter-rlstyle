# rlStyle 
可以使用类似rn的写法类写flutter 减少flutter的地狱嵌套

# demo演示视频
[https://www.bilibili.com/video/av71131117](https://www.bilibili.com/video/av71131117)

# 使用
添加rlStyle到您的pubspec.yaml
```javaScript
dependencies:
  flutter_screenutil: 5.0.0+2
  rlstyles: ^1.0.2
```

# 示例
示例代码 请直接运行本地example项目 内涵9个小demo 增加grid案例

# demo
```javaScript
import 'package:flutter/material.dart';
import 'package:rlstyles/Router.dart';
import 'package:rlstyles/Styles.dart';
import 'package:rlstyles/View.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Demo1 extends StatelessWidget {

  const Demo1({this.navigation});
  final NavigationOption navigation;

  renderView () {
    List<dynamic> colorArr = ['blue','red','#f55fff','rgba(255,12,13,1)','rgb(12,5,78)',Colors.red,Colors.black.withOpacity(0.5),'linear-gradient(blue,red)'];
    return View(
      styles: styles['wrap'],
      children: colorArr.map((f){
        return View(
          styles: Styles(
            width: 300,
            height: 300,
            marginTop: 50,
            marginLeft: 50,
            marginRight: 10,
            backgroundColor: f
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 在整个项目初始化的地方 只需要初始化一次 填入设计稿尺寸即可
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1330);
    return View(
      styles: styles['main'],
      children: <Widget>[
        renderView()
      ],
    );
  }
}

const Map<String,Styles> styles = {
  'main':Styles(
    flexDirection: 'column',
    backgroundColor: 'white',
    overflow: 'scroll',
    width: double.infinity,
    height: double.infinity,
    paddingBottom: 100
  ),
  'wrap':Styles(
    flexWrap: 'wrap',
    position: 'rel'
  )
};
```

# flex

名称 | 类型 | 参数写法
-|-|-
display | String | flex,none 
color | dynamic | Colors.white,Color(0xFFFFFF),rgba(255,255,255,1),rgb(255,255,255),white
flexDirection | String | row,column
justifyContent | String | flex-start,center,flex-end,space-between,space-arround,space-evenly
alignItems | String | flex-start,center,flex-end,space-between,space-arround,space-evenly
flex | int | flex:1

# box-size 
名称 | 类型 | 参数写法
-|-|-
width | dynamic | String,int,double,'16px'
height | dynamic | String,int,double,'16px'
maxWidth | double | maxWidth:100
maxHeight | double | maxHeight:100
minHeight | double | minHeight:100
minWidth | double | minWidth:100
margin | double | margin:100
marginLeft | double | marginLeft:100
marginTop | double | marginTop:100
marginRight | double | marginRight:100
marginBottom | double | marginBottom:100
padding | double | padding:100
paddingLeft | double | paddingLeft:100
paddingTop | double | paddingTop:100
paddingRight | double | paddingRight:100
paddingBottom | double | paddingBottom:100

# box 
名称 | 类型 | 参数写法
-|-|-
opacity | double | opacity:1.0

# border
名称 | 类型 | 参数写法
-|-|-
borderRadius | double | borderRadius:10
borderWidth | double | borderWidth:1
borderStyle | String | solid 
borderColor | dynamic | Colors.white,Color(0xFFFFFF),rgba(255,255,255,1),rgb(255,255,255),white
boxShadow | dynamic | [BoxShadow(offset:Offset(0,1))],BoxShadow(offset:Offset(0,1))
elevation | double | elevation:10
borderBottomLeftRadius | double | borderBottomLeftRadius:10
borderBottomRightRadius | double | borderBottomRightRadius:10
borderTopLeftRadius | double | borderTopLeftRadius:10
borderTopRightRadius | double | borderTopRightRadius:10
borderLeftStyle | String | solid
borderLeftColor | dynamic | Colors.white,Color(0xFFFFFF),rgba(255,255,255,1),rgb(255,255,255),white
borderLeftWidth | double | borderLeftWidth:10
borderRightStyle | String | solid
borderRightColor | String | solid
borderRightWidth | double | borderRightWidth:1.0
borderTopStyle | String | solid
borderTopColor | dynamic | Colors.white,Color(0xFFFFFF),rgba(255,255,255,1),rgb(255,255,255),white
borderTopWidth | double | borderTopWidth:1.0
borderBottomWidth | double | borderBottomWidth:1.0
borderBottomColor | dynamic | Colors.white,Color(0xFFFFFF),rgba(255,255,255,1),rgb(255,255,255),white
borderBottomStyle | String | solid

# postion 
名称 | 类型 | 参数写法
-|-|-
left | double | left:10
right | double | right:10
top | double | top:10
bottom | double | bottom:10
position | String | rel,relative,abs,absolute,(rel = relative abs = absolute),grid

# background
名称 | 类型 | 参数写法
-|-|-
backgroundImage | string | linear-gradient(rgba,rgb,white)
backgroundColor | dynamic | linear-gradient(rgba,rgb,white),Colors.white,Color(0xFFFFFF),rgba(255,255,
255,1),rgb(255,255,255),white

# font
名称 | 类型 | 参数写法
-|-|-
fontWeight | dynamic | 100,200,300,400,500,600,700,800,900,bold
fontFamily | String | fontFamily:'微软雅黑'
fontSize | double | fontSize:10
textDecoration | String | none overline line-through underline
textOverflow | String | clip ellipsis string
textAlign | String | start left center right justify

# scroll
名称 | 类型 | 参数写法
-|-|-
overflow | String | scroll 纵向滑动
overflowY | String | scroll 纵向滑动
overflowX | String | scroll 横向滑动

# grid
名称 | 类型 | 参数写法
-|-|-
gridCount | int | 一行子元素数量
gridMainAxisSpacing | double | 主轴上下间距
gridCrossAxisSpacing | double | 副轴上下间距
gridChildAspectRatio | double | 子元素比例


# 暂不支持属性
boxSizing
lineHeight
whiteSpace
lines
letterSpacing
