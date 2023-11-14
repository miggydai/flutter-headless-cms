import 'package:flutter/material.dart';
import 'package:flutter_headless_cms/widgets/sidebar_tile.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 7,
      child: Container(
        width: 300,
        height: MediaQuery.of(context).size.height,
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SidebarTile(),
            SidebarTile()
          ],
        ),
      ),
    );
  }
}