//
//  EnvironmentObject.swift
//  Scrumdinger
//
//  Created by William on 2023/3/17.
//

import SwiftUI

struct EnvironmentObjectView: View {
    @ObservedObject var john = Human(name: "john", age: 24)
    var body: some View {
        VStack {
            Text(john.name)
            Button(action: {self.john.happyBirthday()}) {
                SubView()
                    .environmentObject(john)
            }
        }
    }
}

/**
 在父View中的被观察对象(被@ObservedObject包装的john)在子View中使用，
 只需要在子View中用@EnviromentObject包装同类型的变量
 并在调用子View的时候使用.environmentObject(john)显式的说明
 */

/**
 View与View间的公用数据：使用@State + @Binding。
 多个View与Class间的公用数据：对View用@ObservedObject，让Class满足ObservableObject协议。
 父View与子View对Class间的公用数据：父View用@ObservedObject，子View用@EnvironmentObject，Class满足ObservableObject协议
 */
struct SubView: View {
    @EnvironmentObject var john: Human
    var body: some View {
        Text(john.name + " sub view ")
    }
}

struct EnvironmentObject_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObjectView()
    }
}
