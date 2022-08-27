import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:open_container_animation/page_1.dart';

import 'constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("Hello This Is Main Page");
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      floatingActionButton: OpenContainer(
        /// This Is Open And Close Duration
        transitionDuration: const Duration(seconds: 1),

        /// Here You Put Page Which You Want to Open
        openBuilder: (context, _) => DetailsPage(),

        /// Transition Type Which You Want
        transitionType: ContainerTransitionType.fade,

        /// Closed Shape When Page Close
        closedShape: CircleBorder(),

        /// This Color Show When You Close Page It Show Little
        closedColor: Colors.black,
        closedBuilder: (context, openContainer) =>

            /// Here You can Make Your Widget Whatever You Want
            Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).primaryColor,
          ),
          height: 80,
          width: 80,
          child: Icon(Icons.remove_red_eye, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          OpenContainer(
            transitionType: ContainerTransitionType.fade,
            transitionDuration: Duration(seconds: 3),
            openBuilder: (context, _) => DetailsPage(),
            closedShape: const RoundedRectangleBorder(),
            closedBuilder: (context, VoidCallback openContainer) => Container(
              color: Colors.blueAccent,
              height: 300,
              width: 200,
              child: InkWell(
                onTap: openContainer,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Hero(
                        tag: "1",
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage("https://source.unsplash.com/random?sig="),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            'Random Image',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Unsplash',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return DetailsPage();
                },
              ));
            },
            child: Hero(
              tag: 'hero-rectangle',
              child: Container(
                color: Colors.black,
                height: 120,
                width: 120,
              ),
            ),
          )
        ],
      ),
      /*OpenContainer(
        /// This Is Open And Close Duration
        transitionDuration: const Duration(seconds: 3),

        /// Here You Put Page Which You Want to Open
        openBuilder: (context, _) => const DetailsPage(),

        /// Transition Type Which You Want
        transitionType: ContainerTransitionType.fade,

        /// Closed Shape When Page Close
        closedShape: const RoundedRectangleBorder(),

        /// This Color Show When You Close Page It Show Little
        closedColor: Colors.black,
        closedBuilder: (context, openContainer) =>

            /// Here You can Make Your Widget Whatever You Want
            Center(
          child: GestureDetector(
            onTap: openContainer,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10)),
              child: Icon(Icons.add),
            ),
          ),
        ),
      ),*/
    );
  }
}
