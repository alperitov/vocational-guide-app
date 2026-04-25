import 'package:freezed_annotation/freezed_annotation.dart';

part 'profession.freezed.dart';
part 'profession.g.dart';

enum MercadoTrabalho { excelente, bom, moderado, limitado }

@freezed
sealed class Profession with _$Profession {
  const factory Profession({
    required String id,
    required String nome,
    required String descricao,
    required String emoji,
    required String areaConhecimento,
    required List<String> dimRiasec,
    required List<String> dimGardner,
    required List<String> dimValores,
    required List<String> cursosRelacionados,
    required List<String> instituicoes,
    required MercadoTrabalho mercadoTrabalho,
    String? salarioMedio,
    String? detalhesMercado,
  }) = _Profession;

  factory Profession.fromJson(Map<String, dynamic> json) =>
      _$ProfessionFromJson(json);
}
