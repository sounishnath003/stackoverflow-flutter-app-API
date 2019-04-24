import 'package:stack_over_flow/home/index.dart';

class HomeProvider {
  final HomeRepository _homeRepository = new HomeRepository();

  HomeProvider();

  void test() {
    this._homeRepository.test();
  }
}
