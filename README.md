# Nudemo

[![Codemagic build status](https://api.codemagic.io/apps/0000/0000/status_badge.svg)](https://codemagic.io/apps/000/000/latest_build) [![Flutter version](https://img.shields.io/badge/flutter-v1.9.1+hotfix.6-blue?logo=flutter)](https://flutter.dev/docs/get-started/install) [![GitHub license](https://img.shields.io/github/license/chinnonsantos/nudemo)](https://choosealicense.com/licenses/mit/) [![Twitter follow](https://img.shields.io/twitter/follow/chinnonsantos?label=follow&style=flat&logo=twitter)](https://twitter.com/intent/follow?screen_name=chinnonsantos) [![Slack channel](https://img.shields.io/badge/slack-%23geral-blueviolet?logo=slack)](https://join.slack.com/t/chinnonsantos-nudemo/signup) [![Open source Love](https://badges.frapsoft.com/os/v2/open-source.svg?v=103)](https://github.com/ellerbrock/open-source-badges/)

## Prerequisites

You will need [Flutter][] framework 1.9.1+hotfix.6 or above installed.

> The Dart SDK **is not required** because Flutter has _[Dart language][]_ support as an integrated tool in the framework.

[Flutter]: https://flutter.dev/
[Dart language]: https://dart.dev/

**Libraries:**

- [test][] 1.6.3
- [provider][] 3.2.0
- [pedantic][] 1.8.0+1 (dev)

[test]: https://pub.dev/packages/test
[provider]: https://pub.dev/packages/provider
[pedantic]: https://pub.dev/packages/pedantic

## Running tests

To test the project, run:

    flutter test

To analyze the Dart language code, run:

    flutter analyze

> The [Dart analyzer][] will check your code and look for possible errors.

[Dart analyzer]: https://flutter.dev/docs/testing/debugging#the-dart-analyzer

To check test coverage, run:

- Run test with `--coverage` flag:

      flutter test --coverage

- Convert the LCOV report generated to a readable HTML file:

      genhtml coverage/lcov.info -o coverage/html

  > The **`flutter test --coverage`** command will generate a **`lcov.info`** file, you will need to install the **[LCOV][]** program to convert (**`genhtml ...`**) the report to an HTML file (human readable).

- Open the HTML report (with a Web Browser)

      google-chrome coverage/html/index.html

[LCOV]: http://ltp.sourceforge.net/coverage/lcov.php

To test only **Unit tests** of the project, run:

    flutter test test/unit/

To test only **Widget tests** of the project, run:

    flutter test test/widget/

To test only **Integration** (or assertion) of the project, run:

    flutter drive --target=test_driver/app.dart

_-->> First, be sure to launch an Android Emulator, iOS Simulator, or connect your computer to a real iOS / Android device. **Integration testing needs to be executed on a real system (simulator or device)!**_

> "Unlike unit and widget tests, integration test suites do not run in the same process as the app being tested. Therefore, create two files that reside in the same directory. By convention, the directory is named **`test_driver`**."
> \- An introduction to integration testing

## Running the APP

To start the mobile App example, run:

    flutter run

## License

Copyright © 2019 | Chinnon Santos | Apache License 2.0
