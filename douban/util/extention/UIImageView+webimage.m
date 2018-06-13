//
//  UIImageView+webimage.m
//  douban
//
//  Created by 步宇星 on 2018/6/12.
//  Copyright © 2018年 步宇星. All rights reserved.
//

#import "UIImageView+webimage.h"
#import "GetRequest.h"

@implementation UIImageView (webimage)

- (void) setUrl:(NSString *)url
    placeholder:(UIImage *)placeholder
{
    self.image = placeholder;
    [[GetRequest requestWithURL:url params:nil delegate:(id<BaseRequestDelegate>)self] start];
}

- (void) requestDidFinished:(BaseRequest *)request{
    self.image = [UIImage imageWithData:request.responseData];
}

- (void) requestDidFailed:(BaseRequest *)request{
    
}

@end
