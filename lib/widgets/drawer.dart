import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageUrl =
        'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';
    return Drawer(
      child: Container(
        color: Colors.purple.shade900,
        child: ListView(
          children: [
            DrawerHeader(
              margin: null,
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
                accountEmail: Text(
                  'nyure@gmail.com',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                accountName: Text(
                  'nirmal',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.account_circle,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.mail,
                color: Colors.white,
              ),
              title: Text(
                "Email ",
                textScaleFactor: 1,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
