import 'package:moto_tech/dominio/dto/agendamento_dto.dart';
import 'package:moto_tech/dominio/portas/primaria/i_entrada_agendamento.dart';
import 'package:moto_tech/infra/dao_agendamento.dart';

import 'cliente.dart';
import 'servico.dart';
import 'veiculo.dart';

class Agendamento implements IEntradaAgendamento {
  dynamic id;
  late Cliente cliente;
  late Veiculo veiculo;
  late Servico servico;

  Agendamento({
    required this.cliente,
    required this.veiculo,
    required this.servico,
  });

  @override
  String salvarAgendamento(AgendamentoDTO agendamentoDTO, DaoAgendamento dao) {
    return dao.salvarAgendamento(
      clienteDTO: agendamentoDTO.clienteDTO,
      veiculoDTO: agendamentoDTO.veiculoDTO,
    );
  }
}
