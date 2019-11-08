import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/style/app_style.dart';
import 'package:flutter_app/dao/user_dao.dart';
import 'package:flutter_app/redux/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class WelcomePage extends StatefulWidget {
  static final String rName = '/';

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WelcomePageState();
  }
}

class WelcomePageState extends State<WelcomePage> {
  bool hadInit;

  @override
  void didChangeDependencies() {
    if (hadInit) {
      return;
    }
    hadInit = true;
    Store<AppState> store = StoreProvider.of(context);
    Future.delayed(Duration(seconds: 3), () {
      UserDao.initUserInfo(store).then((res) {
        if (res != null && res.result) {
          //go homepage
        } else {
          // go loginPage
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StoreBuilder(builder: (context, store) {
      return Container(
        color: AppColors.white,
        child: Stack(
          children: <Widget>[
            Center(
              child: Image(image: AssetImage('static/images/welcome.png')),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 200,
                width: 200,
                child: FlareActor(
                  'sttaic/file/flare_flutter_logo_.flr',
                  alignment: Alignment.topCenter,
                  fit: BoxFit.fill,
                  animation: 'Placeholder',
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
