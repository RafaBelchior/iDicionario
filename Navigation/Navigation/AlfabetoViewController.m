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
@property UITextField *textField;
@end

@implementation AlfabetoViewController
@synthesize abc, label, imagem, textField;

static int contador=0;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    abc = [Alfabeto instance];
    
    UIBarButtonItem *next = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem = next;
    UIBarButtonItem *previous = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemRewind target:self action:@selector(previous:)];
    self.navigationItem.leftBarButtonItem = previous;
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(100, self.view.center.y-130, self.view.bounds.size.width, 80)];
    self.label.text = abc.palavras[contador];
    [self.view addSubview:self.label];
    self.imagem = [[UIImageView alloc] initWithFrame:CGRectMake(0,self.view.center.y-70, self.view.bounds.size.width, 250)];
    self.imagem.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",self.abc.letras[contador]]];
    [self.view addSubview:self.imagem];
    [self.imagem setAlpha:1];
    
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 60, self.view.bounds.size.width, 50)];
    [toolBar setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:toolBar];
    
    textField = [[UITextField alloc] init];
    textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 250, 25)];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Alterar palavra";
    textField.returnKeyType = UIReturnKeyDone;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    UIBarButtonItem *textFieldBarButton = [[UIBarButtonItem alloc] initWithCustomView:textField];
    UIBarButtonItem *buttonBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemEdit target:self action:@selector(trocarPalavra)];
    [toolBar setItems:@[textFieldBarButton, buttonBarButton]];
}

-(void) viewWillDisappear:(BOOL)animated{
    self.label.hidden = true;
    self.imagem.hidden = true;
}


-(void) viewWillAppear:(BOOL)animated {
    self.title = abc.letras[contador];
    self.label.text = abc.palavras[contador];
    self.label.hidden = false;
    self.textField.text = @"";
    self.imagem.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",self.abc.letras[contador]]];
    self.imagem.hidden = false;
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
//    contTouch = 0;
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
}

-(void)previous:(id)sender{
//    contTouch = 0;
    contador--;
    if (contador == -1) {
        contador = 25;
    }
    AlfabetoViewController *proximo;
    if ([self.navigationController.viewControllers count] >=3) {
        NSMutableArray *views = [[NSMutableArray alloc] initWithArray:self.navigationController.viewControllers];
        proximo = [[AlfabetoViewController alloc] init];
        [views insertObject:proximo atIndex:0];
        self.navigationController.viewControllers = views;
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)trocarPalavra{
    if ([self validateTextField:textField.text]){
        label.text = textField.text;
        [abc.palavras removeObjectAtIndex:contador];
        [abc.palavras insertObject:textField.text atIndex:contador];
        textField.text = @"";
    }
}

static BOOL dragging;
//static int contTouch=0;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.textField resignFirstResponder];
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchLocation = [touch locationInView:self.view];
    if (CGRectContainsPoint(imagem.frame, touchLocation)) {
        dragging = YES;
    [UIView animateWithDuration:0.5
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^ {
                         
                         imagem.transform = CGAffineTransformMakeScale(1.2, 1.2);
                         
                     }completion:^(BOOL finished) {
                         
                     }];
    }
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    dragging = NO;
//    contTouch++;
    
    [UIView animateWithDuration:0.5
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^ {
                         
                         imagem.transform = CGAffineTransformMakeScale(1, 1);
                         
                     }completion:^(BOOL finished) {
                         
                     }];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchLocation = [touch locationInView:self.view];
        if (dragging) {
            imagem.center = touchLocation;
            
//            if (frame.origin.y <= label.frame.origin.y) {
//                frame.origin.y += imagem.frame.origin.y + 40;
//                frame.origin.x = label.frame.origin.x;
//                label.frame = frame;
//            }
//            
//            if (frame.origin.y > label.frame.origin.y) {
//                frame.origin.y -= imagem.frame.origin.y - 40;
//                frame.origin.x = label.frame.origin.x;
//                label.frame = frame;
//            }
        }
        
    
    
    
}

-(BOOL) validateTextField:(NSString *)termo{
    //Implementar RegEx;
    NSError *error;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"^[A-Z0-9a-z]{1,100}$" options:NSRegularExpressionCaseInsensitive error:&error];
    NSTextCheckingResult *match = [regex firstMatchInString:termo options:0 range:NSMakeRange(0, [termo length])];
    
    return match;
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
