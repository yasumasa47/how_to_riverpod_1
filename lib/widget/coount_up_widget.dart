import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:how_to_riverpod/notifier/count_up.dart';

//①　StatelessWidget => ConsumerWidget　にする
class CountUpWidet extends ConsumerWidget {
  const CountUpWidet({super.key});

  @override
  //②　ConsumerWidgetを使用する際は「WidgetRef ref」を追加する
  Widget build(BuildContext context, WidgetRef ref) {
    //③　watchで状態を監視し続ける。countUpに状態を格納。
    final countUp = ref.watch(countUpNotifierProvider);

    //④ listenで状態を監視しつづけ、状態の変化があったらスナクッバーで通知される。
    ref.listen(
      countUpNotifierProvider,
      (oldState, newState) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$oldState から $newState に変更されました。'),
            duration: const Duration(milliseconds: 200),
          ),
        );
      },
    );

    final button = ElevatedButton(
      onPressed: () {
        //⑤readで状態を変更する為のnotifierを作成。updateStateを呼び出して状態変更
	      //　watchとlistenは状態を見続けているので、画面上の値も変更され、スナックバーも表示される
        final notifire = ref.read(countUpNotifierProvider.notifier);
        notifire.updateState();
      },
      child: const Text('1増やす'),
    );

/**********************
 *   実際のウィジェット  *
 **********************/
    return Center(
      child: Container(
        width: 300,
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '$countUp',    //=> watchで監視しているstate
              style: const TextStyle(fontSize: 50),
            ),
            button,          //=> notifierで状態変更をするためのボタン
          ],
        ),
      ),
    );
  }
}
