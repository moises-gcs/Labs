
import UIKit

//ARC (Automatic Reference Counting)

class Apartment {
    
    var unit = ""
    var tenant: Person?
    
    init(unit: String){
        self.unit = unit
    }
    
    
    deinit{
        print("Apartment with unit: \(unit) is dellocated!")
    }
    
}

class Person {
    
    var name = ""
    var apartment: Apartment?
    
    
    init(name: String){
        self.name = name
        print("Person initialized with name: '\(name)' ")
    }
    
    deinit{
        print("Person instance with name '\(name)' is dellocated!")
    }
    
}


//Referring to the person instance two times in the code
var ref1:Person? = Person(name: "Moises")
var ref2: Person? = ref1

//Now, deallocating the reference
ref1 = nil
ref2 = nil


//Strong Reference Cycle

var bryan: Person? = Person(name:"Bryan")
var apartment3D:Apartment?  = Apartment(unit:"3D")


bryan!.apartment = apartment3D
apartment3D!.tenant = bryan


//Collocating to nil the values of the variables. The deinit message won't be called,because the reference between the two classes
bryan = nil
apartment3D = nil

class Apartment2 {
    
    var unit = ""
    weak var tenant: Person2? //The weak word means that this variables does not hold strong reference to the instance
    
    init(unit: String){
        self.unit = unit
    }
    
    
    deinit{
        print("Apartment with unit: \(unit) is dellocated!")
    }
    
}

class Person2 {
    
    var name = ""
    var apartment: Apartment2?
    
    
    init(name: String){
        self.name = name
        print("Person initialized with name: '\(name)' ")
    }
    
    deinit{
        print("Person instance with name '\(name)' is dellocated!")
    }
    
}


//This will deallocate  the instance

var moises: Person2? = Person2(name:"Moises")
var apartment1D:Apartment2?  = Apartment2(unit:"1D")


moises!.apartment = apartment1D
apartment1D!.tenant = moises

moises = nil

//Watching the tenant of the apartment
apartment1D?.tenant



 /*Difference between weak and unowned: The weak is used for optionals and unowned by non-optionals*/


//Unowned Reference

class Customer{
    
    var name = ""
    var card: CreditCard?
    
    
    init(name: String){
        self.name = name
    }
    
    
    deinit{
        print("Customer \(name) will be desallocated")
    }
    
}

class CreditCard{
    
    var number: UInt64
    unowned let customer:Customer
    
    init(number:UInt64,customer:Customer){
        self.number = number
        self.customer = customer
    }
    
    
    deinit{
        print("The Card with number \(number) is desallocated!")
    }
}




//Creating the references between of the objects

var aCustomer:Customer? = Customer(name: "Moises")
aCustomer!.card = CreditCard(number:1233,customer: aCustomer!)

aCustomer = nil

//Watching the Credit Card assigned to the Customer
aCustomer?.card



//Working with references in Clousures

/*The clousures are references types , so that means that if a reference of the main  class is "captured" in clousure, the main class will not be deallocated*/


class HTMLElement {
    
    let name: String
    let text: String?
    
    
    init(name: String,text:String? = nil){
        self.name = name
        self.text = text
    }
    
    //Creating a clousure
    lazy var asHTML: () -> String =  {
        
        /*Marking the self reference as unowned, this avoid strong reference and allow to deallocate the class*/
        [unowned self] in
        
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        }else{
            return "</\(self.name)>"
        }
        
    }
    
    deinit{
        print("The HTMLElement '\(self.name)' will be deallocated")
    }
    
}


var pElement:HTMLElement? = HTMLElement(name:"p",text: "Hello to Swift!")
print(pElement!.asHTML())
pElement = nil

