import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'AppBar.dart';
import 'app_drawer.dart';
import 'textfields.dart';

class Body extends StatefulWidget {
  TextEditingController controller;
  TextEditingController controller1;
  TextEditingController controller2;
  TextEditingController controller3;
  bool pressed;

  List<List<String>> info;

  String name = "Name";

  Body(
    this.controller,
    this.controller1,
    this.controller2,
    this.controller3,
    this.info,
  );

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Color colors = Colors.black;

  Widget poupmenubutton(int index) {
    return PopupMenuButton(
        itemBuilder: (context) => [
              PopupMenuItem(
                child: Text(
                  "Edit",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                value: 1,
              ),
              PopupMenuItem(
                child: Text(
                  "Delete",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                value: 2,
              ),
              PopupMenuItem(
                child: Text(
                  "Change Color",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                value: 3,
              ),
              PopupMenuItem(
                child: Text(
                  "Share Info",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                value: 4,
              ),
            ],
        onSelected: (value) {
          if (value == 1) {
            showDialog(
                context: context,
                builder: (context) => Dialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 8),
                          child: Column(
                            children: [
                              textField("Name", widget.controller, 12),
                              textField("Age", widget.controller1, 2),
                              textField("Email Adress", widget.controller2, 40),
                              textField("Profession", widget.controller3, 15),
                              RaisedButton(
                                child: Text(
                                  "Save",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  setState(() {
                                    widget.info[index] = [
                                      widget.controller.text,
                                      widget.controller1.text,
                                      widget.controller2.text,
                                      widget.controller3.text
                                    ];
                                  });

                                  Navigator.pop(context);
                                  widget.controller.clear();
                                  widget.controller1.clear();
                                  widget.controller2.clear();
                                  widget.controller3.clear();
                                },
                                color: Colors.purple[700],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ));
          } else if (value == 2) {
            setState(() {
              widget.info.removeAt(index);
            });
          } else if (value == 3) {
            setState(() {
              if (colors == Colors.black) {
                colors = Colors.red;
              } else if (colors == Colors.red) {
                colors = Colors.purple[900];
              } else if (colors == Colors.purple[900]) {
                colors = Colors.green;
              } else if (colors == Colors.green) {
                colors = Colors.black;
              }
            });
          } else if (value == 4) {
            Share.share("Name : ${widget.info[index][0].toString()}\n"
                "\nAge : ${widget.info[index][1].toString()}\n"
                "\nEmail Address : ${widget.info[index][2].toString()}\n"
                "\nProfession : ${widget.info[index][3].toString()}\n");
          }
        });
  }

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

    return Scaffold(
      drawer: AppDrawer(widget.name),
      backgroundColor: Colors.blue[200],
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                //
                Container(
                  alignment: Alignment.bottomCenter,
                  height: height / 8,
                  width: width,
                  child: Container(
                    height: height / 12,
                    width: width,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 1.7),
                        child: Appbar()),
                  ),
                ),
                Divider(),

                //
                if (widget.info.length == 0)
                  Container(
                    height: height / 1.4,
                    width: width,
                    alignment: Alignment.center,
                    child: Text(
                      'Add Profile',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  )
                else
                  Container(
                    height: height / 1.4,
                    width: width,
                    child: ListView.builder(
                        itemCount: widget.info.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 12),
                            child: Material(
                              color: Colors.blue[50],
                              elevation: 10,
                              borderRadius: BorderRadius.circular(20),
                              //
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 12),
                                //
                                child: Container(
                                    height: height / 2.5,
                                    width: width / 1.2,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            //
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              height: height / 12,
                                              width: width / 1.37,
                                              child: Text(
                                                "Name : ${widget.info[index][0].toString()}",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: colors,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),

                                            //
                                            poupmenubutton(index),

                                            //
                                          ],
                                        ),

                                        //
                                        Row(
                                          children: [
                                            Container(
                                              height: height / 4,
                                              width: width / 1.2,
                                              child: Text(
                                                "Age : ${widget.info[index][1].toString()}\n"
                                                "\nEmail Address : ${widget.info[index][2].toString()}\n"
                                                "\nProfession : ${widget.info[index][3].toString()}\n",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: colors,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                          );
                        }),
                  ),
                Divider(),

                //

                RaisedButton.icon(
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    label: Text(
                      "Add Profiles",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    color: Colors.purple[700],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Cards(
                                widget.controller,
                                widget.controller1,
                                widget.controller2,
                                widget.controller3,
                                widget.info))))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
