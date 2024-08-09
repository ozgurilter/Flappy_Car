/**
import 'dart:async';
import 'dart:math';
import 'package:flappy_bird/screen.dart';
import 'package:mobx/mobx.dart';


part 'game_store.g.dart';

class GameStore = _GameStore with _$GameStore;

final Random random = Random();

abstract class _GameStore with Store {
  @observable
  double carYaxis = 0;

  @observable
  double time = 0;

  @observable
  double height = 0;

  @observable
  double initialHeight = 0;

  @observable
  bool gameHasStarted = false;

  @observable
  double barrierXone = 1;

  @observable
  double barrierXtwo = 2.2;

  @observable
  int score = 0;

  @observable
  int bestScore =0;


  @observable
  var randomSize1 = 160;
  var randomSize2 = 200;
  var randomSize3 = 150;
  var randomSize4 = 250;



  @action
  void jump() {
    time = 0;
    initialHeight = carYaxis;
  }
  @action
  void updateBest(int score){
    if (score > bestScore) {
      bestScore = score;
    }
  }

  @action
  int _getRandomSize(var x, var y) {
   return (x + random.nextInt(y)) ;
  }


  @action
  void startGame(Function showDialog) {
    gameHasStarted = true;
    Timer.periodic(Duration(milliseconds: 60), (timer) {
      time += 0.05;
      height = -4.9 * time * time + 2.8 * time;
      carYaxis = initialHeight - height;

      if (barrierXone < -1.5) {
        barrierXone += 3.5;
        randomSize1 = _getRandomSize(90,70);
        randomSize2 = _getRandomSize(50, 150);
        score += 1;
      } else {
        barrierXone -= 0.05;
      }

      if (barrierXtwo < -1.8) {
        barrierXtwo += 3.5;
        randomSize3 = _getRandomSize(50,70);
        randomSize4 = _getRandomSize(50, 200);
        score += 1;
      } else {
        barrierXtwo -= 0.05;
      }

      if (carYaxis > 1 || carYaxis < -1) {
        timer.cancel();
        gameHasStarted = false;
        updateBest(score);

        showDialog();
      }
    });
  }

  @action
  void resetGame() {
    carYaxis = 0;
    time = 0;
    height = 0;
    initialHeight = carYaxis;
    gameHasStarted = false;
    barrierXone = 1;
    barrierXtwo = 2.2;
    score = 0;
  }
}

*/

import 'dart:async';
import 'dart:math';
import 'package:mobx/mobx.dart';
import 'package:flappy_bird/screen.dart';


part 'game_store.g.dart';

class GameStore = _GameStore with _$GameStore;

final Random random = Random();


abstract class _GameStore with Store {
  @observable
  double carYaxis = 0;

  @observable
  double time = 0;

  @observable
  double height = 0;

  @observable
  double initialHeight = 0;

  @observable
  bool gameHasStarted = false;

  @observable
  double barrierXone = 1;

  @observable
  double barrierXtwo = 2.6;

  @observable
  int score = 0;

  @observable
  int bestScore =0;


  @observable
  var randomSize1 = 200; //aşagıdaki
  var randomSize2 = 120; //yukardaki
  var randomSize3 = 150; //aşağıdaki
  var randomSize4 = 250; //yukardaki
  double ekranYuk = 0.0;


  @action
  void jump() {
    time = 0;
    initialHeight = carYaxis;

  }
  @action
  void updateBest(int score){
    if (score > bestScore) {
      bestScore = score;
    }
  }

  @action
  int _getRandomSize(var x, var y) {
    return (x + random.nextInt(y)) ;
  }


  @action
  void startGame(Function showDialog) {
    gameHasStarted = true;
    Timer.periodic(Duration(milliseconds: 60), (timer) {
      time += 0.05;
      height = -4.9 * time * time + 2.8 * time;
      carYaxis = initialHeight - height;

      if (barrierXone < -1.5) {
        barrierXone += 3.5;
        randomSize1 = _getRandomSize(90,70);
        randomSize2 = _getRandomSize(50, 150);
        score += 1;
      } else {
        barrierXone -= 0.05;
      }

      if (barrierXtwo < -1.8) {
        barrierXtwo += 3.5;
        randomSize3 = _getRandomSize(50,70);
        randomSize4 = _getRandomSize(50, 200);
        score += 1;
      } else {
        barrierXtwo -= 0.05;
      }

      if (carYaxis > 1 || carYaxis < -1) {
        timer.cancel();
        gameHasStarted = false;
        updateBest(score);

        showDialog();
      }


      if (barrierXone < 0.32 && barrierXone > -0.32) {
        if (carYaxis < -(((ekranYuk -10) *5 / 28)*0.54/randomSize2) || carYaxis > (((ekranYuk -10) *5 / 28)*0.54/randomSize1)) {
          timer.cancel();
          gameHasStarted = false;
          updateBest(score);

          showDialog();
        }
      }

      if (barrierXtwo < 0.3 && barrierXtwo > -0.3) {
        if (carYaxis < -(((ekranYuk -10) *5 / 28)*0.52/randomSize4) || carYaxis > (((ekranYuk -10) *5 / 28)*0.54/randomSize3)) {
          timer.cancel();
          gameHasStarted = false;
          updateBest(score);

          showDialog();
        }
      }

    });
  }

  @action
  void resetGame() {
    carYaxis = 0;
    time = 0;
    height = 0;
    initialHeight = carYaxis;
    gameHasStarted = false;
    barrierXone = 1;
    barrierXtwo = 2.2;
    score = 0;
  }
}




