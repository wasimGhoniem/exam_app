import 'package:exam_app/core/providers/app_config_provider.dart';
import 'package:exam_app/core/route/app_routes.dart';
import 'package:exam_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'core/di/di.dart';
import 'core/l10n/localization/app_localizations.dart';
import 'core/route/routes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await getIt<AppConfigProvider>().setSelectedLocale();
  runApp(ChangeNotifierProvider.value(
  value: getIt<AppConfigProvider>()
  ,child: MyApp()));
}
//ignore: must_be_immutable
class MyApp extends StatelessWidget {
   MyApp({super.key});
   late AppConfigProvider appConfigProvider;

  @override
  Widget build(BuildContext context) {
    appConfigProvider=Provider.of(context);
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: Routes.generateRoutes,
            initialRoute: AppRoutes.login,
            theme: AppTheme.lightTheme,
            locale: Locale(appConfigProvider.selectedLocale),
          );
        });
  }
}
