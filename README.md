YoutubeSeq Domain
=============

Sequence de películas

### Install

Dependencies: 

* nodeJS 0.10
* npm 1.4

#### How to install

        $ git clone https://github.com/carlosvillu/youtubeseq
        $ cd youtubeseq
        $ npm install


### Description

Dominio para la aplicación http://youtubeseq.com

Ahora mismo es lo más simple posible y solo se usa en la API de la aplicación. Lo único que hace es exportar lo necesario para poder crear una secuencia de videos de Youtube usando o el título de un video o su Id.

### API

#### Youtubefactory

* repository: Devuelve la instancia de un repositorio de youtube. *SOLO* se puede usar la API como repositorio así que la forma de instanciarlo sería:

```coffee
{YoutubeFactory} = require 'youtubeseq-domain'
repositoryInstance = YoutubeFactory.youtubeRepository( 'API' )
```

```coffee
  findByTitle: (title)-> throw new Error "YoutubeBaseRepository#findByTitle"
  findById: (id)-> throw new Error "YoutubeBaseRepository#findById"
  titleById: (id)-> throw new Error "YoutubeBaseRepository#titleById"
```

Tiene métodos para buscar un video o por su título o por su id. Al buscar un video por su título tratará de encontrar una coindencia exacta en los 4 primeros resultados del buscador, en caso de no encontrarla devuelve el primero de la lista.

#### SequenceForVideoFactory

```coffee
{SequenceForVideoFactory} = require 'youtubeseq-domain'
```

* service: El servicio necesario para devolver una lista de videos.

* request: Encapsula el tipo de request que se le ha de pasar al servicio.

```coffee
    SequenceForVideoFactory.service( YoutubeFactory.youtubeRepository( 'API' ) )
      .execute(SequenceForVideoFactory.request( title )).done (results) ->
        console.log results
    
    # Array de objectos del tipo VideoEntity
```

#### VideoEntity

```coffee
  video = new VideoEntity(  youtube_api_results_item )
  video.videoId
  video.title
  video.description
  video.thumbnails.default.url
  video.thumbnails.medium.url
  video.thumbnails.high.url
  video.channelId
```





