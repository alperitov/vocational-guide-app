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
  }) = _Course;

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
}
