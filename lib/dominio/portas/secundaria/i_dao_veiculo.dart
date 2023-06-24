import 'package:moto_tech/dominio/dto/veiculo_dto.dart';

abstract class IDAOVeiculo {
  String salvarVeiculo({required VeiculoDTO veiculoDTO});
}
