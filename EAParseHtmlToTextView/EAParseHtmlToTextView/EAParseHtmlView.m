//
//  EAParseHtmlView.m
//  EAParseHtmlToTextView
//
//  Created by Ever Danilo Aliaga Lobos on 23-03-16.
//  Copyright © 2016 Ever Aliaga. All rights reserved.
//

#import "EAParseHtmlView.h"


@interface EAParseHtmlView ()



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
    
    self.textView.editable = NO;
    self.textView.selectable = true;
    self.textView.dataDetectorTypes = UIDataDetectorTypeLink;
    self.textView.delegate = self;
    self.textView.delaysContentTouches = NO;
    self.textView.tintColor = [UIColor redColor];
    
    
   [self addSubview:self.textView];
}

-(void) loadHtml:(NSString *) html style:(NSString *) style
{
    NSString * body = [html stringByReplacingOccurrencesOfString:@"\\n"
                                                     withString:@""];
    body = [body stringByReplacingOccurrencesOfString:@"\\"
                                           withString:@""];
    
    
    body = [body stringByReplacingOccurrencesOfString:@"class=\"azuldestacado\""
                                           withString:@""];
    
    NSString * htmlWithBody = [NSString stringWithFormat:@"<!DOCTYPE html> "
                           "<html> \n"
                           "<head> \n"
                           "<meta charset=\"UTF-8\">"
                           "<style type=\"text/css\"> \n"
                           "%@"
                           "</style> \n"
                           "</head> \n"
                           "<body>%@</body> \n"
                           "</html>", style, body]; // @"Georgia", [NSNumber numberWithInt:16], @"#000000"
    
     NSLog(@"%@", htmlWithBody);

    NSAttributedString * attributedString = [[NSAttributedString alloc] initWithData:[htmlWithBody dataUsingEncoding:NSUTF8StringEncoding]
                                                                            options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType}
                                                                 documentAttributes:nil
                                                                              error:nil];
    

    self.textView.attributedText = attributedString;

}

#pragma mark - UITextViewDelegate
- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange
{
    return TRUE;
}


@end
