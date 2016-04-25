//Optional Chaining

class Person {
 var name = ""
 var residence: Residence?
 
}

class Residence{
    var numberOfRooms = 1
    
    func printNumberOfRooms(){
        print("Rooms: \(numberOfRooms)")
    }
}


//Creating a chain for obtain the value of an optional

var moises = Person()

//Getting the value from the optional 
moises.residence?.numberOfRooms

//Asigning a residence
moises.residence = Residence()

//Calling a method from a optional chain

if let m  = moises.residence?.printNumberOfRooms(){
    print("I can call this method!")
}

//Subscript with optionals



//Dictionaries with optionals
