import 'package:flutter/material.dart';

extension SimpleNavigation on BuildContext {
  navigateTo(Widget view) {
    Navigator.pushReplacement(this, MaterialPageRoute(builder: (context) {
      return view;
    }));
  }
}
