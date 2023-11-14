import 'package:flutter/material.dart';
import 'package:flutter_headless_cms/widgets/card.dart';
import 'package:flutter_headless_cms/widgets/sidebar.dart';

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
  appBar: AppBar(
    title: Text("GovPH"),
    actions: <Widget>[
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStatePropertyAll(Colors.white)
            ),
            onPressed: () {},
            child: const Text('Action 1'),
          ),
          InkWell(
            child: TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(Colors.white)
              ),
              onPressed: () {},
              child: const Text('Action 2'),
            ),
          ),
        ],
      ),
  
    body: 
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.blue,
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.blueGrey,
                ),
                MyCard()
              ],
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