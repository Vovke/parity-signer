//
//  TCAuthorPlain.swift
//  NativeSigner
//
//  Created by Alexander Slesarev on 16.8.2021.
//

import SwiftUI

struct TCAuthorPlain: View {
    var value: AuthorPlain
    var body: some View {
        HStack {
            Image(uiImage: UIImage(data: Data(fromHexEncodedString: String(cString: base58_identicon(nil, value.base58, 32)))!)!)
            VStack (alignment: .leading) {
                Text("From: ")
                    .foregroundColor(Color("textMainColor"))
                Text(value.base58).foregroundColor(Color("textMainColor"))
            }
            Spacer()
        }
        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("backgroundCard")/*@END_MENU_TOKEN@*/)
    }
}

/*
 struct TCAuthorPlain_Previews: PreviewProvider {
 static var previews: some View {
 TCAuthorPlain(author: AuthorPlain(base58: "111"))
 }
 }
 */