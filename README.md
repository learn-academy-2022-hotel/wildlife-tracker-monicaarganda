## Wildlife Tracker ##
- accept the slack link (completed)
- https://github.com/learn-academy-2022-hotel/Syllabus/blob/main/rails/rails-api.md
- Wildlife tracker challenge
- cd to your Desktop
- $ rails new wildlife-sightings -d postgresql -T
- $ cd (custom name)
- $ rails db:create
- $ git remote add origin https://github.com/learn-academy-2022-hotel/wildlife-tracker-monicaarganda.git

- $ git branch
- $ git status
- $ git checkout -b main
- $ git add .
- $ git commit -m "initial commit"
- $ git push origin main
- $ git checkout -b initial-setup
- $ bundle add rspec-rails
- $ rails generate rspec:install
- $ git status
- $ git add .
- $ git commit -m "added rspec dependencies and files"
- $ rails s
- $ git push origin initial-setup
- $ git checkout main
- $ git pull origin main
Open the folder in a text editor
Code!

<!-- - Create a Animal tracker, 
    - model for the animals
    - controller that will handle the respone and request cycle
-  $ rails generate resource Animal common_name:string scientific_binomial:string -->
<!-- - update schema
    - $ rails db:migrate -->


###
    Story 1: In order to track wildlife sightings, as a user of the API, I need to manage animals.

- $ git checkout -b animal-crud-actions

    Acceptance Criteria

# Create a resource for animal with the following information: common name and scientific binomial

- Create a Animal tracker, 
    - model for the animals
    - controller that will handle the respone and request cycle

-  $ rails generate resource Animal common_name:string scientific_binomial:string

# Can see the data response of all the animals
* Apis mellifera (the honey bee)|
* Bengal Tiger(Panthera tigris tigris)|
* Cheetah(Acinonyx jubatus)|
* Red-Eyed Tree Frog (Agalychnis callidryas)
* Impala(Aepyceros Melampus)|
* Eyelash Viper(Bothriechis schlegelii)|
* Great Egret(Ardea alba)
* Ruby-Throated Hummingbird(Archilochus colubris)
* Hyacinth Macaw(Anodorhynchus hyacinthinus)
* Long-Tailed Tit(Aegithalos caudatus)
* African Jacana(Actophilornis Africanus)
* Costa’s Hummingbird(Calypte costae)
* Cedar Waxwing(Bombycilla cedrorum)

- $ rails db:migrate
    - update schema

- $ rails c
    - open console

- CREATE DATA
    - Animal.create(common_name:'Ruby-Throated Hummingbird', scientific_binomial:'Archilochus colubris')
    - Animal.create(common_name:'Long-Tailed Tit', scientific_binomial:'Aegithalos caudatus')
    - Animal.create(common_name:'Red-Eyed Tree Frog', scientific_binomial:'Agalychnis callidryas')
    - Animal.create(common_name:'Hyacinth Macaw', scientific_binomial:'Actophilornis Africanus')
    - Animal.create(common_name:'Cedar Waxwing', scientific_binomial:'Bombycilla cedrorum')
    - Animal.create(common_name:'Costa’s Hummingbird', scientific_binomial:'Calypte costae')

- Animal.all
    -output:   
            <!-- Animal Load (1.0ms)  SELECT "animals".* FROM "animals" -->
            <!-- =>                                                           
            [#<Animal:0x000000012906c820                                  
            id: 1,                                                      
            common_name: "Ruby-Throated Hummingbird",                   
            scientific_binomial: "Archilochus colubris",                
            created_at: Fri, 20 Jan 2023 05:19:00.296971000 UTC +00:00, 
            updated_at: Fri, 20 Jan 2023 05:19:00.296971000 UTC +00:00>,
            #<Animal:0x000000012906c6e0                                  
            id: 2,                                                      
            common_name: "Long-Tailed Tit",                             
            scientific_binomial: "Aegithalos caudatus",                 
            created_at: Fri, 20 Jan 2023 05:19:09.474522000 UTC +00:00, 
            updated_at: Fri, 20 Jan 2023 05:19:09.474522000 UTC +00:00>,
            #<Animal:0x000000012906c618                                  
            id: 3,
            common_name: "Red-Eyed Tree Frog",
            scientific_binomial: "Agalychnis callidryas",
            created_at: Fri, 20 Jan 2023 05:19:15.179221000 UTC +00:00,
            updated_at: Fri, 20 Jan 2023 05:19:15.179221000 UTC +00:00>,
            #<Animal:0x000000012906c550
            id: 4,
            common_name: "Hyacinth Macaw",
            scientific_binomial: "Actophilornis Africanus",
            created_at: Fri, 20 Jan 2023 05:19:22.146343000 UTC +00:00,
            updated_at: Fri, 20 Jan 2023 05:19:22.146343000 UTC +00:00>,
            #<Animal:0x000000012906c488
            id: 5,
            common_name: "Cedar Waxwing",
            scientific_binomial: "Bombycilla cedrorum",
            created_at: Fri, 20 Jan 2023 05:19:34.519135000 UTC +00:00,
            updated_at: Fri, 20 Jan 2023 05:19:34.519135000 UTC +00:00>,
            #<Animal:0x000000012906c3c0
            id: 6,
            common_name: "Costa’s Hummingbird",
            scientific_binomial: "Calypte costae",
            created_at: Fri, 20 Jan 2023 05:19:40.433193000 UTC +00:00,
            updated_at: Fri, 20 Jan 2023 05:19:40.433193000 UTC +00:00>] -->

## Index ##
-apps/controller/animals_controller

```ruby
    def index
        animals = Animal.all
        render json: animals
    end
```
- $ rails routes --expanded
--[ Route 1 ]--
Prefix            | animals
Verb              | GET
URI               | /animals(.:format)
Controller#Action | animals#index

- Postman
    -http verb, path, click send
GET localhost:3000/animals
    -output: this pulls all of the entries of each song
        output: an array of objects containing our data entries
            [
            {
                "id": 1,
                "common_name": "Ruby-Throated Hummingbird",
                "scientific_binomial": "Archilochus colubris",
                "created_at": "2023-01-20T05:19:00.296Z",
                "updated_at": "2023-01-20T05:19:00.296Z"
            },
            {
                "id": 2,
                "common_name": "Long-Tailed Tit",
                "scientific_binomial": "Aegithalos caudatus",
                "created_at": "2023-01-20T05:19:09.474Z",
                "updated_at": "2023-01-20T05:19:09.474Z"
            },
            {
                "id": 3,
                "common_name": "Red-Eyed Tree Frog",
                "scientific_binomial": "Agalychnis callidryas",
                "created_at": "2023-01-20T05:19:15.179Z",
                "updated_at": "2023-01-20T05:19:15.179Z"
            },
            {
                "id": 4,
                "common_name": "Hyacinth Macaw",
                "scientific_binomial": "Actophilornis Africanus",
                "created_at": "2023-01-20T05:19:22.146Z",
                "updated_at": "2023-01-20T05:19:22.146Z"
            },
            {
                "id": 5,
                "common_name": "Cedar Waxwing",
                "scientific_binomial": "Bombycilla cedrorum",
                "created_at": "2023-01-20T05:19:34.519Z",
                "updated_at": "2023-01-20T05:19:34.519Z"
            },
            {
                "id": 6,
                "common_name": "Costa’s Hummingbird",
                "scientific_binomial": "Calypte costae",
                "created_at": "2023-01-20T05:19:40.433Z",
                "updated_at": "2023-01-20T05:19:40.433Z"
            }
            ]

## SHOW ##
-apps/controller/animals_controller
```ruby
    def show
        animal = Animal.find(params[:id])
        render json: song
    end 
```
- $ rails routes --expanded
--[ Route 5 ]--
Prefix            | animal
Verb              | GET
URI               | /animals/:id(.:format)
Controller#Action | animals#show

- Postman
    -http verb, path, click send
GET localhost:3000/animals/6
    
    output: object containing the data entry at the id
            {
            "id": 6,
            "common_name": "Costa’s Hummingbird",
            "scientific_binomial": "Calypte costae",
            "created_at": "2023-01-20T05:19:40.433Z",
            "updated_at": "2023-01-20T05:19:40.433Z"
            }

# Can create a new animal in the database

## CREATE ##
-apps/controller/animals_controller
```ruby
    def create
        animal = Animal.create(animal_params)
        if animal.valid?
            render json: animal
        else
            render json: animal.errors
        end
    end
    private
    def animal_params
        params.require(:animal).permit(:common_name, :scientific_binomial)
    end
```

- $ rails routes --expanded
--[ Route 2 ]--
Prefix            | 
Verb              | POST
URI               | /animals(.:format)
Controller#Action | animals#create
    
- Postman
    -http verb, path, click send
POST localhost:3000/animals
    - change Params-> Body
    - change none-> raw
    - change text-> JSON
        - enter text:
            {
                "common_name": "African Jacana",
                "scientific_binomial": "Actophilornis Africanus"
            }
    - Body -> change pretty -> preview to view error message
     -output: ERROR MESSAGE: Can't verify CSRF token authenticity.

-app/controller/application_controller

```ruby
class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
end
``` 
    - output: object that was added into the data entries
        {
            "id": 7,
            "common_name": "African Jacana",
            "scientific_binomial": "Actophilornis Africanus",
            "created_at": "2023-01-20T06:56:46.986Z",
            "updated_at": "2023-01-20T06:56:46.986Z"
        }

# Can update an existing animal in the database
## Update ##
-apps/controller/animals_controller
```ruby
def update
        animal = Animal.find(params[:id])
        animal.update(animal_params)
        if book.vaild?
            render json: animal
        else
            render json: animal
        end
    end
```

- $ rails routes --expanded
--[ Route 6 ]--
Prefix            | 
Verb              | PATCH
URI               | /animals/:id(.:format)
Controller#Action | animals#update

- Postman
    -http verb, path, click send
PATCH localhost:3000/animals/3
    - original entry:
        {
            "id": 3,
            "common_name": "Red-EyedTree Frog",
            "scientific_binomial":"Agalychnis callidryas",
            "created_at":"2023-01-20T05:19:15179Z",
            "updated_at":"2023-01-20T05:19:15179Z"
        }
    - updated text:
        {
            "common_name": "Great Egret",
            "scientific_binomial": "Ardea alba"
        }

     - output: updated object
        {
        "common_name": "Great Egret",
        "scientific_binomial": "Ardea alba",
        "id": 3,
        "created_at": "2023-01-20T05:19:15.179Z",
        "updated_at": "2023-01-20T07:22:16.736Z"
        }


# Can remove an animal entry in the database
## Delete ##
-apps/controller/animals_controller

``` ruby
    def destroy
        animal = Animal.find(params[:id])
        if animal.destroy
            render json: animal
        else
            render json: animal.errors
        end
    end 
```

- $ rails routes --expanded
--[ Route 8 ]--
Prefix            | 
Verb              | DELETE
URI               | /animals/:id(.:format)
Controller#Action | animals#destroy

- Postman
    -http verb, path, click send
DELETE localhost:3000/animals/3

    output: object that was deleted
        {
            "id": 3,
            "common_name": "Great Egret",
            "scientific_binomial": "Ardea alba",
            "created_at": "2023-01-20T05:19:15.179Z",
            "updated_at": "2023-01-20T07:22:16.736Z"
        }
###

    - $ git status
    - $ git add .
    - $ git commit -m "Completed Story 1"
    - $ git push origin animal-crud-actions 
    - $ git push origin main
    - git pull

###
    Story 2: In order to track wildlife sightings, as a user of the API, I need to manage animal sightings.

- $ git checkout -b sighting-crud-actions

    Acceptance Criteria

# Create a resource for animal sightings with the following information: latitude, longitude, date
(Hint: An animal has_many sightings (rails g resource Sighting animal_id:integer ...)(Hint: Date is written in Active Record as yyyy-mm-dd (“2022-07-28"))

- $ rails generate resource Sighting animal_id:integer latitude:string longitude:string date:date

- $ rails c
- Animal.all
    -output: 
          Animal Load (27.3ms)  SELECT "animals".* FROM "animals"
            =>                                                           
            [#<Animal:0x000000012487e180                                  
            id: 1,                                                      
            common_name: "Ruby-Throated Hummingbird",                   
            scientific_binomial: "Archilochus colubris",                
            created_at: Fri, 20 Jan 2023 05:19:00.296971000 UTC +00:00, 
            updated_at: Fri, 20 Jan 2023 05:19:00.296971000 UTC +00:00>,
            #<Animal:0x000000012487e0b8                                  
            id: 2,                                                      
            common_name: "Long-Tailed Tit",                             
            scientific_binomial: "Aegithalos caudatus",                 
            created_at: Fri, 20 Jan 2023 05:19:09.474522000 UTC +00:00, 
            updated_at: Fri, 20 Jan 2023 05:19:09.474522000 UTC +00:00>,
            #<Animal:0x000000012487dff0                                  
            id: 4,
            common_name: "Hyacinth Macaw",
            scientific_binomial: "Actophilornis Africanus",
            created_at: Fri, 20 Jan 2023 05:19:22.146343000 UTC +00:00,
            updated_at: Fri, 20 Jan 2023 05:19:22.146343000 UTC +00:00>,
            #<Animal:0x000000012487df28
            id: 5,
            common_name: "Cedar Waxwing",
            scientific_binomial: "Bombycilla cedrorum",
            created_at: Fri, 20 Jan 2023 05:19:34.519135000 UTC +00:00,
            updated_at: Fri, 20 Jan 2023 05:19:34.519135000 UTC +00:00>,
            #<Animal:0x000000012487de60
            id: 6,
            common_name: "Costa’s Hummingbird",
            scientific_binomial: "Calypte costae",
            created_at: Fri, 20 Jan 2023 05:19:40.433193000 UTC +00:00,
            updated_at: Fri, 20 Jan 2023 05:19:40.433193000 UTC +00:00>,
            #<Animal:0x000000012487dd98
            id: 7,
            common_name: "African Jacana",
            scientific_binomial: "Actophilornis Africanus",
            created_at: Fri, 20 Jan 2023 06:56:46.986330000 UTC +00:00,
            updated_at: Fri, 20 Jan 2023 06:56:46.986330000 UTC +00:00>]

- $ ruby = Animal.first
    - output: 
    id:1,                        
    common_name: "Ruby-Throated Hummingbird",
    scientific_binomial: "Archilochus colubris", 
- $ ruby.sightings.create(latitude: '21.4691° N', longitude: '78.6569° W', date:'2021-07-04')
    -output: 
    id:1,                                                     animal_id:1,
    latitude: "21.4691° N",
    longitude: "78.6569° W",

- $ long = Animal.find(2)
    - output: 
     id:2,
     common_name: "Long-Tailed Tit",
     scientific_binomial: "Aegithalos caudatus", 
- $ long.sightings.create(latitude: '34.0479° N', longitude: '100.6197° E', date:'2022-01-02') 
    -output: 
    id:2,                                                     animal_id:2,
    latitude: "34.0479° N",
    longitude: "100.6197° E",

- $ macaw = Animal.find(4)
    - output: 
     id:4,
     common_name: "Hyacinth Macaw",
     scientific_binomial: "Actophilornis Africanus",  
- $ macaw.sightings.create(latitude: '8.7832° S', longitude: '55.4915° W', date:'2022-12-07') 
    -output: 
    id:3,                                                     animal_id:4,
    latitude: "8.7832° S",
    longitude: "55.4915° W",

- $ wing = Animal.find(5)
    - output: 
     id:5,
     common_name: "Cedar Waxwing",
     scientific_binomial: "Bombycilla cedrorum", 
- $ wing.sightings.create(latitude: '12.7690° N', longitude: '85.6024° W', date:'2022-11-15') 
    -output: 
    id:4,                                                     animal_id:5,
    latitude: "12.7690° N",
    longitude: "85.6024° W",

- $ costa = Animal.find(6)
    - output:  
    id:6,
    common_name: "Costa’s Hummingbird",
    scientific_binomial: "Calypte costae",
- $ costa.sightings.create(latitude: '54.5260° N', longitude: '105.2551° W', date:'2022-10-08') 
    -output: 
    id:5,                                                     animal_id:6,
    latitude: "54.5260° N",
    longitude: "105.2551° W",

- $ cana = Animal.find(7)
    - output:  
    id:7,
    common_name: "African Jacana",scientific_binomial: "Actophilornis Africanus"
- $ cana.sightings.create(latitude: '8.7832° S', longitude: '34.5085° E', date:'2022-12-27') 
    -output: 
    id:6,                                                     animal_id:7,
    latitude: "8.7832° S",
    longitude: "34.5085° E",


## Index ##
-apps/controller/animals_controller
``` ruby
    def index
        sightings = Sighting.all
        render json: sightings
    end
```

- $ rails routes --expanded
--[ Route 1 ]--
Prefix            | sightings
Verb              | GET
URI               | /sightings(.:format)
Controller#Action | sightings#index

- Postman
    -http verb, path, click send
GET localhost:3000/sightings
        -output: this pulls all of the entries of each song, an array of objects containing our data entries

## SHOW ##
-apps/controller/animals_controller
``` ruby
    def show
        sighting = Sighting.find(params[:id])
        render json: sighting
    end
```
- $ rails routes --expanded
--[ Route 5 ]--
Prefix            | sighting
Verb              | GET
URI               | /sightings/:id(.:format)
Controller#Action | sightings#show

- Postman
    -http verb, path, click send
GET localhost:3000/sightings/5
    - output: object containing the data entry at the id

# Can create a new animal sighting in the database
## CREATE ##
-apps/controller/animals_controller
``` ruby
    def create
        sighting = Sighting.create(sighting_params)
        if sighting.valid?
            render json: sighting
        else
            render json: sighting.errors
        end
    end

    private
    def sighting_params
        params.require(:sighting).permit(:animal_id, :latitude, :longitude, :date)
    end
```

- $ rails routes --expanded
--[ Route 2 ]--
Prefix            | 
Verb              | POST
URI               | /sightings(.:format)
Controller#Action | sightings#create

- Postman
    -http verb, path, click send
POST localhost:3000/sightings
    - change Params-> Body
    - change none-> raw
    - change text-> JSON
        - enter text:
            {
                "animal_id": 7,
                "latitude": "34.0479° N",
                "longitude": "100.6197° E",
                "date": 2022-12-27"
            }

        - output: 
            {
                "id": 7,
                "animal_id": 7,
                "latitude": "34.0479° N",
                "longitude": "100.6197° E",
                "date": "2022-12-27",
                "created_at": "2023-01-20T19:09:18.854Z",
                "updated_at": "2023-01-20T19:09:18.854Z"
            }   

# Can update an existing animal sighting in the database
## UPDATE ##
-apps/controller/animals_controller

``` ruby
    def update
        sighting = Sighting.find(params[:id])
        sighting.update(sighting_params)
        if sighting.valid?
            render json: sighting
        else
            render json: sighting.errors
        end
    end
```

- $ rails routes --expanded
--[ Route 6 ]--
Prefix            | 
Verb              | PATCH
URI               | /sightings/:id(.:format)
Controller#Action | sightings#update

- Postman
    -http verb, path, click send
PATCH localhost:3000/sightings/7
    - original 
        {
            "id": 7,
            "animal_id": 7,
            "latitude": "34.0479° N",
            "longitude": "100.6197° E",
            "date": "2022-12-27",
            "created_at": "2023-01-20T19:09:18.854Z",
            "updated_at": "2023-01-20T19:09:18.854Z"
        }
    - modified 
        {
            "animal_id": 6,
            "latitude": "34.0479° N",
            "longitude": "100.6197° E",
            "date": "2023-01-20"
        }
    - updated
        {
            "animal_id": 6,
            "latitude": "34.0479° N",
            "longitude": "100.6197° E",
            "date": "2023-01-20",
            "id": 7,
            "created_at": "2023-01-20T19:09:18.854Z",
            "updated_at": "2023-01-20T19:17:59.825Z"
        }

# Can remove an animal sighting in the database
## DELETE ##
-apps/controller/animals_controller

``` ruby
    def destroy
        sighting = Sighting.find(params[:id])        
        if sighting.destroy
            render json: sighting
        else
            render json: sighting.errors
        end
    end 
```

- $ rails routes --expanded
--[ Route 8 ]--
Prefix            | 
Verb              | DELETE
URI               | /sightings/:id(.:format)
Controller#Action | sightings#destroy

- Postman
    -http verb, path, click send
DELETE localhost:3000/sightings/7
    - object that was deleted
        {
            "id": 7,
            "animal_id": 6,
            "latitude": "34.0479° N",
            "longitude": "100.6197° E",
            "date": "2023-01-20",
            "created_at": "2023-01-20T19:09:18.854Z",
            "updated_at": "2023-01-20T19:17:59.825Z"
        }
        
###