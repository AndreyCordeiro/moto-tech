import 'package:moto_tech/dominio/dto/agendamento_dto.dart';
import 'package:url_launcher/url_launcher.dart';

class DDMEnviarEmail {
  enviarEmail(AgendamentoDTO agendamentoDTO) {
    var mensagem =
        'Obrigado ${agendamentoDTO.clienteDTO.nome}, seu serviço foi agendado com sucesso para o veículo modelo ${agendamentoDTO.veiculoDTO.modelo} com a placa ${agendamentoDTO.veiculoDTO.placa}.';
    launchUrl(
      Uri(
        scheme: 'mailto',
        path: mensagem,
      ),
    );
    print(mensagem);
  }
}
