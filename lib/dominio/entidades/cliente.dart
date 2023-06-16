import 'veiculo.dart';
import '../portas/primaria/interface_entrada_cliente.dart';

class Cliente implements InterfaceEntradaCliente {
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
  bool validarFidelidade({required Cliente cliente}) {
    if (cliente.qtdServico == 10) {
      print("Proxima lavagem será gratuita!");
      return cliente.proximaGratuita = true;
    }

    print(
        "Faltam ${10 - cliente.qtdServico} serviços para receber o bônus da fidelidade.");
    throw Exception(
        "Faltam ${10 - cliente.qtdServico} serviços para receber o bônus da fidelidade.");
  }
}
