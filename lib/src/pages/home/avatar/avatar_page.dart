import 'package:flutter/material.dart';
import 'package:flutter_ejemplos/src/pages/home/avatar/widgets/code_avatar_page.dart';
import 'package:flutter_ejemplos/src/theme/theme_base.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page', style: kTextAppBar),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://www.fcbarcelona.com/photo-resources/2019/05/23/84af7b4d-66b1-4626-b246-4de2dfa16a63/mini_FCBarcelona-LiverpoolFC3-0AnadaSemifinalsUEFAChampionsLeague1819_pic_2019-05-01barcelona-liverpool50.jpg?width=1200&height=750'),
              radius: 20.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 100.0),
            child: CircleAvatar(
              child: Text(
                'SL',
                style: kTextApp,
              ),
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
              'https://www.fcbarcelona.com/photo-resources/2019/05/23/84af7b4d-66b1-4626-b246-4de2dfa16a63/mini_FCBarcelona-LiverpoolFC3-0AnadaSemifinalsUEFAChampionsLeague1819_pic_2019-05-01barcelona-liverpool50.jpg?width=1200&height=750'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}
