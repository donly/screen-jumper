//
//  DisplayRow.swift
//  ScreenJumper
//
//  Created by Tiou Lims on 2020/6/26.
//  Copyright © 2020 Tiou Lims. All rights reserved.
//

import SwiftUI

struct RowModel {
    let idx:Int
    let screenName:String?
    var hasScreen:Bool {
        get {
            screenName != nil
        }
    }
    var key:String {
        get { "values.shortcut.screen_\(idx)" }
    }
}


struct ScreenRow: View {
    var model:RowModel
    var body: some View {
        HStack{
            Text(String(format: NSLocalizedString("Screen %d", comment: ""), arguments: [model.idx]))
            Spacer()
            if model.hasScreen {
                Text(model.screenName!)
            }else{
                Text("None")
            }
            Spacer()
            ShortcutView(focusType: .Index(model.idx), keyPath: model.key)
                .frame(minWidth: 30, idealWidth: 80, maxWidth: 120, minHeight: 10, idealHeight: 30, maxHeight: 100, alignment: .center)
        }
    }
}

struct ScreenRow_Previews: PreviewProvider {
    static var previews: some View {
        ScreenRow(model: RowModel(idx: 0,screenName: "Demo"))
    }
}
