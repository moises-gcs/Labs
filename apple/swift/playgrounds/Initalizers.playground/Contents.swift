//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//Initializer

struct Size{
    
    var width = 0.0
    var height = 0.0
    
}


struct Temperature {
    
    var temp:Double
    
    init(fromFarenheint farenheit: Double){
        temp = (farenheit - 32.0) / 1.80
    }
    
    
    init (fromKelvin kelvin : Double ){
        temp = kelvin - 273.15
    }
    
}


var boiling = Temperature(fromFarenheint: 12.78)

print("Boiling... \(boiling.temp)")

var displaySize = Size(width: 1024, height: 768)



class Display{
    
    var resolution:Size = Size()
    var displayName: String = ""
    var manufacturer: String = ""
    
    init(resolution: Size, displayName: String, manufacturer : String){
        self.resolution = resolution
        self.displayName = displayName
        self.manufacturer = manufacturer
    }
    
    
    convenience init(resolution: Size){
        self.init(resolution: resolution,displayName:"<Unknown>",manufacturer:"<Unknown>")
    }
    
    func showDisplayResolution(){
        print("The current display resolution is: H: \(resolution.height) px - W: \(resolution.width) px")
    }
    
    func showManufacturingInfo(){
        print("Manufacturer: \(manufacturer) - Display Name: \(displayName)")
    }
    
}



//Initialiting an display object using the initializaters

//Swift provide defaut initializers when none constructor are not defined
var size = Size(width:768,height:1024)

var displaySony = Display(resolution: size, displayName: "Vaio Display",manufacturer: "Sony")
var genericDisplay = Display(resolution: size)


//Showing the info of this display
displaySony.showDisplayResolution()
displaySony.showManufacturingInfo()

//Unknown Display Info
genericDisplay.showDisplayResolution()
genericDisplay.showManufacturingInfo()



struct  Gender {
    var description = "";
    var id = 0
}


struct  Owner {
    var name = ""
    var lastName = ""
}

class Animal {
    
    var name = ""
    var breed = ""
    var gender = Gender()
    var birthday = NSDate()
    
    
    //Delegate initializer
    init(){
        name = "Unknown"
        breed = "Unknown"
    }
    
    convenience init(gender:Gender, birthday:NSDate){
        self.init()
        self.gender = gender
        self.birthday = birthday
    }
    
}


class Dog:Animal{
    var owner:Owner?
    var size = 0
    var color1 = ""
    var color2 = ""
    
    //Overriding  a designated initializer of the superclass
    override init(){
        
        super.init()
        size  = 12
        color1 = "brown"
        color2 = "red"
        gender = Gender(description: "Female", id: 2)
    }
    
    
    
    //A convenience initializer must always call a delegate initializer.
    convenience init(dog_size:Int,colors:[String]){
        
        self.init()
        size = dog_size
        color1 = colors[0]
        color2 = colors[1]
        
    }
}


var max = Dog(gender:Gender(description: "Male",id: 1),birthday:NSDate())

print("Max colors: \(max.color1) \(max.color2)")
print("Max Full name: \(max.name)")


max = Dog(dog_size:21, colors: ["Blue","Red"])

print("Max colors: \(max.color1) \(max.color2)")
print("Max Full name: \(max.name)")
print("Max Size: \(max.size)")

max = Dog()
print("------------------------------------------")
print("Max colors: \(max.color1) \(max.color2)")
print("Max Full name: \(max.name)")
print("Max Size: \(max.size)")
print("Gender:\(max.gender.description)[\(max.gender.id)]")




//Testing initializers
class DummyClass{
    
    var dummyThing = 0
    var dummyThingAgain = ""
    
    convenience init(dummyStuff: String){
        self.init()
        dummyThing = 10
        dummyThingAgain = dummyStuff
    }
    
}

var dummyVar = DummyClass(dummyStuff: "Hello World!")
dummyVar = DummyClass()




//Creating a inheritance between two classes


/*This class has two initialiazers:

The init() , that is the default.
The convenience, that will only recieve the description*/
class Device {
    
    var manufacturer = ""
    var modelName = ""
    var modelVersion = ""
    
    
    /*As this is a convenience constructor is required to call the delegate */
    //Only recieve the manufacturer value
    convenience init(man:String){
        
        self.init()
        
        manufacturer = man
        modelName = "Generic Model"
        modelVersion = "Generic version "
        
    }
    
}


class Computer: Device {
    
    var cpuCores = 1
    var cpuName = ""
    var cpuFrequency = 0.0
    var memorySize = 0
    var storageGB = 0
    var osName = ""
    var osVersion = ""
}


class TV: Device{
    
    var colorRange = ""
    var supportHDMI = false
    
    //Override the delegated initializer from the superclass
    override init(){
        colorRange = "Unknown"
        supportHDMI = true
    }
    
    
    func getTVInfo() -> String {
        return "\(manufacturer) \(modelName) \(modelVersion))"
    }
    
}


//Creating a new computer object
var aDevice = Computer()
aDevice  = Computer(man:"Apple") //Calling the constructor of the super class
aDevice.manufacturer //Watching the result


var aTV = TV(man: "Sony")


//Initializer Hiercharchy

class Food {
    
    var name = ""
    
    //Initilizers
    init(name: String){
        self.name = name
    }
    
    convenience init(){
        self.init(name: "[Unknown food]")
    }
}

class RecipentIngredient : Food{
    
    var quantity = 1
    
    init(name:String, quantity:Int){
        self.quantity = quantity
        super.init(name: name)
    }
    
    //Overriding designated initializer with a custom initializer for this process
    override convenience init(name: String){
        self.init(name:name, quantity:1)
    }
    
    
}

/*In this point I had inheritanced the initializers of the superclass*/

var food1 = RecipentIngredient()
var foo2 =  RecipentIngredient(name: "Chocolate Drink") //This initializer come from the superclass


//Another class in the hiercharchy
/*This class inherints all the initializers from the super class*/
class ShoppingListItem : RecipentIngredient {
    
    var purchased = false
    
    var description: String {
        var output =  "\(quantity) x \(name)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
}


//Creating instance of ShoppingListItem using the initializers

var sli1 = ShoppingListItem()
var sli2 = ShoppingListItem(name: "Pepper")
var sli3 = ShoppingListItem(name: "Salt",quantity: 3)


sli1.purchased = true
sli2.purchased = false
sli1.name = "Some Item"

//Failable Initializer


/*A failable initializer can return a 'nil' instead of the instance of the type based */

struct  Plant {
    
    var specie = ""
    
    init?(specie: String){
        
        if specie.isEmpty {
            return nil
        }else{
            self.specie = specie
        }
    }
    
}


//Initializing the struct 

var unknowPlant = Plant(specie:"")
var orangePlant = Plant(specie: "Orange")
var avocadoPlant = Plant(specie:"Avocado")



if let plant = orangePlant {
    "The specie is: \(plant.specie)"
}else{
    "The plant does not have an specie"
}


var validPlant = avocadoPlant!
"The plant specie is : \(validPlant.specie)"


//Failables initializers for Enums

enum TemperatureUnits:Character {
    case Celsius = "C", Farenheit = "F", Kelvin = "K"
}

var tempUnit = TemperatureUnits(rawValue: "K")
var invalidTempUnit = TemperatureUnits(rawValue: "Z")


//Failable initializer for a class

class Product {
    
    let name: String!
    
    init?(name: String){
        
        self.name = name
        
        if name.isEmpty {
            return nil
        }
        
    }
    
}


let prodA  = Product(name: "")
let prodB = Product(name: "Product B")


//Propagating initialization failure


class CartItem:Product{
    
    var quantity:Int!
    
    
    init?(name:String, quantity: Int) {
        
        self.quantity = quantity
        
        
        //The super class failable initializer is valid
        super.init(name:name)
        
        if quantity < 1 {
            return nil
        }
        
    }
    
}


var ci1 = CartItem(name: "Amazon Kindle Fire", quantity:2) //Correct initilization
var unnamedItem = CartItem(name: "",quantity:1 ) // Incorrect initializer from the superclass
var zeroPants = CartItem(name: "Pants",quantity: -1) //Incorrect initializer from the subclass



//Overriding the failable init with a non-failable init


class Document{
    
    var name: String?
    
    init(){}
    
    init?(name:String){
        self.name = name
        
        if name.isEmpty {
           return nil
        }
    }
    
}


class UntitleDocument:Document {
    
    
    override init(){
        super.init()
        self.name = "Untitled Document"
    }
        
    
    //Override the failable with non-failable
    override init(name: String){
        
        super.init()
        
        if name.isEmpty {
            self.name = "Document untittled"
        }else{
            self.name = name
        }
        
        
    }
    
}



//Clousure initialization
struct  ChessBoard {
    
    let boardColor:[Bool] =  {
    
        var tempBoard = [Bool]()
    
    
        var isBlack = false
        
        
        for i in 1...10 {
            
            for i in 1...10{
             
                tempBoard.append(isBlack)
                isBlack = !isBlack
                
            }
            
            isBlack = !isBlack
        }
        
        
        return tempBoard
        
    }() //This is a clousure that will be executed and the result will be allocate in the constant board
    
    
    func isSquareBlackAtRow(row: Int,column: Int) -> Bool{
        return boardColor[(row * 10) + column]
    }
    
}


var chessboard = ChessBoard()
chessboard.isSquareBlackAtRow(0, column: 1)

