import 'package:moto_tech/dominio/dto/agendamento_dto.dart';
import 'package:moto_tech/dominio/dto/cliente_dto.dart';
import 'package:moto_tech/dominio/dto/veiculo_dto.dart';
import 'package:moto_tech/dominio/portas/secundaria/i_dao_agendamento.dart';

class DaoAgendamento implements IDAOAgendamento {
  @override
  String salvarAgendamento(
      {required ClienteDTO clienteDTO, required VeiculoDTO veiculoDTO}) {
    print('Agendamento salvo com sucesso!');
    return 'Agendamento salvo com sucesso!';
  }
}
