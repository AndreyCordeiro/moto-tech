import 'package:moto_tech/dominio/dto/veiculo_dto.dart';

abstract class IEntradaVeiculo {
  bool validarVeiculo(VeiculoDTO veiculoDTO);
}
