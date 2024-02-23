//
//  KapdeLeloLiveActivityLiveActivity.swift
//  KapdeLeloLiveActivity
//
//  Created by macmini50 on 23/02/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct KapdeLeloLiveActivityAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct KapdeLeloLiveActivityLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: KapdeLeloLiveActivityAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension KapdeLeloLiveActivityAttributes {
    fileprivate static var preview: KapdeLeloLiveActivityAttributes {
        KapdeLeloLiveActivityAttributes(name: "World")
    }
}

extension KapdeLeloLiveActivityAttributes.ContentState {
    fileprivate static var smiley: KapdeLeloLiveActivityAttributes.ContentState {
        KapdeLeloLiveActivityAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: KapdeLeloLiveActivityAttributes.ContentState {
         KapdeLeloLiveActivityAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: KapdeLeloLiveActivityAttributes.preview) {
   KapdeLeloLiveActivityLiveActivity()
} contentStates: {
    KapdeLeloLiveActivityAttributes.ContentState.smiley
    KapdeLeloLiveActivityAttributes.ContentState.starEyes
}
