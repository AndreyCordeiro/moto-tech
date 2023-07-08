import 'package:moto_tech/dominio/core-private/cliente.dart';
import 'package:moto_tech/dominio/core-private/servico.dart';
import 'package:moto_tech/dominio/core-private/veiculo.dart';
import 'package:moto_tech/dominio/dto/servico_dto.dart';
import 'package:moto_tech/dominio/portas/primaria/i_entrada_servico.dart';
import 'package:moto_tech/infra/dao_servico.dart';

class DDMServico implements IEntradaServico {
  late ServicoDTO servicoDTO;
  var idaoServico = DaoServico();

  var servico = Servico(
    cliente: Cliente(
      nome: '',
      cpf: '',
      qtdTrocasOleo: 0,
      veiculo: Veiculo(
        modelo: '',
        placa: '',
      ),
    ),
    veiculo: Veiculo(
      modelo: '',
      placa: '',
    ),
    descricao: '',
    tempoServico: 0,
  );

  DDMServico({required this.servicoDTO});

  @override
  String salvarServico(ServicoDTO servicoDTO) {
    return servico.salvarServico(servicoDTO, idaoServico);
  }
}
