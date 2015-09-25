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
    NSLog(@"CDVShareSDK->share");
    
    @try
    {
        int platform = [[command.arguments objectAtIndex:0] intValue];
        NSString* title=[command.arguments objectAtIndex:1];
        NSString* content=[command.arguments objectAtIndex:2];
        NSString* url=[command.arguments objectAtIndex:3];
        
        //platform   新浪微博 = 1, 腾讯微博 = 2, 微信好友 ＝ 22 ，微信朋友圈 ＝ 23
        NSLog(@"%@",command.arguments);
        NSLog(@"%i",platform);
        NSLog(@"%@",title);
        
        [self.commandDelegate runInBackground:^{
            NSString* payload = nil;
            // Some blocking logic...
            NSLog(@"thread is running...");
            NSURL* aURL = [NSURL URLWithString:url];
            NSData* data = [[NSData alloc] initWithContentsOfURL:aURL];
            
            
            NSArray* imageArray = @[[UIImage imageWithData:data]];
            
            //创建分享参数
            NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
            [shareParams SSDKSetupShareParamsByText:content
                                             images:imageArray
                                                url:[NSURL URLWithString:@"http://www.52toys.com"]
                                              title:title
                                               type:SSDKContentTypeAuto];
            
            
            [ShareSDK share:platform
                 parameters:shareParams
             onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
                 
                 switch (state) {
                     case SSDKResponseStateSuccess:
                     {
                         UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享成功"
                                                                             message:nil
                                                                            delegate:nil
                                                                   cancelButtonTitle:@"确定"
                                                                   otherButtonTitles:nil];
                         [alertView show];
                         break;
                     }
                     case SSDKResponseStateFail:
                     {
                         UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享失败"
                                                                             message:[NSString stringWithFormat:@"%@", error]
                                                                            delegate:nil
                                                                   cancelButtonTitle:@"确定"
                                                                   otherButtonTitles:nil];
                         [alertView show];
                         break;
                     }
                     default:
                     break;
                 }
                 
             }];
            
            CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:payload];
            // The sendPluginResult method is thread-safe.
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        }];
    }
    @catch (NSException *exception)
    {
        NSLog(@"%@",exception);
    }
    @finally
    {

    }
    
    
    

}
@end
