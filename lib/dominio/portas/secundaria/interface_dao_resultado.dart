import '../../dto/dados_cliente.dart';
import '../../dto/dados_servico.dart';
import '../../dto/dados_veiculo.dart';
import '../../dto/resultado_final.dart';

abstract class InterfaceSalvarResultado {
  Future<bool> salvar({
    required ClienteDTO clienteDTO,
    required ServicoDTO servicoDTO,
    required VeiculoDTO veiculoDTO,
    required ResultadoFinal resultado,
  });
}
