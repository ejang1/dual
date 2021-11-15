import 'package:flutter/material.dart';
import 'package:dual/back_button.dart';
import 'package:material_dialogs/material_dialogs.dart';
class Game1 extends StatefulWidget {
  const Game1({Key? key}) : super(key: key);

  @override
  _Game1State createState() => _Game1State();
}

class _Game1State extends State<Game1> {
  double height1 = 250;
  double height2 = 250;
  int finished = -1;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurpleAccent,
      padding: EdgeInsets.fromLTRB(30, 100, 30, 50),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      if(finished == -1){
                        height1 += 10;
                        height2 -= 10;
                        finished = winnerCheck(height1, height2);
                      }
                      else{
                        Dialogs.materialDialog(
                          color: Colors.indigo,
                          msg: "player${finished}, win!",
                          title: "GAME SET!!",
                          lottieBuilder:Lottie.asset(
                            'assets/47543-congratulation.json',
                            fit: BoxFit.contain,
                          ),
                          context:context,
                        );
                      }
                    });
                  },
                  child: Container(
                    height: height1,
                    color: Colors.redAccent.shade200,
                  ),
                ),
                MaterialButton(
                  onPressed: (){
                    setState(() {
                      if(finished == -1){
                        height1 -= 10;
                        height2 += 10;
                        finished = winnerCheck(height1, height2);
                      }
                      else{
                        Dialogs.materialDialog(
                          color: Colors.indigo,
                          msg: "player${finished}, win!",
                          title: "GAME SET!!",
                          lottieBuilder:Lottie.asset(
                            'assets/47543-congratulation.json',
                            fit: BoxFit.contain,
                          ),
                          context:context,
                        );
                      }
                    });
                  },
                  child: Container(
                    height: height2,
                    color: Colors.blueAccent.shade200,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          RawMaterialButton(
              onPressed: ()=>Navigator.pop(context),
          child: CustomPaint(
            painter: new BackButtonShape(),
            child: Container(
              height: 50,
              width: 50,
            ),
          ),)
        ],
      ),
    );
  }
}

int winnerCheck(h1,h2){
  if (h1 == 0){
    return 2;
  }
  if (h2 == 0) {
    return 1;
  }
  return -1;
}