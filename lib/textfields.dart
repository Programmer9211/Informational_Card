import 'package:flutter/material.dart';

import 'app_body.dart';

class Cards extends StatelessWidget {
  TextEditingController controller;
  TextEditingController controller1;
  TextEditingController controller2;
  TextEditingController controller3;

  List<List<String>> info;
  List<Color> colors = [];

  Cards(this.controller, this.controller1, this.controller2, this.controller3,
      this.info, this.colors);

  @override
  Widget textField(String name, TextEditingController cont, int length) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        maxLength: length,
        controller: cont,
        decoration: InputDecoration(
            labelText: name,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(18))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    void snackBar(String show) {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(show)));
    }

    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height / 7,
              width: width,
              alignment: Alignment.bottomCenter,
              child: Text(
                'Enter Information',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple[900]),
              ),
            ),
            textField("Name", controller, 15),
            textField("Age", controller1, 2),
            textField("Email Address", controller2, 40),
            textField("Profession", controller3, 15),
            RaisedButton(
              child: Text(
                "Save",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                info.add([
                  controller.text,
                  controller1.text,
                  controller2.text,
                  controller3.text
                ]);
                colors.add(Colors.black);
                //snackBar("Profile Added Sucessfully...");
                print(info.length);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Body(controller, controller1,
                            controller2, controller3, info, this.colors)));
                controller.clear();
                controller1.clear();
                controller2.clear();
                controller3.clear();
              },
              color: Colors.purple[700],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
            ),
          ],
        ),
      ),
    );
  }
}
