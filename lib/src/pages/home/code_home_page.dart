import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

const String _text = """
## List & Drawer

- Lista de opciones y Drawer lateral
```
class _Lista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, i) => Divider(
        color: Colors.blue,
      ),
      itemCount: pageRoutesComponents.length,
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(
          pageRoutesComponents[i].icon,
          color: kColorIconsList,
        ),
        title: Text(pageRoutesComponents[i].titulo),
        trailing: Icon(Icons.chevron_right, color: kColorTrailingList),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => pageRoutesComponents[i].ruta));
        },
      ),
    );
  }
}

class _MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
         padding: EdgeInsets.symmetric(vertical: 40.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 50,
              child: CircleAvatar(
                child: Icon(Icons.code_outlined),
              ),
            ),
            Container(
               child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.bookmarks_outlined),
                    title: Text(
                      'Componentes básicos',
                      style: TextStyle(fontSize: 16),
                    ),
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage())),
                  ),
                  ListTile(
                    leading: Icon(Icons.escalator_outlined),
                    title: Text(
                      'Estados',
                      style: TextStyle(fontSize: 16),
                    ),
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AlertPage())),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

```


""";

class CodeHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Code'),
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
