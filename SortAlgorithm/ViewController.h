//
//  ViewController.h
//  SortAlgorithm
//
//  Created by JK.Peng on 13-3-2.
//  Copyright (c) 2013年 njut. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (retain, nonatomic) IBOutlet UITextView *resultTextView;

//冒泡排序
- (IBAction)bubbleSort:(id)sender;

//快速排序
- (IBAction)quickSort:(id)sender;

//插入排序
- (IBAction)insertSort:(id)sender;

//选择排序
- (IBAction)selectSort:(id)sender;

//基数排序
- (IBAction)radixSort:(id)sender;

//计数排序
- (IBAction)countingSort:(id)sender;

//希尔排序
- (IBAction)shellSort:(id)sender;

//归并排序
- (IBAction)mergerSort:(id)sender;

//小根堆排序
- (IBAction)heapSort:(id)sender;

@end
