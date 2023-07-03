import 'package:app/domain/entity/pokemon/pokemon_list.dart';
import 'package:app/domain/entity/pokemon_info/pokemon_info.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'poke_api_service.g.dart';

@RestApi(baseUrl: "https://pokeapi.co/api/")
abstract class PokeApiService {
  factory PokeApiService(Dio dio, {String baseUrl}) = _PokeApiService;

  @GET("v2/pokemon")
  Future<PokemonList> getPokemonList({
    @Query('limit') int limit = 151,
    @Query('offset') int offset = 0,
  });

  @GET("v2/pokemon/{name}")
  Future<PokemonInfo> getPokemonInfo({
    @Path("name") required String name,
  });
}
