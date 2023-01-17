import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_page_state.freezed.dart';
part 'home_page_state.g.dart';

@JsonSerializable(createFactory: false)
@freezed
class HomePageState with _$HomePageState {
  factory HomePageState({@Default('') String searchQuery}) = _HomePageState;

  factory HomePageState.fromJson(Map<String, dynamic> json) =>
      _$HomePageStateFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$HomePageStateToJson(this);
}
