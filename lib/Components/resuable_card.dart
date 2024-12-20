import 'package:flutter/material.dart';

class ElementContainer extends StatelessWidget {
  final Color color;
  final Widget ? childComponent;
  final VoidCallback ? OnPress;
  const ElementContainer(
      {super.key, required this.color,  this.childComponent, this.OnPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: OnPress,
      child: Container(
        margin: EdgeInsets.all(20),
        width: 200.0,
        height: 200.0,
        decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)),
        child: childComponent,
      ),
    );
  }
}
