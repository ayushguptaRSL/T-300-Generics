// Q - 8.1
func makeSequence(till: Int) -> some Sequence<Int> {
    return 1..<till
}

// Q - 8.2
protocol Animal {
    func describe()
}

class Dog: Animal {
    func describe() {
        print("Dog")
    }
}

class Cat: Animal {
    func describe() {
        print("Cat")
    }
}

class Bird: Animal {
    func describe() {
        print("Bird")
    }
}

let barn: [any Animal] = [Dog(), Cat(), Bird()]
barn.forEach({ animal in animal.describe()})

// Q - 8.3
class StoredValue {
    let value: Int
    
    init(value: Int) {
        self.value = value
    }
    
    // Will use `some` when you want compile-time type safety and performance, as Swift binds the concrete type at call time without creating a dynamic box.
    func isEqualSome(val: some Equatable) -> Bool {
        guard let val = val as? Int else { return false }
        return value == val
    }
    
    // Will Use `any` when you need to store or accept values of varying concrete types dynamically at runtime, such as elements in a heterogeneous array.
    func isEqualAny(val: any Equatable) -> Bool {
        guard let val = val as? Int else { return false }
        return value == val
    }
}

// Q - 8.4
protocol Container<Item> {
    associatedtype Item
    func append(_ item: Item)
    func deleteAt(index: Int)
    var count: Int { get }
    subscript(index: Int) -> Item { get }
}

func sum(of container: some Container<Int>) -> Int {
    var sum = 0
    for i in 0..<container.count {
        sum += container[i]
    }
    
    return sum
}
