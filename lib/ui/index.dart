import 'package:flutter/material.dart';
import 'package:flutter_custom_bottom_tab_bar/tabbar.dart';
import 'package:flutter_custom_bottom_tab_bar/eachtab.dart';
import 'package:flutter_yccapp/ui/search_item.dart';
import 'package:flutter_yccapp/ui/tab_item.dart';

class indexWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return indexWidgetState();
  }
}

class indexWidgetState extends State<indexWidget>
    with SingleTickerProviderStateMixin {
  List<String> tabs = [];
  TabController _tabController;
  int _selectedIndex = 0;
  List<String> searshlist = ["洗发水", "遮阳伞", "小西装", "保湿精华液"];
  List<Widget> searshItemWidgets = [];
  List<Widget> tabItemWidgets = [];
  @override
  void initState() {
    super.initState();
    tabs = <String>[
      '精选',
      '男装',
      '女装',
      '內衣',
      '母婴',
      '美妆',
      '居家',
      '鞋包配饰',
      "美食",
      "文体车品",
      "数码家电",
      "运动户外"
    ];
    setSearshItem();
    setTabs(tabs);
    _tabController =
        new TabController(vsync: this, initialIndex: 0, length: tabs.length);
    _tabController.addListener(() {
      setState(() => _selectedIndex = _tabController.index);
      print("liucheng-> ${_tabController.indexIsChanging}");
    });
  }

  void setTabs(tabs) {
    for (String item in tabs) {
      tabItemWidgets.add(tabItemWidget(item));
    }
  }

  void setSearshItem() {
    for (String item in searshlist) {
      searshItemWidgets.add(searchItemWidget(item));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 90,
            alignment: Alignment.bottomCenter,
            color: Colors.white,
            padding: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: new Image.network(
                    'https://blue-1257230333.cos.ap-guangzhou.myqcloud.com/images/newsTip.png',
                    width: 20,
                    height: 22,
                    fit: BoxFit.cover,
                    color: Colors.red,
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: TextField(
                      style: TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                          hintText: "\uE8b6 宝贝标题/关键词（如女装）",
                          hintStyle: TextStyle(
                              fontFamily: 'MaterialIcons', fontSize: 16),
                          contentPadding:
                              EdgeInsets.only(top: 8, bottom: 8, left: 8),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          filled: true,
                          fillColor: Colors.black12),
                    )),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: new Image.network(
                    'https://blue-1257230333.cos.ap-guangzhou.myqcloud.com/images/newsTip.png',
                    width: 20,
                    height: 22,
                    fit: BoxFit.cover,
                    color: Colors.red,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: new Image.network(
                    'https://blue-1257230333.cos.ap-guangzhou.myqcloud.com/images/newsTip.png',
                    width: 20,
                    height: 22,
                    fit: BoxFit.cover,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          ),
          Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "热搜:",
                    style: TextStyle(fontSize: 16),
                  )),
              Row(children: searshItemWidgets)
            ],
          ),
          Container(
            child: new TabBar(
                isScrollable: true,
                controller: _tabController,
                indicatorColor: Colors.transparent,
                labelColor: Colors.red,
                labelPadding: EdgeInsets.all(0),
                unselectedLabelColor: Colors.black,
                tabs: tabItemWidgets),
          ),
          Expanded(
            child: Container(
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  Text(tabs[0]),
                  Text(tabs[1]),
                  Text(tabs[2]),
                  Text(tabs[3]),
                  Text(tabs[4]),
                  Text(tabs[5]),
                  Text(tabs[6]),
                  Text(tabs[7]),
                  Text(tabs[8]),
                  Text(tabs[9]),
                  Text(tabs[10]),
                  Text(tabs[11])
                ],
              ),
            ),
          )
        ]);
  }
}
