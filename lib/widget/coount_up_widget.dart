import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:how_to_riverpod/notifier/count_up.dart';
//ConsumerWidgetを使用する
class CountUpWidet extends ConsumerWidget {
  const CountUpWidet({super.key});

  @override
  //ConsumerWidgetを使用する際は「WidgetRef ref」を追加する
  Widget build(BuildContext context, WidgetRef ref) {
    //watchで状態を監視し続け、countUpに状態を格納
    final countUp = ref.watch(countUpNotifierProvider);

    //listenで状態を監視しつづけ、状態の変化があったらスナクッバーで通知される
    ref.listen(
      countUpNotifierProvider,
      (oldState, newState) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$oldState から $newState に変更されました。'),
            duration: const Duration(milliseconds: 1000),
          ),
        );
      },
    );

    final button = ElevatedButton(
      onPressed: () {
        //readで状態を変更する為のnotifierを作成し、updateStateの情報を書き換え
        final notifire = ref.read(countUpNotifierProvider.notifier);
        notifire.updateState();
      },
      child: const Text('1増やす'),
    );

    return Center(
      child: Container(
        width: 300,
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '$countUp',
              style: const TextStyle(fontSize: 50),
            ),
            button,
          ],
        ),
      ),
    );
  }
}
