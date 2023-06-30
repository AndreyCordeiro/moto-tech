import 'package:moto_tech/dominio/core-private/veiculo.dart';
import 'package:moto_tech/dominio/dto/veiculo_dto.dart';
import 'package:moto_tech/dominio/portas/primaria/i_entrada_veiculo.dart';
import 'package:moto_tech/infra/dao_veiculo.dart';

class DDMVeiculo implements IEntradaVeiculo {
  late VeiculoDTO veiculoDTO;
  Veiculo veiculo;
  DaoVeiculo idaoVeiculo = DaoVeiculo();

  DDMVeiculo({required this.veiculoDTO})
      : veiculo = Veiculo(modelo: veiculoDTO.modelo, placa: veiculoDTO.placa);

  @override
  bool validarPlaca(VeiculoDTO veiculoDTO) {
    throw UnimplementedError();
  }

  @override
  String salvarVeiculo({required VeiculoDTO veiculoDTO}) {
    var placaValida = veiculo.validarPlaca(veiculoDTO);
    if (placaValida) return veiculo.salvarVeiculo(veiculoDTO, idaoVeiculo);

    print('Placa inválida!');
    return 'Placa inválida!';
  }
}
