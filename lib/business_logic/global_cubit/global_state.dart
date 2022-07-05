part of 'global_cubit.dart';

@immutable
abstract class GlobalState {}

class GlobalInitial extends GlobalState {}
class GlobalLoading extends GlobalState {}
class GlobalSuccess extends GlobalState {
  final UserModel userModel;

  GlobalSuccess(this.userModel);

}
class GlobalError extends GlobalState {
  GlobalError(String string);
}
class ShowPassword extends GlobalState {}
class HidePassword extends GlobalState {}
