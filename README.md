# Popular Movies

Demo Small Application to show popular movies using the [ThemovieDB API][​themoviedb.org]

[​themoviedb.org]:​https://www.themoviedb.org

## Documentation

### Flutter

[Flutter][flutter.dev] is Google’s UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.

To install it, follow the set-up steps in the [documentation][flutter.dev/install] guide according to your operating system.

[flutter.dev]: https://flutter.dev/

[flutter.dev/install]: https://flutter.dev/docs/get-started/install

## Using GetIt

Simple direct Service Locator that allows to decouple the interface from a concrete implementation and to access the concrete implementation from everywhere in the App.

## Using Injectable

Injectable is a convenient code generator for get_it. Inspired by Angular DI, Guice DI and inject.dart.

# Using Intl Translation 

Contains code to deal with internationalized/localized messages, date and number formatting and parsing, bi-directional text, and other internationalization issues.

To create the default intl files run the next command:

`flutter pub pub run intl_translation:extract_to_arb --output-dir=lib/l10n lib/localizations.dart`

To create the default update the intl files run the next command:

`flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/l10n \ --no-use-deferred-loading lib/localizations.dart lib/l10n/intl_*.arb`
