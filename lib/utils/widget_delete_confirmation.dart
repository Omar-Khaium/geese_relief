import 'dart:ui';

import 'package:flutter/material.dart';

class DeleteConfirmation extends StatefulWidget {
  final GestureTapCallback onPositive;
  final GestureTapCallback onNegative;
  final String title;
  final String name;


  DeleteConfirmation({@required this.onPositive, @required this.onNegative, @required this.title,
  @required this.name});

  @override
  _DeleteConfirmationState createState() => _DeleteConfirmationState();
}

class _DeleteConfirmationState extends State<DeleteConfirmation> {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaY: 4,
        sigmaX: 4,
      ),
      child: AlertDialog(
        elevation: 0,
        title: Text(widget.title, textAlign: TextAlign.start, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.title,),
        content: /*Text(widget.name, textAlign: TextAlign.start, style: Theme.of(context).textTheme.body1,)*/
        RichText(
          text: TextSpan(text: "Do you really want to delete ", style: Theme.of(context).textTheme.body1,
          children: [
            TextSpan(text: "\"${widget.name}\"", style: Theme.of(context).textTheme.body1.copyWith(fontWeight: FontWeight.bold),),
            TextSpan(text: "?\n\nPress ", style: Theme.of(context).textTheme.body1,),
            TextSpan(text: "\"Delete\"", style: Theme.of(context).textTheme.body1.copyWith(fontWeight: FontWeight.bold, color: Colors.red),),
            TextSpan(text: " to confirm your action, or you can terminate your action by pressing ", style: Theme.of(context).textTheme.body1,),
            TextSpan(text: "\"Cancel\"", style: Theme.of(context).textTheme.body1.copyWith(fontWeight: FontWeight.bold),),
            TextSpan(text: ".", style: Theme.of(context).textTheme.body1,),
          ]),


        ),
        actions: <Widget>[
          FlatButton(
            onPressed: ()=> widget.onNegative(),
            child: Text("Cancel", textAlign: TextAlign.center, style: Theme.of(context).textTheme.body1,),
            color: Colors.white,
          ),
          FlatButton(
            onPressed: ()=> widget.onPositive(),
            child: Text("Delete", textAlign: TextAlign.center, style: Theme.of(context).textTheme.body1.copyWith(color: Colors.white),),
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
