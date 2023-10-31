import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:meta/meta.dart';
import 'package:milorestaurant/core/models/onboarding_model.dart';
import 'package:milorestaurant/core/utils/assets_manager.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  List<OnBoardingModel> onBoardingList = [
    OnBoardingModel(ImageAssets.onboard_1, 'on_boarding_1_title'.tr(), 'on_boarding_1_description'.tr()),
    OnBoardingModel(ImageAssets.onboard_2, 'on_boarding_2_title'.tr(), 'on_boarding_2_description'.tr()),
    OnBoardingModel(ImageAssets.onboard_3, 'on_boarding_3_title'.tr(), 'on_boarding_3_description'.tr()),
  ];
int selectedIndex=0;
  OnboardingCubit() : super(OnboardingInitial());
  changeSelectIndex(int index){
    selectedIndex=index;
    emit(OnboardingChangeIndex());
  }
}
