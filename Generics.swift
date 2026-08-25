// Q - 1.1: Implement a generic Pair class that can hold two values of any types. Add methods to set and retrieve both values.
class Pair<T1, T2> {
    private var first: T1
    private var second: T2
    
    init(first: T1, second: T2) {
        print("Pair is created of type \(type(of: first)), \(type(of: second))")
        self.first = first
        self.second = second
    }
    
    func get() -> [Any] {
        return [first, second];
    }
    
    func set(first: T1? = nil, second: T2? = nil) {
        if let first {
            self.first = first
        }
        
        if let second {
            self.second = second
        }
    }
}

// Q - 1.2: Create a generic Cache<Key, Value> class with a maximum capacity. Implement an eviction strategy, either LRU (least recently used) or LFU (least frequently used).
class LRUCache<Key: Hashable, Value> {
    let capacity: Int
    private var cache: [Key: Value] = [:]
    private var order: [Key] = []
    
    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Key) -> Value? {
        guard let value = cache[key] else {
            return nil
        }

        order.removeAll { $0 == key }
        order.insert(key, at: 0)
        return value
    }

    func put(_ key: Key, _ value: Value) {
        // If key already exists, remove it from its old position
        if cache[key] != nil {
            order.removeAll { $0 == key }
        }

        cache[key] = value
        order.insert(key, at: 0)

        // Remove least recently used
        if order.count > capacity, let lruKey = order.last {
            order.removeLast()
            cache.removeValue(forKey: lruKey)
        }
    }
}


// Q - 2.1: Design a generic Point<T> struct where T: FloatingPoint, representing a 2D point with x and y coordinates. Add a method that calculates the Euclidean distance between two points.
struct Point<T: FloatingPoint> {
    let x: T
    let y: T
    
    func distance(from p: Point) -> T {
        return abs(p.x - x) + abs(p.y - y)
    }
}


// Q - 2.2: Implement a generic LinkedList<Element> struct that supports inserting, deleting, and searching for elements. Searching should work for any element type.
struct LinkedList<Element> {
    private class Node {
        let value: Element
        var next: Node?
        
        init(value: Element, next: Node? = nil) {
            self.value = value
            self.next = next
        }
    }
    
    private var head: Node? = nil
    
    mutating func insert(value: Element) {
        let node = Node(value: value)
        
        if head == nil {
            self.head = node
        } else {
            var prev = head
            var curr = head
            
            while curr != nil {
                prev = curr
                curr?.next = curr
            }
            
            prev?.next = node
        }
    }
    
    func isExist(value: Element) -> Bool where Element: Equatable {
        var curr = head
        
        while curr != nil {
            if(curr?.value == value) {
                return true
            }
            
            curr?.next = curr
        }
        
        return false
    }
    
    mutating func delete(value: Element) -> Bool where Element: Equatable {
        if value == head?.value {
            head = head?.next
            return true
        }
        
        var prev: Node? = nil
        var curr = head
        
        while curr != nil {
            if(curr?.value == value) {
                prev?.next = curr?.next
                return true
            }
            
            prev = curr
            curr?.next = curr
        }
        
        return false
    }
}

// Q - 3.1
func printArray<T>(_ arr: [T]) {
    arr.forEach { ele in
        print(ele)
    }
}

// Q - 3.2
func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
    guard array.count > 1 else { return array }
    
    let middleIndex = array.count / 2
    let leftArray = mergeSort(Array(array[..<middleIndex]))
    let rightArray = mergeSort(Array(array[middleIndex...]))
    
    return merge(leftArray, rightArray)
}

private func merge<T: Comparable>(_ left: [T], _ right: [T]) -> [T] {
    var sortedArray: [T] = []
    var leftIndex = 0
    var rightIndex = 0
    
    while leftIndex < left.count && rightIndex < right.count {
        if left[leftIndex] < right[rightIndex] {
            sortedArray.append(left[leftIndex])
            leftIndex += 1
        } else {
            sortedArray.append(right[rightIndex])
            rightIndex += 1
        }
    }
    
    if leftIndex < left.count {
        sortedArray.append(contentsOf: left[leftIndex...])
    }
    
    if rightIndex < right.count {
        sortedArray.append(contentsOf: right[rightIndex...])
    }
    
    return sortedArray
}

// Q - 4.1
enum MyOptional<Wrapped> {
    case some(Wrapped)
    case none

    func map<T>(transformTo: (Wrapped) -> T) -> MyOptional<T> {
        switch self {
        case .some(let value):
            return .some(transformTo(value))
        case .none:
            return .none
        }
    }
}

// Q - 4.2
enum MyResult<Success, Failure: Error> {
    case success(Success)
    case failure(Failure)
    
    func map<T>(transformTo: (Success) -> T) -> MyResult<T, Failure> {
        switch self {
        case .success(let success):
            return .success(transformTo(success))
        case .failure(let failure):
            return .failure(failure)
        }
    }
}

// Q - 5.1
func maxInArray<T: Comparable>(_ arr: [T]) -> T? {
    return arr.max()
}


// Q - 5.2
func dotProduct<T: Numeric>(a: [T], b: [T]) -> T {
    precondition(a.count == b.count, "Arrays must have the same length")
    
    var product: T = 0
    for i in 0..<a.count {
        product += (a[i]*b[i])
    }
    
    print(product)
    return product
}


// Q - 6.1

func doesContain<T>(arr: [T], ele: T) -> Bool where T: Equatable {
    return arr.contains(where: { $0 == ele })
}

// Q - 6.2
func binarySearch<T>(arr: [T], ele: T) -> Int? where T: Comparable {
    var start = 0, end = arr.count - 1
    
    while start<=end {
        let mid = start + ((end - start) / 2)
        
        if ele == arr[mid] {
            return mid
        } else if ele > arr[mid] {
            start = mid+1
        } else {
            end = mid-1
        }
    }
    
    return nil
}

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
//protocol Container<Item> {
//    associatedtype Item
//    func append(_ item: Item)
//    func deleteAt(index: Int)
//    var count: Int { get }
//    subscript(index: Int) -> Item { get }
//}
//
//func sum(of container: some Container<Int>) -> Int {
//    var sum = 0
//    for i in 0..<container.count {
//        sum += container[i]
//    }
//    
//    return sum
//}
