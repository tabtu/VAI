//
//  Data.h
//  IOSClient
//
//  Created by JUNWEI WU on 2017-02-15.
//

#import <Foundation/Foundation.h>

@interface Data : NSObject
{
    int language_select;
    int mode_select;
    UIColor *mainView;
    UIColor *textView;
    UIColor *viewText;
    UIColor *labelText;
    UIColor *voiceView;
    
    NSString *ip_address;
    int port_address;
    BOOL isConnect;
    
    NSString *outputString;
    NSString *voiceString;
}
@property (nonatomic) int language_select;
@property (nonatomic) int mode_select;
@property (strong,nonatomic) UIColor *mainView;
@property (strong,nonatomic) UIColor *textView;
@property (strong,nonatomic) UIColor *viewText;
@property (strong,nonatomic) UIColor *labelText;
@property (strong,nonatomic) UIColor *voiceView;
@property (strong,nonatomic) NSString *ip_address;
@property (strong,nonatomic) NSString *outputString;
@property (strong,nonatomic) NSString *voiceString;
@property (nonatomic) int port_address;
@property (nonatomic) BOOL isConnect;
+(Data *)sharedInstance;
-(void)changeMode:(int)mode;
@end
