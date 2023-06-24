import 'package:moto_tech/dominio/portas/secundaria/i_dao_veiculo.dart';

import '../dto/veiculo_dto.dart';
import '../portas/primaria/i_entrada_veiculo.dart';

class Veiculo implements IEntradaVeiculo {
  dynamic id;
  late String modelo;
  late String placa;

  Veiculo({
    required String modelo,
    required String placa,
  });

  bool validarVeiculo(VeiculoDTO veiculo) {
    // Expressão regular para Placas Brasileiras (incluindo Mercosul)
    RegExp regex = RegExp(r'^(([A-Z]{3}\d{4})|([A-Z]{3}\d{1}[A-Z]{1}\d{2}))$');

    if (veiculo.modelo.isNotEmpty && veiculo.placa.isNotEmpty) {
      return regex.hasMatch(placa);
    }

    return false;
  }

  String salvarVeiculo(VeiculoDTO veiculoDTO, IDAOVeiculo dao) {
    return dao.salvarVeiculo(veiculoDTO: veiculoDTO);
  }
}
