import 'dart:async';
import 'package:flutter/material.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:dual/back_button.dart';
import 'dart:math';

class Game2 extends StatefulWidget {
  @override
  _Game2State createState() => _Game2State();
}

class _Game2State extends State<Game2> {
  late int endTime;
  late Timer _timer;
  int seconds = 0;
  int mseconds = 0;

  bool p1click = false;
  bool p2click = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Random rnd = new Random();
    endTime = 4 + rnd.nextInt(6);
    startTimer();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer.cancel();
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
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
                        if(p1click == false){
                          p1click = true;
                          if(seconds + mseconds/1000 < endTime){
                            //click too fast
                            Dialogs.materialDialog(
                              color: Colors.indigo,
                              msg: "player2, win!",
                              title: "GAME SET!!",
                              lottieBuilder:Lottie.asset(
                                'assets/47543-congratulation.json',
                                fit: BoxFit.contain,
                              ),
                              context:context,
                            );
                          }
                          else if (seconds + mseconds/1000 >= endTime && p2click == false){
                            Dialogs.materialDialog(
                              color: Colors.indigo,
                              msg: "player1, win!",
                              title: "GAME SET!!",
                              lottieBuilder:Lottie.asset(
                                'assets/47543-congratulation.json',
                                fit: BoxFit.contain,
                              ),
                              context:context,
                            );
                          }
                        }
                      });
                    },
                    child: Container(
                      height: 250,
                      color: (seconds >= endTime)? Colors.amber:Colors.redAccent.shade200,
                    ),
                  ),
                  MaterialButton(
                    onPressed: (){
                      setState(() {
                        if(p2click == false){
                          p2click = true;
                          if(seconds + mseconds/1000 < endTime){
                            //click too fast
                            Dialogs.materialDialog(
                              color: Colors.indigo,
                              msg: "player1, win!",
                              title: "GAME SET!!",
                              lottieBuilder:Lottie.asset(
                                'assets/47543-congratulation.json',
                                fit: BoxFit.contain,
                              ),
                              context:context,
                            );
                          }
                          else if (seconds + mseconds/1000 >= endTime && p1click == false){
                            Dialogs.materialDialog(
                              color: Colors.indigo,
                              msg: "player2, win!",
                              title: "GAME SET!!",
                              lottieBuilder:Lottie.asset(
                                'assets/47543-congratulation.json',
                                fit: BoxFit.contain,
                              ),
                              context:context,
                            );
                          }
                        }
                      });
                    },
                    child: Container(
                      height: 250,
                      color: (seconds >= endTime)? Colors.amber:Colors.blueAccent.shade200,
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
      ),
    );
  }

  void startTimer(){
    const onemilliSec = const Duration(milliseconds: 100);
    _timer = new Timer.periodic(
      onemilliSec,
          (Timer timer) => setState(
            () {
          if (mseconds < 0) {
            timer.cancel();
          } else {
            mseconds = mseconds + 100;
            if(mseconds == 1000){
              seconds += 1;
              mseconds = 0;
            }
          }
        },
      ),
    );
  }
}

void clicked(endtime, clickedtime, ){

}
