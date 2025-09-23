// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/

import SwiftUI
import Common

public struct PrimaryButtonStyle: ButtonStyle {
    // MARK: – UX Constants
    private enum UX {
        static let verticalPadding: CGFloat = 12
        static let horizontalPadding: CGFloat = 12
        static let cornerRadius: CGFloat = 8
        static let pressedScale: CGFloat = 0.97
        static let defaultScale: CGFloat = 1.0
    }

    let theme: Theme

    public init(theme: Theme) {
        self.theme = theme
    }

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .padding(.vertical, UX.verticalPadding)
            .padding(.horizontal, UX.horizontalPadding)
            .frame(maxWidth: .infinity)
            .scaleEffect(configuration.isPressed ? UX.pressedScale : UX.defaultScale)
            .foregroundColor(Color(uiColor: theme.colors.textInverted))
            .if(isIOS26OrLater) { view in
                Group {
                    if #available(iOS 26.0, *) {
                        view.background(
                            Capsule(style: .continuous)
                                .fill(Color(uiColor: theme.colors.actionPrimary))
                        )
                    } else {
                        view.background(
                            RoundedRectangle(cornerRadius: UX.cornerRadius)
                                .fill(Color(uiColor: theme.colors.actionPrimary))
                        )
                    }
                }
            }
    }

    private var isIOS26OrLater: Bool {
        if #available(iOS 26.0, *) {
            return true
        } else {
            return false
        }
    }
}
