import 'package:intl/intl.dart';

import '../dto/servico_dto.dart';
import '../dto/veiculo_dto.dart';
import 'cliente.dart';
import 'servico.dart';
import 'veiculo.dart';

class Agendamento {
  dynamic id;
  late Cliente cliente;
  late Veiculo veiculo;
  late Servico servico;

  Agendamento({
    required this.cliente,
    required this.veiculo,
    required this.servico,
  });
}
