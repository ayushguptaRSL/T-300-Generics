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