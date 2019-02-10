//
//  Out.m
//  Tablet
//
//  Created by LunarEclipse on 2019/2/11.
//  Copyright © 2019年 LunarEclipse. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import "Out.h"
#import "Tablet-Swift.h"

float   GetPenPressure() { return [Tablet shared].pressure;}
float   GetPenTangentialPressure() { return [Tablet shared].tangentialPressure; }
double2 GetPenTilt() { return {[Tablet shared].tilt.x, [Tablet shared].tilt.y}; }
float   GetPenRotation() { return [Tablet shared].rotation; }
int3    GetAbsolute() { return {[Tablet shared].absolute.x, [Tablet shared].absolute.y, [Tablet shared].absolute.z}; }
int     GetDeviceID() { return [Tablet shared].pressure; }
const char * GetDeviceName() { return [Tablet shared].penName.UTF8String; }
int     GetTransducerSerialNumber() { return [Tablet shared].pressure; }
const char *  GetTransducerName() { return [Tablet shared].transducerName.UTF8String; }

float   GetMoveLocationX() { return [Tablet shared].penMoveLocation.x; }
float   GetMoveLocationY() { return [Tablet shared].penMoveLocation.y; }
double2 GetMoveLocation() { return {[Tablet shared].penMoveLocation.x, [Tablet shared].penMoveLocation.y}; }
float   GetMoveDeltaX() { return [Tablet shared].penMoveDelta.x; }
float   GetMoveDeltaY() { return [Tablet shared].penMoveDelta.y; }
double2 GetMoveDelta() { return {[Tablet shared].penMoveDelta.x, [Tablet shared].penMoveDelta.y}; }

float   GetDownLocationX() { return [Tablet shared].penDownLocation.x; }
float   GetDownLocationY() { return [Tablet shared].penDownLocation.y; }
double2 GetDownLocation() { return {[Tablet shared].penDownLocation.x, [Tablet shared].penDownLocation.y}; }

float   GetDragLocationX() { return [Tablet shared].penDragLocation.x; }
float   GetDragLocationY() { return [Tablet shared].penDragLocation.y; }
double2 GetDragLocation() { return {[Tablet shared].penDragLocation.x, [Tablet shared].penDragLocation.y}; }
float   GetDragDeltaX() { return [Tablet shared].penDragDelta.x; }
float   GetDragDeltaY() { return [Tablet shared].penDragDelta.y; }
double2 GetDragDelta() { return {[Tablet shared].penDragDelta.x, [Tablet shared].penDragDelta.y}; }

float   GetUpLocationX() { return [Tablet shared].penUpLocation.x; }
float   GetUpLocationY() { return [Tablet shared].penUpLocation.y; }
double2 GetUpLocation() { return {[Tablet shared].penUpLocation.x, [Tablet shared].penUpLocation.y}; }

