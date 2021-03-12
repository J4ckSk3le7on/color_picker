import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:random_color/random_color.dart';

class ColorMainTab extends StatefulWidget {

  @override
  _ColorMainTab createState() => _ColorMainTab();
}

RandomColor _randomColor = RandomColor();

class _ColorMainTab extends State<ColorMainTab> {

  List _gridItems = List.generate(50, (index) => "Item $index");

  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);

  void changeColor(Color color) {
  setState(() => pickerColor = color);
}

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF2C3D40),
       child: Scrollbar(
         child: Padding(
           padding: const EdgeInsets.all(12.0),
           child: GridView.builder(
             itemCount: _gridItems.length,
             gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent
             (
               maxCrossAxisExtent: 130,
               crossAxisSpacing: 20,
               mainAxisSpacing: 20
             ),
             itemBuilder: (_, index) {
               return GestureDetector(
                 onTap: () => print("ALGO"),
                 child: Container(
                   height: 15,
                   width: 15,
                   decoration: BoxDecoration(
                     color: _randomColor.randomColor(
                       colorSaturation: ColorSaturation.mediumSaturation
                     ),
                     borderRadius: BorderRadius.circular(20)
                   ),
                 ),
               );
             },
          ),
         ),
       ),
    );
  }

  _colorPicker(context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Select color!"),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: pickerColor,
            onColorChanged: changeColor,
            showLabel: true,
            pickerAreaHeightPercent: 0.8,
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text("Got it"),
            onPressed: () {
              setState(() {
                currentColor = pickerColor;
                Navigator.of(context).pop();                
              });
            },
          )
        ],
      )
    );
  }

}



// onPressed: () {},
// style: ButtonStyle(
  // backgroundColor: MaterialStateProperty.all<Color>(_randomColor.randomColor())
// ),

// return Container(
  // color: _randomColor.randomColor(),
  // height: 20,
  // width: 20,
// );