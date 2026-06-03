import '../models/widget_param.dart';

class SliderUiConfig {
  final double min;
  final double max;
  final int divisions;

  const SliderUiConfig({
    required this.min,
    required this.max,
    this.divisions = 100,
  });

  static SliderUiConfig forParam(WidgetParam param) {
    // 仮ルール（あとでUiConstraintsと統合）
    switch (param.name) {
      case 'width':
        return const SliderUiConfig(min: 0, max: 300);

      case 'height':
        return const SliderUiConfig(min: 0, max: 600);

      default:
        return const SliderUiConfig(min: 0, max: 100);
    }
  }
}