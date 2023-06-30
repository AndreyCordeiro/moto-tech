import 'package:moto_tech/dominio/dto/cliente_dto.dart';
import 'package:moto_tech/dominio/dto/veiculo_dto.dart';

abstract class IDAOAgendamento {
  String salvarAgendamento(
      {required ClienteDTO clienteDTO, required VeiculoDTO veiculoDTO});
}
