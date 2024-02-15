import 'package:flutter/material.dart';
import 'package:primeiroprograma/componentes/tarefas.dart';

class MinhaPrimeiraTela extends StatefulWidget {
  const MinhaPrimeiraTela({super.key});

  @override
  State<MinhaPrimeiraTela> createState() => _MinhaPrimeiraTelaState();
}

class _MinhaPrimeiraTelaState extends State<MinhaPrimeiraTela> {
  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Flutter: Primeiros Passos'),
        elevation: 0,
        leading: const Icon(Icons.add_task),
        ),
        body: AnimatedOpacity(
          opacity: opacidade ? 1 : 0,
          duration: const Duration(milliseconds: 800),
          child: ListView(
            children: const[
              Tarefas(
                'Comprar Frutas',
                'https://source.unsplash.com/random/900×700/?fruit',
                3,
              ),
              Tarefas(
                'Comprar Pão',
                'https://source.unsplash.com/random/?city,night',
                1,
              ),
              SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });
        },
        child: const Icon(
            Icons.remove_red_eye,
            color: Colors.white,
          ),
        backgroundColor: Colors.blue[200],
        )
    );
  }
}
