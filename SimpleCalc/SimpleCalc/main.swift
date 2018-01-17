//  Aindra Thin
//  INFO 449
//  Winter 2018
//  Homework 2

//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        let last = args[args.count - 1]
        switch last {
        case "count":
            return args.count - 1
        case "avg":
            return average(args)
        case "fact":
            return factorial(args)
        default:
            let num1 = Int(args[0])
            let num2 = Int(args[2])
            let symbol = args[1]
            switch symbol {
            case "+":
                return num1! + num2!
            case "-":
                return num1! - num2!
            case "/":
                return num1! / num2!
            case "*":
                return num1! * num2!
            default:    // symbol = "%" case
                return modulus(num1!, num2!)
            }
        }
    }
    
    private func average(_ nums: [String]) -> Int {
        var sum = 0;
        let count = nums.count - 1
        if count > 0 {
            var neg = false
            for index in 0...nums.count - 2 { // skip last element which is not a number
                if nums[index] == "-" {
                    neg = true
                } else {
                    var next = Int(nums[index])
                    if neg {
                        next = next! * -1
                        neg = false
                    }
                    sum += next!
                }
            }
            return sum / count
        } else {    // account for 0 / 0 case
            return 0
        }
    }
    
    private func factorial(_ nums: [String]) -> Int {
        if nums.count == 2 {
            let limit = Int(nums[0])
            var result = 1;
            for index in 1...limit! {
                result *= index
            }
            return result
        } else {    // account for no Int argument passed
            return 0
        }
    }
   
    private func modulus(_ num1: Int, _ num2: Int) -> Int {
        var remainder = num1
        let divisor = num2
        while remainder >= divisor {
            remainder -= divisor
        }
        return remainder
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

