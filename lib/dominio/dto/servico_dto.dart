import 'veiculo_dto.dart';

class ServicoDTO {
  late VeiculoDTO veiculo;
  late String descricao;
  late int qtdTrocasOleo;
  late int tempoServico;
  late DateTime? tempoEstimadoEntrega;

  ServicoDTO({
    required this.veiculo,
    required this.descricao,
    required this.qtdTrocasOleo,
    required this.tempoServico,
    this.tempoEstimadoEntrega,
  });
}
