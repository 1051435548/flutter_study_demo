import 'package:Flutter/utils/ToastUtil.dart';
import 'package:flutter/material.dart';

class RouteGenerate extends StatefulWidget {
  @override
  _RouteGenerateState createState() => _RouteGenerateState();
}

class _RouteGenerateState extends State<RouteGenerate> {
  bool hasText = false;
  FocusNode focusNode = FocusNode();
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: _title(),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('skip to generate route page'),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width - 86,
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
                  autofocus: true,
                  controller: searchController,
                  focusNode: focusNode,
                  onSubmitted: (str) {
                    focusNode.unfocus();
                  },
                  onChanged: (str) {
                    if (searchController.text.length != 0) {
                      setState(() {
                        hasText = true;
                      });
                    } else {
                      setState(() {
                        hasText = false;
                      });
                    }
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '请输入搜索内容...',
                    hintStyle: TextStyle(fontSize: 14, color: Colors.grey[400]),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(hasText ? Icons.clear : Icons.camera_alt),
                color: Colors.grey,
                onPressed: () {
                  hasText ? _clear() : _camera();
                },
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
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

  void _clear() {
    searchController.clear();
    setState(() {
      hasText = false;
    });
  }

  void _camera() {
    ToastUtil.show(context: context, msg: "调用相机");
  }
}
