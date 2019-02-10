//
//  Out.h
//  Tablet
//
//  Created by LunarEclipse on 2019/2/11.
//  Copyright © 2019年 LunarEclipse. All rights reserved.
//

#import <simd/simd.h>

using namespace simd;

#ifdef __cplusplus
extern "C" {
#endif
    float   GetPenPressure(void);
    float   GetPenTangentialPressure(void);
    double2 GetPenTilt(void);
    float   GetPenRotation(void);
    double3 GetAbsolute(void);
    int     GetDeviceID(void);
    const char * GetDeviceName(void);
    int     GetTransducerSerialNumber(void);
    const char * GetTransducerName(void);
    
    float   GetMoveLocationX(void);
    float   GetMoveLocationY(void);
    double2 GetMoveLocation(void);
    float   GetMoveDeltaX(void);
    float   GetMoveDeltaY(void);
    double2 GetMoveDelta(void);
    
    float   GetDownLocationX(void);
    float   GetDownLocationY(void);
    double2 GetDownLocation(void);
    
    float   GetDragLocationX(void);
    float   GetDragLocationY(void);
    double2 GetDragLocation(void);
    float   GetDragDeltaX(void);
    float   GetDragDeltaY(void);
    double2 GetDragDelta(void);
    
    float   GetUpLocationX(void);
    float   GetUpLocationY(void);
    double2 GetUpLocation(void);
#ifdef __cplusplus
}
#endif
