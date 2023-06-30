import 'package:moto_tech/dominio/dto/agendamento_dto.dart';
import 'package:moto_tech/infra/dao_agendamento.dart';

abstract class IEntradaAgendamento {
  String salvarAgendamento(AgendamentoDTO agendamentoDTO, DaoAgendamento dao);
}
