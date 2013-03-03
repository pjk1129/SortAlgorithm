//
//  ViewController.m
//  SortAlgorithm
//
//  Created by JK.Peng on 13-3-2.
//  Copyright (c) 2013年 njut. All rights reserved.
//

#import "ViewController.h"
#import "Sort.h"

@interface ViewController ()

@property (nonatomic, retain) NSMutableArray   *dataArray;
@end

@implementation ViewController
@synthesize dataArray = _dataArray;
@synthesize resultTextView = _resultTextView;

-(void)dealloc{
    [_dataArray release];
    [_resultTextView release];
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.dataArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInteger:6],
                      [NSNumber numberWithInteger:10],
                      [NSNumber numberWithInteger:7],
                      [NSNumber numberWithInteger:9],
                      [NSNumber numberWithInteger:1],
                      [NSNumber numberWithInteger:4],
                      [NSNumber numberWithInteger:3],
                      [NSNumber numberWithInteger:2],
                      [NSNumber numberWithInteger:5],
                      [NSNumber numberWithInteger:8],nil];
}


- (void)viewDidUnload {
    [self setResultTextView:nil];
    [super viewDidUnload];
}

//冒泡排序
- (IBAction)bubbleSort:(id)sender
{
    Sort *sort = [[[Sort alloc] init] autorelease];
    NSArray  *result = [sort bubbleSortWithArray:self.dataArray];
    
    NSLog(@"冒泡排序后的结果：%@",result);
    self.resultTextView.text = [result description];
        
}

//选择排序
- (IBAction)selectSort:(id)sender
{
    Sort *sort = [[[Sort alloc] init] autorelease];
    NSArray  *result = [sort selectSortWithArray:self.dataArray];
    
    NSLog(@"选择排序后的结果：%@",result);
    self.resultTextView.text = [result description];

}

//插入排序
- (IBAction)insertSort:(id)sender
{
    Sort *sort = [[[Sort alloc] init] autorelease];
    NSArray  *result = [sort insertSortWithArray:self.dataArray];
    
    NSLog(@"插入排序后的结果：%@",result);
    self.resultTextView.text = [result description];

}

//快速排序
- (IBAction)quickSort:(id)sender
{
    Sort *sort = [[[Sort alloc] init] autorelease];
    NSArray  *result = [sort quickSortWithArray:self.dataArray];
    
    NSLog(@"快速排序后的结果：%@",result);
    self.resultTextView.text = [result description];

}

//希尔排序
- (IBAction)shellSort:(id)sender
{
    Sort *sort = [[[Sort alloc] init] autorelease];
    NSArray  *result = [sort shellSortWithArray:self.dataArray];
    NSLog(@"希尔排序后的结果：%@",result);
    self.resultTextView.text = [result description];

}

//归并排序
- (IBAction)mergerSort:(id)sender
{
    Sort *sort = [[[Sort alloc] init] autorelease];
    NSArray  *result = [sort mergerSortWithArray:self.dataArray];
    NSLog(@"归并排序后的结果：%@",result);
    self.resultTextView.text = [result description];
}

//基数排序
- (IBAction)radixSort:(id)sender
{
    Sort *sort = [[[Sort alloc] init] autorelease];
    NSArray  *result = [sort radixSortWithArray:self.dataArray];
    NSLog(@"基数排序后的结果：%@",result);
    self.resultTextView.text = [result description];
}

//计数排序
- (IBAction)countingSort:(id)sender
{
    self.resultTextView.text = @"";
}

//小根堆排序
- (IBAction)heapSort:(id)sender
{
    self.resultTextView.text = @"";

}


@end
