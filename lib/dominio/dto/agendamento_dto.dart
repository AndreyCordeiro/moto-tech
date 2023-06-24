import 'package:moto_tech/dominio/dto/cliente_dto.dart';

import 'veiculo_dto.dart';
import 'servico_dto.dart';

class AgendamentoDTO {
  ClienteDTO clienteDTO;
  VeiculoDTO veiculoDTO;
  ServicoDTO servicoDTO;

  AgendamentoDTO({
    required this.clienteDTO,
    required this.veiculoDTO,
    required this.servicoDTO,
  });
}
