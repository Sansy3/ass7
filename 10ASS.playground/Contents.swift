import Cocoa


//
//1. შექმენით CreatureType enum-ი სხვადასხვა ტიპის არსებებით (მაგ: fire, water, earth, air, electric …). გამოიყენეთ associated value, რომ თითოეულ ტიპს ჰქონდეს rarity: Double მნიშვნელობა 0-დან 1-მდე. დაამატეთ computed property description, რომელიც დააბრუნებს არსების ტიპის აღწერას.


enum CreatureType {
    case fire (rarity: Double)
    case water (rarity: Double)
    case earth (rarity: Double)
    case air (rarity: Double)
    case electric (rarity: Double)
    
    var description: String {
        switch self {
        case .fire(let rarity):
            return "fire creature rarity: \(rarity)"
        case .water(let rarity):
            return "water creature rarity:  \(rarity)"
        case .earth(let rarity):
            return "earth creature rarity: \(rarity)"
        case .air(let rarity):
            return "air creature rarity: \(rarity)"
        case .electric(let rarity):
            return "electric creature rarity: \(rarity)"
        }
    }
    static func rarityy(type: CreatureType, rarity: Double) -> CreatureType{
        if rarity < 0 || rarity > 1 {
            print("value is invalid for \(type)")
           }
        switch type {
        case .fire(let rarity):
            return.fire(rarity: rarity)
        case .water(let rarity):
            return.water(rarity: rarity)
        case .earth(let rarity):
            return.earth(rarity: rarity)
        case .air(let rarity):
            return.air(rarity: rarity)
        case .electric(let rarity):
            return.electric(rarity: rarity)
        }
   }
}
let creature = CreatureType.rarityy(type:.water(rarity: 1.5), rarity: 1.5)
print(creature.description) //
let creature1 = CreatureType.rarityy(type: .electric(rarity: 0.3), rarity: 0.3)
print(creature1.description)


//2. შექმენით პროტოკოლი CreatureStats შემდეგი მოთხოვნებით:
//    * var health: Double
//    * var attack: Double
//    * var defense: Double
//    * func updateStats(health: Double, attack: Double, defense: Double) მეთოდი, რომელიც განაახლებს ამ მონაცემებს (შეგიძლიათ ფუნქციის პარამეტრები სურვილისამებრ შეცვალოთ, მაგ: დეფოლტ მნიშვნელობები გაუწეროთ 😌) 

protocol CreatureStats {
    var health: Double { get set }
    var attack: Double { get set }
    var defense: Double { get set }
    
    func updateStats(health: Double, attack: Double, Defense: Double)
}

class stats: CreatureStats{
    func updateStats(health: Double, attack: Double, Defense: Double) {
        self.health = health
        self.attack = attack
        self.defense = Defense
        
    }
    
    var health: Double
    var attack: Double
    var defense: Double
    
    init(health: Double, attack: Double, defense: Double) {
        self.health = health
        self.attack = attack
        self.defense = defense
    }
}
let creaturestats = stats(health: 30, attack: 40, defense: 50)
print(creaturestats)
creaturestats.updateStats(health: 40, attack: 50, Defense: 60)
print(creaturestats)

//3. შექმენით კლასი Trainer შემდეგი ფროფერთებით:
//    * public let name: String
//    * private var creatures: [DigitalCreature]
//    * დაამატეთ public მეთოდი add(creature: DigitalCreature) რომლითაც შეძლებთ ახალი არსების დამატებას მასივში, ასევე არსებას საკუთარ თავს (self) დაუსეტავს ტრენერად.
//



class Trainer {
    public var name: String
    private var creatures: [DigitalCreature] = []
    
    init(name: String, creatures: [DigitalCreature]) {
        self.name = name
        self.creatures = creatures
    }
    
    public func add (creature: DigitalCreature) {
        creatures.append(creature)
        creature.trainer = self
    }
    
}

//
//4. შექმენით კლასი DigitalCreature, რომელიც დააკმაყოფილებს CreatureStats პროტოკოლს. დაამატეთ:
//    * public let name: String
//    * public let type: CreatureType
//    * public var level: Int
//    * public var experience: Double
//    * weak public var trainer: Trainer?
//    * დაამატეთ deinit მეთოდი, რომელიც დაბეჭდავს შეტყობინებას არსების წაშლისას. 

class DigitalCreature: CreatureStats{
    
    var health: Double
    
    var attack: Double
    
    var defense: Double
    
    
    
    public let type: CreatureType
    public var level: Int
    public var experience: Double
    weak public var trainer: Trainer?
    public var name: String = ""

    init(health: Double, name: String, attack: Double, defense: Double, type: CreatureType, level: Int, experience: Double, trainer: Trainer? = nil) {
        self.health = health
        self.attack = attack
        self.defense = defense
        self.type = type
        self.level = level
        self.experience = experience
        self.trainer = trainer
        self.name = name
    }
    
    func updateStats(health: Double, attack: Double, Defense : Double) {
        self.health = health
        self.attack = attack
        self.defense = Defense
    }
    
    deinit {
        print("creature \(name) has been deleted")
    }
}

let trainer1 = Trainer(name: "sandro", creatures: [])
let creaturetype1 = CreatureType.rarityy(type: .water(rarity: 0.5), rarity: 0.5)
let digitalcreature1 = DigitalCreature(health: 100, name: "shorty", attack: 100, defense: 100, type: creaturetype1, level: 10, experience: 5000)
trainer1.add(creature: digitalcreature1)


print("trainer \(trainer1.name) has creature named\(digitalcreature1.name)")

//5 piroba//



class CreatureManager {
    
    private var creatures: [DigitalCreature]
    
    public func adoptCreature(_ creature: DigitalCreature){
        creatures.append(creature)
    }
    public func trainCreature(named name: String) {
        for creature in creatures {
            if creature.name == name {
                creature.level += 1
            }
        }
    }
    public func listCreatures() -> [DigitalCreature] {
        for creature in creatures {
            print(creature.name)
        }
        return creatures

    }
    
    
    init(creatures: [DigitalCreature]) {
        self.creatures = creatures
    }
    
}

extension CreatureManager {
    func trainaAllCreatures() {
        for creature in creatures {
            creature.level += 1
           print("\(creature.name) has been trained to level \(creature.level).")
        }
    }
}




class CreatureShop {
    
     let CreatureTypes: [CreatureType] = [
            .fire(rarity: 0.1),
            .water(rarity: 0.2),
            .earth(rarity: 0.3),
            .air(rarity: 0.4),
            .electric(rarity: 0.5)
        ]
    
     func randomDouble(min: Double, max: Double) -> Double {
        return Double.random(in: min...max)
    }
        
        func purchaseRandomcreature() -> DigitalCreature {
            let health = randomDouble(min: 0, max: 1000)
            let attack = randomDouble(min: 0, max: 1000)
            let defense = randomDouble(min: 10, max: 1000)
            let level = Int.random(in: 1...30)
            let experience = randomDouble(min: 0, max: 50000)
            
            
            let random = Int.random(in: 0..<CreatureTypes.count)
            let random1 = CreatureTypes[random]
            
            let newcreature = DigitalCreature(health: health, name:"Creature named \(random )" , attack: attack, defense: defense, type: random1, level: level, experience: experience)
            return newcreature
            
        }
}


//7.task

func updateLeaderboard(players: [CreatureManager]) -> [CreatureManager] {
    return players.sorted()
}
 
extension CreatureManager: Comparable {
    static func < (lhs: CreatureManager, rhs: CreatureManager) -> Bool {
        var sumOfLevelLhs = lhs.creatures.reduce(0, { $0 + $1.level })
        var sumOfLevelRhs = rhs.creatures.reduce(0, { $0 + $1.level })
        return sumOfLevelLhs < sumOfLevelRhs
    }
    
    static func == (lhs: CreatureManager, rhs: CreatureManager) -> Bool {
        var sumOfLevelLhs = lhs.creatures.reduce(0, { $0 + $1.level })
        var sumOfLevelRhs = rhs.creatures.reduce(0, { $0 + $1.level })
        return sumOfLevelLhs == sumOfLevelRhs
    }
}


//8.task

var trainer5 = Trainer(name: "Sandro", creatures: [])
var trainer6 = Trainer(name: "Beka", creatures: [])
let trainer7 = Trainer(name: "Likuna", creatures: [])

let manager5 = CreatureManager(creatures: [])
let manager6 = CreatureManager(creatures: [])
let manager7 = CreatureManager(creatures: [])

let shop1 = CreatureShop()
let shop2 = CreatureShop()

let creatureA1 = shop1.purchaseRandomcreature()
let creatureA2 = shop1.purchaseRandomcreature()

manager5.adoptCreature(creatureA1)
manager5.adoptCreature(creatureA2)

trainer5.add(creature: creatureA1)
trainer5.add(creature: creatureA2)

let creatureB1 = shop2.purchaseRandomcreature()
let creatureB2 = shop2.purchaseRandomcreature()

manager6.adoptCreature(creatureB1)
manager6.adoptCreature(creatureB2)


trainer6.add(creature: creatureB1)
trainer6.add(creature: creatureB2)

let creatureC1 = shop1.purchaseRandomcreature()
let creatureC2 = shop1.purchaseRandomcreature()

manager7.adoptCreature(creatureC1)
manager7.adoptCreature(creatureC2)

manager5.trainCreature(named: creatureA1.name)
manager6.trainCreature(named: creatureB1.name)
manager7.trainCreature(named: creatureC1.name)

manager5.trainaAllCreatures()
manager6.trainaAllCreatures()
manager7.trainaAllCreatures()
    
let managers = [manager5, manager6, manager7]

let sortedManagers = updateLeaderboard(players: managers)

for (index, manager) in sortedManagers.enumerated() {
    let creatures = manager.listCreatures()
    for creature in creatures {
        print("""
              -----------------------
              Name: \(creature.name)
              Health: \(creature.health)
              Attack: \(creature.attack)
              Defense: \(creature.defense)
              Level: \(creature.level)
              Experience: \(creature.experience)
              """)
    }
}

/*davitanje ver davaremove da gavanile vapshe avirie sad ra miweria agar vici
 vegar vaswreb ese unda gamovagzavno

 kvevivt printi ro weria eg roar damewera ise ar ushvebda
 
 */











print("trainer \(trainer1.name) has creature  named\(digitalcreature1.name)")
