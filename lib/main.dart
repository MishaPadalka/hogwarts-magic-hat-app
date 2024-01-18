import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hogwarts_magic_hat_app/data/models/local_models/character_local_model.dart';
import 'package:hogwarts_magic_hat_app/data/models/local_models/guesses_amount_model.dart';
import 'package:hogwarts_magic_hat_app/tools/di/injection.dart';
import 'package:hogwarts_magic_hat_app/tools/router.dart';

import 'data/models/local_models/chosen_character_local_model.dart';
import 'data/models/local_models/wand_local_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await Hive.initFlutter();
  Hive.registerAdapter(WandLocalModelAdapter());
  Hive.registerAdapter(CharacterLocalModelAdapter());
  Hive.registerAdapter(ChosenCharacterLocalModelAdapter());
  Hive.registerAdapter(GuessesAmountModelAdapter());



  //charactersBox = await Hive.openBox<CharacterLocalModel>('charactersBox');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
