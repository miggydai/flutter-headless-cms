import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_headless_cms/models/posts.dart';
import 'package:flutter_headless_cms/services/wp_api.dart';
import 'package:flutter_headless_cms/widgets/card.dart';
import 'package:wordpress_client/wordpress_client.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
      },
    ));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Posts> allPosts = [];
  @override
  void initState() {
    super.initState();
    getPostDataWP();
  }

  Future<void> getPostDataWP() async {
    var request =
        ListPostRequest(page: 1, perPage: 20, status: ContentStatus.publish);

    final wpResponse = await WP_Api().myclient.posts.list(request);

// Dart 3 style
// switch (wpResponse) {
//     case WordpressSuccessResponse():
//       final data = wpResponse.data; // List<Post>
//       break;
//     case WordpressFailureResponse():
//       final error = wpResponse.error; // WordpressError
//       break;
// }

// or
// wordpress_client style
    final result = wpResponse.map(
      onSuccess: (response) {
        // print(response.message);
        // print(response.data.length.toString());
        // print(response.data[0].title?.parsedText.toString());
        return response.data;
      },
      onFailure: (response) {
        print(response.error.toString());
        return <Post>[];
      },
    );
    List<Posts> wpPostsArr = [];
    result.forEach((element) {
      Posts dposts = Posts(
        id: element.id.toString(),
        title: element.title?.parsedText.toString() ?? "",
        content: element.content?.parsedText.toString() ?? "",
      );
      wpPostsArr.add(dposts);
    });

    setState(() {
      allPosts = wpPostsArr;
    });
  }

  List<Posts> wpPostsArr = [];

  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Stack(
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 700,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://static.wixstatic.com/media/dc9771_fb7844201fe5414699f6e344dd95ba74~mv2.gif/v1/fill/w_1600,h_900,al_c,q_90/file.jpg"),
                          fit: BoxFit.cover))),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "GovPh",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 25),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Icon(Icons.ac_unit_outlined),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Department",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 70,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Text(
                        "of",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 70,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "Tourism",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 70,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width * .5,
            height: 512,
            child: Expanded(
                child: allPosts.isNotEmpty
                    ? ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: allPosts.length,
                        itemBuilder: (BuildContext context, int index) {
                          if (allPosts.isNotEmpty) {
                            return MyCard(post: allPosts[index]);
                          } else
                            return Text("no posts");
                        })
                    : Center(child: Text("no posts"))),
          )
        ],
      ),
    ));
  }
}
