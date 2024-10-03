import 'package:flutter/material.dart';
import '../model/modelDetailPoke.dart';


class PokemonPage extends StatelessWidget {
  final PokeDetails poke;

  const PokemonPage({super.key, required this.poke});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text(
          poke.baseExperience as String,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Image.network(
              'error',
              // poke.sprite,
              errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.flag),
              width: 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Center(
                //   child: Text(
                //     poke.name,
                //     style: const TextStyle(
                //         fontSize: 24, fontWeight: FontWeight.bold),
                //   ),
                // ),
                const SizedBox(height: 16),
                Text('Experiencia Base: ${poke.baseExperience}',
                    style: const TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
