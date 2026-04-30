import '../models/institution.dart';

const List<Institution> kInstituicoes = [
  // PRIVADAS (Foco USTM)
  Institution(
    id: 'inst_ustm',
    acronym: 'USTM',
    name: 'Universidade São Tomás de Moçambique',
    type: InstitutionType.privada,
    province: Province.maputoCidade,
  ),
  Institution(
    id: 'inst_isctem',
    acronym: 'ISCTEM',
    name: 'Instituto Superior de Ciências e Tecnologias de Moçambique',
    type: InstitutionType.privada,
    province: Province.maputoCidade,
  ),
  Institution(
    id: 'inst_isutc',
    acronym: 'ISUTC',
    name: 'Instituto Superior de Transportes e Comunicações',
    type: InstitutionType.privada,
    province: Province.maputoCidade,
  ),
  Institution(
    id: 'inst_ucm',
    acronym: 'UCM',
    name: 'Universidade Católica de Moçambique',
    type: InstitutionType.privada,
    province: Province.sofala,
  ),
  Institution(
    id: 'inst_a_politecnica',
    acronym: 'A Politécnica',
    name: 'Universidade Politécnica',
    type: InstitutionType.privada,
    province: Province.maputoCidade,
  ),

  // PÚBLICAS
  Institution(
    id: 'inst_uem',
    acronym: 'UEM',
    name: 'Universidade Eduardo Mondlane',
    type: InstitutionType.publica,
    province: Province.maputoCidade,
  ),
  Institution(
    id: 'inst_up',
    acronym: 'UP',
    name: 'Universidade Pedagógica',
    type: InstitutionType.publica,
    province: Province.maputoCidade,
  ),
  Institution(
    id: 'inst_unizambeze',
    acronym: 'UniZambeze',
    name: 'Universidade Zambeze',
    type: InstitutionType.publica,
    province: Province.sofala,
  ),
  Institution(
    id: 'inst_unilurio',
    acronym: 'UniLúrio',
    name: 'Universidade Lúrio',
    type: InstitutionType.publica,
    province: Province.nampula,
  ),
  Institution(
    id: 'inst_isri',
    acronym: 'ISRI',
    name: 'Instituto Superior de Relações Internacionais',
    type: InstitutionType.publica,
    province: Province.maputoProvincia,
  ),
];
