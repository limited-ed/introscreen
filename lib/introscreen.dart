import 'package:flutter/material.dart';


class IntroScreen extends StatefulWidget {
  final List<Widget> items;
  final Color background;
  final Widget navigateAfter;
  final VoidCallback onDonePressed;

  IntroScreen({
    @required this.items,
    this.background = Colors.teal,
    this.navigateAfter,
    this.onDonePressed
  }) {
    if (navigateAfter==null && onDonePressed==null) {
      throw new ArgumentError("navigateAfter or onDonePressed is required");
    }
  }

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> with SingleTickerProviderStateMixin {
  TabController _controller;
  bool _isFirstScreen = true;
  bool _isLastScreen= false;
  BuildContext _context;

  void _tabChangeListener() {
    //if (_controller.index==0)
    setState(() {
          _isFirstScreen = _controller.index==0 ? true : false; 
          _isLastScreen = _controller.index == _controller.length-1? true : false;
        });
  }

  void _leftButtonPress(){
    if (!_controller.indexIsChanging){
      _controller.animateTo(_controller.index-1);
    }
  }

  void _rightButtonPress(){
    if(!_isLastScreen && !_controller.indexIsChanging){
      _controller.animateTo(_controller.index+1);
    } else {
      if (widget.navigateAfter!=null){
        Navigator.of(_context).pushReplacement(new MaterialPageRoute(builder: (BuildContext context) {return widget.navigateAfter;} ));
      }
      if (widget.onDonePressed != null) {
        widget.onDonePressed();
      }
    }
  }

  @override
  void initState() {
      super.initState();
      _controller = TabController(vsync: this, length: widget.items.length);
      _controller.addListener(_tabChangeListener);
    }

  @override
  Widget build(BuildContext context) {
    _context=context;
    return Scaffold(
      backgroundColor: widget.background,
      
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: TabBarView(
                children: widget.items,
                controller: _controller,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child:
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(icon: Icon(Icons.chevron_left),  onPressed: _isFirstScreen? null: _leftButtonPress, color: Colors.white, disabledColor: Colors.grey, ),
                  TabPageSelector(controller: _controller, selectedColor: Colors.white,),
                  IconButton(icon: _isLastScreen?Icon(Icons.check) : Icon(Icons.chevron_right), onPressed: _rightButtonPress, color: Colors.white),                
                ],
              ) ,
            ),           
          ],
        ),
      ),
    );
  }
}

