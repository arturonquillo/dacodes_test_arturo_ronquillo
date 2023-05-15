import 'package:dacodes_test/app/bindings/remote_binding.dart';
import 'package:get/get.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    RemoteBinding().dependencies();
  }
}
