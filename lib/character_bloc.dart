import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_bloc_api_calling/character_event.dart';
import 'package:new_bloc_api_calling/character_state.dart';
import 'package:new_bloc_api_calling/model.dart';

class CharacterBloc extends Bloc<CharacterEvent,CharacterState>{
  final Dio dio = Dio();

  CharacterBloc() : super(CharacterInitials()){
    on<FetchCharacterList>((event,emit)async{
      try{
        emit(CharacterLoading());
        final response = await dio.get("https://www.simplifiedcoding.net/demos/marvel/");

        List list = response.data;

        List<CharacterModel> listMain = list.map((e)=>CharacterModel.fromJson(e)).toList();
        emit(CharacterLoaded(listMain));

      }catch(e){
        emit(CharacterError(e.toString()));
      }
    });
  }



}