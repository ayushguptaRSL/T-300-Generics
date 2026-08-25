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