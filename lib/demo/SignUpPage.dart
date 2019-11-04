import 'package:flutter/material.dart';

import 'package:flutter_app/demo/ChooseDetail.dart';
import 'package:flutter_app/demo/CollectPersonInfoPage.dart';

class SignUpPage extends StatelessWidget{

  

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Navigator(
        initialRoute: 'signup/person_info',
        onGenerateRoute: (RouteSettings setting) {
          WidgetBuilder builder;
          switch(setting.name){
            case 'signup/person_info':
              builder = (BuildContext c)=> CollectPersonInfoPage();
              break;
            case 'signup/choose_detail':
              builder = (BuildContext c) => ChooseDetail(onSignUpComplete:(){
                        Navigator.of(context).pop();
              });
              break;
            default:
              throw Exception('Invalid route $setting.name ');
          }
          return MaterialPageRoute(builder: builder,settings: setting);
    }
    );
  }

}