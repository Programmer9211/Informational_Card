import 'package:flutter/material.dart';

import 'Dialoges.dart';

class Appbar extends StatefulWidget {
  @override
  _AppbarState createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  int val = 0;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        key: UniqueKey(),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: Colors.white,
        title: val == 0
            ? Text(
                'Profiles',
                style: TextStyle(color: Colors.purple[900]),
              )
            : TextField(
                decoration: InputDecoration(
                    hintText: "Type Keyword",
                    hintStyle:
                        TextStyle(color: Colors.purple[900], fontSize: 18)),
              ),
        iconTheme: IconThemeData(
          color: Colors.purple[900],
        ),
        actions: val == 0
            ? [
                IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      setState(() {
                        val = 1;
                      });
                    })
              ]
            : [
                IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () => showDialog(
                        context: context, builder: (context) => Dialoges())),
                IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: () {
                      setState(() {
                        val = 0;
                      });
                    })
              ]);
  }
}
