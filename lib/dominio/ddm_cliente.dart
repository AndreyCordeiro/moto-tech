import 'package:moto_tech/dominio/core-private/cliente.dart';
import 'package:moto_tech/dominio/core-private/servico.dart';
import 'package:moto_tech/dominio/core-private/veiculo.dart';
import 'package:moto_tech/dominio/dto/cliente_dto.dart';
import 'package:moto_tech/dominio/portas/primaria/i_entrada_cliente.dart';
import 'package:moto_tech/infra/dao_cliente.dart';
import 'package:moto_tech/infra/dao_servico.dart';

class DDMCliente implements IEntradaCliente {
  late ClienteDTO clienteDTO;
  Cliente cliente;
  DaoCliente idaoVeiculo = DaoCliente();

  DDMCliente({required this.clienteDTO})
      : cliente = Cliente(
          nome: clienteDTO.nome,
          cpf: clienteDTO.cpf,
          qtdTrocasOleo: clienteDTO.qtdServico,
          veiculo: Veiculo(
              modelo: clienteDTO.veiculo.modelo,
              placa: clienteDTO.veiculo.placa),
        );

  @override
  String salvarCliente({required ClienteDTO clienteDTO}) {
    var clienteValido = cliente.validarCliente(clienteDTO);
    if (clienteValido) {
      return cliente.salvarCliente(clienteDTO, idaoVeiculo);
    }

    print('CPF do cliente inválido!');
    return 'CPF do cliente inválido!';
  }

  @override
  String getCpf(String cpf) {
    // TODO: implement getCpf
    throw UnimplementedError();
  }

  @override
  String getNome(String nome) {
    // TODO: implement getNome
    throw UnimplementedError();
  }
}
