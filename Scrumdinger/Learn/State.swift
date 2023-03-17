//
//  State.swift
//  Scrumdinger
//
//  Created by William on 2023/3/17.
//

import SwiftUI

// 又一个字符串HelloWorld，按下按钮后
// 修改了被State包装的变量x，所以UI也跟着发生了变化
struct StateView: View {
    @State var x = "HelloWorld"
    var body: some View {
        VStack {
            Text(x)
                .padding(.bottom, 6)
            Button(action: {self.x = "Hello UI"}) {
                Text("ChangeValue")
            }
        }
    }
}

struct StateView_Previews: PreviewProvider {
    static var previews: some View {
        StateView()
    }
}

