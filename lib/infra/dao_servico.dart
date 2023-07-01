import 'package:moto_tech/dominio/dto/servico_dto.dart';
import 'package:moto_tech/dominio/dto/veiculo_dto.dart';
import 'package:moto_tech/dominio/portas/secundaria/i_dao_servico.dart';
import 'package:moto_tech/dominio/portas/secundaria/i_dao_veiculo.dart';

class DaoServico implements IDAOServico {
  @override
  String salvarServico({required ServicoDTO servicoDTO}) {
    print('Serviço salvo com sucesso!');
    return 'Serviço salvo com sucesso!';
  }
}
