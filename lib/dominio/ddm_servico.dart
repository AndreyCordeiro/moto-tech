import 'package:moto_tech/dominio/core-private/servico.dart';
import 'package:moto_tech/dominio/core-private/veiculo.dart';
import 'package:moto_tech/dominio/dto/servico_dto.dart';
import 'package:moto_tech/dominio/dto/veiculo_dto.dart';
import 'package:moto_tech/dominio/portas/primaria/i_entrada_servico.dart';
import 'package:moto_tech/dominio/portas/primaria/i_entrada_veiculo.dart';
import 'package:moto_tech/infra/dao_servico.dart';
import 'package:moto_tech/infra/dao_veiculo.dart';

class DDMServico implements IEntradaServico {
  late ServicoDTO servicoDTO;
  Servico servico;
  DaoServico idaoServico = DaoServico();

  DDMVeiculo({required this.veiculoDTO})
      : veiculo = Veiculo(modelo: veiculoDTO.modelo, placa: veiculoDTO.placa);

  @override
  String salvarVeiculo({required VeiculoDTO veiculoDTO}) {
    var placaValida = veiculo.validarPlaca(veiculoDTO);
    if (placaValida) return veiculo.salvarVeiculo(veiculoDTO, idaoVeiculo);

    print('Placa inválida!');
    return 'Placa inválida!';
  }
}
