import Cocoa


enum Genre {
    case fiction
    case nonFiction
    case mystery
    case sciFi
    case bioGraphy
    
    
    var description: String {
        switch self {
        case .fiction:
            return "ჟანრი დაფუძნებულია წარმოსახვაზე."
        case .nonFiction:
            return "ჟანრი დაფუძნებულია რეალურ ფაქტებზე."
        case .mystery:
            return "ფანტასტიკის ჟანრი რომელიც მოყვება დანაშაულს(როგორიცაა მკველლობა ან გაუჩინარება) ."
        case .sciFi:
            return "ჟანრი არის სამეცნიერო ფანტასტიკა , დაფუძნებული ტექნოლოგიურ მიღწევებზე"
        case .bioGraphy:
            return "ჟანრი დაფუძნებულია ადამიანის ცხოვრების დეტალებზე"
        }
    }
}
let genre = Genre.mystery
print(genre.description)


//2. შექმენით enum "ReadingLevel" მნიშვნელობებით: beginner, intermediate, advanced. შემდეგ შექმენით პროტოკოლი "Readable" შემდეგი მოთხოვნებით:
//
//   - "title: String" ფროფერთი
//
//   - "author: String" ფროფერთი
//
//   - "publicationYear: Int" ფროფერთი
//
//   - "readingLevel: ReadingLevel" ფროფერთი
//
//   - "read()" მეთოდი, რომელიც დაბეჭდავს ინფორმაციას წიგნის წაკითხვის შესახებ, მაგ: "გილოცავთ თქვენ ერთ კლიკში წაიკითხეთ წიგნი" ან რამე სხვა, მიეცით ფანტაზიას გასაქანი 🤘

enum ReadingLevel {
    case beginner
    case intermediate
    case advanced
}

protocol Readable {
    var title: String {get}
    var author: String {get}
    var publicationYear: Int {get}
    var readingLevel: ReadingLevel {get}
    func read()
}



//3. შექმენით სტრუქტურა "Book", რომელიც დააკმაყოფილებს "Readable" პროტოკოლს. დაამატეთ "genre: Genre" ფროფერთი და "description()" მეთოდი, რომელიც დაბეჭდავს სრულ ინფორმაციას წიგნზე.

struct Book: Readable {
    
    var title: String
    
    var author: String
    
    var publicationYear: Int
    
    var readingLevel: ReadingLevel
    
    var genre: Genre
    
    func read() {
        print("შენ წაიკითხე წიგნი \(title)")
    }
    
    func descripiton() {
        print("წიგნის სახელია \(title) , წიგნის ავტორია \(author), გამოშვების წელი \(publicationYear), კითხვის დონე \(readingLevel), ჯანრი \(genre.description) ")
    }
    
}





//4. შექმენით "Library" კლასი შემდეგი ფროფერთებით:
//
//   - "name: String" - ბიბლიოთეკის სახელი
//
//   - "books: [Book]" - წიგნების მასივი
//
//
//
//   დაამატეთ მეთოდები:
//
//   - "add(book: Book)" - წიგნის დამატება
//
//   - "removeBookWith(title: String)" - წიგნის წაშლა სათაურის მიხედვით
//
//   - "listBooks()" - ყველა წიგნის ჩამონათვალის დაბეჭდვა

//  გააფართოეთ “Library” კლასი “filterBooks” მეთოდით რომელიც არგუმენტად მიიღებს ქლოჟერს და დააბრუნებს ამ ქლოჟერის გამოყენებით გაფილტრულ წიგნთა მასივს.
//


class Library {
    var name: String
    var books: [Book]
    init(name: String, books: [Book]) {
        self.name = name
        self.books = books
    }
    
    func add(book: Book)  {
        books.append(book)
    }
    
    func removeBookWith(title: String) {
        books.removeAll { $0.title == title }
        print("წიგნი \(title) წაშლილია ბიბლიოთეკიდან")
    }
    
    func listBooks() {
        books.forEach { Book in
            print(Book.title.description)
        }
    }
}

extension Library {
    func filterBooks(filterClosure: ([Book]) -> [Book]) -> [Book] {
        return filterClosure(books)
    }
}




var book2 = Book(title: "LOTR", author: "dasd", publicationYear: 300, readingLevel: .intermediate, genre:.mystery)
            
var book3 = Book(title: "LOTRTRWQ", author: "dasd", publicationYear: 300, readingLevel: .beginner, genre:.fiction)
var book4 = Book(title: "ragac", author: "dasd", publicationYear: 300, readingLevel: .beginner, genre:.fiction)
var book5 = Book(title: "ragac1", author: "dasd", publicationYear: 300, readingLevel: .beginner, genre:.fiction)
var book6 = Book(title: "ragac2", author: "dasd", publicationYear: 300, readingLevel: .advanced, genre:.fiction)

var library1 = Library(name: "Okk", books: [book2])
library1.add(book: book3)

var library2 = Library(name: "dasda", books: [book2,book3,book4,book5,book6])




//
//5.  შექმენით generic ფუნქცია groupBooksByLevel<T: Readable>(_ books: [T]) -> [ReadingLevel: [T]], რომელიც დააჯგუფებს წიგნებს კითხვის დონის მიხედვით. გამოიყენეთ ეს ფუნქცია ბიბლიოთეკის წიგნებზე და დაბეჭდეთ შედეგი.

func groupBooksByLevel<T: Readable>(_ books: [T]) -> [ReadingLevel: [T]] {
    var groupedBooks: [ReadingLevel: [T]] = [:]
    
    for book in books {
        let level = book.readingLevel
        groupedBooks[level, default: []].append(book)
    }
    
    return groupedBooks
}
let groupedBooks = groupBooksByLevel(library2.books)





//6. შექმენით "LibraryMember" კლასი შემდეგი ფროფერთებით:
//
//   - "id: Int"
//
//   - "name: String"
//
//   - "borrowedBooks: [Book]"
//
//
//
//   დაამატეთ მეთოდები:
//
//   - "borrowBook(_ book: Book, from library: Library)" - წიგნის გამოწერა ბიბლიოთეკიდან
//
//   - "returnBook(_ book: Book, to library: Library)" - წიგნის დაბრუნება ბიბლიოთეკაში

class LibraryMember {
    var id: Int
    var name: String
    var borrowedBooks: [Book]
    
    init(id: Int, name: String, borrowedBooks: [Book]) {
        self.id = id
        self.name = name
        self.borrowedBooks = borrowedBooks
    }
    
    func borrowbook(_ book: Book, from library: Library) {
        if library.books.contains(where: { $0.title == book.title }) {
            borrowedBooks.append(book)
            print("\(name) ითხოვა \(book.title).")
        } else {
            print("წიგნი \(book.title) არ არის ბიბლიოთეკაში.")
        }
    }
    func returnBook(_ book: Book, to library: Library) {
        if borrowedBooks.contains(where: {$0.title ==  book.title}) {
            library.books.append(book)
            print("\(name) -მ დააბრუნა\(book.title) ბიბლიოთეკაში ")
        }
    }
}



//7. შექმენით მინიმუმ 5 "Book" ობიექტი და 1 "Library" ობიექტი. დაამატეთ წიგნები ბიბლიოთეკაში "add(book:)" მეთოდის გამოყენებით. შემდეგ:



//
//   - გამოიყენეთ "listBooks()" მეთოდი ყველა წიგნის ჩამოსათვლელად
//
//   - წაშალეთ ერთი წიგნი "removeBookWith(title:)" მეთოდის გამოყენებით
//
//   - გამოიყენეთ "filterBooks" მეთოდი და დაბეჭდეთ მხოლოდ ის წიგნები, რომლებიც გამოცემულია 2000 წლის შემდეგ

var book10 = Book(title: "The Silent Patient", author: "Alex Michaelides", publicationYear: 2019, readingLevel: .intermediate, genre: .mystery)
var book11 = Book(title: "Educated", author: "Tara Westover", publicationYear: 2018, readingLevel: .advanced, genre: .nonFiction)
var book12 = Book(title: "Dune", author: "Frank Herbert", publicationYear: 1965, readingLevel: .advanced, genre: .sciFi)
var book13 = Book(title: "The Hobbit", author: "J.R.R. Tolkien", publicationYear: 1937, readingLevel: .beginner, genre: .fiction)
var book14 = Book(title: "Becoming", author: "Michelle Obama", publicationYear: 2018, readingLevel: .intermediate, genre: .bioGraphy)

var library5 = Library(name:"New York Public Library", books: [])
library5.add(book: book10)
library5.add(book: book11)
library5.add(book: book12)
library5.add(book: book13)
library5.add(book: book14)

library5.listBooks()
library5.removeBookWith(title: "Dune")
var filterdBooks = library5.filterBooks { arrayOfBooks in
    return arrayOfBooks.filter { book in
        book.publicationYear > 2000
    }
}
print("გაფილტრული წიგნები 2000 წლიდან")
filterdBooks.forEach { Book in
    print(Book.title)
}


//
//8. შექმენით მინიმუმ 2 "LibraryMember" ობიექტი. თითოეული წევრისთვის:
//
//   - გამოიწერეთ 2 წიგნი "borrowBook(_:from:)" მეთოდის გამოყენებით
//
//   - დააბრუნეთ 1 წიგნი "returnBook(_:to:)" მეთოდის გამოყენებით
//
//   დაბეჭდეთ თითოეული წევრის გამოწერილი წიგნების სია


var librarymember1 = LibraryMember(id: 10, name: "beka", borrowedBooks: [])
var librarymember2 = LibraryMember(id: 11, name: "sandro", borrowedBooks: [])

librarymember1.borrowbook(book10, from: library5)
librarymember1.borrowbook(book11, from: library5)
librarymember2.borrowbook(book13, from: library5)
librarymember2.borrowbook(book14, from: library5)

librarymember1.returnBook(book10, to: library5)
librarymember2.returnBook(book13, to: library5)


////12. შექმენით მასივი, რომელიც შეიცავს ყველა წიგნის ავტორს მე-7 დავალებაში შექმნილი ბიბლიოთეკიდან.
///
//გამოიძახეთ "findMostFrequent" ფუნქცია ამ მასივზე, რათა იპოვოთ ყველაზე პოპულარული ავტორი.
//დაბეჭდეთ შედეგი: "ბიბლიოთეკაში ყველაზე პოპულარული ავტორი არის: [ავტორის სახელი]".


