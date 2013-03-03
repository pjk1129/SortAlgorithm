//
//  SortManager.m
//  Test
//
//  Created by JK.Peng on 13-2-28.
//  Copyright (c) 2013年 njut. All rights reserved.
//

#import "Sort.h"
#import <math.h>


@interface Sort()
-(void)quickSortWithArray:(NSArray *)aData left:(NSInteger)left right:(NSInteger)right;
-(void)swapWithData:(NSMutableArray *)aData index1:(NSInteger)index1 index2:(NSInteger)index2;

- (void)sortWithArray:(NSMutableArray *)aData left:(NSInteger)left right:(NSInteger)right;
- (void)mergeWithArray:(NSMutableArray *)aData
                  left:(NSInteger)left
                center:(NSInteger)center
                 right:(NSInteger)right;
@end

@implementation Sort

-(void)dealloc{
    [super dealloc];
}


- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (NSArray *)bubbleSortWithArray:(NSArray *)aData;
{
    NSMutableArray *data = [[[NSMutableArray alloc]initWithArray:aData] autorelease];
    
    int length = [data count];
    for (int i= 1; i < length; i++) {
        
        BOOL isExchanged = NO;
        for (int j = length - 1; j >= i; j--) {
            if ([[data objectAtIndex:j] integerValue] < [[data objectAtIndex:j-1] integerValue]) {
                [self swapWithData:data index1:j index2:j-1];
                isExchanged = YES;
            }
        }
        if (!isExchanged) {
            break;
        }
    }
    
    return data;
}

-(NSArray *)selectSortWithArray:(NSArray *)aData{
    NSMutableArray *data = [[[NSMutableArray alloc] initWithArray:aData] autorelease];
    for (int i=0; i<[data count]-1; i++) {
        int selected =i;
        for (int j =i+1; j<[data count]; j++) {
            if ([[data objectAtIndex:j] integerValue] < [[data objectAtIndex:selected] integerValue]) {
                selected = j;
            }
        }
        if (selected != i) {
            [self swapWithData:data index1:selected index2:i];
        }
    }
    
    return data;
}

-(NSArray *)insertSortWithArray:(NSArray *)aData{
    NSMutableArray *data = [[[NSMutableArray alloc]initWithArray:aData] autorelease];
    for (int i = 1; i < [data count]; i++) {
        id tmp = [data objectAtIndex:i];
        int j = i-1;
        while (j != -1 && [[data objectAtIndex:j] integerValue] > [tmp integerValue]) {
            [data replaceObjectAtIndex:j+1 withObject:[data objectAtIndex:j]];
            j--;
        }
        [data replaceObjectAtIndex:j+1 withObject:tmp];
    }
    return data;
}

-(NSArray *)quickSortWithArray:(NSArray *)aData{
    NSMutableArray *data = [[[NSMutableArray alloc] initWithArray:aData] autorelease];
    [self quickSortWithArray:data left:0 right:[aData count]-1];
    return data;
}

-(void)quickSortWithArray:(NSMutableArray *)aData left:(NSInteger)left right:(NSInteger)right{
    if (right > left) {
        NSInteger i = left;
        NSInteger j = right + 1;
        while (true) {
            //直到找到，比left位置的元素小的元素为止
            while (i+1 < [aData count] && [[aData objectAtIndex:++i] integerValue] < [[aData objectAtIndex:left] integerValue])
            {
                
            }
            
            //直接找到，比left位置的元素大的元素为止
            while (j-1 > -1 && [[aData objectAtIndex:--j] integerValue] > [[aData objectAtIndex:left] integerValue]) ;
            
            //经过上面两步，若i>=j，则跳出while
            if (i >= j) {
                break;
            }
            [self swapWithData:aData index1:i index2:j];
        }
        
        //数组left位置的元素确定其排序最终正确位置
        [self swapWithData:aData index1:left index2:j];
        
        //分别对两个子数组进行遍历
        [self quickSortWithArray:aData left:left right:j-1];
        [self quickSortWithArray:aData left:j+1 right:right];
    }
}

- (NSArray *)shellSortWithArray:(NSArray *)aData;
{
    NSMutableArray *data = [[[NSMutableArray alloc] initWithArray:aData] autorelease];
    int length = [data count];
    for (int h = length / 2; h > 0; h = h / 2) {
        // here is insert sort
        for (int i = h; i < length; i++) {
            NSNumber *temp = [data objectAtIndex:i];
            if ([temp integerValue] < [[data objectAtIndex:i - h] integerValue]) {
                for (int j = 0; j < i; j += h) {
                    if ([temp integerValue] < [[data objectAtIndex:j] integerValue]) {
                        [self swapWithData:data index1:i index2:j];
                    }
                }
            }
        }
        
    }
    return data;
}

- (NSArray *)mergerSortWithArray:(NSArray *)aData
{
    NSMutableArray *data = [[[NSMutableArray alloc] initWithArray:aData] autorelease];
    [self sortWithArray:data left:0 right:[data count]-1];
    return data;
}

- (void)sortWithArray:(NSMutableArray *)aData left:(NSInteger)left right:(NSInteger)right
{
    //用分治法对R[low..high]进行二路归并排序
    if (left<right) {
        //区间长度大于1 
        //找出中间索引
        NSInteger center=(left+right)/2;
        //对左边数组进行递归
        [self sortWithArray:aData left:left right:center];
        //对右边数组进行递归
        [self sortWithArray:aData left:center+1 right:right];
        //组合，将两个有序区归并为一个有序区
        [self mergeWithArray:aData left:left center:center right:right];
    }
}

- (void)mergeWithArray:(NSMutableArray *)aData
                  left:(NSInteger)left
                center:(NSInteger)center
                 right:(NSInteger)right
{    
    //中间数组
    NSMutableArray  *tempArray = [NSMutableArray arrayWithArray:aData];
    NSInteger  mid = center+1;
    
    //记录中间数组的索引
    NSInteger tempLeft = left;
    NSInteger tmpIndex = left;
    while (left<=center&&mid<=right) {
        //从两个数组中取出最小的放入中间数组
        if ([[aData objectAtIndex:left] integerValue] <= [[aData objectAtIndex:mid] integerValue]) {
            [tempArray insertObject:[aData objectAtIndex:left++] atIndex:tempLeft++];
        }else{
            [tempArray insertObject:[aData objectAtIndex:mid++] atIndex:tempLeft++];
        }

    }
    
    //剩余部分依次放入中间数组
    while(mid<=right){
        [tempArray insertObject:[aData objectAtIndex:mid++] atIndex:tempLeft++];
    }
    
    while(left<=center){
        [tempArray insertObject:[aData objectAtIndex:left++] atIndex:tempLeft++];
    }
    
    //将中间数组中的内容复制回原数组
    while(tmpIndex<=right){
        [aData replaceObjectAtIndex:tmpIndex withObject:[tempArray objectAtIndex:tmpIndex++]];
    }
}

- (NSArray *)radixSortWithArray:(NSArray *)aData
{
    NSMutableArray *data = [[[NSMutableArray alloc] initWithArray:aData] autorelease];
    
    //首先确定排序的趟数
    NSInteger maxValue = [[data objectAtIndex:0] integerValue];
    for(NSInteger i=1;i<[data count];i++){
        if([[data objectAtIndex:i] integerValue]>maxValue){
            maxValue = [[data objectAtIndex:i] integerValue];
        }
    }
    
    NSInteger time=0;
    //判断位数
    while(maxValue>0){
        maxValue/=10;
        time++;
    }
    
    //设定10个list保存数据
    NSMutableArray  *queue = [[NSMutableArray alloc] initWithCapacity:10];
    for (NSInteger i=0; i<10; i++) {
        NSMutableArray   *dataQueue = [[NSMutableArray alloc] initWithCapacity:0];
        [queue addObject:dataQueue];
        [dataQueue release];
    }
    
    //开始进行排序
    for (NSInteger i=0; i<time; i++) {
        
        for (NSInteger j=0; j<[data count]; j++) {
            //取到当前这个数的对应位置上的一位数
            NSNumber  *number = [data objectAtIndex:j];
            NSInteger  x = [number integerValue]% (int)pow(10, i+1)/(int)pow(10, i);
            [[queue objectAtIndex:x] addObject:number];
        }
        
        NSInteger count = 0;
        for (NSInteger k = 0; k < 10; k++) {
            NSMutableArray   *tempQueue = [queue objectAtIndex:k];
            while ([tempQueue count] > 0) {
                [data replaceObjectAtIndex:count withObject:[tempQueue objectAtIndex:0]];
                [tempQueue removeObjectAtIndex:0];
                count++;
            }
        }
        
    }

    [queue release];
    return data;
}

-(void)swapWithData:(NSMutableArray *)aData index1:(NSInteger)index1 index2:(NSInteger)index2{
    NSNumber *temp = [aData objectAtIndex:index1];
    [aData replaceObjectAtIndex:index1 withObject:[aData objectAtIndex:index2]];
    [aData replaceObjectAtIndex:index2 withObject:temp];
}

@end
