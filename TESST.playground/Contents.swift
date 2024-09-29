import Cocoa
//
//შექმენით Genre ტიპის enum, რომელიც შეიცავს ფილმის ჟანრებს, მაგალითად: action, drama, comedy, thriller და სხვა. შექმენით ძირითადი კლასი Film, რომელსაც ექნება შემდეგი თვისებები:
//title - ფილმის სახელი,
//releaseYear— გამოშვების წელი,
//genre — ფილმის ჟანრი,
//
//revenue - შემოსავალი
//მეთოდი description(), რომელიც დაბეჭდავს ინფორმაციას ფილმზე.
//

enum Genre: (String) {
    case action
    case drama
    case comedy
    case thriller
}



class Film {
    var title: String
    var releaseYear: Int
    var genre: Genre
    var revenue: Int
    
    init(title: String, releaseYear: Int, genre: Genre, revenue: Int) {
        self.title = title
        self.releaseYear = releaseYear
        self.genre = genre
        self.revenue = revenue
    }
    
    func description() {
        print("filmtitle \(title)")
        print("releaseyear \(releaseYear)")
        print("genre \(genre)")
        print("revenue \(revenue)")
    }
    func removeFilm(movieArray: inout [String], film: String) {
        movieArray.removeAll { movie in
            movie == film
        }
        print(movieArray)
    }
}
    
let movie1 = Film(title: "eyes wide Shut", releaseYear: 1999, genre:.drama, revenue: 162091208)



//
//2. შექმენით კლასი Person, რომელსაც აქვს შემდეგი თვისებები:
//
//name — პიროვნების სახელი
//birthYear — დაბადების წელი.
//
//მეთოდი getAge რომელიც დაიანგარიშებს და დააბრუნებს ამ პიროვნების ასაკს მოცემულ წელს.

class Person {
    var name: (String)
    var birthYear: (Int)
    
    init(name: String, birthYear: Int)  {
        self.name = name
        self.birthYear = birthYear
    }
    
    func getAge(currentYear: Int) -> Int {
            return currentYear - birthYear
        }

    }

    let person1 = Person(name: "sandro", birthYear: 2000)
    let age = person1.getAge(currentYear: 2024)



//3. Film კლასში შექმენით ფუნქცია removeFilm რომელიც პარამეტრად მიიღებს ფილმების მასივს და დასახელებას, ფუნქციამ უნდა წაშალოს მასივში თუ მოიძებნა მსგავსი დასახელების ფილმი.


var movie2 = Film(title: "the matrix ", releaseYear: 1999, genre:.thriller, revenue: 463517383)
var movieArray = ["Dumb and the dumber", "Titanic", "Spiderman", "Harry Poter", "Forest Gump"]
movie1.removeFilm(movieArray: &movieArray, film: "Titanic")




//4. შექმენით კლასი Actor, რომელიც არიას Person კლასის მემკვიდრე კლასი
//Actor-ს უნდა ჰქონდეს actedFilms  მსახიობის მიერ ნათამაშები ფილმების სია და მეთოდი რომელიც მსახიობის მიერ ნათამაშებ ფილმებს დაამატებს სიაში.


class Actor: Person {
    var actedFilms: [String]
    
    init(name: String, birthYear: Int, actedFilms: [String] = []) {
        self.actedFilms = actedFilms
        super.init(name: name, birthYear: birthYear)
    }
    func addFilm(title: String) {
        actedFilms.append(title)
    }
    func listActedFilms() {
        print("\(name)'s acted films:")
        for film in actedFilms {
            print("- \(film)")
        }
    }
}

let actor = Actor(name: "leonardo", birthYear: 1990)
actor.addFilm(title: "catch me if you can ")
actor.addFilm(title: "titanic")
actor.listActedFilms()

//


//
//5. შექმენი Director კლასი, რომელიც ასევე Person-ის მემკვიდრეა და ექნება directedFilms რეჟისორის მიერ გადაღებული ფილმების სია და totalRevenue რეჟისორის ჯამური შემოსავალი.დაამატე მეთოდი რომელიც რეჟისორის მიერ გადაღებულ ფილმებს დაამატებს და დაითვლის თითოეული ფილმისთვის ჯამურ შემოსავალს.

class Director: Person {
    var directedFilms: [String]
    var totalRevenue: Int
    
    init(name: String, birthYear: Int, directedFilms: [String], totalRevenue: Int) {
        self.directedFilms = directedFilms
        self.totalRevenue = totalRevenue
        super.init(name: name, birthYear: birthYear)
    }
    
    func addMoviesAndCalculatetotalRevenue(movie: String, Revenue: Int) {
        directedFilms.append(movie)
        totalRevenue += Revenue
        
        print("ფილმების სრული სია: \n\(directedFilms) \nრეჟისორის ჯამური შემოსავალი: \(totalRevenue)")
    }
    
}



var director1 = Director(name: "alfred hichkock", birthYear: 1899, directedFilms: ["psycho", "Vertigo" , "The Birds"], totalRevenue: 900000000)
director1.addMoviesAndCalculatetotalRevenue(movie: "north by nothwest", Revenue: 90000)

//
//
//6. შექმენით 5 ფილმის და 5 მსახიობის ობიექტები და Dictionary, რომელშიც key იქნება მსახიობის სახელი, ხოლო მნიშვნელობებად მიიღებს იმ ფილმების სიას, რომლებშიც მონაწილეობს ეს მსახიობი.


let film1 = Film(title: "Inception", releaseYear: 2010, genre: .action, revenue: 836800000)
let film2 = Film(title: "The Dark Knight", releaseYear: 2008, genre: .action, revenue: 1004558444)
let film3 = Film(title: "Forrest Gump", releaseYear: 1994, genre: .drama, revenue: 678200000)
let film4 = Film(title: "Parasite", releaseYear: 2019, genre: .thriller, revenue: 258200000)
let film5 = Film(title: "The Grand Budapest Hotel", releaseYear: 2014, genre: .comedy, revenue: 172900000)

let actor1 = Actor(name: "Leonardo DiCaprio", birthYear: 1974, actedFilms: ["Inception", "Titanic", "The Revenant"])
let actor2 = Actor(name: "Christian Bale", birthYear: 1974, actedFilms: ["The Dark Knight", "American Psycho", "Ford v Ferrari"])
let actor3 = Actor(name: "Tom Hanks", birthYear: 1956, actedFilms: ["Forrest Gump", "Saving Private Ryan", "Cast Away"])
let actor4 = Actor(name: "Bong Joon-ho", birthYear: 1969, actedFilms: ["Parasite", "Snowpiercer", "The Host"])
let actor5 = Actor(name: "Ralph Fiennes", birthYear: 1962, actedFilms: ["The Grand Budapest Hotel", "Schindler's List", "Harry Potter Series"])

let actorsArray = [actor1, actor2, actor3, actor4, actor5]

var actorsAndTheirMovies: [String: [String]] = [:]
actorsArray.forEach { actrotObject in
    actorsAndTheirMovies[actrotObject.name] = actrotObject.actedFilms
}

print(actorsAndTheirMovies)


//
//7. გამოიყენეთ map, იმისთვის რომ დაბეჭდოთ ყველა ფილმის სათაურების სია ამავე ფილმების მასივიდან
//

let filmsArray = [film1, film2, film3, film4, film5]

filmsArray.map { film in
    print("ფილმი: \(film.title)")
}



//8. reduce ფუნქციის გამოყენებით დაიანგარიშეთ ამ ყველა ფილმების გამოშვების საშუალო წელი.


var sumOfYears = filmsArray.reduce(0, { $0 + $1.releaseYear })
var average = Double(sumOfYears) / Double(filmsArray.count)

print(average)


