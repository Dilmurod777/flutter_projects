import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:imdb_movie_app/common/constants/languages.dart';
import 'package:imdb_movie_app/common/constants/routes_constants.dart';
import 'package:imdb_movie_app/common/screenutil/screenutil.dart';
import 'package:imdb_movie_app/di/get_it.dart';
import 'package:imdb_movie_app/presentation/app_localizations.dart';
import 'package:imdb_movie_app/presentation/blocs/language/language_bloc.dart';
import 'package:imdb_movie_app/presentation/blocs/login/login_bloc.dart';
import 'package:imdb_movie_app/presentation/fade_page_route_builder.dart';
import 'package:imdb_movie_app/presentation/routes.dart';
import 'package:imdb_movie_app/presentation/themes/app_color.dart';
import 'package:imdb_movie_app/presentation/themes/theme_text.dart';
import 'package:imdb_movie_app/presentation/wiredash_app.dart';

class MovieApp extends StatefulWidget {
  @override
  _MovieAppState createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  LoginBloc _loginBloc;
  LanguageBloc _languageBloc;
  dynamic _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    _loginBloc = getItInstance<LoginBloc>();
    _languageBloc = getItInstance<LanguageBloc>();
    _languageBloc.add(LoadPreferredLanguageEvent());
  }

  @override
  void dispose() {
    _loginBloc?.close();
    _languageBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguageBloc>.value(value: _languageBloc),
        BlocProvider<LoginBloc>.value(value: _loginBloc),
      ],
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          if (state is LanguageLoaded) {
            return WiredashApp(
              navigatorKey: _navigatorKey,
              languageCode: state.locale.languageCode,
              child: MaterialApp(
                navigatorKey: _navigatorKey,
                debugShowCheckedModeBanner: false,
                title: 'Movie App',
                theme: ThemeData(
                  unselectedWidgetColor: AppColor.royalBlue,
                  primaryColor: AppColor.vulcan,
                  accentColor: AppColor.royalBlue,
                  scaffoldBackgroundColor: AppColor.vulcan,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  textTheme: ThemeText.getTextTheme(),
                  appBarTheme: const AppBarTheme(elevation: 0),
                ),
                supportedLocales:
                    Languages.languages.map((l) => Locale(l.code)).toList(),
                locale: state.locale,
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                builder: (context, child) {
                  return child;
                },
                initialRoute: RouteList.initial,
                onGenerateRoute: (RouteSettings settings) {
                  final routes = Routes.getRoutes(settings);
                  final WidgetBuilder builder = routes[settings.name];
                  return FadePageRouteBuilder(
                    builder: builder,
                    settings: settings,
                  );
                },
              ),
            );
          }

          return SizedBox.shrink();
        },
      ),
    );
  }
}
