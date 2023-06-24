import 'package:moto_tech/dominio/core-private/veiculo.dart';
import 'package:moto_tech/dominio/dto/agendamento_dto.dart';
import 'package:moto_tech/dominio/dto/cliente_dto.dart';
import 'package:moto_tech/dominio/dto/servico_dto.dart';
import 'package:moto_tech/dominio/dto/veiculo_dto.dart';
import 'package:moto_tech/dominio/portas/primaria/i_entrada_veiculo.dart';
import 'package:moto_tech/dominio/portas/secundaria/i_dao_veiculo.dart';
import 'package:moto_tech/infra/dao_veiculo.dart';

class DDMVeiculo implements IEntradaVeiculo {
  late VeiculoDTO veiculoDTO;
  Veiculo veiculo;
  IDAOVeiculo idaoVeiculo = DaoVeiculo();

  DDMVeiculo({required this.veiculoDTO})
      : veiculo = Veiculo(modelo: veiculoDTO.modelo, placa: veiculoDTO.placa);

  @override
  bool validarVeiculo(VeiculoDTO veiculoDTO) {
    // TODO: implement validarVeiculo
    throw UnimplementedError();
  }

  @override
  Future<bool> salvarVeiculo({required VeiculoDTO veiculoDTO}) {
    // TODO: implement salvarVeiculo
    throw UnimplementedError();
  }
}
