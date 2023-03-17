//
//  ObservedObject+ObservableObject.swift
//  Scrumdinger
//
//  Created by William on 2023/3/17.
//

import SwiftUI

struct ObservedObject_ObservableObject: View {
    @ObservedObject var john = Human(name: "john", age: 24)
    var body: some View {
        VStack {
            Text(john.name)
            Button(action: {self.john.happyBirthday()}) {
                Text(String(john.age))
            }
        }
    }
}

// 一个Human类满足ObservableObject协议表示这个类在监听某些属性
// @Publish name，@Publish age 表示这些属性在被监听
// @ObservedObject var john 表示john对象是被监听的对象
// 点击按钮调用self.john.happyBirthday()，改变了john的名字和年龄
// UI收到了Publisher的广播，自动更新了界面

class Human: ObservableObject {
    @Published var name: String
    @Published var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func happyBirthday() {
        self.name = "Happy birthday"
        self.age += 1
    }
}

struct ObservedObject_ObservableObject_Previews: PreviewProvider {
    static var previews: some View {
        ObservedObject_ObservableObject()
    }
}

/**
 相比@State解决了哪些问题呢：
 如果你需要在多个 View 中共享数据，@State可能不是很好的选择；
 如果还需要在 View 外部操作数据，那么 @State 甚至就不是可选项了。
 含有少数几个成员变量的值类型，也许使用 @State也还不错。
 但是对于更复杂的情况，可能其 中只有很少几个属性需要触发 UI 更新，也可能各个属性之间彼此有关联，那 么我们应该选择引用类型和更灵活的可自定义方式。
 */
