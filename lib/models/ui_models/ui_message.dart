enum UiMessageState { success, error, initial }

class UiMessage {
  String? message;
  String? action;
  UiMessageState state;
  UiMessage({this.message, this.action, this.state = UiMessageState.initial});
}
