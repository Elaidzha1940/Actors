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


````````
