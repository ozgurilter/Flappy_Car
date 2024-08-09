// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GameStore on _GameStore, Store {
  late final _$carYaxisAtom =
      Atom(name: '_GameStore.carYaxis', context: context);

  @override
  double get carYaxis {
    _$carYaxisAtom.reportRead();
    return super.carYaxis;
  }

  @override
  set carYaxis(double value) {
    _$carYaxisAtom.reportWrite(value, super.carYaxis, () {
      super.carYaxis = value;
    });
  }

  late final _$timeAtom = Atom(name: '_GameStore.time', context: context);

  @override
  double get time {
    _$timeAtom.reportRead();
    return super.time;
  }

  @override
  set time(double value) {
    _$timeAtom.reportWrite(value, super.time, () {
      super.time = value;
    });
  }

  late final _$heightAtom = Atom(name: '_GameStore.height', context: context);

  @override
  double get height {
    _$heightAtom.reportRead();
    return super.height;
  }

  @override
  set height(double value) {
    _$heightAtom.reportWrite(value, super.height, () {
      super.height = value;
    });
  }

  late final _$initialHeightAtom =
      Atom(name: '_GameStore.initialHeight', context: context);

  @override
  double get initialHeight {
    _$initialHeightAtom.reportRead();
    return super.initialHeight;
  }

  @override
  set initialHeight(double value) {
    _$initialHeightAtom.reportWrite(value, super.initialHeight, () {
      super.initialHeight = value;
    });
  }

  late final _$gameHasStartedAtom =
      Atom(name: '_GameStore.gameHasStarted', context: context);

  @override
  bool get gameHasStarted {
    _$gameHasStartedAtom.reportRead();
    return super.gameHasStarted;
  }

  @override
  set gameHasStarted(bool value) {
    _$gameHasStartedAtom.reportWrite(value, super.gameHasStarted, () {
      super.gameHasStarted = value;
    });
  }

  late final _$barrierXoneAtom =
      Atom(name: '_GameStore.barrierXone', context: context);

  @override
  double get barrierXone {
    _$barrierXoneAtom.reportRead();
    return super.barrierXone;
  }

  @override
  set barrierXone(double value) {
    _$barrierXoneAtom.reportWrite(value, super.barrierXone, () {
      super.barrierXone = value;
    });
  }

  late final _$barrierXtwoAtom =
      Atom(name: '_GameStore.barrierXtwo', context: context);

  @override
  double get barrierXtwo {
    _$barrierXtwoAtom.reportRead();
    return super.barrierXtwo;
  }

  @override
  set barrierXtwo(double value) {
    _$barrierXtwoAtom.reportWrite(value, super.barrierXtwo, () {
      super.barrierXtwo = value;
    });
  }

  late final _$scoreAtom = Atom(name: '_GameStore.score', context: context);

  @override
  int get score {
    _$scoreAtom.reportRead();
    return super.score;
  }

  @override
  set score(int value) {
    _$scoreAtom.reportWrite(value, super.score, () {
      super.score = value;
    });
  }

  late final _$bestScoreAtom =
      Atom(name: '_GameStore.bestScore', context: context);

  @override
  int get bestScore {
    _$bestScoreAtom.reportRead();
    return super.bestScore;
  }

  @override
  set bestScore(int value) {
    _$bestScoreAtom.reportWrite(value, super.bestScore, () {
      super.bestScore = value;
    });
  }

  late final _$randomSize1Atom =
      Atom(name: '_GameStore.randomSize1', context: context);

  @override
  int get randomSize1 {
    _$randomSize1Atom.reportRead();
    return super.randomSize1;
  }

  @override
  set randomSize1(int value) {
    _$randomSize1Atom.reportWrite(value, super.randomSize1, () {
      super.randomSize1 = value;
    });
  }

  late final _$_GameStoreActionController =
      ActionController(name: '_GameStore', context: context);

  @override
  void jump() {
    final _$actionInfo =
        _$_GameStoreActionController.startAction(name: '_GameStore.jump');
    try {
      return super.jump();
    } finally {
      _$_GameStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateBest(int score) {
    final _$actionInfo =
        _$_GameStoreActionController.startAction(name: '_GameStore.updateBest');
    try {
      return super.updateBest(score);
    } finally {
      _$_GameStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  int _getRandomSize(dynamic x, dynamic y) {
    final _$actionInfo = _$_GameStoreActionController.startAction(
        name: '_GameStore._getRandomSize');
    try {
      return super._getRandomSize(x, y);
    } finally {
      _$_GameStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void startGame(Function showDialog) {
    final _$actionInfo =
        _$_GameStoreActionController.startAction(name: '_GameStore.startGame');
    try {
      return super.startGame(showDialog);
    } finally {
      _$_GameStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetGame() {
    final _$actionInfo =
        _$_GameStoreActionController.startAction(name: '_GameStore.resetGame');
    try {
      return super.resetGame();
    } finally {
      _$_GameStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
carYaxis: ${carYaxis},
time: ${time},
height: ${height},
initialHeight: ${initialHeight},
gameHasStarted: ${gameHasStarted},
barrierXone: ${barrierXone},
barrierXtwo: ${barrierXtwo},
score: ${score},
bestScore: ${bestScore},
randomSize1: ${randomSize1}
    ''';
  }
}
