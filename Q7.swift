// Q - 7.1
protocol Displayable {
    associatedtype Value
    func display(_ value: Value)
}

struct StringDisplay: Displayable {
    typealias Value = String

    func display(_ value: String) {
        print("String: \(value)")
    }
}

struct IntDisplay: Displayable {
    typealias Value = Int

    func display(_ value: Int) {
        print("Integer: \(value)")
    }
}

// Q - 7.2
protocol Container<Item> {
    associatedtype Item

    func append(_ item: Item)
    func deleteAt(index: Int)
    var count: Int { get }
    subscript(index: Int) -> Item { get }
}

class ArrayContainer: Container {
    typealias Item = Int
    var items: [Int] = []
    
    func append(_ item: Int) {
        items.append(item)
    }
    
    func deleteAt(index: Int) {
        items.remove(at: index)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(index: Int) -> Int {
        return items[index]
    }
}

func sum(of container: some Container<Int>) -> Int {
    var sum = 0
    for i in 0..<container.count {
        sum += container[i]
    }
    
    return sum
}

let temp = ArrayContainer()
temp.append(1)
temp.append(2)
print(sum(of: temp))