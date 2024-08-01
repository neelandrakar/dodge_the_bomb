import 'package:dodge_the_bomb/game_ui/assets_constants.dart';
import 'package:dodge_the_bomb/game_ui/screens/game_ui_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

class PopBox extends StatefulWidget {

  final bool is_bomb;
  const PopBox({super.key, required this.is_bomb});

  @override
  State<PopBox> createState() => _PopBoxState();
}

class _PopBoxState extends State<PopBox> {

  Color box_color = Colors.grey;
  bool is_clicked = false;

  clickFun(){
    if(!is_clicked && !has_blast){

      if(!widget.is_bomb) {
        setState(() {
          box_color = Colors.green;
        });
      } else {
        setState(() {
          box_color = Colors.red;
          has_blast = true;
          // Phoenix.rebirth(context);
        });
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: clickFun,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: box_color,
          image: has_blast ? DecorationImage(image: AssetImage(AssetsConstants.bomb_blast), fit: BoxFit.fill) : null,
        ),

      ),
    );
  }
}
