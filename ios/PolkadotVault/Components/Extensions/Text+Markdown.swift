//
//  Text+Markdown.swift
//  Polkadot Vault
//
//  Created by Krzysztof Rodak on 15/11/2022.
//

import SwiftUI

extension Text {
    @ViewBuilder
    static func markdownWithFallback(_ value: String, allowsEmptyValue: Bool = true) -> some View {
        Text(
            AttributedString.build(fromDocs: value, allowsEmptyValue: allowsEmptyValue) ??
                AttributedString("")
        )
        .multilineTextAlignment(.leading)
    }
}
