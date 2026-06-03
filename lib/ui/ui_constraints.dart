class SliderConfig {
  final double min;
  final double max;

  const SliderConfig({
    required this.min,
    required this.max,
  });
}

class EnumConfig {
  final List<String> values;

  const EnumConfig({
    required this.values,
  });
}

class UiConstraints {
  final Map<String, SliderConfig> sliders;
  final Map<String, EnumConfig> enums;

  const UiConstraints({
    this.sliders = const {},
    this.enums = const {},
  });
}