import '../models/course.dart';

import 'courses_data/courses_negocios.dart';
import 'courses_data/courses_tecnologia.dart';
import 'courses_data/courses_sociais.dart';
import 'courses_data/courses_saude.dart';
import 'courses_data/courses_engenharia.dart';

export 'courses_data/courses_negocios.dart';
export 'courses_data/courses_tecnologia.dart';
export 'courses_data/courses_sociais.dart';
export 'courses_data/courses_saude.dart';
export 'courses_data/courses_engenharia.dart';

final List<Course> kCursos = [
  ...cursosNegocios,
  ...cursosTecnologia,
  ...cursosSociais,
  ...cursosSaude,
  ...cursosEngenharia,
];
