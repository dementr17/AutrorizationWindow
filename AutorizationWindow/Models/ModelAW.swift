
struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUsers() -> User {
        User(login: "user",
             password: "123456",
             person: Person(name: "Dmitry",
                            surName: "Chepanov",
                            age: 28,
                            city: "Tambov",
                            interests: "active pastime, motorcycle, TV series and movies")
            )
    }
}

struct Person {
    let name: String
    let surName: String
    let age: Int
    let city: String
    let interests: String
}
