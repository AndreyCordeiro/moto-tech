import 'package:moto_tech/dominio/ddm_cliente.dart';
import 'package:moto_tech/dominio/ddm_enviar_email.dart';
import 'package:moto_tech/dominio/ddm_servico.dart';
import 'package:moto_tech/dominio/ddm_veiculo.dart';
import 'package:moto_tech/dominio/dto/agendamento_dto.dart';
import 'package:moto_tech/dominio/portas/secundaria/i_dao_agendamento.dart';

class DDMAgendamento implements IDAOAgendamento {
  @override
  String salvarAgendamento({
    required AgendamentoDTO agendamentoDTO,
  }) {
    var ddmVeiculo = DDMVeiculo(veiculoDTO: agendamentoDTO.clienteDTO.veiculo);
    var ddmCliente = DDMCliente(clienteDTO: agendamentoDTO.clienteDTO);
    var ddmServico = DDMServico(servicoDTO: agendamentoDTO.servicoDTO);
    var ddmEmail = DDMEnviarEmail();

    ddmVeiculo.salvarVeiculo(veiculoDTO: agendamentoDTO.clienteDTO.veiculo);
    ddmCliente.salvarCliente(clienteDTO: agendamentoDTO.clienteDTO);
    ddmServico.salvarServico(agendamentoDTO.servicoDTO);

    print('Agendamento salvo com sucesso');
    return 'Agendamento salvo com sucesso';
  }
}
