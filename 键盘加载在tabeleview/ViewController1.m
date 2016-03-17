//
//  ViewController1.m
//  键盘加载在tabeleview
//
//  Created by MAC mini1 on 16/3/17.
//  Copyright © 2016年 MAC mini1. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>{
    
    
    UITableView *_tab;
    
    NSMutableArray *_dataArray;

    
}

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
    // Do any additional setup after loading the view.
}

-(void)setUpUI{
    
    self.title = @"智能键盘";
    _dataArray = [[NSMutableArray alloc]initWithObjects:@"邮箱",@"地址",@"身份证",@"姓名" ,nil];
    _tab = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    _tab.delegate = self;
    _tab.dataSource = self;
    _tab.rowHeight = 50;
    _tab.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:_tab];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
   
    static NSString *CellIdentifier = @"Cell";
  
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        }
    
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, cell.frame.size.width, 40)];
    textField.delegate = self;
    textField.tag = indexPath.row;
    textField.backgroundColor = [UIColor grayColor];
    textField.placeholder = _dataArray[indexPath.row];
    textField.userInteractionEnabled = YES;
    [cell addSubview: textField];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if ((tableView = _tab)) {
        
        NSTimeInterval anmiation = 0.30f;
        [UIView beginAnimations:@"ResizeForkeyboard" context:nil];
        [UIView setAnimationDuration:anmiation];
        tableView.contentOffset = CGPointMake(0, 50*indexPath.row-64);
        [UIView commitAnimations];
        
    }
    
    
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    [self  tableView:_tab didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:textField.tag inSection:0]];
    
}

//当点击return 键的时候通知代理调用下面的函数
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
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

@end
