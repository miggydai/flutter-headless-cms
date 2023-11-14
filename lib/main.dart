import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => const HomePage(),
      },
    ));

  class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (BuildContext, BoxConstraints constraints) {
                if (constraints.maxWidth > 600) {
                  return WebView(context);
                } else {
                   return mobileView(context);
                }
              })
    );
  }
}


Scaffold WebView(BuildContext context){
  return Scaffold(
   body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Center(
            child: Text("hi"),
          )
          ],
        ),
      )
      );
}

Scaffold mobileView (BuildContext context){
  return Scaffold(
    
    body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text("hi"),
            )
          ],
        ),
      )
  );
}