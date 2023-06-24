import 'veiculo_dto.dart';

class ClienteDTO {
  late String nome;
  late String cpf;
  late int qtdTrocasOleo;
  late VeiculoDTO veiculo;

  ClienteDTO({
    required this.nome,
    required this.cpf,
    required this.qtdTrocasOleo,
    required this.veiculo,
  });
}