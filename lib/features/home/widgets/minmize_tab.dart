import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class MinimizedTabStyle extends StyleHook {
  @override
  double get activeIconSize => 22;

  @override
  double get activeIconMargin => 4;

  @override
  double get iconSize => 20; 

  @override
  TextStyle textStyle(Color color, String? fontFamily) {
    return TextStyle(
      fontSize: 12,
      color: color,
    );
  }
}