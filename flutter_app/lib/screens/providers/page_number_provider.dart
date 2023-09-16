import 'package:flutter_riverpod/flutter_riverpod.dart';

final pageNumberProvider = StateNotifierProvider<PageNumberProvider, int>(
  (ref) {
    return PageNumberProvider();
  },
);

class PageNumberProvider extends StateNotifier<int> {
  PageNumberProvider() : super(0);

  void setPage(int index) {
    state = index;
  }
}
