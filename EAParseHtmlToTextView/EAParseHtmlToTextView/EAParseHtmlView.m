//
//  EAParseHtmlView.m
//  EAParseHtmlToTextView
//
//  Created by Ever Danilo Aliaga Lobos on 23-03-16.
//  Copyright © 2016 Ever Aliaga. All rights reserved.
//

#import "EAParseHtmlView.h"


@interface EAParseHtmlView ()

@property (strong, nonatomic) UITextView * textView;

@end

@implementation EAParseHtmlView

-(id) init
{
    if (self = [super initWithFrame:[[UIScreen mainScreen] bounds]])
    {
        self.backgroundColor = [UIColor whiteColor];
        
        [self setupScrollView];
        [self setupTextView];
        
    }
    
    return self;
}

-(void) setupScrollView
{
    
}

-(void) setupTextView
{
 
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(10,
                                                                 20,
                                                                 CGRectGetWidth(self.frame) - 20,
                                                                 CGRectGetHeight(self.frame) - 20)];
    
    

   [self addSubview:self.textView];
}

-(void) loadHtml:(NSString *) body
{
   // NSString *style = @"<meta charset=\"UTF-8\">";
   // html = [NSString stringWithFormat:@"%@%@", style, html];
    
    NSString * html = [NSString stringWithFormat:@"<html> \n"
                           "<head> \n"
                           "<style type=\"text/css\"> \n"
                           "body {font-family: \"%@\"; font-size: %@; color: %@;}\n"
                           "</style> \n"
                           "</head> \n"
                           "<body>%@</body> \n"
                           "</html>", @"Georgia", [NSNumber numberWithInt:16], @"#000000", body];

    NSAttributedString * attributedString = [[NSAttributedString alloc] initWithData:[html dataUsingEncoding:NSUnicodeStringEncoding]
                                                                            options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType}
                                                                 documentAttributes:nil
                                                                              error:nil];
    self.textView.attributedText = attributedString;
    
    //self.textView.text = html;
}

@end
