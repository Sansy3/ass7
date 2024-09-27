import Foundation
 
//1. შექმენით FoodGroup Enum, რომელიც მოიცავს: fruit, vegetable, protein, dairy, grain ჩამონათვალს.
 
enum FoodGroup {
    case fruit
    case vegetables
    case protein
    case dairy
    case grain
}
 
 
//2. შექმენით enum ProductStatus (გაყიდულია, ხელმისაწვდლომია ქეისებით)
 
enum ProductStatus {
    case available
    case sold
}
 
//3. შექმენით სტრუქტურა Product რომელიც შეიცავს
//ცვლადებს: name, category(FoodGroup), price, info(რომელიც ფასის და სახელის ინფოს მოგვაწვდის), ფასდაკლება, მასა, კალორია100გრამზე, ProductStatus ცვლადი
//ფუნქციები: ფადაკლებული ფასის ჩვენება, ყიდვა, გამოითვალე კალორია მასაზე დაყრდნობით.
 
struct Product {
    var name: String
    var category: FoodGroup
    var price: Double
    var discount: Double?
    var mass: Double
    var caloriesPer100gr: Double
    var productStatus: ProductStatus
    
    var info: String {
        "ეს პროდუქტი არის \(name) და მისი ღირებულება შეადგენს \(price)"
    }
    
    func discountedPrice() -> Double {
        price - (price * (discount ?? 0) / 100)
    }
    
    func calculateCalories() -> Double {
        let massInGrams = mass * 1000
        
        return massInGrams * caloriesPer100gr / 100
    }
    
    func buy() -> String {
           if productStatus == .available {
               return "თქვენ შეიძინეთ \(name) \(discountedPrice()) ფასად"
           } else {
               return "პროდუქტი არ არის მარაგში"
           }
       }
       
   }
    

 
 
var pear = Product(name: "მსხალი", category: .fruit, price: 11, discount: 4, mass: 0.250, caloriesPer100gr: 7, productStatus: .available)
 
print(pear.info)
print("ფასდაკლებული ფასი არის: \(pear.discountedPrice())")
print("მთლიანი მასის კალორია არის: \(pear.calculateCalories())")
print(pear.buy())
print("\n")
 
 
//4. შექმენით მასივი პროდუქტებით სადაც მინიმუმ 15 პროდუქტი გექნებათ.
var productsArray = [
    Product.init(name: "მსხალი", category: .fruit, price: 11, discount: 4, mass: 0.250, caloriesPer100gr: 7, productStatus: .available),
    Product(name: "ყველი", category: .dairy, price: 27.2, mass: 1.6, caloriesPer100gr: 112, productStatus: .available),
    Product(name: "ვაშლი", category: .fruit, price: 3.5, discount: 2, mass: 0.8, caloriesPer100gr: 7, productStatus: .sold),
    Product(name: "არაჟანი", category: .dairy, price: 13, discount: 5, mass: 0.900, caloriesPer100gr: 200, productStatus: .available),
    Product(name: "ყაიმაღი", category: .dairy, price: 20, mass: 1.9, caloriesPer100gr: 700, productStatus: .available),
    Product(name: "კიტრი", category: .vegetables, price: 2.2, mass: 1, caloriesPer100gr: 32, productStatus: .sold),
    Product(name: "პამიდორი", category: .vegetables, price: 3.8, mass: 2, caloriesPer100gr: 4, productStatus: .available),
    Product(name: "კურდღლის ხორცი", category: .protein, price: 23, discount: 10, mass: 3, caloriesPer100gr: 75, productStatus: .available),
    Product(name: "ქათმის ფილე", category: .protein, price: 123, discount: 1.4, mass: 1.3, caloriesPer100gr: 77, productStatus: .sold),
    Product(name: "კვერცხი", category: .protein, price: 12, mass: 0.750, caloriesPer100gr: 100, productStatus: .available),
    Product(name: "ხორბალი", category: .grain, price: 19, mass: 3, caloriesPer100gr: 2, productStatus: .sold),
    Product(name: "ბატატი", category: .vegetables, price: 7, mass: 1.7, caloriesPer100gr: 98, productStatus: .sold),
    Product(name: "შვრია", category: .grain, price: 9, mass: 2.5, caloriesPer100gr: 33, productStatus: .sold),
    Product(name: "თევზი", category: .protein, price: 2872, mass: 700, caloriesPer100gr: 1000, productStatus: .available),
    Product(name: "წიწაკა", category: .vegetables, price: 7.2, mass: 0.7, caloriesPer100gr: 87, productStatus: .sold),
    Product(name: "სიმინდი", category: .grain, price: 19, mass: 22.5, caloriesPer100gr: 330, productStatus: .sold),
]
 
//5. მიღებული მასივისგან შექმენით ახალი მასივი სადაც მხოლოდ პროდუქტის name იქნება ჩამოწერილი
var namesFromProductArray = productsArray.map { $0.name }
 
//6. თავდაპირველი მასივის ელემენტები დაალაგეთ ფასის ზრდადობის მიხედვით.
var sortedByPrice = productsArray.sorted { $0.price < $1.price }
 
//7. რენდომ (1)კატეგორიის ყველა პროდუქტის სტატუსი შეცვალეთ ხელმისაწვდომიდან გაყიდულზე.
var updatedProductsArray = productsArray.map { product in
    var updatedProduct = product
    
    if updatedProduct.category == .grain {
        updatedProduct.productStatus = .available
    }
    return updatedProduct
}
 
//8. გაიგეთ ყველა იმ პროდუქტის ერთეულის ჯამური ღირებულება რომელიც ხელმისაწვდომია.
var availableProductsPriceSum = 0.0
for product in updatedProductsArray {
    if product.productStatus == .available {
        availableProductsPriceSum += product.price
    }
}
 
 
//9. შექმენით ფუნქცია რომელიც მიიღებს პროდუქტების მასივს და დააბრუნებს dictionary-ს სადაც key იქნება კატეგორიის სახელწოდება და value იქნება იმ პროდუქტების მასივი რომლებიც შეესაბამება მოცემულ კატეგორიას.
 
