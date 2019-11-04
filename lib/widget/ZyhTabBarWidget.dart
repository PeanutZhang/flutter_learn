import 'package:flutter/material.dart';


  //custom tabBar
class ZyhTabBarWidget extends StatefulWidget{

  static const int BOTTOM_TAB =1;//底部tab
  static const int TOP_TAB = 2; //顶部tab

  int type;
  final bool resizeToAvoidBottomPadding;


  final List<Widget> tabItems;

  final List<Widget> tabViews;

  final Color backgroundColor;

  final Color indicatorColor;

  final Widget title;

  final Drawer drawer;

  final Widget bottomBar;

  final FloatingActionButton floatingActionButton;

  final FloatingActionButtonLocation floatingActionButtonLocation;

  final TarWidgetControl tarWidgetControl;

  final ValueChanged<int> onPageChanged;

  ZyhTabBarWidget({
      Key key,
      this.type,
      this.tabItems,
      this.tabViews,
      this.backgroundColor,
      this.indicatorColor,
      this.title,
      this.drawer,
      this.bottomBar,
      this.floatingActionButton,
      this.floatingActionButtonLocation,
      this.tarWidgetControl,
      this.onPageChanged,
      this.resizeToAvoidBottomPadding = true}):super(key:key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ZyhTabBarState(type,tabViews,indicatorColor,drawer,floatingActionButton,tarWidgetControl,onPageChanged);
  }



}



class _ZyhTabBarState extends State<ZyhTabBarWidget> with SingleTickerProviderStateMixin{

  final int _type;
  final List<Widget> _tabViews;
  final Color _indicatorColor;
  final Widget _drawer;
  final FloatingActionButton _floatingActionButton;
  final TarWidgetControl _tarWidgetControl;
  final PageController _pageController = new PageController();
  final ValueChanged<int> _onPageChanged;

  TabController _tabController;


  _ZyhTabBarState(
      this._type,
      this._tabViews,
      this._indicatorColor,
      this._drawer,
      this._floatingActionButton,
      this._tarWidgetControl,
      this._onPageChanged
      );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length:widget.tabItems.length, vsync: this);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(this._type == ZyhTabBarWidget.TOP_TAB){
       return new Scaffold(
         resizeToAvoidBottomInset: widget.resizeToAvoidBottomPadding,
         floatingActionButtonLocation: widget.floatingActionButtonLocation,
         persistentFooterButtons: _tarWidgetControl == null ? null : _tarWidgetControl.footerButton,
         appBar: AppBar(
           backgroundColor: Theme.of(context).primaryColor,
           title: widget.title,
           bottom: TabBar(
               tabs:widget.tabItems,
               indicatorColor: _indicatorColor,
               onTap: (index) {
                 _onPageChanged?.call(index);
                 _pageController.jumpTo(MediaQuery.of(context).size.width * index);
           },
           ),
         ),
         body: PageView(
           scrollDirection: Axis.horizontal,
           controller: _pageController,
           children: _tabViews,
           onPageChanged: (index){
             _tabController.animateTo(index);
             _onPageChanged.call(index);
           },
         ),
         bottomNavigationBar: widget.bottomBar,
       );
    }
    //在底部时
    return Scaffold(
        drawer: _drawer,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: widget.title,
        ),
        body: PageView(
          controller: _pageController,
          children: _tabViews,
          onPageChanged: (index){
            _tabController.animateTo(index);
            _onPageChanged.call(index);
          },
        ),
        bottomNavigationBar: Material(
          color: Theme.of(context).primaryColor,
          child: SafeArea(
              child: TabBar(
                  tabs:widget.tabItems,
                  controller: _tabController,
                  indicatorColor: widget.indicatorColor,
                  onTap: (index){
                    _pageController.jumpTo(MediaQuery.of(context).size.width * index);
                    _onPageChanged?.call(index);
                  },
              )
          ),
        ),
    );
  }

}

class TarWidgetControl {
  List<Widget> footerButton = [];
}