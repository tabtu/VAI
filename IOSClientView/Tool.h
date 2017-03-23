//
//  Tool.h
//  IOSClient
//
//  Created by Junwei Wu on 2017-03-10.
//  This is to translate voice to commands

#import <Foundation/Foundation.h>
#import "Tool.h"

@interface Tool : NSObject
{
    BOOL isFirst;
    BOOL isSecond;
    NSString *res;
}

@property (assign) BOOL isFirst;
@property (assign) BOOL isSecond;
@property (nonatomic) NSString *res;

+(Tool *)sharedInstance;
-(void)REG_W:(NSString *)voice;
-(void)First:(NSString *)voice;
-(void)Second:(NSString *)voice withArray:(NSMutableArray *)array;

@end

