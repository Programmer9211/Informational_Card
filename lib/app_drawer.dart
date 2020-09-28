import 'dart:io';

import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Dialoges.dart';

class AppDrawer extends StatelessWidget {
  String name;

  AppDrawer(this.name);

  Widget tiles(String show, Icon icon, void tap()) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Material(
        elevation: 10,
        color: Colors.blue[80],
        borderRadius: BorderRadius.circular(18),
        child: ListTile(
          leading: icon,
          title: Text(
            show,
            style: TextStyle(fontSize: 17, color: Colors.purple[800]),
          ),
          onTap: tap,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    void onTap() {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                title: Text(
                  'Exit',
                  style: TextStyle(
                      color: Colors.purple[900],
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                content: Text(
                  'Do you want to exit app',
                  style: TextStyle(
                      color: Colors.purple[900],
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                actions: [
                  FlatButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Cancel')),
                  FlatButton(onPressed: () => exit(0), child: Text('OK'))
                ],
              ));
    }

    return Drawer(
      child: Container(
        color: Colors.blue[200],
        child: Column(
          children: [
            UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(30))),
                accountName: Text(
                  "Name",
                  style: TextStyle(fontSize: 20, color: Colors.purple[900]),
                ),
                currentAccountPicture:
                    ClipOval(child: Image.asset("assets/w.png")),
                accountEmail: null),
            Divider(),
            tiles(
                "Your Profile",
                Icon(
                  Icons.create,
                  color: Colors.purple[900],
                ),
                () => showDialog(
                    context: context, builder: (context) => Dialoges())),

            //

            tiles(
                "Share App",
                Icon(
                  Icons.share,
                  color: Colors.purple[900],
                ), () {
              Share.share(
                  "https://drive.google.com/file/d/1-gsfKVQ1hdn33L1VebMF7p4UUkZSRj13/view?usp=sharing");
            }),

            //

            tiles("Rate Us", Icon(Icons.star, color: Colors.purple[900]),
                () async {
              final url =
                  "https://play.google.com/store/apps/details?id=com.activision.callofduty.shooter&hl=en_IN";
              if (await canLaunch(url)) {
                launch(url);
              }
            }),

            tiles(
                "Exit App", Icon(Icons.exit_to_app, color: Colors.purple[900]),
                () {
              onTap();
            }),

            //
          ],
        ),
      ),
    );
  }
}
