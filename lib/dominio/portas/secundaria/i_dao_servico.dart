import 'package:moto_tech/dominio/dto/servico_dto.dart';

abstract class IDAOServico {
  String salvarServico({required ServicoDTO servicoDTO});
}
