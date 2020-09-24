//
//  MAXAdvertANEUtils.c
//  MAXSDK
//
//  Created by 洋吴 on 2020/9/10.
//  Copyright © 2020 洋吴. All rights reserved.
//

#import "MAXAdvertANEUtils.h"
#import "MAXAdvertANE.h"

#pragma mark - string
NSString * MAXAdvertGetStringFromFREObject(FREObject obj){
    
    uint32_t length;
    const uint8_t *value;
    FREGetObjectAsUTF8(obj, &length, &value);
    return [NSString stringWithUTF8String:(const char *)value];
}

FREObject MAXAdvertCreateFREString(NSString * string){
    
    const char *str = [string UTF8String];
    FREObject obj;
    
    FRENewObjectFromUTF8((uint32_t)strlen(str)+1, (const uint8_t*)str, &obj);
    return obj;
}

#pragma mark - double
double MAXAdvertGetDoubleFromFREObject(FREObject obj){
    
    double number;
    FREGetObjectAsDouble(obj, &number);
    return number;
}

FREObject MAXAdvertCreateFREDouble(double value)
{
    FREObject obj = nil;
    FRENewObjectFromDouble(value, &obj);
    return obj;
}

#pragma mark - int
int MAXAdvertGetIntFromFREObject(FREObject obj){
    
    int32_t number;
    FREGetObjectAsInt32(obj, &number);
    return number;
}

FREObject MAXAdvertCreateFREInt(int value){
    
    FREObject obj = nil;
    FRENewObjectFromInt32(value, &obj);
    return obj;
}

#pragma mark - bool
BOOL MAXAdvertGetBoolFromFREObject(FREObject obj){
    
    uint32_t boolean;
    FREGetObjectAsBool(obj, &boolean);
    return boolean;
}

FREObject MAXAdvertCreateFREBool(BOOL value){
    
    FREObject obj = nil;
    FRENewObjectFromBool(value, &obj);
    return obj;
}


#pragma mark - objToJsonString
NSString *MAXAdvertObj2ANEJSON(id obj){
    
    if (obj&&[NSJSONSerialization isValidJSONObject:obj]){
        
        NSError *error = nil;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:obj options:0 error:&error];
        if (jsonData==nil) {
            return @"";
        }
        NSString * json =[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        return json;
    }
    return @"";
}


#pragma mark - sendMessageToANE(NSString)
void MAXAdvertSendANEMessage(int what,NSString *code,NSString *key,NSString *value){
    NSDictionary * dict = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:what], @"what",value,key, nil];
    NSString *json = MAXAdvertObj2ANEJSON(dict);
    MAXAdvertANEDispatchStatusEventAsyn(code,json);
}

#pragma mark - sendMessageToAne(Dictionary)
void MAXAdvertSendANEMessageWithDict(NSDictionary *dict,NSString *code){
    
    NSString *json = MAXAdvertObj2ANEJSON(dict);
    MAXAdvertANEDispatchStatusEventAsyn(code,json);
}

void MAXAdvertANEDispatchStatusEventAsyn(NSString  *type ,NSString *jsonString ){
    
    if(MAXANEEventContext==NULL){
        return ;
    }
    const char * cTypeString = [type cStringUsingEncoding:NSUTF8StringEncoding];
    const char * cJsonString = [jsonString cStringUsingEncoding:NSUTF8StringEncoding];
    const uint8_t* ane_type = (const uint8_t*)cTypeString;
    const uint8_t* ane_params = (const uint8_t*) cJsonString;
    FREDispatchStatusEventAsync(MAXANEEventContext,ane_type,ane_params);
}



