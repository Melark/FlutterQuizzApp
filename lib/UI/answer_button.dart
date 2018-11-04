import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final bool answer;
  final VoidCallback _onTap;


  AnswerButton(this.answer, this._onTap);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  new Expanded(
             child: new Material(
             color: answer ? Colors.greenAccent: Colors.redAccent,
             child: new InkWell(
               onTap: () => _onTap,
               child: new Center(
                 child: new Container(
                   decoration: new BoxDecoration(
                     border: Border.all( color: Colors.white , width: 5.0),
                     borderRadius: BorderRadius.circular(20.0)
                   ),
                    padding: new EdgeInsets.all(10.0),
                   child: new Text(answer ?"True":"False",
                   style: new TextStyle(color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold),),
                 ),
               ),
             ),
           ),
           ),
    );
  }
}