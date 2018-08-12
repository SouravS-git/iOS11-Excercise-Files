//var myString : [String : String] = ["one" : "hello", "two" : "world"]
//var myString : [String] = ["hello", "world"]
//
//for (key, value) in myString.enumerated() {
//    print(key)
//}


//var rating: Int = 5
//
//switch rating {
//case 1...5:
//    print("1")
//    break
//case 2:
//    print("2")
//
////case 3:
////    print("3")
////case 4:
////    print("4")
////case 5:
////    print("5")
//default:
//    print("Not Rated")
//}

//var arr : [Int] = [-3, 4, 6, 9, 0, -7]
//
//func findMinMax(myArray : [Int]) -> (min : Int, max : Int) {
//    var myMin : Int = myArray[0]
//    var myMax : Int = myArray[0]
//
//    for value in myArray[1..<myArray.count] {
//        if value < myMin {
//            myMin = value
//        }
//        else if value > myMax {
//            myMax = value
//        }
//    }
//
//    return (myMin, myMax)
//}
//
//print(findMinMax(myArray: arr).min)
//
//
//func helloWorld(_ variable : String = "hello") -> String {
//    return variable
//}
//
//print(helloWorld())

//func variadic(_ num : Int...){
//    print(num)
//}
//
//variadic(12,14,13,18)


//var heros : [String] = ["Spider Man", "Hulk", "Captain America", "Iron Man"]
//
//func sorty(_ hero1 : String, _ hero2 : String) -> Bool{
//    return hero1 < hero2
//}
//
//print(heros.sorted(by : {
//    (_ hero1 : String, _ hero2 : String) -> Bool in
//        //print(hero1)
//        //print(hero2)
//        //print("\n")
//        return hero1 > hero2
//}))
//print(heros.sorted(by : sorty))

//class SuperHero{
//    var heroName = "Hulk"
//
//    func sayHello(myHero : String) -> String {
//        return "Hello from " + myHero
//    }
//}
//
//print(SuperHero().sayHello(myHero: (SuperHero().heroName)))
//
//struct MyStruct{
//    var a = 12
//    var b = "hello"
//}
//
//class Demo{
//    var tmp = MyStruct()
//}
//
//print(MyStruct().a)
//print(Demo().tmp.b)


//class Game {
//    var lifeUp : LifeUp?
//}
//
//class LifeUp{
//    var noOfLife = 78
//}
//
//var obj = Game()
////obj.lifeUp = LifeUp()
//
//var ok = obj.lifeUp?.noOfLife


//extension Double {
//    var distance : Double { return self * 1000}
//}

//print(34.55.distance)


//var dictionary : [String : String] = [
//    "ok" : "hello",
//    "ok2" : "hello2",
//]
//
//print(dictionary)


//func swap<S>(a : inout S, b : inout S) {
//    let t = a
//    a = b
//    b = t
//}
//
//var a = 78
//var b = 99
//
//swap(&a, &b)
//
//print(a)
//print(b)
