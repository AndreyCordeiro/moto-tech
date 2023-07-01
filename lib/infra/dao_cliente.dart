import 'package:moto_tech/dominio/dto/cliente_dto.dart';
import 'package:moto_tech/dominio/portas/secundaria/i_dao_cliente.dart';

class DaoCliente implements IDAOCliente {
  @override
  String salvarCliente({required ClienteDTO clienteDTO}) {
    print('Cliente salvo com sucesso!');
    print('Nome do Cliente: ${clienteDTO.nome} com CPF N°: ${clienteDTO.cpf}');
    return 'Cliente salvo com sucesso!';
  }
}
