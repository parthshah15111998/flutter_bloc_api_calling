
import 'package:new_bloc_api_calling/model.dart';

abstract class CharacterState {}

class CharacterInitials extends CharacterState {}

class CharacterLoading extends CharacterState {}

class CharacterLoaded extends CharacterState {
  final List<CharacterModel> listMain;
  CharacterLoaded(this.listMain);
}

class CharacterError extends CharacterState {
  final String msg;
  CharacterError(this.msg);
}