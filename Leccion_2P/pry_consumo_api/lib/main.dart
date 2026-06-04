import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/datasource/rickandmorty_datasource.dart';
import 'data/repositories/character_repository_impl.dart';
import 'domain/usecases/get_characters_usecase.dart';
import 'presentation/viewmodels/character_viewmodel.dart';
import 'presentation/routes/app_routes.dart';

void main() {
  // Inyección de dependencias
  final datasource = RickAndMortyDatasource();
  final repository = CharacterRepositoryImpl(datasource);
  final usecase = GetCharactersUsecase(repository);

  runApp(MyApp(usecase: usecase));
}

class MyApp extends StatelessWidget {
  final GetCharactersUsecase usecase;
  const MyApp({super.key, required this.usecase});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CharacterViewModel(usecase))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Rick and Morty",
        initialRoute: "/",
        routes: AppRoutes.routes,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
          useMaterial3: true,
        ),
      ),
    );
  }
}
