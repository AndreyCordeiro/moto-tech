import 'package:moto_tech/dominio/dto/servico_dto.dart';

abstract class IEntradaServico {
  String salvarServico(ServicoDTO servicoDTO);
}
