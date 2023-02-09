
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]


<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/board-together">
    <img src="#" alt="Logo" width="200" height="200">
  </a>

  <h1 align="center">Board (games) Together!</h3>

  <h3 align="center">
    Board Game Swap app
    <br />
  </h3>
</div>

<!-- TABLE OF CONTENTS -->
<h3>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#heroku-information">Heroku Information</a></li>
        <li><a href="#built-with">Built With</a></li>
        <li><a href="#database-schema">Database Schema</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
          <li><a href="#repositories">Repositories</a></li>
          <li><a href="#back-end-repository-installation">Back-End Repository Installation</a></li>
          <li><a href="#available-endpoints">Available Endpoints</a></li>
      </ul>
    </li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</li>
    <li><a href="#license">License</a></li></a>
  </ol>
</h3>

<!-- ABOUT THE PROJECT -->
## About The Project

![Product Demo](lib/assets/demo.gif)

Bacon ipsum dolor amet doner filet mignon flank pork ham kielbasa chicken jerky sirloin short ribs rump turducken. Kevin leberkas andouille, alcatra bresaola burgdoggen cow ball tip shankle. Meatloaf prosciutto bacon beef pork belly, boudin ball tip cupim kielbasa turducken pork loin landjaeger brisket buffalo. Short loin brisket drumstick salami cow shank pastrami pig bacon alcatra frankfurter picanha ham hock spare ribs tenderloin. T-bone brisket sausage pork loin, shank pancetta meatloaf jerky swine rump shankle.

Shankle filet mignon prosciutto doner. Tongue pancetta doner, pig landjaeger venison pork. Pig drumstick meatloaf tenderloin, porchetta boudin turducken pancetta picanha beef brisket burgdoggen meatball frankfurter pastrami. Bacon ham landjaeger cupim venison cow turkey, prosciutto brisket chicken swine. Jowl spare ribs bresaola flank. Pancetta shoulder ham hock, meatball beef ribs salami swine buffalo spare ribs sausage tail kevin picanha frankfurter andouille.

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- Heroku Information -->
### Heroku Information

<b>To start, visit the link below and login or register:</b>

* <a href="#">To be deployed</a><br>

<b>The back-end application is hosted separately at the link below, although it offers no end-user interactions:</b>

* <a href="#"></a><br>

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- Built With -->
### Built With

Rails backend, React front end (etc)

<img src="public/tech-stack.png" alt="Tech-Stack" width="80%" height="80%">

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- Database Schema -->
### Database Schema

<img src="public/Schema 2-6-23.png" alt="Database-Schema" width="90%" height="90%">

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- GETTING STARTED -->
## Getting Started

Bacon ipsum dolor amet doner filet mignon flank pork ham kielbasa chicken jerky sirloin short ribs rump turducken. Kevin leberkas andouille, alcatra bresaola burgdoggen cow ball tip shankle. Meatloaf prosciutto bacon beef pork belly, boudin ball tip cupim kielbasa turducken pork loin landjaeger brisket buffalo. Short loin brisket drumstick salami cow shank pastrami pig bacon alcatra frankfurter picanha ham hock spare ribs tenderloin. T-bone brisket sausage pork loin, shank pancetta meatloaf jerky swine rump shankle.

<!-- Repositories -->
### Repositories

* <b>Front-End:</b> https://github.com/board-together/FE-Board-Together <br />
* <b>Back-End:</b> https://github.com/board-together/BE-Board-Together <br />

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- Back-End Repository Installation -->
### Back-End Repository Installation
<b>Gem Installation</b>
* `bundle install`


<b>Required API keys</b>:
* Sign up for a <a href="https://www.boardgameatlas.com/api/docs/apps">Board Game Atlas client ID</a>
<li> In your <code>application.yml</code> file:</li>
          <ul> - Assign your Board Game Atlas api key to a variable (this will need to be passed in as query params with key <code>client_id</code>)</ul>


<p align="right">(<a href="#top">back to top</a>)</p>

<!-- Available Endpoints -->
## Available Endpoints

Endpoints are run through GraphQL queries. Expand a section below for query requests and expected responses. 

### User Queries
<details close>
  <summary>Find All Users</summary><br>

Returns a list of all current users in database.<br>

```query
query {
    users {
        id
        username
    }  
}
```

Expected Response:

 ```json
{
    "data": {
        "users": [
            {
                "id": 1,
                "username": "Pickafloof"
            },
            {
                "id": 2,
                "username": "Floofything"
            }
        ]  
    }
}
```
</details><br>

<details close>
  <summary>Find a Specific User</summary><br>

Return information about a specific user in the database.<br>

```query
query {
    user(username: "Pickafloof") {
        id
        username
        games {
            id
            boardGameAtlasId
            url
            name
            yearPublished
            minPlayers
            maxPlayers
            minPlaytime
            maxPlaytime
            minAge
            description
            thumbUrl
            imageUrl 
        }
    }
}
```

Expected Response:

 ```json
{
    "data": {
        "user": {
            "id": "1",
            "username": "Pickafloof",
            "games": [
                {
                    "id": 1,
                    "board_game_atlas_id": "OIXt3DmJU0",
                    "url": "https://www.boardgameatlas.com/game/OIXt3DmJU0/catan",
                    "name": "Catan",
                    "year_published": 1995,
                    "min_players": 3,
                    "max_players": 4,
                    "min_playtime": 45,
                    "max_playtime": 90,
                    "min_age": 10,
                    "description": "<p>The women and men of your expedition build the first two settlements. Fortunately, the land is rich in natural resources. You build roads and new settlements that eventually become cities. Will you succeed in gaining supremacy on Catan? Barter trade dominates the scene. Some resources you have in abundance, other resources are scarce. Ore for wool, brick for lumber - you trade according to what is needed for your current building projects. Proceed strategically! If you found your settlements in the right places and skillfully trade your resources, then the odds will be in your favor. But your opponents are smart too.</p>\r\n<p>To begin the game, we build the game board using hexagonal terrain tiles. Catan is born - a beautiful island with mountains, pastures, hills, fields, and forests, surrounded by the sea.</p>\r\n<p>Each of us places two small houses on spaces where three terrain hexes meet. They are our starting settlements.</p>\r\n<p>And so it begins. I roll two dice. An “11”! Each terrain hex is marked with a die roll number. Each player who owns a settlement adjacent to a terrain hex marked with the number rolled receives a resource produced by this hex. Hills produce brick, forests produce lumber, mountains produce ore, fields produce grain, and pastures produce wool.</p>\r\n<p>We use these resources to expand across Catan: we build roads and new settlements, or we upgrade our existing settlements to cities. For example, a road costs 1 brick and 1 lumber. If we do not have the necessary resources, we can acquire them by trading with our opponents.</p>\r\n<p>Each settlement is worth 1 victory point and each city is worth 2 victory points. If you expand cleverly, you may be the first player to reach 10 victory points and thus win the game!</p>",
                    "thumb_url": "https://s3-us-west-1.amazonaws.com/5cc.images/games/uploaded/1629324722072.jpg",
                    "image_url": "https://s3-us-west-1.amazonaws.com/5cc.images/games/uploaded/1629324722072.jpg",
                },
                {
                    "id": 2,
                    "board_game_atlas_id": "E5TYKwLTf0",
                    "name": "Catan: Cities & Knights",
                    "year_published": 1998,
                    "min_players": 3,
                    "max_players": 4,
                    "min_playtime": 60,
                    "max_playtime": 90,
                    "min_age": 10,
                    "description": "Dark clouds gather over the once peaceful landscape. Wild barbarians, lured by Catan’s wealth and power, maneuver to attack. Their massive warships loom against the bright orange horizon. You must be strong! Barbarians attack the weakest targets, and the victim of their onslaught will be the player who contributes the least to the defense of Catan.<br /><br /> Don’t take any chances! Field your knights!<br /><br /> In <b>Catan: Cities &amp; Knights</b> you engage in the defense of Catan and compete to build the three great metropolises of Catan. Each of these magnificent urban centers is even more valuable than a city. They’re also immune to the dangerous barbarians. Invest in city improvements, which you acquire using three commodities of trade: coin, paper, and cloth. If you improve your culture, muster your knights, and enrich your fine cities, you will be the master of the great realm of Catan!<br /><br /><b> Components:</b><br /> 36 Commodity Cards<br /> 54 Progress Cards<br /> 6 Victory Point Cards<br /> 3 Wooden Metropolis Pieces<br /> 1 Wooden Merchant Figure<br /> 1 Custom Event Die<br /> 1 Wooden Barbarian Ship<br /> 24 Wooden Knights<br /> 12 City Walls<br /> 4 Development Flip-Charts<br /> 1 Sea Frame Piece<br /> 1 Rulebook<br />",
                    "thumb_url": "https://s3-us-west-1.amazonaws.com/5cc.images/games/uploaded/1559257359245-51DYsPZcYyL.jpg",
                    "image_url": "https://s3-us-west-1.amazonaws.com/5cc.images/games/uploaded/1559257359245-51DYsPZcYyL.jpg",
                    "owned": "borrowed"
                }
            ]
        }
    }
}
```
</details><br>

<details close>
  <summary>Create a New User</summary><br>

Create a new user in the database.<br>

```query
mutation {
    creatUser(input:{username: "Foofything"}) {
        user {
            id
            username
        }
        errors
    }
}
```

Expected Response:

 ```json
{
    "data": {
        "user": {
            "id": "11",
            "username": "Floofything"
        },
        "errors": []
    }
}
```
</details><br>

<details close>
  <summary>Destroy a User's Game</summary><br>

Delete a game from a user's owned games list.<br>

```query
mutation {
    destroyUserGame(input:{user_id: 1, game_id: 1}) {
        user_id
        game_id
    }
}
```

Expected Response:

 ```json
{
    "data": {
        "destroyUserGame": {
            "user_id": 1,
            "game_id": 1
        }
    }
}
```
</details><br>

### Search Queries

<details close>
  <summary>Search for Games</summary><br>

Search for a game matching user input.<br>

```query
query {
    searchGames(name: "Catan") {
        board_game_atlas_id
        url
        name
        year_published
        min_players
        max_players
        min_playtime
        max_playtime
        min_age
        description
        thumb_url
        image_url
    }
}
```

Expected Response:

 ```json
{
    "data": {
        "searchGames": [
            {
                "boardGameAtlasId": "OIXt3DmJU0",
                "url": "https://www.boardgameatlas.com/game/OIXt3DmJU0/catan",
                "name": "Catan",
                "yearPublished": 1995,
                "minPlayers": 3,
                "maxPlayers": 4,
                "minPlaytime": 45,
                "maxPlaytime": 90,
                "minAge": 10,
                "description": "<p>The women and men of your expedition build the first two settlements. Fortunately, the land is rich in natural resources. You build roads and new settlements that eventually become cities. Will you succeed in gaining supremacy on Catan? Barter trade dominates the scene. Some resources you have in abundance, other resources are scarce. Ore for wool, brick for lumber - you trade according to what is needed for your current building projects. Proceed strategically! If you found your settlements in the right places and skillfully trade your resources, then the odds will be in your favor. But your opponents are smart too.</p>\r\n<p>To begin the game, we build the game board using hexagonal terrain tiles. Catan is born - a beautiful island with mountains, pastures, hills, fields, and forests, surrounded by the sea.</p>\r\n<p>Each of us places two small houses on spaces where three terrain hexes meet. They are our starting settlements.</p>\r\n<p>And so it begins. I roll two dice. An “11”! Each terrain hex is marked with a die roll number. Each player who owns a settlement adjacent to a terrain hex marked with the number rolled receives a resource produced by this hex. Hills produce brick, forests produce lumber, mountains produce ore, fields produce grain, and pastures produce wool.</p>\r\n<p>We use these resources to expand across Catan: we build roads and new settlements, or we upgrade our existing settlements to cities. For example, a road costs 1 brick and 1 lumber. If we do not have the necessary resources, we can acquire them by trading with our opponents.</p>\r\n<p>Each settlement is worth 1 victory point and each city is worth 2 victory points. If you expand cleverly, you may be the first player to reach 10 victory points and thus win the game!</p>",
                "thumbUrl": "https://s3-us-west-1.amazonaws.com/5cc.images/games/uploaded/1629324722072.jpg",
                "imageUrl": "https://s3-us-west-1.amazonaws.com/5cc.images/games/uploaded/1629324722072.jpg"
            },
            {
                "boardGameAtlasId": "E5TYKwLTf0",
                "name": "Catan: Cities & Knights",
                "yearPublished": 1998,
                "minPlayers": 3,
                "maxPlayers": 4,
                "minPlaytime": 60,
                "maxPlaytime": 90,
                "minAge": 10,
                "description": "Dark clouds gather over the once peaceful landscape. Wild barbarians, lured by Catan’s wealth and power, maneuver to attack. Their massive warships loom against the bright orange horizon. You must be strong! Barbarians attack the weakest targets, and the victim of their onslaught will be the player who contributes the least to the defense of Catan.<br /><br /> Don’t take any chances! Field your knights!<br /><br /> In <b>Catan: Cities &amp; Knights</b> you engage in the defense of Catan and compete to build the three great metropolises of Catan. Each of these magnificent urban centers is even more valuable than a city. They’re also immune to the dangerous barbarians. Invest in city improvements, which you acquire using three commodities of trade: coin, paper, and cloth. If you improve your culture, muster your knights, and enrich your fine cities, you will be the master of the great realm of Catan!<br /><br /><b> Components:</b><br /> 36 Commodity Cards<br /> 54 Progress Cards<br /> 6 Victory Point Cards<br /> 3 Wooden Metropolis Pieces<br /> 1 Wooden Merchant Figure<br /> 1 Custom Event Die<br /> 1 Wooden Barbarian Ship<br /> 24 Wooden Knights<br /> 12 City Walls<br /> 4 Development Flip-Charts<br /> 1 Sea Frame Piece<br /> 1 Rulebook<br />",
                "thumbUrl": "https://s3-us-west-1.amazonaws.com/5cc.images/games/uploaded/1559257359245-51DYsPZcYyL.jpg",
                "imageUrl": "https://s3-us-west-1.amazonaws.com/5cc.images/games/uploaded/1559257359245-51DYsPZcYyL.jpg",
            }
        ]
    }
}  }
}
```
</details><br>

<details close>
  <summary>Find a User's Games</summary><br>

Find all games owned by a specific user.<br>

```query
query {
    games(user: 1) {
        id
        type
        attributes {
            board_game_atlas_id
            url
            name
            year_published
            min_players
            max_players
            min_playtime
            max_playtime
            min_age
            description
            thumb_url
            image_url
        }
    }
}
```

Expected Response:

 ```json
{
    "data": {
        "games": [
            {
                "id": 1,
                "boardGameAtlasId": "OIXt3DmJU0",
                "url": "https://www.boardgameatlas.com/game/OIXt3DmJU0/catan",
                "name": "Catan",
                "yearPublished": 1995,
                "minPlayers": 3,
                "maxPlayers": 4,
                "minPlaytime": 45,
                "maxPlaytime": 90,
                "minAge": 10,
                "description": "<p>The women and men of your expedition build the first two settlements. Fortunately, the land is rich in natural resources. You build roads and new settlements that eventually become cities. Will you succeed in gaining supremacy on Catan? Barter trade dominates the scene. Some resources you have in abundance, other resources are scarce. Ore for wool, brick for lumber - you trade according to what is needed for your current building projects. Proceed strategically! If you found your settlements in the right places and skillfully trade your resources, then the odds will be in your favor. But your opponents are smart too.</p>\r\n<p>To begin the game, we build the game board using hexagonal terrain tiles. Catan is born - a beautiful island with mountains, pastures, hills, fields, and forests, surrounded by the sea.</p>\r\n<p>Each of us places two small houses on spaces where three terrain hexes meet. They are our starting settlements.</p>\r\n<p>And so it begins. I roll two dice. An “11”! Each terrain hex is marked with a die roll number. Each player who owns a settlement adjacent to a terrain hex marked with the number rolled receives a resource produced by this hex. Hills produce brick, forests produce lumber, mountains produce ore, fields produce grain, and pastures produce wool.</p>\r\n<p>We use these resources to expand across Catan: we build roads and new settlements, or we upgrade our existing settlements to cities. For example, a road costs 1 brick and 1 lumber. If we do not have the necessary resources, we can acquire them by trading with our opponents.</p>\r\n<p>Each settlement is worth 1 victory point and each city is worth 2 victory points. If you expand cleverly, you may be the first player to reach 10 victory points and thus win the game!</p>",
                "thumbUrl": "https://s3-us-west-1.amazonaws.com/5cc.images/games/uploaded/1629324722072.jpg",
                "imageUrl": "https://s3-us-west-1.amazonaws.com/5cc.images/games/uploaded/1629324722072.jpg",
            },
            {
                "id": 2,
                "boardGameAtlasId": "E5TYKwLTf0",
                "name": "Catan: Cities & Knights",
                "yearPublished": 1998,
                "minPlayers": 3,
                "maxPlayers": 4,
                "minPlaytime": 60,
                "maxPlaytime": 90,
                "minAge": 10,
                "description": "Dark clouds gather over the once peaceful landscape. Wild barbarians, lured by Catan’s wealth and power, maneuver to attack. Their massive warships loom against the bright orange horizon. You must be strong! Barbarians attack the weakest targets, and the victim of their onslaught will be the player who contributes the least to the defense of Catan.<br /><br /> Don’t take any chances! Field your knights!<br /><br /> In <b>Catan: Cities &amp; Knights</b> you engage in the defense of Catan and compete to build the three great metropolises of Catan. Each of these magnificent urban centers is even more valuable than a city. They’re also immune to the dangerous barbarians. Invest in city improvements, which you acquire using three commodities of trade: coin, paper, and cloth. If you improve your culture, muster your knights, and enrich your fine cities, you will be the master of the great realm of Catan!<br /><br /><b> Components:</b><br /> 36 Commodity Cards<br /> 54 Progress Cards<br /> 6 Victory Point Cards<br /> 3 Wooden Metropolis Pieces<br /> 1 Wooden Merchant Figure<br /> 1 Custom Event Die<br /> 1 Wooden Barbarian Ship<br /> 24 Wooden Knights<br /> 12 City Walls<br /> 4 Development Flip-Charts<br /> 1 Sea Frame Piece<br /> 1 Rulebook<br />",
                "thumbUrl": "https://s3-us-west-1.amazonaws.com/5cc.images/games/uploaded/1559257359245-51DYsPZcYyL.jpg",
                "imageUrl": "https://s3-us-west-1.amazonaws.com/5cc.images/games/uploaded/1559257359245-51DYsPZcYyL.jpg"
            }
        ]
    }
}
```
</details><br>

[![Run in Postman](https://run.pstmn.io/button.svg)](https://www.google.com/)

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- ROADMAP -->
## Roadmap

MVP
* [ ] DO STUFF

Stretch Goals
* [ ] EXTENSINOS

See the [open issues](https://github.com/board-together/BE-Board-Together/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- CONTACT -->
## Contact

<table>
  <tr>
    <td><img src="https://avatars.githubusercontent.com/u/102780642?s=150&v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/101418582?s=150&v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/60988144?s=150&v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/35391349?s=150&v=4"></td>
  </tr>
  <tr>
    <td>Annie Pulzone</td>
    <td>Bryan Keener</td>
    <td>Darby Smith</td>
    <td>Michael Marchand</td>
  </tr>
  <tr>
    <td>
      <a href="https://github.com/ajpulzone">GitHub</a><br>
      <a href="https://www.linkedin.com/in/annie-pulzone/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/bkeener7">GitHub</a><br>
      <a href="https://www.linkedin.com/in/bkeener/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/DarbySmith">GitHub</a><br>
      <a href="https://www.linkedin.com/in/darby-m-smith/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/marchandMD">GitHub</a><br>
      <a href="https://www.linkedin.com/in/mmarchand1/">LinkedIn</a>
    </td>
  </tr>
</table>

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

Turing School of Software Design: [https://turing.edu/](https://turing.edu/)

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- LICENSE -->
## License

Distributed under the MIT License.

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/board-together/BE-Board-Together.svg?style=for-the-badge
[contributors-url]: https://github.com/board-together/BE-Board-Together/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/board-together/BE-Board-Together.svg?style=for-the-badge
[forks-url]: https://github.com/board-together/BE-Board-Together/network/members
[stars-shield]: https://img.shields.io/github/stars/board-together/BE-Board-Together.svg?style=for-the-badge
[stars-url]: https://github.com/board-together/BE-Board-Together/stargazers
[issues-shield]: https://img.shields.io/github/issues/board-together/BE-Board-Together.svg?style=for-the-badge
[issues-url]: https://github.com/board-together/BE-Board-Together/issues
[license-shield]: https://img.shields.io/github/license/board-together/BE-Board-Together.svg?style=for-the-badge
[license-url]: https://github.com/board-together/BE-Board-Together/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/othneildrew
