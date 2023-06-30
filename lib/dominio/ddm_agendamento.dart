import 'package:moto_tech/dominio/ddm_cliente.dart';
import 'package:moto_tech/dominio/ddm_veiculo.dart';
import 'package:moto_tech/dominio/dto/cliente_dto.dart';
import 'package:moto_tech/dominio/dto/veiculo_dto.dart';
import 'package:moto_tech/dominio/portas/secundaria/i_dao_agendamento.dart';

class DDMAgendamento implements IDAOAgendamento {
  @override
  String salvarAgendamento(
      {required ClienteDTO clienteDTO, required VeiculoDTO veiculoDTO}) {
    var ddmVeiculo = DDMVeiculo(veiculoDTO: veiculoDTO);
    var ddmCliente = DDMCliente(clienteDTO: clienteDTO);

    ddmVeiculo.salvarVeiculo(veiculoDTO: veiculoDTO);
    ddmCliente.salvarCliente(clienteDTO: clienteDTO);

    print('Agendamento salvo com sucesso');
    return 'Agendamento salvo com sucesso';
  }
}
