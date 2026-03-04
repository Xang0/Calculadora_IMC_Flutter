import 'package:calculadora_imc/models/registro.dart';
import 'package:calculadora_imc/repository/registroRepository.dart';
import 'package:calculadora_imc/services/calculadora_imc.dart';
import 'package:flutter/material.dart';

class ListRegistroPage extends StatefulWidget {
  const ListRegistroPage({super.key});

  @override
  State<ListRegistroPage> createState() => _ListRegistroPageState();
}

class _ListRegistroPageState extends State<ListRegistroPage> {
  TextEditingController pesoController = TextEditingController(text: "");
  TextEditingController alturaController = TextEditingController(text: "");

  RegistroRepository registroRepository = RegistroRepository();
  List<Registro> _registros = [];
  
  int id = 0;
  double peso = 0;
  double altura = 0;
  double imc = 0;
  String faixa = "";

  @override
  void initState() {
    super.initState();

    obterRegistros();
  }

  void obterRegistros() async {
    _registros = await registroRepository.obterDados();

    if (_registros.isNotEmpty) {
      id = _registros.length;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _registros.length,
              itemBuilder: (BuildContext bc, int index) {
                var registro = _registros[index];
                return Column(
                  children: [
                    Dismissible(
                      key: Key(registro.id.toString()),
                      onDismissed: (DismissDirection dissmissDirection) async {
                        setState(() {
                          _registros.removeAt(index);
                        });

                        await registroRepository.remover(registro.id);

                        obterRegistros();
                      },
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(registro.faixa),
                            Text("${registro.data.day}/${registro.data.month}/${registro.data.year}")
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            Text("IMC: ${registro.imc.toStringAsPrecision(2)}"),
                            SizedBox(width: 5,),
                            Text("Altura: ${registro.altura}"),
                            SizedBox(width: 5,),
                            Text("Peso: ${registro.peso}"),
                          ],
                        )
                      )
                    ),
                    SizedBox(height: 5),
                    Divider(),
                  ],
                );
              }
            )
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pesoController.text = "";
          alturaController.text = "";
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Calcular IMC"),
                content: Wrap(
                  children: [
                    TextField(
                      controller: pesoController,
                      decoration: InputDecoration(
                        hintText: "Peso (Ex: 78.9, 56.2)"
                      ),
                    ),
                    TextField(
                      controller: alturaController,
                      decoration: InputDecoration(
                        hintText: "Altura (Ex: 1.96, 1.67)"
                      ),
                    ),
                  ],
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cancelar")
                      ),
                      TextButton(
                        onPressed: () async {
                          bool deuCerto = true;
                          try {
                            peso = double.parse(pesoController.text);
                          } catch (e) {
                            ScaffoldMessenger.of(context)
                              .showSnackBar(
                                SnackBar(
                                  content: Text("O peso deve ser um valor númerico válido (Ex: 78.9, 56.2)")
                                )
                              );

                            deuCerto = false;
                          }

                          try {
                            altura = double.parse(alturaController.text);
                          } catch (e) {
                            ScaffoldMessenger.of(context)
                              .showSnackBar(
                                SnackBar(
                                  content: Text("A altura deve ser um valor númerico válido (Ex: 1.96, 1.67)")
                                )
                              );

                            deuCerto = false;
                          }

                          if (deuCerto) {
                            imc = CalculadoraImc.calcularIMC(altura, peso);
                            faixa = CalculadoraImc.obterClassificacao(imc);
                            id += 1;

                            Registro registro = Registro(id, peso, altura, imc, faixa);
                            await registroRepository.salvar(registro);
                            obterRegistros();

                            Navigator.pop(context);
                          }
                        },
                        child: Text("Salvar"),
                      ),
                    ],
                  )
                ],
              );
            }
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}