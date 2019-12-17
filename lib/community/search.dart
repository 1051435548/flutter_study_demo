import 'package:flutter/material.dart';

class MySearchDelegate extends SearchDelegate<String> {
  String searchHint = "请输入搜索内容...";
  var sourceList = [
    "dart",
    "dart 入门",
    "flutter",
    "flutter 编程",
    "flutter 编程开发",
  ];

  var suggestList = [
    "flutter",
    "flutter 编程开发",
  ];

  @override
  String get searchFieldLabel => searchHint;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      Center(
        child: Padding(
          padding: EdgeInsets.only(right: 15),
          child: GestureDetector(
            child: Text(
              '搜索',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {
              showResults(context);
            },
          ),
        ),
      ),
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
//          query = "";
//          showSuggestions(context);
          close(context, null);
        },
      ),
    ];

  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> result = List();

    ///模拟搜索过程
    for (var str in sourceList) {
      ///query 就是输入框的 TextEditingController
      if (query.isNotEmpty && str.contains(query)) {
        result.add(str);
      }
    }

    ///展示搜索结果
    return ListView.builder(
      itemCount: result.length,
      itemBuilder: (BuildContext context, int index) => ListTile(
        title: Text(result[index]),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggest = query.isEmpty
        ? suggestList
        : sourceList.where((input) => input.startsWith(query)).toList();
    return ListView.builder(
      itemCount: suggest.length,
      itemBuilder: (BuildContext context, int index) => InkWell(
        child: ListTile(
          title: RichText(
            text: TextSpan(
              text: suggest[index].substring(0, query.length),
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: suggest[index].substring(query.length),
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          //  query.replaceAll("", suggest[index].toString());
          searchHint = "";
          query = suggest[index].toString();
          showResults(context);
        },
      ),
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme.copyWith(
//      primaryColor: Colors.blue,
//      primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.grey),
//      primaryColorBrightness: Brightness.light,
//      primaryTextTheme: theme.textTheme,
      textTheme: TextTheme(
        title: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
    );
  }
}
