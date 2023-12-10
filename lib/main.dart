import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:how_to_riverpod/router/my_app.dart';

void main() {
  //MyApp()をProviderScopeで囲み、それをrunAppする
  const app = ProviderScope(child: MyApp());
  runApp(app);
}
