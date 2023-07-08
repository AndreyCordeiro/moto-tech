import 'package:moto_tech/dominio/dto/agendamento_dto.dart';

abstract class IDAOAgendamento {
  String salvarAgendamento(
      {required AgendamentoDTO agendamentoDTO});
}
