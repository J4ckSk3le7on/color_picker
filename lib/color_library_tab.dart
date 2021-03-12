import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

class ColorLibraryTab extends StatefulWidget {

  @override
  _ColorLibraryTabState createState() => _ColorLibraryTabState();
}

RandomColor _randomColor = RandomColor();

class _ColorLibraryTabState extends State<ColorLibraryTab> {

  List _gridItems = List.generate(100, (index) => "Item $index");

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
              maxCrossAxisExtent: 100,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20
            ),
            itemBuilder: (_, index) {
              return GestureDetector(
                onTap: () => print("Algo We"),
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    color: _randomColor.randomColor(),
                    borderRadius: BorderRadius.circular(60)
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}