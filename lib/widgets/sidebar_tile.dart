import 'package:flutter/material.dart';

class SidebarTile extends StatelessWidget {
  const SidebarTile({super.key});

  @override
  Widget build(BuildContext context) {
    return 
     Card(
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            debugPrint('Card tapped.');
          },
          child: const SizedBox(
            width: double.infinity,
            height: 50,
            child: Center(child: Text("item"),),
          ),
        ),
      );
    
  }
}