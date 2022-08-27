import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:open_container_animation/page_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
      floatingActionButton: OpenContainer(
        /// This Is Open And Close Duration
        transitionDuration: const Duration(seconds: 1),

        /// Here You Put Page Which You Want to Open
        openBuilder: (context, _) => const DetailsPage(),

        closedShape: const RoundedRectangleBorder(),

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
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsPage()));
          },
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
