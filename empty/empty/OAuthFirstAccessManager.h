//
//  OAuthFirstAccessManager.h
//  empty
//
//  Created by echo on 13. 6. 15..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "OAConsumer.h"
#import "OAMutableURLRequest.h"
#import "OADataFetcher.h"
#import "OAToken.h"

@interface OAuthFirstAccessManager : NSObject
{
    OAToken *requestToken;
    OAToken *accessToken;
    bool isFinishRequest;
    bool isFinishAuthorize;
    bool isEnd;
    bool isAA;
    NSHTTPCookie *cookie;
    NSDictionary *headerFields;
    NSString *verifier;
}
@end
