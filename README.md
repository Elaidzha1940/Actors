Actors.
=======

How to solve the problem without Actors:
----------------------------------------
````````ruby

class MyDataManager {
    static let instance = MyDataManager()
    
    private init() { }
    
    var data: [String] = []
    private let lock = DispatchQueue(label: "com.MyApp.MyDataManager")
    
    func getRandomData(completionHandler: @escaping (_ title: String?) -> ()) {
        lock.async {
            self.data.append(UUID().uuidString)
            print(Thread.current)
            completionHandler(self.data.randomElement())
        }
    }
}

````````

How to solve the problem with Actors:
-------------------------------------

````````ruby

actor MyActorDataManager {
    static let instance = MyActorDataManager ()
    
    private init() { }
    
    var data: [String] = []
    
    func getRandomData() -> String? {
        self.data.append(UUID().uuidString)
        print(Thread.current)
        return self.data.randomElement()
    }
}

/*
  nonisolated func getSaveData() -> String {
        return "New Data"
    }
*/

````````

@globalActor:
-------------

````````````ruby

@globalActor struct MyGlobalActor {
    static var shared = MyNewDataManager()
}

@MyGlobalActor
    func getData() {
//
}

````````````


