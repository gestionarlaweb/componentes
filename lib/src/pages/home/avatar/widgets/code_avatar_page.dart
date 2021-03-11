import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

const String _text = """
## CircleAvatar

Varios CircleAvatar
```
return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://pbs.twimg.com/profile_images/1018943227791982592/URnaMrya_400x400.jpg'),
              radius: 20.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 100.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,
            ),
          ),
          IconButton(
            icon: Icon(Icons.code, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return CodeAvatarPage();
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage(
              'https://hipertextual.com/files/2020/11/Stan_Lee_Painting_by_Abijith_Ka_Full_Quality.png'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );

```
""";

class CodeAvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Code'),
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
