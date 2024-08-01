import 'dart:math';

import 'package:dodge_the_bomb/game_ui/widgets/pop_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
bool has_blast = false;
class GameUIScreen extends StatefulWidget {
  const GameUIScreen({super.key});

  @override
  State<GameUIScreen> createState() => _GameUIScreenState();
}

class _GameUIScreenState extends State<GameUIScreen> {
  bool is_modded = false;
  @override
  Widget build(BuildContext context) {

    Random random = Random();
    int randomNumber = random.nextInt(17);
    print('random: '+ randomNumber.toString());

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Dodge The Bomb', style: TextStyle(color: Colors.white)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
            Switch(
            // This bool value toggles the switch.
              value: is_modded,
              activeColor: Colors.red,
              onChanged: (bool value) {
              // This is called when the user toggles the switch.
              setState(() {
                if(!is_modded){
                  is_modded = true;
                } else {
                  is_modded = false;
                }

                print(is_modded);

              });
            }),

                Container(
                    color: Colors.black,
                    height: 700,
                    width: 700,
                    child: GridView.count(
                      crossAxisCount: 4,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2,
                      children: List.generate(16, (i) {

                        bool make_bomb = false;

                        if(i==randomNumber && !is_modded){
                          make_bomb = true;
                        } else if(is_modded){
                          make_bomb = true;
                        }
                        return PopBox(
                          is_bomb: make_bomb,
                        );
                      }),
                    )
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}
