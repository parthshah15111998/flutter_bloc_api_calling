
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_bloc_api_calling/character_bloc.dart';
import 'package:new_bloc_api_calling/character_state.dart';

import 'character_event.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (BuildContext context) {
          return CharacterBloc()..add(FetchCharacterList());
        },
        child: Scaffold(
          body: BlocBuilder<CharacterBloc,CharacterState>(
            builder: (BuildContext context, state) {
              // if(state is CharacterInitial){
              //   context.read<CharacterBloc>().fetchCharacter();
              //   return Center(child: Text("Loading..",style: TextStyle(fontSize: 20,color: Colors.black),),);
              // }
              if(state is CharacterLoading){
                return Center(child: CircularProgressIndicator(color: Colors.black,),);
              }
              if(state is CharacterLoaded) {
                final list  =  state.listMain;
                return ListView.builder(
                  itemCount: list.length,
                    itemBuilder: (context, index) {
                      final itam = list[index];
                      return ListTile(
                        title: Text("${itam.name}"),
                        subtitle: Text("${itam.realName}"),
                        leading: Image.network("${itam.imageUrl}"),
                      );
                    },);
              }

              if(state is CharacterError) {
                return Center(child: Text("Error Mes:-${state.msg}"),);
              }
              return SizedBox();
            },
            ),
          ),
        ),
      );
  }
}
