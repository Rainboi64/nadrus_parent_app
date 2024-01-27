import 'package:lazy_evaluation/lazy_evaluation.dart';
import 'package:nadrus_parent_app/viewmodels/base_viewmodel.dart';

import "children_params.dart";

class ChildrenViewModel extends BaseViewModel {
  final _params = Lazy(() => ChildrenParams());
  ChildrenParams get params => _params.value;

  @override
  void onInit() {
    super.onInit();
    // called immediately after the widget is allocated in memory.
  }

  @override
  void onDispose() {
    // called immediately before the widget is disposed
    super.onDispose();
  }
}
