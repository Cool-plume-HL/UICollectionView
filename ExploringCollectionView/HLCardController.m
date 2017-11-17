//
//  HLCardController.m
//
//  Created by HeLin on 2017/10/21.
//  Copyright © 2017年 HL. All rights reserved.
//

#import "HLCardController.h"
#import "HLCardCell.h"
#import "HLCardFlowLayout.h"

typedef enum : NSUInteger {
    ControllerEditStatusSimple,
    ControllerEditStatusMutable,
} ControllerEditStatus;

@interface HLCardController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>{
    ControllerEditStatus _status;
}

@property (nonatomic, strong) UICollectionView *collectionView;
@end

static NSString *cellIden = @"CollectionViewCell";

@implementation HLCardController

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(10, 64, self.view.frame.size.width - 2*10, self.view.frame.size.height - 64) collectionViewLayout:[[HLCardFlowLayout alloc]init]];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        [_collectionView registerClass:[HLCardCell class] forCellWithReuseIdentifier:cellIden];
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _status = ControllerEditStatusSimple;
    [self setupInterface];
}

-(void)setupInterface{
    self.view.backgroundColor = [UIColor colorWithRed:41/255.0 green:41/255.0 blue:41/255.0 alpha:1];
    
    CGFloat editBtnW = 33;
    CGFloat editBtnH = 44;
    CGFloat editBtnX = self.view.bounds.size.width - editBtnW;
    CGFloat editBtnY = 20;
    UIButton *editBtn = [[UIButton alloc]initWithFrame:CGRectMake(editBtnX, editBtnY, editBtnW, editBtnH)];
    [editBtn setTitle:@"单选" forState:UIControlStateNormal];
    [editBtn setTitle:@"多选" forState:UIControlStateSelected];
    [editBtn addTarget:self action:@selector(editIDCard:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:editBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    CGFloat printBtnW = 33;
    CGFloat printBtnH = 44;
    CGFloat printBtnX = self.view.bounds.size.width - printBtnW;
    CGFloat printBtnY = 20;
    UIButton *printBtn = [[UIButton alloc]initWithFrame:CGRectMake(printBtnX, printBtnY, printBtnW, printBtnH)];
    [printBtn setTitle:@"打印" forState:UIControlStateNormal];
    [printBtn addTarget:self action:@selector(printCard:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:printBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    [self.view addSubview:self.collectionView];
}

-(void)printCard:(UIButton *)btn{
    NSLog(@"%@",self.collectionView.indexPathsForSelectedItems);
}

-(void)editIDCard:(UIButton *)btn{
    btn.selected = !btn.selected;
    self.collectionView.allowsMultipleSelection = btn.selected;
}


#pragma mark -
#pragma mark -- -- -- -- -- - UICollectView Delegate & DataSource - -- -- -- -- --

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HLCardCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIden forIndexPath:indexPath];
    return cell;
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
