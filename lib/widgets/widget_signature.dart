import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SignatureDialog extends StatefulWidget {
  @override
  _SignatureDialogState createState() => _SignatureDialogState();
}

class _SignatureDialogState extends State<SignatureDialog> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(),
              ),
              Container(
                width: 64,
                color: Colors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    SizedBox(height: 12,),
                    CircleAvatar(
                      backgroundColor: Colors.white24,
                      child: IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.undo, color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 12,),
                    CircleAvatar(
                      backgroundColor: Colors.white24,
                      child: IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.redo, color: Colors.white,),
                      ),
                    ),
                    SizedBox(height: 12,),
                    CircleAvatar(
                      backgroundColor: Colors.white24,
                      child: IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.color_lens, color: Colors.white,),
                      ),
                    ),
                    SizedBox(height: 12,),
                    CircleAvatar(
                      backgroundColor: Colors.white24,
                      child: IconButton(
                        onPressed: (){},
                        icon: Icon(MdiIcons.pencil, color: Colors.white,),
                      ),
                    ),
                    SizedBox(height: 12,),
                    CircleAvatar(
                      backgroundColor: Colors.white24,
                      child: IconButton(
                        onPressed: (){},
                        icon: Icon(MdiIcons.eraser, color: Colors.white,),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: CircleAvatar(
                          backgroundColor: Colors.white24,
                          child: IconButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                            icon: Icon(MdiIcons.close, color: Colors.white,),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 12,)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
