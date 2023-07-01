import 'package:moto_tech/dominio/dto/veiculo_dto.dart';
import 'package:moto_tech/dominio/portas/secundaria/i_dao_veiculo.dart';

class DaoVeiculo implements IDAOVeiculo {
  @override
  String salvarVeiculo({required VeiculoDTO veiculoDTO}) {
    print('Veículo salvo com sucesso!');
    print('Modelo: ${veiculoDTO.modelo} - Placa: ${veiculoDTO.placa}' );
    return 'Veículo salvo com sucesso!';
  }
}
