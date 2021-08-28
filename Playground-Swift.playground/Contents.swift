import UIKit

var greeting = "Hello "


// Declaraciones

let count = 10
var price = 23.55
let firstMessage = "Swift is awesome. "
let secondMessage = "What do you think?"
var message = firstMessage + secondMessage

let constant = 10
var y = 10
var x = y + constant

 // constant = 20 constant is unmutable
y = 50

var name = "Alex"
var message2 = greeting + name
message2.uppercased()

var bookPrice = 39
var numOfCopies = 5
var totalPrice = bookPrice * numOfCopies
var totalPriceMessage = "The price of the book is $" + String(totalPrice)
totalPriceMessage = "The price of the book is $\(totalPrice)" // recommendado

var timeYouWakeUp = 6
if timeYouWakeUp == 6 {
    print("Cook yourself a big breakfast!")
} else {
    print("Go out for breakfast")
}

switch timeYouWakeUp {
case 6:
    print("Cook yourself a big breakfast!")
default:
    print("Go out for breakfast")
}

var bonus = 5000

if bonus >= 10000 {
    print("I will travel to Europe!")
} else if bonus >= 5000 && bonus < 10000 {
    print("I will travel to USA!")
} else if bonus >= 1000 && bonus < 5000 {
    print("I will travel to Colombia!")
}else {
    print("I will stay at home!")
}

switch bonus {
case 10000...:
    print("I will travel to Europe!")
case 5000...9999:
    print("I will travel to USA!")
case 1000...4999:
    print("I will travel to USA!")
default:
    print("I will stay at home!")
}


var bookCollection = ["Path of destruction", "Rule of Two", "Dynasty of Evil"]
bookCollection[0]

for index in 0...2 {
    print(bookCollection[index])
}

for book in bookCollection {
    print(book)
}

var bookCollectionIBN10 = [
    "0345477375" : "Path of destruction",
    "0345477499" : "Rule of Two",
    "0345511565" : "Dynasty of Evil"
]

bookCollectionIBN10["0345477499"]

for (key, value) in bookCollectionIBN10 {
    print("ISBN10: \(key)")
    print("Title \(value)")
}

var emojiDict: [String:String] = [
    "👻" : "Ghost",
    "💩": "Poop",
    "😤": "Angry",
    "😱": "Scream",
    "👾": "Alien monster"
]

var wordToLookup = "👻"
var meaning = emojiDict[wordToLookup]
print(meaning)

var jobTitle: String?
jobTitle = "iOS Developer"
if jobTitle != nil { // bad practice
    _ = "Your job title is " + jobTitle!
}

if let jobTitleWithValue = jobTitle { //Best practice - Optional Binding
    _ = "Your job title is " + jobTitleWithValue
}



// Objective c
// const int count = 10;
// double price = 23.55;
// NSString *firstMessage = @"Swift is awesome. "
// NSString *secondMessage = @"What do you think?"
// NSString *message = [
