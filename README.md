# Photo Album App

Este é um projeto Flutter baseado na API REST gratuita [JSONPlaceholder](https://jsonplaceholder.typicode.com/), que fornece informações sobre álbuns de fotos, fotos e autores (usuários). O aplicativo permite que os usuários naveguem por uma lista de fotos, visualizem detalhes de cada uma, filtrem a lista e adicionem comentários. O projeto utiliza FVM, Flutter Modular, MobX e Dio.

## Funcionalidades

1. **Listagem de Fotos**:
    - Ao abrir o aplicativo, o usuário visualiza uma lista de fotos obtida da API.

2. **Detalhes da Foto**:
    - Ao tocar em um item da lista, o usuário é redirecionado para uma tela de detalhes onde pode ver:
        - A imagem em tamanho maior.
        - Informações da foto (como título e descrição) e informações sobre o autor.
        - Lista de comentários associados à foto.

3. **Opções na Tela de Detalhes**:
    - Ver a localização da empresa do autor no Google Maps (aplicação externa).
    - Enviar um e-mail para o autor da imagem via aplicativos externos.
    - Adicionar um novo comentário à foto.
    - Voltar para a tela anterior.

4. **Filtragem**:
    - O usuário pode filtrar a lista de fotos exibida na tela inicial por título da foto, título do álbum ou nome do autor.

5. **Envio de Comentários**:
    - O usuário pode enviar um comentário para o autor, incluindo título e descrição do comentário. Após o envio, o usuário é redirecionado de volta para a tela de detalhes da foto.

## Tecnologias Utilizadas

- **[Flutter](https://flutter.dev/)**: Framework para desenvolvimento de aplicativos móveis multiplataforma.
- **[FVM](https://fvm.app/)**: Gerenciador de versões do Flutter.
- **[Flutter Modular](https://modular.flutterando.com.br/docs/intro/)**: Gerenciamento de rotas e injeção de dependências.
- **[MobX](https://mobx.netlify.app/)**: Gerenciamento de estado reativo.
- **[Dio](https://pub.dev/packages/dio)**: Cliente HTTP para realizar as requisições à API.

## Requisitos

- **FVM**: Utilize o FVM para gerenciar a versão do Flutter no projeto.
- **Flutter SDK**: Certifique-se de que está utilizando a última versão do Flutter SDK.
- **Dart SDK**: Última versão do Dart SDK.

## Instalação

1. Clone o repositório:
   ```bash
   git clone https://github.com/seu-usuario/photo-album-app.git
