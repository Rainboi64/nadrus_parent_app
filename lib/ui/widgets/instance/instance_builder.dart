import 'package:flutter/material.dart';
import 'package:nadrus_parent_app/config/instance_config.dart';

import 'instance_state.dart';

class InstanceBuilder<T extends Object> extends StatefulWidget {
  /// callback which wrap your widgets with the same global instance you registered in [InstanceState].
  final Widget Function(T instance) builder;

  /// pass [instanceName] if you want to register more than one instance in same lifeCycle
  final String? instanceName;

  /// wrap child widgets with the same global instance which registered in [InstanceState].
  ///
  /// no more passing variables from parent to children.
  ///
  /// just create instance in the parent in use this instance in the children widgets.
  const InstanceBuilder({this.instanceName, required this.builder, Key? key})
      : super(key: key);

  @override
  State<InstanceBuilder> createState() => _InstanceBuilderState<T>();
}

class _InstanceBuilderState<T extends Object>
    extends State<InstanceBuilder<T>> {
  @override
  Widget build(BuildContext context) {
    return widget.builder
        .call(findInstance<T>(instanceName: widget.instanceName));
  }
}
