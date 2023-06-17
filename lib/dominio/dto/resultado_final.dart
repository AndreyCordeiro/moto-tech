import 'dados_cliente.dart';
import 'dados_veiculo.dart';
import 'dados_servico.dart';

class ResultadoFinal {
  ClienteDTO clienteDTO;
  VeiculoDTO veiculoDTO;
  ServicoDTO servicoDTO;

  ResultadoFinal({
    required this.clienteDTO,
    required this.veiculoDTO,
    required this.servicoDTO,
  });
}
