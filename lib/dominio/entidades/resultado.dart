import 'package:intl/intl.dart';

import '../dto/dados_cliente.dart';
import '../dto/dados_servico.dart';
import '../dto/dados_veiculo.dart';
import 'cliente.dart';
import 'servico.dart';
import 'veiculo.dart';

class Resultado {
  Cliente cliente;
  Veiculo veiculo;
  Servico servico;

  Resultado({
    required this.cliente,
    required this.veiculo,
    required this.servico,
  });

  //   void realizarServico(
  //     Cliente cliente, String descricao, DateTime tempoServico) {
  //   var fidelidade = cliente.validarFidelidade(cliente: cliente);

  //   if (cliente.proximaGratuita) {
  //     valorServico = 0.0;
  //   }

  //   var servico = Servico(
  //     cliente: cliente,
  //     veiculo: cliente.veiculo,
  //     descricao: descricao,
  //     tempoServico: tempoServico,
  //     valorServico: valorServico,
  //   );
  // }

  bool estimativaDataEntrega({required Servico servico}) {
    DateTime now = DateTime.now();

    if (servico.tempoServico < 8) {
      DateTime dataEntrega = now.add(Duration(hours: servico.tempoServico));
      String dataFormatada = DateFormat('dd/MM/yyyy').format(dataEntrega);
      String tempoFormatado = DateFormat('HH:mm').format(dataEntrega);

      if (dataEntrega.hour > 18) {
        throw Exception("O seu veiculo só estara pronto no dia seguinte!");
      }
      print(
          "Seu veículo estará pronto às $tempoFormatado do dia $dataFormatada");
      return true;
    }
    return false;
  }

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
