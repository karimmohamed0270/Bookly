import 'package:flutter/material.dart';

class Errorswidget extends StatelessWidget {
  const Errorswidget({super.key, required this.errorMes});
  final String errorMes;
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(errorMes));
  }
}
