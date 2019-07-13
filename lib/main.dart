import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yccapp/ui/hot.dart';
import 'package:flutter_yccapp/ui/index.dart';
import 'package:flutter_yccapp/ui/mine.dart';
import 'package:flutter_yccapp/utils/HttpGo.dart';

import 'model/HotMovieData.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: '小蓝优选'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _selectedIndex = 0;
  final _widgetItems = [indexWidget(),hotWidget(), mineWidget()];
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    FormData p = FormData.from({
      'apikey': '0b2bdeda43b5688921839c8ecb20399b',
      "city": "深圳",
      "start": 0,
      "count": 10
    });
    HttpGo.getInstance().get("/v2/movie/in_theaters", (response) {
      HotMovieData hotMovies1 =
          HotMovieData.fromJson(new Map<String, dynamic>.from(response.data));
      print(hotMovies1.subjects[0].rating.max);
    }, params: p);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('首页'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.hot_tub),
            title: Text('热门'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            title: Text('我的'),
          ),
        ],
        currentIndex: _selectedIndex, //默认选中的 index
        fixedColor:  Colors.red, //选中时颜色变为黑色
        type: BottomNavigationBarType.fixed, //类型为 fixed
        onTap: _onItemTapped,
      ),
      body:_widgetItems[_selectedIndex],
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: _incrementCounter,
    //     tooltip: 'Increment',
    //     child: Icon(Icons.add),
    //   ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; //刷新界面
    });
  }
}
