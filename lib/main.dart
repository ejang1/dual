import 'package:flutter/material.dart';
import 'package:dual/games/game_1.dart';
import 'package:dual/games/game_2.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: Dual_Home(),
    );
  }
}


class Dual_Home extends StatefulWidget {
  @override
  _Dual_HomeState createState() => _Dual_HomeState();
}

class _Dual_HomeState extends State<Dual_Home> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.deepPurple.shade800,
        child: Column(
          children: [
            SizedBox(height: 200,),
            Text("DUAL!",
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.amber,
            ),),
            //scrollable list
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 30),
                children: [
                  SizedBox(height: 50),
                  gameTile("game1",Game1(),context),
                  SizedBox(height: 20),
                  gameTile("game2",Game2(),context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Container gameTile(gametitle, nextPage,context){
  return Container(
    decoration: BoxDecoration(
      color: Colors.deepPurpleAccent.shade100,
      borderRadius: BorderRadius.circular(30),
    ),
    child: ListTile(
      title: Text(gametitle),
      minVerticalPadding: 50,
      contentPadding: EdgeInsets.symmetric(horizontal: 30),
      onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>nextPage)
      ),
    ),
  );
}