import 'package:moto_tech/dominio/dto/cliente_dto.dart';
import 'package:moto_tech/infra/dao_cliente.dart';
import '../portas/primaria/i_entrada_cliente.dart';
import 'veiculo.dart';

class Cliente implements IEntradaCliente {
  dynamic id;
  late String nome;
  late String cpf;
  late Veiculo veiculo;
  late int qtdServico;
  late bool proximaGratuita;

  Cliente({
    required String nome,
    required String cpf,
    required int qtdTrocasOleo,
    required Veiculo veiculo,
  });

  bool validarCliente(ClienteDTO clienteDTO) {
    return validarCpf(clienteDTO.cpf);
  }

  String salvarCliente(ClienteDTO clienteDTO, DaoCliente dao) {
    // verifica se o próximo serviço vai ser gratuito (bônus)
    if (validarFidelidade(clienteDTO: clienteDTO)) {
      clienteDTO.qtdServico++;
    }

    return dao.salvarCliente(clienteDTO: clienteDTO);
  }

  @override
  bool validarCpf(String cpf) {
    if (!cpf.contains('.')) return false;
    if (!cpf.contains('-')) return false;
    if (cpf.length != 14) return false;

    var cpfSemMascara = cpf.replaceAll('.', '').replaceAll('-', '');

    var cpfListaNumeros = cpfSemMascara
        .substring(0, 9)
        .split('')
        .map<int>((e) => int.parse(e))
        .toList();

    var isNumerosIguais = true;
    var primeiroDigito = int.parse(cpfSemMascara.substring(9, 10));
    var segundoDigito = int.parse(cpfSemMascara.substring(10, 11));

    for (var i = 1; i < cpfListaNumeros.length; i++) {
      if (cpfListaNumeros[i - 1] != cpfListaNumeros[i]) {
        isNumerosIguais = false;
        break;
      }
    }

    if (isNumerosIguais) return false;

    var peso = 10;
    var digitoCalculado = 0;

    for (var n in cpfListaNumeros) {
      digitoCalculado += peso * n;
      peso--;
    }

    digitoCalculado = 11 - (digitoCalculado % 11);

    if (digitoCalculado > 9) digitoCalculado = 0;
    if (primeiroDigito != digitoCalculado) return false;

    cpfListaNumeros.add(digitoCalculado);

    peso = 11;
    digitoCalculado = 0;

    for (var n in cpfListaNumeros) {
      digitoCalculado += peso * n;
      peso--;
    }

    digitoCalculado = 11 - (digitoCalculado % 11);

    if (digitoCalculado > 10) digitoCalculado = 0;

    return true;
  }

  @override
  bool validarFidelidade({required ClienteDTO clienteDTO}) {
    if (clienteDTO.qtdServico == 10) {
      clienteDTO.qtdServico = 0;

      print("Proxima lavagem será gratuita!");
      return clienteDTO.proximaGratuita = true;
    }
    clienteDTO.qtdServico++;

    return false;
  }

  @override
  String getCpf(String cpf) {
    // TODO: implement getCpf
    throw UnimplementedError();
  }

  @override
  String getNome(String nome) {
    // TODO: implement getNome
    throw UnimplementedError();
  }
}
