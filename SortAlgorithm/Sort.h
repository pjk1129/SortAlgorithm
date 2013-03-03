//
//  SortManager.h
//  Test
//
//  Created by JK.Peng on 13-2-28.
//  Copyright (c) 2013年 njut. All rights reserved.
//

/*
 *采用objective-c实现常见的排序算法：冒泡算法，选择排序，插入排序，快速排序等经典算法。
 *其中选择排序，插入排序，快速排序实现来自http://www.cnblogs.com/halzhang/archive/2011/10/07/2200631.html
 *在此向原作者表示感谢！
 *
 *欢迎更好，更高效的实现方法，欢迎交流
 *
 */

#import <Foundation/Foundation.h>

@interface Sort : NSObject

/*
 冒泡排序
 
 冒泡排序可以算是最经典的排序算法了，记得小弟上学时最先接触的也就是这个算法了，因为实现方法最简单，两层 for 循环，里层循环中判断相邻两个元素是否逆序，是的话将两个元素交换，外层循环一次，就能将数组中剩下的元素中最小的元素“浮”到最前面，所以称之为冒泡排序。
 */
- (NSArray *)bubbleSortWithArray:(NSArray *)aData;

/*
 选择排序
 
 选择排序的基本思想是遍历数组的过程中，以 i 代表当前需要排序的序号，则需要在剩余的 [i…n-1] 中找出其中的最小值，然后将找到的最小值与 i 指向的值进行交换。因为每一趟确定元素的过程中都会有一个选择最大值的子流程，所以人们形象地称之为选择排序。
 */
-(NSArray *)selectSortWithArray:(NSArray *)aData;

/*
 插入排序
 插入排序的基本思想是在遍历数组的过程中，假设在序号 i 之前的元素即 [0..i-1] 都已经排好序，本趟需要找到 i 对应的元素 x 的正确位置 k ，并且在寻找这个位置 k 的过程中逐个将比较过的元素往后移一位，为元素 x “腾位置”，最后将 k 对应的元素值赋为 x ，插入排序也是根据排序的特性来命名的。
 */
-(NSArray *)insertSortWithArray:(NSArray *)aData;

/*
 快速排序
 快速排序也是用归并方法实现的一个“分而治之”的排序算法，它的魅力之处在于它能在每次partition（排序算法的核心所在）都能为一个数组元素确定其排序最终正确位置（一次就定位准，下次循环就不考虑这个元素了）。
 */
-(NSArray *)quickSortWithArray:(NSArray *)aData;

/*
 希尔排序
 属于插入类排序,是将整个无序列分割成若干小的子序列分别进行插入排序
 排序过程：先取一个正整数d1<n，把所有序号相隔d1的数组元素放一组，组内进行直接插入排序；
 然后取d2<d1，重复上述分组和排序操作；直至di=1，即所有记录放进一个组中排序为止
 */
- (NSArray *)shellSortWithArray:(NSArray *)aData;

/*
 归并排序
 算法思想是每次把待排序列分成两部分，分别对这两部分递归地用归并排序，完成后把这两个子部分合并成一个
 序列。
 归并排序借助一个全局性临时数组来方便对子序列的归并，该算法核心在于归并。
 */
- (NSArray *)mergerSortWithArray:(NSArray *)aData;

/*
 基数排序
 思想：将所有待比较数值（正整数）统一为同样的数位长度，数位较短的数前面补零。然后，从最低位开始，依次进行一次排序。这样从最低位排序一直到最高位排序完成以后,数列就变成一个有序序列。
 */
- (NSArray *)radixSortWithArray:(NSArray *)aData;

@end
