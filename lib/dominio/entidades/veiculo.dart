import 'package:moto_tech/dominio/portas/primaria/interface_entrada_veiculo.dart';

class Veiculo implements InterfaceEntradaVeiculo {
  late String modelo;
  late String placa;

  Veiculo(String modelo, String placa) {
    this.modelo = modelo;
    this.placa = placa;
  }

  @override
  bool validarVeiculo(Veiculo veiculo) {
    // Expressão regular para Placas Brasileiras (incluindo Mercosul)
    RegExp regex = RegExp(r'^(([A-Z]{3}\d{4})|([A-Z]{3}\d{1}[A-Z]{1}\d{2}))$');

    if (veiculo.modelo != null &&
        veiculo.modelo.isNotEmpty &&
        veiculo.placa != null &&
        veiculo.placa.isNotEmpty) {
      return regex.hasMatch(placa);
    }

    return false;
  }
}
