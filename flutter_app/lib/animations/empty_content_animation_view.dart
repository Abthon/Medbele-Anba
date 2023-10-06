import 'package:flutter_app/animations/lottie_animation_view.dart';
import 'package:flutter_app/models/lottii_animation.dart';

class EmptyContentAnimationView extends LottieAnimationView {
  const EmptyContentAnimationView({super.key})
      : super(animation: LottieAnimation.empty);
}
