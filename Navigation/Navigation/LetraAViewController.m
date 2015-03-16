//
//  LetraAViewController.m
//  Navigation
//
//  Created by Vinicius Miana on 2/23/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "LetraAViewController.h"

@implementation LetraAViewController
@synthesize elemento, ib, abc;

-(void) viewDidLoad {
    [super viewDidLoad];
    NSUInteger viewControllerCount = self.navigationController.viewControllers.count;
    ib = viewControllerCount;
    
    abc = [Alfabeto instance];
    abc = [abc initWithLetras];
    self.title = abc.titles[viewControllerCount-2];
    
    if (viewControllerCount > 26) {
        
    }else{
        UIBarButtonItem *next = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
        self.navigationItem.rightBarButtonItem = next;
    }
    
    //    UIButton *botao = [UIButton buttonWithType:UIButtonTypeSystem];
    //    [botao setTitle:@"Mostre uma palavra, uma figura e leia a palavra ao apertar um botao" forState:UIControlStateNormal];
    //    [botao sizeToFit];
    //    botao.center = self.view.center;
    
    //    [self.view addSubview:botao];
    
    
}

-(void)next:(id)sender {
    LetraAViewController *proximo = [[LetraAViewController alloc] initWithNibName:nil bundle:NULL];
    [self.navigationController pushViewController:proximo animated:YES];
}


@end
