import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ejemplos/src/pages/estados/provider/widgets/providers/info_provider.dart';
import 'package:flutter_ejemplos/src/pages/home/home_page.dart';
import 'package:flutter_ejemplos/src/theme/theme_base.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Evitar la horientación horizontal
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<InfoProvider>(
          create: (context) {
            return InfoProvider();
          },
        )
      ],
      child: MaterialApp(
        title: 'Ejemplos de Flutter',
        debugShowCheckedModeBanner: false,
        theme: myTheme,

        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', 'US'),
          const Locale('es', 'ES'),
        ],
        //home: HomePage(),
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
        },
      ),
    );
  }
}
