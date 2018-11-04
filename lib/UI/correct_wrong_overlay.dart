import 'package:flutter/material.dart';
import 'dart:math';

class CorrectWrongOverlay extends StatefulWidget {
final bool _isCorrect;

CorrectWrongOverlay(this._isCorrect);

@override
  State createState() => new _CorrectWrongOverlayState();
}

class _CorrectWrongOverlayState extends State<CorrectWrongOverlay> with SingleTickerProviderStateMixin {

  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  @override
  void initState(){
    super.initState();
    _iconAnimationController = new AnimationController(duration: new Duration(seconds: 2), vsync: this);
    _iconAnimation = new CurvedAnimation(curve: Curves.elasticOut, parent: _iconAnimationController);
    _iconAnimation.addListener(()=> this.setState((){}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.black54,
      child: new InkWell(
        onTap: () => print('Lala'),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white
              ),
              child: new Transform.rotate(
                angle: _iconAnimation.value * 2 * pi,
                child: new Icon(widget._isCorrect? Icons.done : Icons.clear, size: 80.0,),
              )
            ),
            new Padding(
              padding: new EdgeInsets.only(bottom: 20.0),
            ),
            new Text(widget._isCorrect?"Correct!":"Wrong!",
            style: new TextStyle(fontSize: 30.0, color: Colors.white),)
          ],
        ),
      ),
    );
  }
}