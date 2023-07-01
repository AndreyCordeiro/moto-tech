import 'package:flutter/material.dart';
import 'package:moto_tech/dominio/ddm_agendamento.dart';
import 'package:moto_tech/dominio/dto/agendamento_dto.dart';
import 'package:moto_tech/dominio/dto/cliente_dto.dart';
import 'package:moto_tech/dominio/dto/servico_dto.dart';
import 'package:moto_tech/dominio/dto/veiculo_dto.dart';

class Formulario extends StatelessWidget {
  const Formulario({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    var veiculo = VeiculoDTO(modelo: '', placa: '');

    var cliente = ClienteDTO(
      nome: '',
      cpf: '',
      qtdServico: 0,
      proximaGratuita: false,
      veiculo: veiculo,
    );

    var servico = ServicoDTO(
      veiculo: veiculo,
      descricao: '',
      qtdTrocasOleo: 0,
      tempoServico: 0,
    );

    var agendamento = AgendamentoDTO(
      clienteDTO: cliente,
      veiculoDTO: veiculo,
      servicoDTO: servico,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Moto-Tech'),
      ),
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text(
                'Dados do Veículo',
                style: TextStyle(fontSize: 30.0),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Placa'),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insira a placa';
                  } else {
                    veiculo.placa = value;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Modelo'),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insira o modelo';
                  } else {
                    veiculo.modelo = value;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 70.0),
              const Text(
                'Dados do Cliente',
                style: TextStyle(fontSize: 30.0),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Nome'),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insira o nome';
                  } else {
                    cliente.nome = value;
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('CPF'),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insira o CPF';
                  } else {
                    cliente.cpf = value;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 70.0),
              const Text(
                'Dados do Serviço',
                style: TextStyle(fontSize: 30.0),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Descrição'),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insira a descrição';
                  } else {
                    servico.descricao = value;
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Tempo de serviço'),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insira o tempo de serviço';
                  } else {
                    servico.tempoServico = int.parse(value);
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30.0),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      var ddmAgendamento = DDMAgendamento();

                      cliente.veiculo = veiculo;

                      ddmAgendamento.salvarAgendamento(
                        agendamentoDTO: agendamento,
                        clienteDTO: cliente,
                      );
                    }
                  },
                  child: const Text('REALIZAR AGENDAMENTO'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
