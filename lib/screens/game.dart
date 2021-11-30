import 'package:flutter/material.dart';
import 'package:snail_puzzle_game/models/snail_model.dart';

enum MoveType { left, right, up, down }

class Game extends StatefulWidget {
  Game({Key? key}) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  late SnailModel snail;

  final List<List<double>> gamePad = [
    [1, 0, 2, 0],
    [0, 0, 0, 0],
    [0, 0, 0, 0],
    [0, 0, 0, 0]
  ];

  @override
  void initState() {
    super.initState();
    snail = SnailModel(x: 25, y: 25);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                makeMove(MoveType.right);
              },
              icon: const Icon(Icons.arrow_right)),
          IconButton(
              onPressed: () {
                makeMove(MoveType.left);
              },
              icon: const Icon(Icons.arrow_left)),
        ],
      ),
      body: Center(
        child: SizedBox(
          height: 200,
          width: 200,
          child: Stack(
            children: [
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemCount: 16,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 50,
                    height: 50,
                    color: Colors.blue,
                  );
                },
              ),
              AnimatedPositioned.fromRect(
                  duration: Duration(seconds: 1),
                  rect: Rect.fromCenter(
                      center: Offset(snail.getX, snail.getY),
                      width: 50,
                      height: 50),
                  child: Container(color: Colors.red)),
            ],
          ),
        ),
      ),
    );
  }

  void makeMove(MoveType moveType) {
    int snailXCord = (snail.getX / 50).floor();
    int snailYCord = (snail.getY / 50).floor();
    print(snailXCord);
    print(snailYCord);
    switch (moveType) {
      case MoveType.left:
        for (var i = snailXCord - 1; i > -1; i--) {
          if (gamePad[snailYCord][i] != 2) {
            snail.setX = snail.getX - 50;
          }
          else{
            break;
          }
        }
        setState(() {});
        break;
      case MoveType.right:
        for (var i = snailXCord + 1; i < gamePad[snailYCord].length; i++) {
          if (gamePad[snailYCord][i] != 2) {
            snail.setX = snail.getX + 50;
          } else {
            break;
          }
        }
        setState(() {});
        print(snail.getX);
        break;
      case MoveType.down:
        break;
      case MoveType.up:
        break;
    }
  }

  void controlReachToTarget() {}
}
