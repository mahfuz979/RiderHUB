import 'package:flutter/material.dart';

import 'app_state.dart';
import 'screens.dart';
import 'strings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final state = AppState();
  await state.load();
  runApp(RiderHubApp(state: state));
}

class RiderHubApp extends StatelessWidget {
  final AppState state;
  const RiderHubApp({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: state,
      builder: (context, _) {
        return MaterialApp(
          title: S(state.lang).t('appName'),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            colorSchemeSeed: const Color(0xFF006A4E),
          ),
          home: HomeShell(state: state),
        );
      },
    );
  }
}
