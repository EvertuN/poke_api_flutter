import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../model/modelDetailPoke.dart';
import '../model/modelPoke.dart';

class PokeService {
  final Dio _dio = Dio();

  Future<List<PokeList>> fetchPokes() async {
    try {
      final response = await _dio.get('https://pokeapi.co/api/v2/pokemon');
      if (response.statusCode == 200) {
        final data = response.data;
        final pokeData = data['results'] as List;

        List<PokeList> pokes = pokeData.map((item) {
          return PokeList(
            name: item['name'] ?? 'Título Indisponível',
            url: item['url'] ?? '',
            // sprit: '',
          );
        }).toList();

        return pokes;
      } else {
        throw Exception('Erro ao carregar a lista: ${response.statusCode}');
      }
    } on DioException catch (e) {
      print('Erro na requisição: ${e.message}');
      throw Exception('Falha ao carregar a lista');
    }
  }

  Future<PokeDetails> fetchPokeDetails(String url) async {
    try {
      final response = await _dio.get(url);
      if (response.statusCode == 200) {
        return PokeDetails.fromJson(response.data);
      } else {
        throw Exception('Erro ao carregar detalhes: ${response.statusCode}');
      }
    } on DioException catch (e) {
      print('Erro na requisição: ${e.message}');
      throw Exception('Falha ao carregar detalhes');
    }
  }
  //
  // Future<void> showPokeDetails(String url) async {
  //   try {
  //     PokeDetails details = await PokeService().fetchPokeDetails(url);
  //
  //   } catch (e) {
  //     print('Erro ao exibir detalhes: $e');
  //   }
  // }
}
