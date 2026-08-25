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