//
//  Tablet.swift
//  Test
//
//  Created by LunarEclipse on 2019/2/10.
//

import Cocoa
import simd

@objcMembers
public class Tablet: NSObject
{
    // MARK: Singleton
    
    static let shared: Tablet = {
        let instance = Tablet()
        return instance
    }()
    
    // MARK: Property
    private(set) var penMoveLocation: Point = Point.zero
    private(set) var penMoveDelta: Point = Point.zero
    private(set) var penMoveModifiers: String = ""
    private(set) var penMoveIsTabletEvent: Bool = false
    // Mouse Down
    private(set) var penDownLocation: Point = Point.zero
    private(set) var penDownModifiers: String = ""
    private(set) var penDownIsTabletEvent: Bool = false
    // Mouse Drag
    private(set) var penDragLocation: Point = Point.zero
    private(set) var penDragDelta: Point = Point.zero
    private(set) var penDragModifiers: String = ""
    private(set) var penDragIsTabletEvent: Bool = false
    // Mouse Up
    private(set) var penUpLocation: Point = Point.zero
    private(set) var penUpModifiers: String = ""
    private(set) var penUpIsTabletEvent: Bool = false
    // Tablet events
    private(set) var pressure: Float = 0
    private(set) var absolute: double3 = double3()
    private(set) var tangentialPressure: Float = 0
    private(set) var tilt: Point = Point.zero
    private(set) var rotation: Float = 0
    private(set) var deviceID: Int = 0
    private(set) var transducerSerialNumber: Int = 0
    private(set) var transducerName: String = ""
    
    private(set) var lastUsedTablet: UInt32 = 0
    private(set) var penName: String? = nil
    
    override init() {
        super.init()
        
        let observedTypes = [.tabletPoint,
                             .tabletProximity,
                             .mouseMoved,
                             .leftMouseDragged,
                             .rightMouseDragged,
                             .otherMouseDragged,
                             .leftMouseDown,
                             .rightMouseDown,
                             .otherMouseDown,
                             .leftMouseUp,
                             .rightMouseUp,
                             .otherMouseUp] as NSEventMask;
        NSEvent.addLocalMonitorForEvents(matching: observedTypes, handler:  handleEvents)
    }
    
    
    private func handleEvents(event: NSEvent) -> NSEvent? {
        var isMouseEvent = false
        var isTabletPointEvent = false
        
        let modifierString = String(format: "%lX", UInt(event.modifierFlags.rawValue) & UInt(NSEventModifierFlags.deviceIndependentFlagsMask.rawValue))
        
        if  event.type == .mouseMoved ||
            event.type == .leftMouseDragged ||
            event.type == .rightMouseDragged ||
            event.type == .otherMouseDragged ||
            event.type == .leftMouseDown ||
            event.type == .rightMouseDown ||
            event.type == .otherMouseDown ||
            event.type == .leftMouseUp ||
            event.type == .rightMouseUp ||
            event.type == .otherMouseUp {
            isMouseEvent = true
        }
        
        if  event.type == .tabletPoint ||
            (isMouseEvent == true && event.subtype == .tabletPoint) {
            isTabletPointEvent = true
        }
        
        if event.type == .tabletProximity {
            self.lastUsedTablet = UInt32(event.systemTabletID)
            self.penName = TabletUtils.name(ofPen: UInt(event.pointingDeviceSerialNumber), byLastUsedTablet: lastUsedTablet)
        }
        
        // Pen move
        if event.type == .mouseMoved {
            penMoveLocation = event.locationInWindow
            penMoveDelta = Point(x: event.deltaX, y: event.deltaX)
            penMoveModifiers = modifierString
            penMoveIsTabletEvent = isTabletPointEvent
        }
        
        // Pen down
        if  event.type == .leftMouseDown ||
            event.type == .rightMouseDown ||
            event.type == .otherMouseDown {
            penDownLocation = event.locationInWindow
            penMoveModifiers = modifierString
            penMoveIsTabletEvent = isTabletPointEvent
        }
        
        // Pen dragged
        if  event.type == .leftMouseDragged ||
            event.type == .rightMouseDragged ||
            event.type == .otherMouseDragged {
            penDragLocation = event.locationInWindow
            penDragDelta = Point(x: event.deltaX, y: event.deltaX)
            penDragModifiers = modifierString
            penDragIsTabletEvent = isTabletPointEvent
        }
        
        // Pen up
        if  event.type == .leftMouseUp ||
            event.type == .rightMouseUp ||
            event.type == .otherMouseUp {
            penUpLocation = event.locationInWindow
            penUpModifiers = modifierString
            penUpIsTabletEvent = isTabletPointEvent
        }
        
        // Set field valid for Tablet Point events
        if isTabletPointEvent {
            absolute = double3(Double(event.absoluteX), Double(event.absoluteY), Double(event.absoluteZ))
            tilt = Point(x: event.tilt.x, y: event.tilt.y)
            rotation = event.rotation
            pressure = event.pressure
            tangentialPressure = event.tangentialPressure
            deviceID = event.deviceID
        }
        
        // Set Fields valid for point or proximity events
        if isTabletPointEvent || event.type == .tabletProximity {
            deviceID = event.deviceID
        }
        
        if event.type == .tabletProximity {
            if penName != nil {
                transducerName = penName!
            }
            transducerSerialNumber = event.pointingDeviceSerialNumber
        }
        
        return event
    }
    
    
    
    public typealias Point = NSPoint
}
