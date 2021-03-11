import 'package:flutter/material.dart';
import 'package:flutter_ejemplos/src/pages/mapbox/mapbox_page.dart';
import '../estados/bloc/bloc_page.dart';
import '../futurebuilder/future_builder_page.dart';
import '../streambuilder/stream_builder_page.dart';
import '../estados/provider/provider_pag.dart';
import '../home/code_home_page.dart';
import '../model/model_page.dart';
import '../theme/code_theme_page.dart';
import 'package:flutter_ejemplos/src/routes/routes_components.dart';
import 'package:flutter_ejemplos/src/theme/theme_base.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes básicos', style: kTextAppBar),
        actions: [
          IconButton(
            icon: Icon(Icons.code, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Container(
                      child: CodeHomePage(),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
      drawer: _MyDrawer(),
      body: _Lista(),
    );
  }
}

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
        title: Text(
          pageRoutesComponents[i].titulo,
          style: kTextApp,
        ),
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
      child: SingleChildScrollView(
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
                        style: kTextApp,
                      ),
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage())),
                    ),
                    ListTile(
                      leading: Icon(Icons.text_fields_rounded),
                      title: Text(
                        'Theme',
                        style: kTextApp,
                      ),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CodeThemePage())),
                    ),
                    ListTile(
                      leading: Icon(Icons.folder),
                      title: Text(
                        'Modelo',
                        style: kTextApp,
                      ),
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ModelPage())),
                    ),
                    ListTile(
                      leading: Icon(Icons.stream),
                      title: Text(
                        'StreamBuilder',
                        style: kTextApp,
                      ),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StreamBuilderPage())),
                    ),
                    ListTile(
                      leading: Icon(Icons.stream),
                      title: Text(
                        'FutureBuilder',
                        style: kTextApp,
                      ),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FutureBuilderPage())),
                    ),
                    ListTile(
                      leading: Icon(Icons.account_balance_wallet_outlined),
                      title: Text(
                        'Provider',
                        style: kTextApp,
                      ),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProviderPage())),
                    ),
                    ListTile(
                      leading: Icon(Icons.account_balance_wallet_outlined),
                      title: Text(
                        'Bloc',
                        style: kTextApp,
                      ),
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => BlocPage())),
                    ),
                    ListTile(
                      leading: Icon(Icons.map),
                      title: Text(
                        'Mapbox',
                        style: kTextApp,
                      ),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MapboxPage())),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
