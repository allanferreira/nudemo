import 'package:test/test.dart';

import 'package:nudemo/construction/presenter/construction_presenter.dart';

void main() {
  group('[Unit -> BasicConstructionPresenter]', () {
    BasicConstructionPresenter constructionPresenter;

    setUp(() {
      constructionPresenter = BasicConstructionPresenter();
    });

    test('Construction initial value should be 0', () {
      expect(constructionPresenter.getValue(), 0);
    });

    test('Construction value should be incremented', () {
      constructionPresenter.onfloatingButtonClicked();

      expect(constructionPresenter.getValue(), 1);
    });

    test('Construction value should be incremented to 3', () {
      constructionPresenter.onfloatingButtonClicked();
      constructionPresenter.onfloatingButtonClicked();
      constructionPresenter.onfloatingButtonClicked();

      expect(constructionPresenter.getValue(), 3);
    });

    test('Construction value should be decremented to 0 when reach 4', () {
      constructionPresenter.onfloatingButtonClicked();
      constructionPresenter.onfloatingButtonClicked();
      constructionPresenter.onfloatingButtonClicked();
      constructionPresenter.onfloatingButtonClicked();

      expect(constructionPresenter.getValue(), 0);
    });
  });
}
