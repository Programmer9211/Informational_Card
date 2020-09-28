import 'package:flutter/material.dart';

class Dialoges extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      title: Text(
        'Not Available',
        style: TextStyle(
            color: Colors.purple[900],
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
      content: Text(
        'we will fix this in next update',
        style: TextStyle(
            color: Colors.purple[900],
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
      actions: [
        FlatButton(onPressed: () => Navigator.pop(context), child: Text('OK')),
      ],
    );
  }
}
