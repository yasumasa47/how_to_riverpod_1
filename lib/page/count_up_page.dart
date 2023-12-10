import 'package:flutter/material.dart';
import 'package:how_to_riverpod/widget/coount_up_widget.dart';

class CountUp extends StatelessWidget {
  const CountUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOW TO RIVERPOD 1'),
      ),
      body: CountUpWidet(),
    );
  }
}