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