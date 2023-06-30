import 'package:moto_tech/dominio/dto/cliente_dto.dart';
import 'package:moto_tech/dominio/portas/secundaria/i_dao_cliente.dart';

class DaoCliente implements IDAOCliente {
  @override
  String salvarCliente({required ClienteDTO clienteDTO}) {
    print('Cliente salvo com sucesso!');
    return 'Cliente salvo com sucesso!';
  }
}
