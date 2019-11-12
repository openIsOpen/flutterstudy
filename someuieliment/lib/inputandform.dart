import 'package:flutter/material.dart';

class Login extends StatelessWidget{
  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _passWordController = new TextEditingController();

  @override
  void initState()
  {
    _userNameController.addListener((){
      print(_userNameController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('输入框和表单'),),
      body: Column(
        children: <Widget>[
          TextField(
            //controller: _userNameController,
            autofocus: true,
            decoration: InputDecoration(
              labelText: '用户名',
              hintText: '用户名或邮箱',
              prefixIcon: Icon(Icons.person)
            ),
            onChanged: (value){
              print(value);
            },
          ),
          TextField(
            //controller: _passWordController,
            autofocus: true,
            decoration: InputDecoration(
              labelText: '密码',
              hintText: '您的登录密码',
              prefixIcon: Icon(Icons.lock)
            ),
            obscureText: true,
            onChanged: (value){
              print(value);
            },
          ),
          RaisedButton(
            color: Colors.lightBlue,
            child: Text('登录'),
            onPressed: (){
              print('用户名:${_userNameController.text}|密码:${_passWordController.text}');
            },
          ),

          FocusTestRoute()
        ],
      ),
    );
  }

}


class FocusTestRoute extends StatefulWidget {
  @override
  _FocusTestRouteState createState() => new _FocusTestRouteState();
}

class _FocusTestRouteState extends State<FocusTestRoute> {
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TextField(
            autofocus: true, 
            focusNode: focusNode1,//关联focusNode1
            decoration: InputDecoration(
                labelText: "input1"
            ),
          ),
          TextField(
            focusNode: focusNode2,//关联focusNode2
            decoration: InputDecoration(
                labelText: "input2"
            ),
          ),
          Builder(builder: (ctx) {
            return Column(
              children: <Widget>[
                RaisedButton(
                  child: Text("移动焦点"),
                  onPressed: () {
                    //将焦点从第一个TextField移到第二个TextField
                    // 这是一种写法 FocusScope.of(context).requestFocus(focusNode2);
                    // 这是第二种写法
                    if(null == focusScopeNode){
                      focusScopeNode = FocusScope.of(context);
                    }
                    focusScopeNode.requestFocus(focusNode2);
                  },
                ),
                RaisedButton(
                  child: Text("隐藏键盘"),
                  onPressed: () {
                    // 当所有编辑框都失去焦点时键盘就会收起  
                    focusNode1.unfocus();
                    focusNode2.unfocus();
                  },
                ),
              ],
            );
          },
          ),
        ],
      ),
    );
  }

}