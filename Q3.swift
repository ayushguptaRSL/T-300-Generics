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