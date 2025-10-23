// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/

// Holds the state of what the translation button on the the action of the toolbar
struct TranslationConfiguration: Equatable, FeatureFlaggable {
    var canTranslate: Bool {
        featureFlags.isFeatureEnabled(.translation, checking: .buildOnly)
    }
}
