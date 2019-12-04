set -e # abort CI if an error happens
flutter packages pub get
flutter format --set-exit-if-changed lib test test_driver
flutter analyze --no-pub
flutter test --no-pub --coverage
