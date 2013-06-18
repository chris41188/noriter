//
//  OAuthFirstAccessManager.m
//  empty
//
//  Created by echo on 13. 6. 15..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import "OAuthFirstAccessManager.h"

@implementation OAuthFirstAccessManager
-(id)init
{
    if( self = [super init] )
    {
        [[NSHTTPCookieStorage sharedHTTPCookieStorage]
         setCookieAcceptPolicy:NSHTTPCookieAcceptPolicyAlways];
        isFinishAuthorize = false;
        isFinishRequest = false;
        [self oauthRequest];
    }
    return self;
}
- (void)oauthRequest
{
    NSLog(@"Request Token");
    OAConsumer *consumer = [[OAConsumer alloc] initWithKey:@"noriterminidar"
                                                    secret:@"noritersuperpower"];
    
    NSURL *url = [NSURL URLWithString:@"http://noritercorp.com:8080/MinidarService/oauth/request_token"];
    
    OAMutableURLRequest *request = [[OAMutableURLRequest alloc] initWithURL:url
                                                                   consumer:consumer
                                                                      token:nil   // we don't have a Token yet
                                                                      realm:nil   // our service provider doesn't specify a realm
                                                          signatureProvider:nil]; // use the default method, HMAC-SHA1
    [request setOAuthParameterName:@"oauth_callback" withValue:@""];
    [request setHTTPMethod:@"POST"];
    
    OADataFetcher *fetcher = [[OADataFetcher alloc] init];
    
    [fetcher fetchDataWithRequest:request
                         delegate:self
                didFinishSelector:@selector(requestTokenTicket:didFinishWithData:)
                  didFailSelector:@selector(requestTokenTicket:didFailWithError:)];
    
}
- (void)requestTokenTicket:(OAServiceTicket *)ticket didFinishWithData:(NSData *)data {
    NSLog(@"request Token Ticket");
    NSLog(@"%@",[[NSString alloc] initWithData:data
                                      encoding:NSUTF8StringEncoding]);
    if (ticket.didSucceed) {
        NSString *responseBody = [[NSString alloc] initWithData:data
                                                       encoding:NSUTF8StringEncoding];
        requestToken = [[OAToken alloc] initWithHTTPResponseBody:responseBody];
        NSLog(@"Response body = %@",responseBody);
        NSLog(@"Request Token = %@",requestToken.key);
        isFinishRequest = true;
        [self connectToServer];
    }
}

- (void)requestTokenTicket:(OAServiceTicket *)ticket didFailWithError:(NSData *)error {
    NSLog(@"Request Token Ticket Error");
    
    NSLog(@"%@",error);
    if (ticket.didSucceed) {
        NSString *responseBody = [[NSString alloc] initWithData:error
                                                       encoding:NSUTF8StringEncoding];
        requestToken = [[OAToken alloc] initWithHTTPResponseBody:responseBody];
        NSLog(@"Response body = %@",responseBody);
        NSLog(@"Request Token = %@",requestToken.key);
    }
}

- (void)connectToServer
{
	NSString *smsURL = [NSString stringWithFormat:@"http://noritercorp.com:8080/MinidarService/minidarlogin.do"];
    //https://www.linkedin.com/uas/oauth/authenticate?oauth_token=%@",requestToken.key];
    //    CGRect newFrame = self.view.frame;
    //    newFrame.size.height *= 3.0/4.0;
    //    UIWebView *webview = [[UIWebView alloc]initWithFrame:newFrame];
    //    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    //    button.frame = CGRectMake(0, self.view.frame.size.height*3/4, 130, 130);
    //    [button addTarget:self action:@selector(connection:) forControlEvents:UIControlEventTouchUpInside];
    //
    //    [self.view addSubview:webview];
    //        [self.view addSubview:button];
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
	
	
	NSString *post = [NSString stringWithFormat:@"j_username=%@&j_password=%@",@"skatpgusskat@naver.com",@"qwer1234"];
	NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
	NSString *postLength = [NSString stringWithFormat:@"%d",[postData length]];
	
	NSLog(@"%@",smsURL);
	[request setURL:[NSURL URLWithString:smsURL]];
	[request setHTTPMethod:@"POST"];
	[request setValue:postLength forHTTPHeaderField:@"Content-Length"];
	[request setValue:@"Mozilla/4.0 (compatible;)" forHTTPHeaderField:@"User-Agent"];
	[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
	[request setHTTPBody:postData];
	[NSURLConnection connectionWithRequest:request delegate:self ];
    
    
    //[webview loadRequest:request];
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	NSString *returnString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
	NSLog(@"after connection, return string : %@",returnString);
    
    if(isFinishRequest == true && isFinishAuthorize == true && isEnd == false)
    {
        isEnd = true;
        [self oauthAuthorizeWithCookie:cookie];
    }
    
    else if(isFinishRequest == true && isFinishAuthorize == true && isEnd == true && isAA == false)
    {
        isAA = true;
        [self oauthAccess];
    }
}

- (void)oauthAuthorizeWithCookie:(NSHTTPCookie*)_cookie
{
    NSString *smsURL = [NSString stringWithFormat:@"http://noritercorp.com:8080/MinidarService/oauth/authorize?requestToken=%@",requestToken.key];
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
	
	NSLog(@"in Auth : %@",smsURL);
	[request setURL:[NSURL URLWithString:smsURL]];
	[request setHTTPMethod:@"POST"];
    
    NSString *post = [NSString stringWithFormat:@"%@=%@",_cookie.name,[_cookie.value substringFromIndex:6]];
	NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
	NSString *postLength = [NSString stringWithFormat:@"%d",[postData length]];
	NSLog(@"Cookie : %@",post);
	NSLog(@"%@",smsURL);
	[request setURL:[NSURL URLWithString:smsURL]];
	[request setHTTPMethod:@"POST"];
    //[request setValue:post forHTTPHeaderField:@"Cookie"];
    //	[request setValue:postLength forHTTPHeaderField:@"Content-Length"];
	[request setValue:@"Mozilla/4.0 (compatible;)" forHTTPHeaderField:@"User-Agent"];
	[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setAllHTTPHeaderFields:headerFields];
    //	[request setHTTPBody:postData];
	[NSURLConnection connectionWithRequest:request delegate:self ];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)aResponse
{
    NSLog(@"aResponse : %@",aResponse.URL);
    
    if(isFinishRequest == true && isFinishAuthorize == false)
    {
        if ([aResponse isKindOfClass:[NSHTTPURLResponse class]]) {
            headerFields = [(NSHTTPURLResponse*)aResponse allHeaderFields]; //This would give you all the header fields;
            NSLog(@"Header Fields : %@",headerFields);
        }
        for (cookie in [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies])
        {
            if( [cookie.name isEqualToString:@"JSESSIONID"] )
            {
                isFinishAuthorize = true;
                
                return;
            }
        }
    }
    if(isFinishAuthorize == true && isFinishRequest == true && isEnd == true && isAA == false)
    {
        NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
        for (NSString *param in [[NSString stringWithFormat:@"%@",aResponse.URL] componentsSeparatedByString:@"&"]) {
            NSArray *elts = [param componentsSeparatedByString:@"="];
            if([elts count] < 2) continue;
            [params setObject:[elts objectAtIndex:1] forKey:[elts objectAtIndex:0]];
        }
        NSLog(@"%@",[params objectForKey:@"oauth_verifier"]);
        verifier = [params objectForKey:@"oauth_verifier"];
    }
}
- (void)oauthAccess
{
    NSLog(@"Access Token");
    OAConsumer *consumer = [[OAConsumer alloc] initWithKey:@"noriterminidar"
                                                    secret:@"noritersuperpower"];
    
    NSURL *url = [NSURL URLWithString:@"http://noritercorp.com:8080/MinidarService/oauth/access_token"];
    
    OAMutableURLRequest *request = [[OAMutableURLRequest alloc] initWithURL:url
                                                                   consumer:consumer
                                                                      token:requestToken   // we don't have a Token yet
                                                                      realm:nil   // our service provider doesn't specify a realm
                                                          signatureProvider:nil]; // use the default method, HMAC-SHA1
    [request setOAuthParameterName:@"oauth_callback" withValue:@""];
    [request setOAuthParameterName:@"oauth_verifier" withValue:verifier];
    [request setHTTPMethod:@"POST"];
    
    OADataFetcher *fetcher = [[OADataFetcher alloc] init];
    
    [fetcher fetchDataWithRequest:request
                         delegate:self
                didFinishSelector:@selector(accessTokenTicket:didFinishWithData:)
                  didFailSelector:@selector(accessTokenTicket:didFailWithError:)];
    
}

- (void)accessTokenTicket:(OAServiceTicket *)ticket didFinishWithData:(NSData *)data {
    NSLog(@"Access Token Ticket");
    NSLog(@"%@",[[NSString alloc] initWithData:data
                                      encoding:NSUTF8StringEncoding]);
    
    if (ticket.didSucceed) {
        NSString *responseBody = [[NSString alloc] initWithData:data
                                                       encoding:NSUTF8StringEncoding];
        accessToken = [[OAToken alloc] initWithHTTPResponseBody:responseBody];
        NSLog(@"Access Token = %@",accessToken);
        
        //        [accessToken storeInDefaultKeychainWithAppName:@"Minidar"                                    serviceProviderName:@"192.168.0.34"];
    }
}

- (void)accessTokenTicket:(OAServiceTicket *)ticket didFailWithError:(NSData *)error {
    NSLog(@"Access Token Ticket Error");
    NSLog(@"%@",[[NSString alloc] initWithData:error
                                      encoding:NSUTF8StringEncoding]);
    if (ticket.didSucceed) {
        NSString *responseBody = [[NSString alloc] initWithData:error
                                                       encoding:NSUTF8StringEncoding];
        accessToken = [[OAToken alloc] initWithHTTPResponseBody:responseBody];
        NSLog(@"Access Token = %@",accessToken);
        
        //[accessToken storeInDefaultKeychainWithAppName:@"Minidar"                                    serviceProviderName:@"192.168.0.34"];
    }
}
@end
