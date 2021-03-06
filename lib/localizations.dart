import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'l10n/messages_all.dart';

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) {
    final name =
        locale.countryCode == null ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String get title {
    return Intl.message("Popular Movies", name: "title");
  }

  String get popularityLabel {
    return Intl.message(
      "Popularity",
      name: "popularityLabel",
      desc: "Movies Overview",
    );
  }

  String get userScoreLabel {
    return Intl.message(
      "User Score",
      name: "userScoreLabel",
      desc: "Movies Overview",
    );
  }

  String get seeDetailsButton {
    return Intl.message(
      "See Details",
      name: "seeDetailsButton",
      desc: "Movies Overview",
    );
  }
}

// AppLocalizationsDelegate to provide this resources to our app.
//
class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'es'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}
