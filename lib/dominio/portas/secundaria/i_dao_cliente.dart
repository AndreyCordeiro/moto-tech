import 'package:moto_tech/dominio/dto/cliente_dto.dart';

abstract class IDAOCliente {
  String salvarCliente({required ClienteDTO clienteDTO});
}
