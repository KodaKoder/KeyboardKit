//
//  ActionCalloutStyle.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2021-01-06.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This style can be applied to ``ActionCallout`` to customize
 things like the callout style, padding, font etc.
 
 You can modify the ``standard`` style to change the default,
 global style of all ``ActionCallout`` views that use it.
 */
public struct ActionCalloutStyle {
    
    /**
     Create an action callout style.
     
     - Parameters:
       - callout: The callout style to use, by default ``CalloutStyle/standard``.
       - font: The font to use in the callout, by default ``standardFont``.
       - selectedBackgroundColor: The background color of the selected item.
       - selectedForegroundColor: The foreground color of the selected item.
       - verticalOffset: The vertical offset of the action callout, by default 20 on iPad devices.
       - verticalTextPadding: The vertical padding to apply to text in the callout.
     */
    public init(
        callout: CalloutStyle = .standard,
        font: Font = Self.standardFont,
        maxButtonSize: CGSize = CGSize(width: 50, height: 50),
        selectedBackgroundColor: Color = .blue,
        selectedForegroundColor: Color = .white,
        verticalOffset: CGFloat? = nil,
        verticalTextPadding: CGFloat = 5
    ) {
        self.callout = callout
        self.font = font
        self.maxButtonSize = maxButtonSize
        self.selectedBackgroundColor = selectedBackgroundColor
        self.selectedForegroundColor = selectedForegroundColor
        let standardVerticalOffset: CGFloat = DeviceType.current == .pad ? 20 : 0
        self.verticalOffset = verticalOffset ?? standardVerticalOffset
        self.verticalTextPadding = verticalTextPadding
    }
    
    /**
     The callout style to use.
     */
    public var callout: CalloutStyle
    
    /**
     The font to use in the callout.
     */
    public var font: Font
    
    /**
     The max size of the callout buttons.
     */
    public var maxButtonSize: CGSize
    
    /**
     The background color of the selected item.
     */
    public var selectedBackgroundColor: Color
    
    /**
     The foreground color of the selected item.
     */
    public var selectedForegroundColor: Color
    
    /**
     The vertical offset to apply to the callout.
     */
    public var verticalOffset: CGFloat
    
    /**
     The vertical padding to apply to text in the callout.
     */
    public var verticalTextPadding: CGFloat
}


// MARK: - Standard Style

public extension ActionCalloutStyle {
    
    /**
     This standard style aims to mimic the native iOS style.

     This can be set to change the standard value everywhere.
     */
    static var standard = ActionCalloutStyle()
    
    /**
     This is the standard font that will be used by default.

     This can be set to change the standard value everywhere.
     You must change it before using the .``standard`` style,
     otherwise you will also have to change the style, since
     it will hold a reference to the old font.
     */
    static var standardFont: Font = {
        if #available(iOS 14.0, tvOS 14.0, watchOS 7.0, *) {
            return .title3
        } else {
            return .body
        }
    }()
}
