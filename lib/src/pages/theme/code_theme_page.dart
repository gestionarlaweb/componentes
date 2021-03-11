import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

const String _text = """
## Theme App
main.dart
```
return MaterialApp(
      theme: myTheme,
```

theme.dart
```
import 'package:flutter/material.dart';

final myTheme = ThemeData.dark().copyWith(
  primaryColorDark: Color(0xff000063),
  primaryColor: Color(0xff311b92),
  accentColor: Colors.amber[900],
);

// Constants Colors
const kColorButton = const Color(0xff00251a);
const kColorTrailingList = const Color(0xfff8f8fb);
const kColorIconsList = const Color(0xfff8f8fb);

// Fonts
const kTextAppBar = TextStyle(
  fontSize: 22.0,
  color: Colors.white,
  fontFamily: 'Raleway',
);
```
pubspec.yaml
```
fonts:
    - family: Raleway
      fonts:
        - asset: assets/fonts/Raleway-LightItalic.ttf
        - asset: assets/fonts/Raleway-Regular.ttf
          style: italic
```
""";

class CodeThemePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Code'),
      ),
      body: SafeArea(
        child: Markdown(
          controller: controller,
          selectable: true,
          data: _text,
        ),
      ),
    );
  }
}
