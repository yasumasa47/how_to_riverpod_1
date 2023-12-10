// TODO notifireを完成させる => コマンド打つ必要あり

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'count_up.g.dart';

@riverpod
class CountUpNotifier extends _$CountUpNotifier {
  @override
  int build() {
    return 0;
  }

  void updateState() {
    final oldState = state;
    final newState = oldState + 1;
    state = newState;
  }
}

/**
 * 作成されたプロバイダーは先頭小文字で自動で名前がつく
 * 例:S1Notifire >> s1NotifireProvider
 *
 * riverpod_generaterを使うには、プロジェクトのディレクトリで下記コマンドを実行。
 * flutter pub run build_runner build --delete-conflicting-outputs
 *
 */
