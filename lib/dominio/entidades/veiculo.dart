import '../portas/primaria/interface_entrada_veiculo.dart';

class Veiculo implements InterfaceEntradaVeiculo {
  late String modelo;
  late String placa;

  Veiculo({
    required String modelo,
    required String placa,
    });

  @override
  bool validarPlaca(Veiculo veiculo) {
    // Expressão regular para Placas Brasileiras (incluindo Mercosul)
    RegExp regex = RegExp(r'^(([A-Z]{3}\d{4})|([A-Z]{3}\d{1}[A-Z]{1}\d{2}))$');

    if (veiculo.modelo.isNotEmpty && veiculo.placa.isNotEmpty) {
      return regex.hasMatch(placa);
    }

    return false;
  }
}
