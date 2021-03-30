import 'package:flutter/material.dart';
import 'package:imdb_movie_app/presentation/themes/app_color.dart';
import 'package:wiredash/wiredash.dart';

class WiredashApp extends StatelessWidget {
  final dynamic navigatorKey;
  final Widget child;
  final String languageCode;

  const WiredashApp({
    Key key,
    @required this.navigatorKey,
    @required this.child,
    @required this.languageCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wiredash(
        projectId: 'imdb-movie-app-lz1ywg4',
        secret: '1q79qpzlqpap4pr506i5fzwtls4t9ez513bjr28efkc82eqq',
        navigatorKey: navigatorKey,
        child: child,
        options: WiredashOptionsData(
          locale: Locale.fromSubtags(languageCode: languageCode),
        ),
        theme: WiredashThemeData(
          brightness: Brightness.dark,
          primaryColor: AppColor.royalBlue,
          secondaryColor: AppColor.violet,
          secondaryBackgroundColor: AppColor.vulcan,
          dividerColor: AppColor.vulcan,
        ));
  }
}
