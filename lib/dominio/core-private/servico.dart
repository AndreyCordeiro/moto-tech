import 'package:moto_tech/dominio/dto/servico_dto.dart';
import 'package:moto_tech/dominio/dto/veiculo_dto.dart';
import 'package:moto_tech/infra/dao_servico.dart';

import 'cliente.dart';
import 'veiculo.dart';
import 'package:intl/intl.dart';

class Servico {
  dynamic id;
  late Cliente cliente;
  late Veiculo veiculo;
  late String descricao;
  late int tempoServico;
  late DateTime? tempoEstimadoEntrega;
  late double? valorServico;

  Servico({
    required this.cliente,
    required this.veiculo,
    required this.descricao,
    required this.tempoServico,
    this.tempoEstimadoEntrega,
    this.valorServico,
  });

  String salvarServico(ServicoDTO servicoDTO, DaoServico dao) {
    return dao.salvarServico(servicoDTO: servicoDTO);
  }

  DateTime calcularEstimativaEntrega(int tempoServico) {
    DateTime agora = DateTime.now();
    DateTime horaEntrega = agora.add(Duration(hours: tempoServico));

    if (horaEntrega.hour >= 18) {
      horaEntrega = horaEntrega.add(Duration(days: 1));
    }

    horaEntrega = DateTime(
      horaEntrega.year,
      horaEntrega.month,
      horaEntrega.day,
      18,
      0,
    );

    return horaEntrega;
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
