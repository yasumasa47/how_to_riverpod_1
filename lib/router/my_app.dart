import 'package:flutter/material.dart';
import 'package:how_to_riverpod/page/count_up_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CountUp(),
    );
  }
}
