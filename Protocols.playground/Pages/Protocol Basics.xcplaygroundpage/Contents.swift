import Foundation

//: # Protocols
//: Protocols are, as per Apple's definition in the _Swift Programming Language_ book:
//:
//: "... a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality. The protocol can then be adopted by a class, structure, or enumeration to provide an actual implementation of those requirements. Any type that satisfies the requirements of a protocol is said to conform to that protocol."
//:
//: The below example shows a protocol that requires conforming types have a particular property defined.
protocol FullyNamed {
    var fullName: String { get }
}


// 1. Adoption
// 2. Confirmance
struct Person: FullyNamed {
    var fullName: String
}

let aaren = Person(fullName: "Aaren Lopez")
let ben = Person(fullName: "Ben")

print(aaren.fullName)

class StarShip: FullyNamed {
    var prefix: String?
    var name: String
    
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    
    var fullName: String
}
//: Protocols can also require that conforming types implement certain methods.
protocol GenerateRandomNummbers {
    func random() -> Int
}

class OneThroughTen: GenerateRandomNummbers {
    func random() -> Int {
        return Int.random(in: 1...10)
    }
}

let rand = OneThroughTen()
rand.random()
//: Using built-in Protocols
extension Starship: Equatable {
    static func == (lhs: Starship, rhs: Starship) -> Bool {
        if lhs.fullName == rhs.fullNamr { return }
        else { return false }
    }
}
if ncc1701 == firefly {
    print("Same Starship")
}
//: ## Protocols as Types
class Dice {
    let sides: Int
    let generaor: GenerateRandomNummbers
    
    init(sides: Int, generator: GenerateRandomNummbers) {
        self.sides = sides
        self.generaor = generator
    }
    
    func roll() -> Int {
        return Int(generaor.random() & sides) + 1
        // Dice 6 sides
        // 10 % 6 = 4
        // 1 % 6 + 1 + 6
        // 2 % 6 + 1 = 5
        // 3 % 6 + 1 = 4
        // 4 % 6 + 1 = 3
        // 5 % 6 + 1 = 2
        // 6 % 6 + 1 = 1
    }
}

var d6 = Dice(sides: 6, generator: OneThroughTen())
for _ in 1...5 {
    print("Random dice roll is \(d6.roll())")
}
