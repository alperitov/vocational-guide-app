import 'package:freezed_annotation/freezed_annotation.dart';

part 'course.freezed.dart';
part 'course.g.dart';

@freezed
sealed class Course with _$Course {
  const factory Course({
    required String id,
    required String nome,
    required String area,
    required List<String> dimensoesRiasec,
    required List<String> instituicoes,
    required String descricao,
    @Default([]) List<String> dimGardner,
    @Default([]) List<String> dimValores,
    @Default([]) List<String> profissoesRelacionadas,
    String? duracao,
    String? requisitosMinimos,
  }) = _Course;

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
}
