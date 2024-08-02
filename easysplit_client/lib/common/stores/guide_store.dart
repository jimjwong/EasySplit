import 'package:easysplit_flutter/common/repositories/interfaces/guide_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'guide_store.g.dart';

@Singleton()
class GuideStore = GuideStoreBase with _$GuideStore;

abstract class GuideStoreBase with Store {
  final GuideRepository _guideRepository;

  @observable
  GuideState homeGuideState = GuideState.notViewed;

  @observable
  GuideState splitGuideState = GuideState.notViewed;

  GuideStoreBase(this._guideRepository) {
    _guideRepository.homeGuideState.listen((state) {
      homeGuideState = state;
    });

    _guideRepository.splitGuideState.listen((state) {
      splitGuideState = state;
    });
  }

  @action
  Future<void> setHomeGuideViewed() async {
    await _guideRepository.setHomeGuideViewed();
  }

  @action
  Future<void> setSplitGuideViewed() async {
    await _guideRepository.setSplitGuideViewed();
  }
}
