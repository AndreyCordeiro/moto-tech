import 'cliente.dart';
import 'veiculo.dart';
import 'package:intl/intl.dart';

class Servico {
  late Cliente cliente;
  late Veiculo veiculo;
  late String descricao;
  late int tempoServico;
  late DateTime? tempoEstimadoEntrega;
  late double? valorServico;

  Servico({
    required Cliente cliente,
    required Veiculo veiculo,
    required String descricao,
    required DateTime tempoServico,
    this.tempoEstimadoEntrega,
    this.valorServico,
  });

  void realizarServico(
      Cliente cliente, String descricao, DateTime tempoServico) {
    var fidelidade = cliente.validarFidelidade(cliente: cliente);

    if (cliente.proximaGratuita) {
      valorServico = 0.0;
    }

    var servico = Servico(
      cliente: cliente,
      veiculo: cliente.veiculo,
      descricao: descricao,
      tempoServico: tempoServico,
      valorServico: valorServico,
    );
  }

  @override
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
}
