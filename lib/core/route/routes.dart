import 'package:exam_app/core/constants/app_constants.dart';
import 'package:exam_app/core/di/di.dart';
import 'package:exam_app/core/l10n/localization/app_localizations.dart';
import 'package:exam_app/core/providers/app_config_provider.dart';
import 'package:exam_app/core/route/app_routes.dart';

import 'package:flutter/material.dart';

import '../../features/auth/presentation/pages/sign_in_screen.dart';
import '../../features/auth/presentation/pages/sign_up_screen.dart';

abstract class Routes {

  static  Route generateRoutes(RouteSettings setting){
    final Uri url=Uri.parse(setting.name??'/');
    switch(url.path){
      case AppRoutes.login:
        return
        MaterialPageRoute(builder: (_)=>SignInScreen());
      case AppRoutes.signup:
        return
          MaterialPageRoute(builder: (_)=>SignUpScreen());

      default:
        return MaterialPageRoute(builder: (context)=>Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(),
            Text(AppLocalizations.of(context)!.appName),
            ElevatedButton(onPressed: (){
              if(getIt<AppConfigProvider>().isEn()){
                getIt<AppConfigProvider>().changeLocale(AppConstants.arLocalKey);
              }else{
                getIt<AppConfigProvider>().changeLocale(AppConstants.enLocalKey);
              }
            }, child: Text('test'))
          ],),
        ));
    }


  }


}