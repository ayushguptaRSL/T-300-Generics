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