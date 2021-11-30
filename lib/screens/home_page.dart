import 'package:flutter/material.dart';
import 'package:snail_puzzle_game/screens/game.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Game(),
                )),
            child: Text("Game")),
      ),
    );
  }
}
