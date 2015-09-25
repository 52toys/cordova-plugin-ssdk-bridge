//
//  ShareBridge.m
//  HelloCordova
//
//  Created by quanzhenan on 9/23/15.
//
//

#import "CDVShareSDK.h"
#import <Cordova/CDV.h>
#import <ShareSDK/ShareSDK.h>


@implementation CDVShareSDK

-(void)share:(CDVInvokedUrlCommand *)command
{
    int platform = [[command.arguments objectAtIndex:0] intValue];

    NSString* title=[command.arguments objectAtIndex:1];
    NSString* content=[command.arguments objectAtIndex:2];
    NSString* url=[command.arguments objectAtIndex:3];
    NSString* imagePath=[command.arguments objectAtIndex:4];

    //platform   新浪微博 = 1, 腾讯微博 = 2, 微信好友 ＝ 22 ，微信朋友圈 ＝ 23
    NSLog(@"%@",command);

}
@end
