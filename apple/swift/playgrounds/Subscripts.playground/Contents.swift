import Foundation
import UIKit

struct TimesTable{
    
    
    var toMultiply = 0
    
    init(toMultiply: Int){
        self.toMultiply = toMultiply
    }
    

    //Computed-value
    //Creating a subscript that recieve a Int value and return the result
    subscript(index: Int) -> Int{
        return toMultiply * index
    }
    
}



var times3 = TimesTable(toMultiply: 3)
times3[3] //Calling the subscript




class Matrix {
    
    let rows: Int, columns: Int
    var grid: [Double]
    
    //Initializer of the class
    init(rows: Int , columns: Int){
        self.rows = rows
        self.columns = columns
        grid  = Array(count: rows * columns ,repeatedValue: 0.0)
    }
    
    
    func indexIsValidForRow(row: Int, column:Int) -> Bool{
        return row >= 0 && row < rows && column  >= 0 && column < columns
    }
    
    
    //Subscript for read and set value to the grid
    
    subscript(row: Int ,column: Int ) -> Double {

        get{
            
            assert(indexIsValidForRow(row, column: column),"Error: Out of index")
            return grid[(row * column) + column]
            
        }
        
        //Using the default parameter "newValue"
        set{
            assert(indexIsValidForRow(row, column: column),"Error: Out of index")
            grid[(column * row) + column] = newValue
        }
    
    }
    
    
    func toString() -> String{
    
        var matrixValue = ""
        
        var counter = 0
        
        for value in grid {
            
            matrixValue.appendContentsOf("\(value) ")
            counter++
            
            if counter % columns == 0 {
                matrixValue.appendContentsOf("\n")
            }
            
        }
        
        return matrixValue
    }
    
    
}


//Testing the matrix 

var  matrix = Matrix(rows: 5, columns: 4)
matrix[2,3] = 190.99
matrix[1,2] = 90.99
matrix[3,3] = 8.00
matrix[1,3] = 213

print(matrix.toString())


//Experiments with subscripts

enum SystemProperties{
    case CPU,OS,RAM
}


class SystemInfo{

    var systemInfoData:[SystemProperties:String] = [:]
    
    init(){
        
        let osData  = "\(UIDevice.currentDevice().systemName) \(UIDevice.currentDevice().systemVersion)"
        let ramMem  = "\(NSProcessInfo.processInfo().physicalMemory)"
        let cpuInfo = "Active Processors: \(NSProcessInfo.processInfo().activeProcessorCount)"
        
        //var cpuData = "\(UIDevice.currentDevice().)"
        
        systemInfoData[SystemProperties.OS] = osData
        systemInfoData[SystemProperties.RAM] = ramMem
        systemInfoData[SystemProperties.CPU] = cpuInfo
    }
    
    
    //Subscript for obtain the info about the system 
    
    subscript(systemProperty:SystemProperties) -> String? {
    
        get{
            return systemInfoData[systemProperty]
        }
    }
    
}


//Testing SystemInfo with subscripts

var sysInfo = SystemInfo()

print("System Information:\nOperating System: \(sysInfo[SystemProperties.OS]!)\nAvailable RAM(in bytes): \(sysInfo[SystemProperties.RAM]!)\nCPU: \(sysInfo[SystemProperties.CPU]!)")




