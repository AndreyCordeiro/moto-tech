import 'package:moto_tech/dominio/dto/agendamento_dto.dart';
import 'package:moto_tech/dominio/portas/secundaria/i_dao_agendamento.dart';

class DaoAgendamento implements IDAOAgendamento {
  @override
  String salvarAgendamento({required AgendamentoDTO agendamentoDTO}) {
    return 'Agendamento salvo com sucesso!';
  }
}
