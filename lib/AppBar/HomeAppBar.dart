import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF4C53A5), // Màu nền của AppBar
      elevation: 0,
      title: Row(
        children: [
          // Text giữa AppBar
          Expanded(
            child: Text(
              "TFSEN",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(width: 10),
          // Icon cho Favorite
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, "favorite");
            },
          ),
          SizedBox(width: 10),
          // Icon cho Account
          IconButton(
            icon: Icon(
              Icons.account_circle,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              Navigator.pushNamed(context, "account");
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
