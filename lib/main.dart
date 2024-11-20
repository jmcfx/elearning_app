import 'package:elearning_app/src/common/routes/pages_entity.dart';
import 'package:elearning_app/src/common/routes/routes.dart';
import 'package:elearning_app/src/common/values/colors/colors.dart';
import 'package:elearning_app/global.dart';
import 'package:elearning_app/src/core/bloc_providers/bloc_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Global.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //spread the list of blocProvider....
        ...AppBlocProviders.allBlocProviders,
      ],
      child: ScreenUtilInit(
        designSize: const Size(430.0, 932.0),
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'eLearningApp',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
              appBarTheme: AppBarTheme(
                elevation: 0,
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(color: AppColors.primaryText),
              ),
            ), 
            // home: DashBoardScreens(),
            onGenerateRoute: AppPages.generateRouteSettings,
          );
        },
      ),
    );
  }
}
