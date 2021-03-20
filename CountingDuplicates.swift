/*Count the number of Duplicates, 6 kyu

Write a function that will return the count of distinct case-insensitive alphabetic characters and numeric digits that occur more than once in the input string. The input string can be assumed to contain only alphabets (both uppercase and lowercase) and numeric digits.
 
 Declaration
 
 func countDuplicates(_ s:String) -> Int {
   return // code here.
 }
 
 Example

"abcde" -> 0 # no characters repeats more than once
"aabbcde" -> 2 # 'a' and 'b'
"aabBcde" -> 2 # 'a' occurs twice and 'b' twice (`b` and `B`)
"indivisibility" -> 1 # 'i' occurs six times
"Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice
"aA11" -> 2 # 'a' and '1'
"ABBA" -> 2 # 'A' and 'B' each occur twice
*/

func countDuplicates2(_ s: String) -> Int {
    var setStr: Set<Character> = []
    var setDupl: Set<Character> = []
    
    var insertOK: Bool
    var insertChar: Character
    
    for char in s {
        (insertOK, insertChar) = setStr.insert(Character(char.lowercased()))

        if !insertOK {
            setDupl.insert(insertChar)
        }
    }
    return setDupl.count
}

func countDuplicates(_ s: String) -> Int {
    var set: (full: Set<Character>, dupl: Set<Character>) = ([], [])
    
    s.forEach { let res = set.full.insert(Character($0.lowercased()))
        if !res.inserted { set.dupl.insert(res.memberAfterInsert) }
              }
    return set.dupl.count
}

func countDuplicates3(_ s: String) -> Int {
    var dic: [String: Int] = [:]

    s.forEach { dic[$0.lowercased(), default: 0] += 1 }
    return dic.values.filter {$0>1}.count
}

countDuplicates("abcde") //0
countDuplicates3("Indivisibilities") //2
countDuplicates("ABBA") //2
countDuplicates("aA11") //2
