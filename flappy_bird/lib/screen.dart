/**
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flappy_bird/SonucEkrani.dart';
import 'package:flappy_bird/barriers.dart';
import 'package:flappy_bird/car.dart';
import 'game_store.dart';

class Screen extends StatefulWidget {
  final List<Map<String, dynamic>> userList;
  final int userIndex;
  final GameStore gameStore;



  const Screen({Key? key, required this.userList, required this.userIndex, required this.gameStore})
      : super(key: key);

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  final Random random = Random();

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.brown,
          title: Text("GAME OVER"),
          content: Text(
            "Score: ${widget.gameStore.score}\nBest Score: ${widget.gameStore.bestScore}",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () {
                widget.userList[widget.userIndex]['score'] = widget.gameStore.score;
                widget.gameStore.resetGame();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SonucEkrani(userList: widget.userList, gameStore: widget.gameStore,) ,
                  ),
                );
              },
              child: Text(
                "OK",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        if (widget.gameStore.gameHasStarted) {
          widget.gameStore.jump();
        } else {
          widget.gameStore.startGame(_showDialog);
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 5,
              child: Stack(
                children: [
                  Container(color: Colors.cyan),
                  Observer(
                    builder: (_) => AnimatedContainer(
                      duration: Duration(milliseconds: 0),
                      alignment: Alignment(0, widget.gameStore.carYaxis),
                      child: Car(),
                    ),
                  ),

                  Observer(
                    builder: (_) {
                      return AnimatedContainer(
                        alignment: Alignment(widget.gameStore.barrierXone, 1.1),
                        duration: Duration(milliseconds: 0),
                        child: Barriers(size: widget.gameStore.randomSize1),
                      );
                    },
                  ),
                  Observer(
                    builder: (_) => AnimatedContainer(
                      alignment: Alignment(widget.gameStore.barrierXone, -1.1),
                      duration: Duration(milliseconds: 0),
                      child: Barriers(size: widget.gameStore.randomSize2),
                    ),
                  ),
                  Observer(
                    builder: (_) => AnimatedContainer(
                      alignment: Alignment(widget.gameStore.barrierXtwo, 1.1),
                      duration: Duration(milliseconds: 0),
                      child: Barriers(size: widget.gameStore.randomSize3),
                    ),
                  ),
                  Observer(
                    builder: (_) => AnimatedContainer(
                      alignment: Alignment(widget.gameStore.barrierXtwo, -1.1),
                      duration: Duration(milliseconds: 0),
                      child: Barriers(size: widget.gameStore.randomSize4),
                    ),
                  ),
                  Observer(
                    builder: (_) => Visibility(
                      visible: !widget.gameStore.gameHasStarted,
                      child: Container(
                        alignment: Alignment(0, -0.5),
                        child: Text(
                          "CLICK TO PLAY",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(color: Colors.green, height: 10),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.brown,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Score",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(height: 20),
                        Observer(
                          builder: (_) => Text(
                            "${widget.gameStore.score}",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 30),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Best",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(height: 20),
                        Observer(
                          builder: (_) => Text(
                            "${widget.gameStore.bestScore}",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

    */

import 'dart:math';
import 'package:flappy_bird/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flappy_bird/SonucEkrani.dart';
import 'package:flappy_bird/barriers.dart';
import 'package:flappy_bird/car.dart';
import 'game_store.dart';

class Screen extends StatefulWidget {
  final List<Map<String, dynamic>> userList;
  final int userIndex;
  final GameStore gameStore;

  const Screen({Key? key, required this.userList, required this.userIndex, required this.gameStore})
      : super(key: key);

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  final Random random = Random();




  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.brown,
          title: Text("GAME OVER"),
          content: Text(
            "Score: ${widget.gameStore.score}\nBest Score: ${widget.gameStore.bestScore}",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () {
                widget.userList[widget.userIndex]['score'] = widget.gameStore.score;
                widget.gameStore.resetGame();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SonucEkrani(userList: widget.userList, gameStore: widget.gameStore,) ,
                  ),
                );
              },
              child: Text(
                "OK",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {

    var ekran = MediaQuery.of(context);
    final double ekranHeight = ekran.size.height;

    widget.gameStore.ekranYuk = ekranHeight;
    return GestureDetector(

      onTap: () {
        if (widget.gameStore.gameHasStarted) {
          widget.gameStore.jump();
        } else {
          widget.gameStore.startGame(_showDialog);
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 5,
              child: Stack(
                children: [
                  Container(color: Colors.cyan),
                  Observer(
                    builder: (_) => AnimatedContainer(
                      duration: Duration(milliseconds: 0),
                      alignment: Alignment(-0.5, -0.7),
                      child: Logo(),
                    ),
                  ),
                  Observer(
                    builder: (_) => AnimatedContainer(
                      duration: Duration(milliseconds: 0),
                      alignment: Alignment(0, widget.gameStore.carYaxis),
                      child: Car(),
                    ),
                  ),

                  Observer(
                    builder: (_) {
                      return AnimatedContainer(
                        alignment: Alignment(widget.gameStore.barrierXone, 1.1),
                        duration: Duration(milliseconds: 0),
                        child: Barriers(size: widget.gameStore.randomSize1),
                      );
                    },
                  ),
                  Observer(
                    builder: (_) => AnimatedContainer(
                      alignment: Alignment(widget.gameStore.barrierXone, -1.1),
                      duration: Duration(milliseconds: 0),
                      child: Barriers(size: widget.gameStore.randomSize2),
                    ),
                  ),
                  Observer(
                    builder: (_) => AnimatedContainer(
                      alignment: Alignment(widget.gameStore.barrierXtwo, 1.1),
                      duration: Duration(milliseconds: 0),
                      child: Barriers(size: widget.gameStore.randomSize3),
                    ),
                  ),
                  Observer(
                    builder: (_) => AnimatedContainer(
                      alignment: Alignment(widget.gameStore.barrierXtwo, -1.1),
                      duration: Duration(milliseconds: 0),
                      child: Barriers(size: widget.gameStore.randomSize4),
                    ),
                  ),
                  Observer(
                    builder: (_) => Visibility(
                      visible: !widget.gameStore.gameHasStarted,
                      child: Container(
                        alignment: Alignment(0, -0.5),
                        child: Text(
                          "CLICK TO PLAY",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(color: Colors.green, height: 10),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.brown,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Score",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(height: 20),
                        Observer(
                          builder: (_) => Text(
                            "${widget.gameStore.score}",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 30),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Best",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(height: 20),
                        Observer(
                          builder: (_) => Text(
                            "${widget.gameStore.bestScore}",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

