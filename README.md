<h1 align="center">FlutterPokédex</h1>

<p align="center">
    <a href="https://opensource.org/licenses/Apache-2.0">
        <img alt="License" src="https://img.shields.io/badge/License-Apache%202.0-blue.svg"/>
    </a>
    <a href="https://github.com/tegueneeeee/FlutterPokedex/actions">
    <img src="https://github.com/tegueneeeee/FlutterPokedex/actions/workflows/flutter.yml/badge.svg" 
    alt="Flutter CI">
    </a>
</p>

<p>
🐼 Pokedex demonstrates modern Flutter development based on MVVM CleanArchitecture.
</p>

## Tech stack & Open-source libraries
- [Riverpod](https://pub.dev/packages/flutter_riverpod)
- Clean Architecture
  - MVVM Architecture View(Page StatelessWidget) - ViewModel(StateNotifier by Riverpod) - Model(Entity by Freezed)
  - Repository Pattern
  - Remote, Local, Cache data soure
  - UseCase
- [Retrofit](https://pub.dev/packages/retrofit) & [Dio](https://pub.dev/packages/dio): Construct the REST APIs network interface.
- [Freezed](https://pub.dev/packages/freezed): Creating immutable classes with value equality for modeling
- [go_router](https://pub.dev/packages/go_router): Navigation simplifiles routing in app
- [Mocktail](https://pub.dev/packages/mocktail): Unit Test Mocking
- [palette_generator](https://pub.dev/packages/palette_generator): For average background color
  

## Architecture 
Flutter Pokedex is based on the Clean Architecture MVVM architecture
## Open API

<img src="https://pokeapi.co/static/pokeapi_256.3fa72200.png" align="left" width="25%"/>

Pokedex using the [PokeAPI](https://pokeapi.co/) for constructing RESTful API.<br>
PokeAPI provides a RESTful API interface to highly detailed objects built from thousands of lines of data related to Pokémon.

# License
```xml
Designed and developed by 2023 tegueneeeee (Teakwon Kim)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```