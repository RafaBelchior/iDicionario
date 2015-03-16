//
//  ViewController.m
//  Navigation
//
//  Created by Rafael Souza Belchior da Silva on 16/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "ViewController.h"
#import "LetraAViewController.h"
#import "Alfabeto.h"

@interface ViewController ()
@property UITextField *textField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBarButtonItem *next = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem = next;
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 200, 20)];
    [self.textField setBorderStyle:UITextBorderStyleRoundedRect];
    self.textField.center = self.view.center;
    
    [self.view addSubview:self.textField];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

-(void)next:(id)sender {
    LetraAViewController *proximo = [[LetraAViewController alloc] initWithNibName:nil bundle:NULL];
    [self.navigationController pushViewController:proximo animated:YES];
    proximo.ib = 0;
}

@end
