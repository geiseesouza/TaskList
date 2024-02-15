import 'package:flutter/material.dart';
import 'package:primeiroprograma/componentes/Dificulty.dart';

class Tarefas extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;

  const Tarefas(this.nome, this.foto,this.dificuldade,{super.key});

  @override
  State<Tarefas> createState() => _TarefasState();
}

class _TarefasState extends State<Tarefas> {
  int nivel = 0;

  Map<int, Color> dificuldadeCores = {
    0: Colors.blue,
    1: Colors.black,
    2: Colors.green,
    3: Colors.yellow,
    4: Colors.orange,
    5: Colors.red,
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: dificuldadeCores[currentColor],
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                  ),
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            image: DecorationImage(
                              image: NetworkImage(
                                  widget.foto,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          width: 72,
                          height: 100,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 200,
                                child: Text(
                                  widget.nome,
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Difficulty(
                                dificultyLevel: widget.dificuldade,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                nivel++;
                              });
                            },
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.arrow_drop_up),
                                Text('Up'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: SizedBox(
                        width: 200,
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          backgroundColor: Colors.grey[300],
                          value:(widget.dificuldade >0)
                            ? (nivelatual/widget.dificuldade)/10
                              : 1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        'Nível: $nivelatual',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  int get nivelatual => nivel%(widget.dificuldade*10)+1;
  int get currentColor => (nivel~/(widget.dificuldade*10))%6;
}
