part of 'color_bloc.dart';

class ColorState extends Equatable {
  final Color color;
  const ColorState({required this.color});

  factory ColorState.initial() {
    return const ColorState(color: Colors.red);
  }

  @override
  List<Object> get props => [color];

  @override
  String toString() {
    // TODO: implement toString
    return "ColorState(color : $color)";
  }

  ColorState copyWith({
    Color? color,
  }) {
    return ColorState(
      color: color ?? this.color,
    );
  }
}
