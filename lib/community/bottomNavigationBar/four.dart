import 'package:Flutter/utils/ToastUtil.dart';
import 'package:flutter/material.dart';

class Four extends StatefulWidget {
  @override
  _FourState createState() => _FourState();
}

class _FourState extends State<Four> {
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /// 隐藏返回按钮
        automaticallyImplyLeading: false,
        title: _search(),
      ),
      body: _body(),
    );
  }

  Widget _search() {
    var size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          child: Container(
            width: size.width - 86,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: null,
                ),
                Expanded(
                  child: TextField(
                    focusNode: focusNode,
                    onSubmitted: (str) {
                      focusNode.unfocus();
                      ToastUtil.show(context: context, msg: str);
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '请输入搜索内容...',
                      hintStyle:
                          TextStyle(fontSize: 14, color: Colors.grey[400]),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.camera_alt),
                  color: Colors.grey,
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            focusNode.unfocus();
          },
          child: Text(
            '取消',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  Widget _body() {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(60.0),
      child: Container(
        width: size.width,
        height: size.height / 2,
        color: Colors.lightBlue,
      ),
    );
  }
}
