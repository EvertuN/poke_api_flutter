import 'package:flutter/material.dart';
import 'package:poke_api_flutter/view/pokemonPage.dart';
import '../model/modelPoke.dart';
import '../services/pokemonapiService.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PokeList> pokemon = [];

  @override
  void initState() {
    super.initState();
    _fetchPokes();
  }

  Future<void> _fetchPokes() async {
    PokeService pokeService = PokeService();
    List<PokeList> fetchedPokes = await pokeService.fetchPokes();
    setState(() {
      pokemon = fetchedPokes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Colors.red,
          title: const Text(
            'Pokedex',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: pokemon.isEmpty
              ? const Center(child: Text('Nenhum pokemon encontrado'))
              : ListView.builder(
                  itemCount: pokemon.length,
                  itemBuilder: (context, index) {
                    final poke = pokemon[index];
                    return Center(
                      child: SizedBox(
                        width: 400,
                        height: 120,
                        // child: Card(
                        //   clipBehavior: Clip.hardEdge,
                        //   child: InkWell(
                        //     splashColor: Colors.blue.withAlpha(30),
                        //     onTap: () {
                        //       // Navigator.push(
                        //       //   context,
                        //       //   MaterialPageRoute(
                        //       //     builder: (context) => PokemonPage(poke: poke),
                        //       //   ),
                        //       // );
                        //     },
                        //     child: Padding(
                        //       padding: const EdgeInsets.all(8.0),
                        //       child: Row(
                        //         crossAxisAlignment: CrossAxisAlignment.start,
                        //         children: [
                        //           Text(
                        //             poke.name,
                        //             style: const TextStyle(
                        //                 fontWeight: FontWeight.bold,
                        //                 fontSize: 18),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        child: ListTile(
                          leading: Image.network(
                            // poke.thumbnail,
                            'error.com',
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.catching_pokemon),
                            width: 50,
                          ),
                          title: Text(poke.name),
                          //isThreeLine: true,
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => PokemonPage(poke: poke),
                            //     ));
                          },
                        )
                      ),
                    );
                  },
                ),
        ));
  }
}
