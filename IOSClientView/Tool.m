//
//  Tool.m
//  IOSClient
//
//  Created by Junwei Wu on 2017-03-10.
//

#import "Tool.h"

@implementation Tool
#define MAX_LEN 3
@synthesize isFirst;
@synthesize isSecond;
@synthesize res;

-(id)init
{
    if(	self==[super init])
    {
        isFirst=NO;
        isSecond=NO;
        res=@"2";
    }
    return self;
}

-(void)REG_W:(NSString *)voice;
{
    res=@"2";
    /*
    NSMutableArray *dance=[[NSMutableArray alloc]initWithObjects:@"jump",@"dance",@"show",nil];  // y
    NSMutableArray *shine=[[NSMutableArray alloc]initWithObjects:@"crazy",@"fly",@"out",nil];  // t
    NSMutableArray *flash=[[NSMutableArray alloc]initWithObjects:@"flash",@"shining",nil];  // w,z
    NSMutableArray *open=[[NSMutableArray alloc]initWithObjects:@"open",@"on",@"up", nil];  // A,B
    NSMutableArray *close=[[NSMutableArray alloc]initWithObjects:@"close",@"off",@"down",nil];  // a,b
    NSMutableArray *place=[[NSMutableArray alloc]initWithObjects:@"living",@"kitchen",@"all",nil];  //
     */
    
    NSMutableArray *shine=[[NSMutableArray alloc]initWithObjects:@"crazy",@"flash",@"shining",nil];
    NSMutableArray *open=[[NSMutableArray alloc]initWithObjects:@"open",@"on",@"up", nil];
    NSMutableArray *close=[[NSMutableArray alloc]initWithObjects:@"close",@"off",@"down",nil];
    NSMutableArray *place=[[NSMutableArray alloc]initWithObjects:@"living",@"kitchen",@"all",nil];
    
    
    int b_open_count=0;
    int b_close_count=0;
    int k_close_count=0;
    int k_open_count=0;
    
    [self First:voice];
    if(isFirst==NO)
    {
        [self Second:voice withArray:shine];
    }
    
 if(isFirst==NO)
 {
    for(int i=0;i<MAX_LEN;i++)
    {
        if([voice containsString:place[i]])
        {
            switch (i)
            {
                case 0://living
                    for(int j=0;j<MAX_LEN;j++){
                    if([voice containsString:open[j]])
                    {
                        res=@"B";
                        b_open_count++;
                    }
                    else if ([voice containsString:close[j]])
                    {
                        res=@"b";
                        b_close_count++;
                    }
                    }
                    if([voice isEqualToString:@"Recogonize failed."])
                    {
                        res=@"2";
                    }
                    break;
                case 1://kitchen
                    for(int j=0;j<MAX_LEN;j++){
                        if([voice containsString:open[j]])
                        {
                            res=@"A";
                            b_open_count++;
                        }
                        else if ([voice containsString:close[j]])
                        {
                            res=@"a";
                            b_close_count++;
                        }
                    }
                    if([voice isEqualToString:@"Recogonize failed."])
                    {
                        res=@"2";
                    }
                    break;
                case 2://all
                    if([voice containsString:open[i]])
                    {
                        res=@"AB";
                    }
                    else if ([voice containsString:close[i]])
                    {
                        res=@"ab";
                    }
                    else if([voice isEqualToString:@"Recogonize failed."])
                    {
                        res=@"2";
                    }
                    break;
                default:
                    break;
            }
        }
    }
    
    if((k_open_count>1||k_close_count>1||b_open_count>1||b_close_count>1)&&k_open_count!=k_close_count&&b_open_count!=b_close_count)
    {
        if(k_open_count>k_close_count)
        {
            res=@"A";
        }
        else if(k_open_count<k_close_count)
        {
            res=@"a";
        }
        else if(k_open_count<b_open_count)
        {
            res=@"B";
        }
        else if(k_open_count>b_open_count)
        {
            res=@"A";
        }
        else if(b_open_count<b_close_count)
        {
            res=@"b";
        }
        else if(b_open_count>b_close_count)
        {
            res=@"B";
        }
    }
 }
    NSLog(@"result = %@",res);
    isSecond=NO;
    isFirst=NO;
}

-(void)First:(NSString *)voice
{
    res=@"2";
    if([voice containsString:@"enable"])
    {
        res=@"1";
        isFirst=YES;
    }
    else if ([voice containsString:@"disable"])
    {
        res=@"0";
        isFirst=YES;
    }
    else if([voice containsString:@"Recogonize failed."])
    {
        res=@"2";
    }
}

-(void)Second:(NSString *)voice withArray:(NSMutableArray *)array
{
    res=@"2";
    for(int i=0;i<MAX_LEN;i++)
    {
        if ([voice containsString:array[i]])
        {
            if([voice containsString:@"living"])
            {
                res=@"z";
            }
            else if([voice containsString:@"kitchen"])
            {
                res=@"w";
            }
            else
            {
                res=@"t";
            }
            
            isSecond=YES;
        }
        else if([voice containsString:@"dance"])
        {
            res=@"y";
        }
        else if([voice containsString:@"Recogonize failed."])
        {
            res=@"2";
        }
    }
}

+(Tool *)sharedInstance
{
    static Tool *_sharedInstace=nil;
    if(_sharedInstace==nil)
    {
        _sharedInstace=[[Tool alloc] init];
    }
    return _sharedInstace;
}
@end
