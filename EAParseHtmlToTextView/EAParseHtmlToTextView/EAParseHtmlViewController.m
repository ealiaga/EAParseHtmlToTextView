//
//  EAParseHtmlViewController.m
//  EAParseHtmlToTextView
//
//  Created by Ever Danilo Aliaga Lobos on 23-03-16.
//  Copyright © 2016 Ever Aliaga. All rights reserved.
//

#import "EAParseHtmlViewController.h"
#import "EAParseHtmlView.h"


@interface EAParseHtmlViewController ()

@property (strong, nonatomic) EAParseHtmlView * eaParseHtmlView;

@end

@implementation EAParseHtmlViewController

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


-(void) loadView
{
    [super loadView];
    
    self.eaParseHtmlView = [[EAParseHtmlView alloc] init];
    self.view = self.eaParseHtmlView;
    
}

-(void) viewDidLoad
{
    [super viewDidLoad];
    
    NSString * path = [[NSBundle mainBundle] pathForResource:@"content HTML" ofType:@"html"];
    FILE * htmlFile = fopen([path cStringUsingEncoding:1],"r");
    if (htmlFile == NULL){
        NSLog(@"File not found.");
        return;
    }
    
    NSError * error;
    NSString * htmlString = [NSString stringWithContentsOfFile:path
                                                 encoding: NSUTF8StringEncoding error:&error];
   
    
    NSString * pathStyle = [[NSBundle mainBundle] pathForResource:@"style" ofType:@"css"];
    FILE * styleFile = fopen([path cStringUsingEncoding:1],"r");
    if (styleFile == NULL){
        NSLog(@"File not found.");
        return;
    }
   
    NSString * styleString = [NSString stringWithContentsOfFile:pathStyle
                                                      encoding: NSUTF8StringEncoding error:&error];
    NSLog(@"%@", styleString);
    
    [self.eaParseHtmlView loadHtml:htmlString style:styleString];
}




@end
