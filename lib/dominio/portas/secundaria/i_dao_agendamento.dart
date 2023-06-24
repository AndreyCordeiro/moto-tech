import '../../dto/agendamento_dto.dart';

abstract class IDAOAgendamento {
  String salvarAgendamento({required AgendamentoDTO agendamentoDTO});
}
