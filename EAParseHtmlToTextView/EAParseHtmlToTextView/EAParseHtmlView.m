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
        
        [self setupTextView];
        
    }
    
    return self;
}


-(void) setupTextView
{
 
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(10,
                                                                 20,
                                                                 CGRectGetWidth(self.frame) - 20,
                                                                 CGRectGetHeight(self.frame) - 20)];
    
    

   [self addSubview:self.textView];
}

-(void) loadHtml:(NSString *) html
{
    NSString * body = [html stringByReplacingOccurrencesOfString:@"\\n"
                                                     withString:@""];
    body = [body stringByReplacingOccurrencesOfString:@"\\"
                                           withString:@""];

    
    NSLog(@"%@", body);
    
    NSString * htmlWithBody = [NSString stringWithFormat:@"<html> \n"
                           "<head> \n"
                           "<meta charset=\"UTF-8\">"
                           "<style type=\"text/css\"> \n"
                           "body {font-family: \"%@\"; font-size: %@; color: %@;}\n"
                           "a {text-decoration: none;}\n"
                           ".azuldestacado {color: red;}\n"
                           "</style> \n"
                           "</head> \n"
                           "<body>%@</body> \n"
                           "</html>", @"Georgia", [NSNumber numberWithInt:16], @"#000000", body];

    NSAttributedString * attributedString = [[NSAttributedString alloc] initWithData:[htmlWithBody dataUsingEncoding:NSUnicodeStringEncoding]
                                                                            options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType}
                                                                 documentAttributes:nil
                                                                              error:nil];
    self.textView.attributedText = attributedString;

}

@end
