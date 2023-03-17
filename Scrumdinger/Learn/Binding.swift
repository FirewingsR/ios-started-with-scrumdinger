//
//  Binding.swift
//  Scrumdinger
//
//  Created by William on 2023/3/17.
//

import SwiftUI

// 例子：Binding1和Binding2是两个不相关的View，他们共同使用一个数据，
// 当该数据发生改变的时候除了要用@State告诉Binding1更新UI，还要告诉Binding2更新数字
// button左边的数字是Text1，右边的数字是Text2

struct Binding1: View {
    @State var x = 5
    var body: some View {
        HStack{
            Text(String(x))
                .padding(.bottom, 32)
            Button(action: {self.x *= 2}) {
                Text("change to 10")
            }
            Binding2(y: $x)
                .padding(.bottom, -32)
        }
        
    }
}

struct Binding2: View {
    @Binding var y: Int
    var body: some View {
        Text(String(y))
    }
}

struct Binding1_Previews: PreviewProvider {
    static var previews: some View {
        Binding1()
    }
}

