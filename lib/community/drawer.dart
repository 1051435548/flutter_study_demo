import 'package:Flutter/common/CustomTheme.dart';
import 'package:Flutter/community/login.dart';
import 'package:Flutter/provider/themeProvider.dart';
import 'package:Flutter/utils/LocalStore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowDrawer extends StatefulWidget {
  @override
  _ShowDrawerState createState() => _ShowDrawerState();
}

class _ShowDrawerState extends State<ShowDrawer> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    /// 把最外层的Drawer去掉可以实现从左侧滑出的抽屉完全覆盖当前页面
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: const Text('Xiaoyang Drawer'),
            accountEmail: const Text('xiaoyang.flutter@demo.com'),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage(
                'images/logo.png',
              ),
            ),
            margin: EdgeInsets.zero,
          ),
          MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: Expanded(
              child: _drawerItem(context),
            ),
          )
        ],
      ),
    );
  }

  /// 抽屉里的每个item
  Widget _drawerItem(BuildContext context) {
    DateTime time = DateTime.now();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.color_lens),
          title: Text("切换主题"),
          trailing: Icon(Icons.chevron_right),
          onTap: () {
            Navigator.of(context).pop();
            showThemeDialog();
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.timer),
          title: Text('$time'),
          trailing: Icon(Icons.chevron_right),
          onTap: () {

          },
        ),
      ],
    );
  }

  void showThemeDialog() {
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('切换主题'),
          content: Scrollbar(
            child: Container(
              //包含ListView要指定宽高
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: CustomTheme.themeColor.keys.length,
                itemBuilder: (BuildContext context, int position) {
                  return GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(20.0),
                      margin: EdgeInsets.only(bottom: 15),
                      color: CustomTheme.themeColor[position]["primaryColor"],
                    ),
                    onTap: () async {
                      Provider.of<ThemeProvide>(context).setTheme(position);
                      //存储主题下标
                      LocalStore.setLocalStorage('themeIndex', position);
                      Navigator.of(context).pop();
                    },
                  );
                },
              ),
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('关闭',
                  style: TextStyle(color: Theme.of(context).primaryColor)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
