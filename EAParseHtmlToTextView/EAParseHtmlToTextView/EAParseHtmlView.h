//
//  EAParseHtmlView.h
//  EAParseHtmlToTextView
//
//  Created by Ever Danilo Aliaga Lobos on 23-03-16.
//  Copyright © 2016 Ever Aliaga. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EAParseHtmlView : UIView<UITextViewDelegate>

@property (strong, nonatomic) UITextView * textView;

-(id) init;
-(void) loadHtml:(NSString *) body style:(NSString *) style;

@end
