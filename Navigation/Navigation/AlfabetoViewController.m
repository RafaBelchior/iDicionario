//
//  AlfabetoViewController.m
//  Navigation
//
//  Created by Rafael Souza Belchior da Silva on 19/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "AlfabetoViewController.h"
#import "Alfabeto.h"

@interface AlfabetoViewController ()
@property Alfabeto *abc;
@property UILabel *label;
@property UIImageView *imagem;
@end

@implementation AlfabetoViewController
@synthesize abc, label, imagem;

static int contador=0;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    abc = [Alfabeto instance];
    abc = [abc initWithLetras];
    
    UIBarButtonItem *next = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem = next;
    UIBarButtonItem *previous = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemRewind target:self action:@selector(previous:)];
    self.navigationItem.leftBarButtonItem = previous;
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(100, self.view.center.y, 200, 40)];
    self.label.text = abc.palavras[contador];
    [self.view addSubview:self.label];
    
    self.imagem = [[UIImageView alloc] initWithFrame:CGRectMake(100,self.view.center.y+100, 200, 200)];
    self.imagem.image = [UIImage imageNamed:@"alpha.png"];
    [self.view addSubview:self.imagem];
    
}

-(void) viewWillDisappear:(BOOL)animated{
    self.label.hidden = true;
    self.imagem.hidden = true;
}

-(void) viewWillAppear:(BOOL)animated {
    self.label.text = abc.palavras[contador];
    self.label.hidden = false;

}

-(void) viewDidAppear:(BOOL)animated{
    [UIView animateWithDuration:1 animations:^{
        [imagem setAlpha:0];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1 animations:^{
            [imagem setAlpha:1];
        } completion:nil];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)next:(id)sender {
    contador++;
    if (contador == 26) {
        contador = 0;
    }
    
    AlfabetoViewController *proximo;
    if ([self.navigationController.viewControllers count] >= 3) {
        NSMutableArray *views = [[NSMutableArray alloc] initWithArray:self.navigationController.viewControllers];
        proximo = [views objectAtIndex:0];
        [views removeObject:[views objectAtIndex:0]];
        self.navigationController.viewControllers = views;

    }else{
        proximo = [[AlfabetoViewController alloc]init];

    }
    [self.navigationController pushViewController:proximo animated:YES];
//    NSLog(@"%lu %d",[self.navigationController.viewControllers count], contador);
}

-(void)previous:(id)sender{
    contador--;
    if (contador == -1) {
        contador = 25;
    }
    //Chega a 4 controllers!!
    AlfabetoViewController *proximo;
    if ([self.navigationController.viewControllers count] >=3) {
        NSMutableArray *views = [[NSMutableArray alloc] initWithArray:self.navigationController.viewControllers];
        proximo = [[AlfabetoViewController alloc] init];
        [views insertObject:proximo atIndex:0];
        self.navigationController.viewControllers = views;
    }
//    NSLog(@"%lu %d",[self.navigationController.viewControllers count], contador);
    
    [self.navigationController popViewControllerAnimated:YES];
//    NSLog(@"%lu %d",[self.navigationController.viewControllers count], contador);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
