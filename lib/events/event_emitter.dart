import 'dart:async';

class EventEmitter<T> {
  StreamSubscription? _streamSubscription;
  final _controller = StreamController<T>();

  Stream<T> get result async* {
    yield* _controller.stream;
  }

  void emit(T Function() value) {
    _controller.add(value.call());
  }

  void emitValue(T value) {
    _controller.add(value);
  }

  void observe(Function(T) callback) {
    _streamSubscription = result.listen((event) => callback.call(event));
  }

  void dispose() {
    _streamSubscription?.cancel();
  }
}
