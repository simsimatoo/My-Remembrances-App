import 'package:daily_supplications_app/modules/supplications_screen.dart';
import 'package:daily_supplications_app/shared/cubit/cubit.dart';
import 'package:daily_supplications_app/shared/cubit/status.dart';
import 'package:daily_supplications_app/shared/local/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacthHelper.inti();
bool?  themeModeValue= await CacthHelper.get_Data(key: "themeMode")??true;
  runApp(
    BlocProvider(
      create: (context) => AppCubit()..createDb()..changeValueOfThemeMode(value:themeModeValue ),
      child: MyApp(themeModeValue),
    ),
  );
}

class MyApp extends StatefulWidget {

   const MyApp(value, {super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool ?value;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:  const Size(393, 852), // Set your base design size here
      builder: (context, child) {

        ScreenUtil.configure(
          data: MediaQuery.of(context),

        );
        return App(value);
      },
    );
  }
}
class App extends StatefulWidget {

  const App(value, {super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool ?value;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit, AppStates>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return MaterialApp(
      locale: const Locale('ar'),
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      darkTheme: ThemeData(
        scaffoldBackgroundColor: const Color(0Xff21201e),
        textTheme: TextTheme(
          labelMedium: TextStyle(
              fontSize: 25.sp, fontWeight: FontWeight.bold,
              color: Colors.white,
          )
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0XFF005b1e),
          foregroundColor: Color(0xff000000),
          iconTheme: IconThemeData(
            color: Colors.white,
          )
        ),
          cardColor: const Color(0Xff5846fe),

        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF01591c),
        )
      ),
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          textTheme: TextTheme(
              labelMedium: TextStyle(
                fontSize: 25.sp, fontWeight: FontWeight.bold,
                color: Colors.black,
              )
          ),
          appBarTheme: const AppBarTheme(
              backgroundColor:Colors.blue,
              foregroundColor: Colors.blue,
              iconTheme: IconThemeData(
                color: Colors.white,
              )
          ),
          cardColor: Colors.blue,

          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.blue,
          )
      ),

      themeMode: AppCubit.get(context).themeMode?ThemeMode.light:ThemeMode.dark,


      debugShowCheckedModeBanner: false,
      home: const SupplicationsScreen(),
    );
  },
);
  }
}

