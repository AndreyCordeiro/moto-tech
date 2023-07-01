import 'veiculo_dto.dart';

class ClienteDTO {
  late String nome;
  late String cpf;
  late int qtdServico;
  late bool proximaGratuita;
  late VeiculoDTO veiculo;

  ClienteDTO({
    required this.nome,
    required this.cpf,
    required this.qtdServico,
    required this.proximaGratuita,
    required this.veiculo,
  });
}
