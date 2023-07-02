import 'package:app/domain/entity/pokemon_url/pokemon_url.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'poke_api_service.g.dart';

@RestApi(baseUrl: "https://pokeapi.co/api/")
abstract class PokeApiService {
  factory PokeApiService(Dio dio, {String baseUrl}) = _PokeApiService;

  @GET("v2/pokemon")
  Future<PokemonUrl> getPokemonUrl({
    @Query("limit") int limit = 151,
  });
}
