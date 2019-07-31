//
//  main.swift
//  atcoder_test
//
//  Created by sun-yryr on 2019/07/13.
//  Copyright © 2019 sun-yryr. All rights reserved.
//

import Foundation

prefix operator *
prefix func * <T> (a: [T]) -> (T, T) {return (a[0], a[1])}
prefix func * <T> (a: [T]) -> (T, T, T) {return (a[0], a[1], a[2])}
prefix func * <T> (a: [T]) -> (T, T, T, T) {return (a[0], a[1], a[2], a[3])}


func readInt(separator s: Character = " ") -> [Int] {return readLine()!.split(separator: s).map({Int($0)!})}
func readDouble(separator s: Character = " ") -> [Double] {return readLine()!.split(separator: s).map({Double($0)!})}
func readElement(separator s: Character = " ") -> [String] {return readLine()!.split(separator: s).map({String($0)})}

extension String {
    func at(_ i: Int) -> Character {
        precondition(0 <= i && i < self.count)
        return self[self.index(self.startIndex, offsetBy: i)]
    }
}

func main() {
    /* 準備 */
    let aiueo = "あいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやゆよらりるれろわゐゑをがぎぐげござじずぜぞだぢづでどばびぶべぼぱぴぷぺぽぁぃぅぇぉっゃゅょん"
    var dic: [Character : [Character]] = [:]
    var dist: [Character : Int] = [:]
    for a in aiueo {
        dic[a] = []
        dist[a] = -1
    }
    /* 読み込み */
    let n = Int(readLine()!)!
    for _ in 0..<n {
        let s = readLine()!
        dic[s.first!]!.append(s.last!)
    }
    var queue = Queue<Character>()
    queue.enqueue("り")
    var v = queue.dequeue()
    for c in dic[v]! {
        dist[c] = 1
        queue.enqueue(c)
    }
    while !queue.isEmpty() {
        v = queue.dequeue()
        if v == "ん" {break}
        for c in dic[v]! {
            if dist[c] != -1 {continue}
            dist[c] = dist[v]! + 1
            queue.enqueue(c)
        }
    }
    if v == "ん" {
        print(dist[v]!)
    } else {
        print(-1)
    }
}
main()
