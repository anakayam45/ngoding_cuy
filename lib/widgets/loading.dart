import 'package:flutter/material.dart';

class MyCostumLoading extends StatefulWidget {
  final String info;
  const MyCostumLoading({super.key, required this.info});

  @override
  State<MyCostumLoading> createState() => _MyCostumLoadingState();
}

class _MyCostumLoadingState extends State<MyCostumLoading> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Container(
          color: Colors.amber,
          child: Text(widget.info),
        ),
      ),
    );
  }
}
