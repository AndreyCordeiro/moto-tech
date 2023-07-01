import 'package:moto_tech/dominio/ddm_cliente.dart';
import 'package:moto_tech/dominio/ddm_servico.dart';
import 'package:moto_tech/dominio/ddm_veiculo.dart';
import 'package:moto_tech/dominio/dto/agendamento_dto.dart';
import 'package:moto_tech/dominio/dto/cliente_dto.dart';
import 'package:moto_tech/dominio/portas/secundaria/i_dao_agendamento.dart';

class DDMAgendamento implements IDAOAgendamento {
  @override
  String salvarAgendamento({
    required AgendamentoDTO agendamentoDTO,
    required ClienteDTO clienteDTO,
  }) {
    var ddmVeiculo = DDMVeiculo(veiculoDTO: clienteDTO.veiculo);
    var ddmCliente = DDMCliente(clienteDTO: clienteDTO);
    var ddmServico = DDMServico(servicoDTO: servicoDTO);

    ddmVeiculo.salvarVeiculo(veiculoDTO: clienteDTO.veiculo);
    ddmCliente.salvarCliente(clienteDTO: clienteDTO);
    ddmServico.salvarServico(servicoDTO: servicoDTO);

    print('Agendamento salvo com sucesso');
    return 'Agendamento salvo com sucesso';
  }
}
