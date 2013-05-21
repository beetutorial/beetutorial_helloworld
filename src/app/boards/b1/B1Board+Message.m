//
//  LoginBoard+Message.m
//  helloworld
//
//  Created by sang alfred on 5/21/13.
//
//

#import "B1Board+Message.h"
//http://top.baidu.com/news/pagination?pageno=1

#import "B1Api.h"


#define URL_BAI_TOP_NEW @"http://top.baidu.com/news/pagination?pageno=1"


@implementation B1Board(m)

#pragma mark - Messages
- (void)handleMessage:(BeeMessage *)msg
{
	[super handleMessage:msg];
}


#pragma mark - Messages
- (void)handleMessage_B1Api:(BeeMessage *)msg
{
	[super handleMessage:msg];
    
    if ( [msg is:B1Api.LOCAL] )
	{
		if ( msg.sending )
		{
//			_button1.stateNormal.title = @"Cancel";
		}
		else
		{
//			_button1.stateNormal.title = @"Local message";
		}
		
		if ( msg.succeed )
		{
			[BeeUIAlertView showMessage:[msg.output description] cancelTitle:@"OK"];
		}
	}
	else if ( [msg is:B1Api.REMOTE] )
	{
		if ( msg.sending )
		{
//			_button2.stateNormal.title = @"Cancel";
		}
		else
		{
//			_button2.stateNormal.title = @"Remote message";
		}
		
		if ( msg.sending )
		{
			// TODO: 当发送
			
			self.title = @"Communicating...";
		}
		else if ( msg.failed )
		{
			// TODO: 当失败
			
			self.title = @"Failed";
		}
		else if ( msg.succeed )
		{
			// TODO: 当成功
			
//            id json = [msg responseJSON];
            
            NSArray *f = [msg responseJSONArray];
            NSMutableArray *r = [NSMutableArray array];
            
            for (id i in f) {
                NSArray *newsArr = [i objectForKey:@"news"];
                
                for (NSDictionary *ddd in newsArr) {
                    if ([[ddd objectForKey:@"image"] length]>0) {
                        [r addObject:ddd];
                    }
                }
            }
            
            self._news_source_array = r;
//            _table.s
			self.title = @"Succeed";
			
//			[BeeUIAlertView showMessage:[msg.output description] cancelTitle:@"OK"];
		}
		else if ( msg.cancelled )
		{
			// TODO: 当取消
			
			self.title = @"Cancelled";
		}
	}

}


#pragma mark - Public

- (void)api_get_top_news
{
    if ( [self sendingMessage:B1Api.REMOTE] )
    {
        [self cancelMessage:B1Api.REMOTE];
    }
    else
    {
        [[self sendMessage:B1Api.REMOTE timeoutSeconds:10.0f] input:
         @"url", URL_BAI_TOP_NEW, nil];
    }

}

@end
