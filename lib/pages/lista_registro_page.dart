import 'package:calculadora_imc/models/registro_class.dart';
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

  double peso = 0;
  double altura = 0;
  double imc = 0;
  String faixa = "";

  List<RegistroClass> registros = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: registros.length,
              itemBuilder: (BuildContext bc, int index) {
                var registro = registros[index];
                return Column(
                  children: [
                    Dismissible(
                      key: Key(index.toString()),
                      onDismissed: (DismissDirection dissmissDirection) {
                        setState(() {
                          registros.remove(registro);
                        });
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
                            Text("Altura: ${registro.peso}"),
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
                        onPressed: () {
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

                            RegistroClass registro = RegistroClass(peso, altura, imc, faixa);
                            setState(() {
                              registros.add(registro);
                            });

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