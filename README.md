# Nudemo

[![Codemagic build status](https://api.codemagic.io/apps/5de0594954bf42000aeaed79/5de0594954bf42000aeaed78/status_badge.svg)](https://codemagic.io/apps/5de0594954bf42000aeaed79/5de0594954bf42000aeaed78/latest_build) [![Travis build status](https://img.shields.io/travis/chinnonsantos/nudemo/master?logo=travis)](https://travis-ci.org/chinnonsantos/nudemo) [![Codecov coverage](https://codecov.io/gh/chinnonsantos/nudemo/branch/master/graph/badge.svg)](https://codecov.io/gh/chinnonsantos/nudemo) [![Flutter version](https://img.shields.io/badge/flutter-v1.9.1+hotfix.6-blue?logo=flutter)](https://flutter.dev/docs/get-started/install) [![GitHub license](https://img.shields.io/github/license/chinnonsantos/nudemo)](https://choosealicense.com/licenses/mit/) [![Twitter follow](https://img.shields.io/twitter/follow/chinnonsantos?label=follow&style=flat&logo=twitter)](https://twitter.com/intent/follow?screen_name=chinnonsantos) [![Slack channel](https://img.shields.io/badge/slack-%23nudemo-blueviolet?logo=slack)](https://join.slack.com/t/chinnonsantos-nudemo/signup) [![Open source Love](https://badges.frapsoft.com/os/v2/open-source.svg?v=103)](https://github.com/ellerbrock/open-source-badges/)

## Prerequisites

You will need [Flutter][] framework v1.11.0 or above installed ([Channel beta][], on Linux, locale en_US.UTF-8).

> The Dart SDK **is not required** because Flutter has _[Dart language][]_ support as an integrated tool in the framework.

[Flutter]: https://flutter.dev/
[Channel beta]: https://github.com/flutter/flutter/wiki/Flutter-build-release-channels#beta
[Dart language]: https://dart.dev/

**Libraries:**

- [test][] 1.6.3
- [provider][] 3.2.0
- [pedantic][] 1.8.0+1 (dev)

[test]: https://pub.dev/packages/test
[provider]: https://pub.dev/packages/provider
[pedantic]: https://pub.dev/packages/pedantic

## Running tests

To automatically [formatting][] code, run:

    flutter format lib test test_driver

[formatting]: https://flutter.dev/docs/development/tools/formatting

To analyzing the Dart language code, run:

    flutter analyze

> The [Dart analyzer][] will check your code and look for possible errors.

[Dart analyzer]: https://flutter.dev/docs/testing/debugging#the-dart-analyzer

To [testing] the project, run:

    flutter test

[testing]: https://flutter.dev/docs/testing

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

To run **Formatting code** ✔️; **Analyzing code** 🔍; **Unit test code** 🆗; **Widget test** 📲 and **Test coverage** ☔️. everything together ⏲️:

    sh scripts/flutter_test.sh

## Drive testing on AWS Device Farm with Sylph

To runs Flutter integration tests on real devices in cloud, use the **Sylph**.

- Install Sylph:

      pub global activate sylph

    > For more details see [Sylph][].

- Configure the [AWS CLI][] credentials:

      $ aws configure
      AWS Access Key ID [None]: YOUR_KEY_ID_HERE
      AWS Secret Access Key [None]: YOUR_SECRET_ACCESS_KEY_HERE
      Default region name [None]: us-west-2
      Default output format [None]: json

    > The AWS Device Farm is only available in Oregon region (**us-west-2**)!

- Run the Sylph:

      sylph

    > Sylph uses the [`sylph.yaml`][] file in this repository to configure and run device on AWS.
    >> Android devices: **Samsung Galaxy S10+**; **Samsung Galaxy Note 10**; **Sony Xperia XZ3**.
    >> Running iOS devices requires an [Apple Developer Certificate] (Team ID), We don't cover this steps!

    ![Screenshot from 2019-11-28 22-09-54](https://user-images.githubusercontent.com/3258293/69837139-21041c80-122c-11ea-8180-de296a3281fb.png)

[Sylph]: https://github.com/mmcc007/sylph
[AWS CLI]: https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html
[`sylph.yaml`]: https://github.com/chinnonsantos/nudemo/blob/master/sylph.yaml
[Apple Developer Certificate]: https://developer.apple.com/account/#/membership

## Drive testing on Codemagic CI/CD (using AWS Device Farm and Sylph)

Execute the same process when previous step **"Drive testing on AWS Device Farm with Sylph"**.

When you can run local drive testing with Sylph on AWS Device Farm, see [this article] to learn how to configure Codemagic console to automate the process.

![Screenshot from 2019-11-28 22-10-44](https://user-images.githubusercontent.com/3258293/69837305-d040f380-122c-11ea-9daf-f94a36cf7639.png)

[this article]: https://blog.codemagic.io/flutter-ci-cd-with-codemagic-sylph-aws-device-farm/

## Running the APP

To start the mobile App example, run:

    flutter run

## License

Copyright © 2019 | Chinnon Santos | Apache License 2.0
