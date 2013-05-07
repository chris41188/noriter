//
//  MonthViewController.m
//  empty
//
//  Created by echo on 13. 4. 29..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import "MonthViewController.h"


@implementation MonthViewController
#define sh self.view.frame.size.height/6*3
#define h_n self.view.frame.size.height/6
#define w_n self.view.frame.size.width/7


- (void)viewDidLoad
{
    [super viewDidLoad];
}
-(void)viewDidAppear:(BOOL)animated
{
    TVC = [TableViewController makeChildTVC:self frame:self.view.frame];
    
    [TVC.view setHidden:YES];
    NSLog(@"in view did appear TVC view is %@",TVC.view);
    DB = [DataBase sharedDataBase];
    arrMDVC = [[NSMutableArray alloc]init];
    arrMDV = [[NSMutableArray alloc]init];
    intActioning = 0;
    isOpen = false;
    int i=0,l=0;
    now = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSWeekdayCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit fromDate:[NSDate date]];
    [now setDay:1];
    self.view.clipsToBounds = YES;

    for(i=0;i<6;i++)
    {
        for(l=0;l<7;l++)
        {
            MonthDayView* MDV = [[MonthDayView alloc] init];
            MDV.frame = CGRectMake(l*w_n, i*h_n, w_n, h_n);
            [arrMDV addObject:MDV];
            [self.view addSubview:MDV];
            [MDV setRow:i];
            [MDV setCol:l];
            
            NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
            [offsetComponents setDay:-[now weekday]+1+i*7+l];
            NSDateComponents *dateComponent = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSWeekdayCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit fromDate:[[NSCalendar currentCalendar] dateByAddingComponents:offsetComponents toDate:[[NSCalendar currentCalendar] dateFromComponents:now] options:0]];
            
            [MDV.label setText:[NSString stringWithFormat:@"%d/%d",[dateComponent month],[dateComponent day]]];
            [MDV setMVC:self];
            
        }
    }
}
-(void)expandRow:(int)row Col:(int)col
{
    NSLog(@"%@",self.view);
    NSLog(@"%d , %d %d %d",row,col,isOpen,intActioning);
    int i,l;    
    if(isOpen == false && intActioning == 0) // it's mean, in this time will open.
    {
        preCol = col, preRow = row;
        isOpen = true;
        NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
        [offsetComponents setDay:-[now weekday]+1+row*7+col];
        NSDateComponents *dateComponent = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSWeekdayCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit fromDate:[[NSCalendar currentCalendar] dateByAddingComponents:offsetComponents toDate:[[NSCalendar currentCalendar] dateFromComponents:now] options:0]];
        [TVC setData:[[DB.array objectAtIndex:[dateComponent month]-1] objectAtIndex:[dateComponent day]-1]];
        [TVC.view setHidden:NO];
        
        //up//
        if(row==5)
        {
            //up sh
            for(i=0;i<=row;i++)
            {
                for (l=0; l<7; l++)
                {
                    MonthDayView *MDV = [arrMDV objectAtIndex:i*7+l];
                    [UIView animateWithDuration:0.3 animations:^(void) {
                        intActioning++; //NSLog(@"%d",intActioning);
                        MDV.frame = CGRectApplyAffineTransform(MDV.frame, CGAffineTransformMakeTranslation(0, -(sh)));
                    } completion:^(BOOL finished) {
                        intActioning--; //NSLog(@"%d",intActioning);
                    }];
                }
            }
            //and TVC do..
            TVC.view.frame = CGRectMake(0, h_n*6, self.view.frame.size.width, 0);
            [UIView animateWithDuration:0.3 animations:^(void) {
                intActioning++; //NSLog(@"%d",intActioning);
                TVC.view.frame = CGRectMake(0,6*h_n-sh,self.view.frame.size.width,sh);
            } completion:^(BOOL finished) {
                intActioning--; //NSLog(@"%d",intActioning);
            }];
            
        }
        else if(row == 0)
        {
            // no up//
            //and TVC do..
            TVC.view.frame = CGRectMake(0, h_n, self.view.frame.size.width, 0);
            [UIView animateWithDuration:0.3 animations:^(void) {
                intActioning++; //NSLog(@"%d",intActioning);
                TVC.view.frame = CGRectMake(0,h_n,self.view.frame.size.width,sh);
            } completion:^(BOOL finished) {
                intActioning--; //NSLog(@"%d",intActioning);
            }];
        }
        else
        {
            //up sh-(4-k)*h/n
            for(i=0;i<=row;i++)
            {
                for (l=0; l<7; l++)
                {
                    MonthDayView *MDV = [arrMDV objectAtIndex:i*7+l];
                    [UIView animateWithDuration:0.3 animations:^(void) {
                        intActioning++; //NSLog(@"%d",intActioning);
                        MDV.frame = CGRectApplyAffineTransform(MDV.frame, CGAffineTransformMakeTranslation(0, -(sh-(4-row)*h_n)));
                    } completion:^(BOOL finished) {
                        intActioning--; //NSLog(@"%d",intActioning);
                    }];
                }
            }
            //and TVC do..
            TVC.view.frame = CGRectMake(0, (1+row)*h_n, self.view.frame.size.width, 0);
            [UIView animateWithDuration:0.3 animations:^(void) {
                intActioning++; //NSLog(@"%d",intActioning);
                TVC.view.frame = CGRectMake(0,(1+row)*h_n-(sh-(4-row)*h_n),self.view.frame.size.width,sh);
            } completion:^(BOOL finished) {
                intActioning--; //NSLog(@"%d",intActioning);
            }];
        }
        
        
        //down//
        if(row==5)
        {
            //no down
        }
        else if(row == 0)
        {
            //down sh//
            for(i=row+1;i<6;i++)
            {
                for (l=0; l<7; l++)
                {
                    MonthDayView *MDV = [arrMDV objectAtIndex:i*7+l];
                    [UIView animateWithDuration:0.3 animations:^(void) {
                        intActioning++; //NSLog(@"%d",intActioning);
                        MDV.frame = CGRectApplyAffineTransform(MDV.frame, CGAffineTransformMakeTranslation(0, sh));// CGAffineTransformMakeTranslation(0,sh);
                    } completion:^(BOOL finished) {
                        intActioning--; //NSLog(@"%d",intActioning);
                    }];
                }
            }
        }
        else
        {
            //down sh-(4-k)*h/n
            for(i=row+1;i<6;i++)
            {
                for (l=0; l<7; l++)
                {
                    MonthDayView *MDV = [arrMDV objectAtIndex:i*7+l];
                    [UIView animateWithDuration:0.3 animations:^(void) {
                        intActioning++; //NSLog(@"%d",intActioning);
                        MDV.frame = CGRectApplyAffineTransform(MDV.frame, CGAffineTransformMakeTranslation(0,(4-row)*h_n));
                    } completion:^(BOOL finished) {
                        intActioning--; //NSLog(@"%d",intActioning);
                    }];
                }
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    else if(isOpen == true && intActioning == 0)
    {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [TVC.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
        
        isOpen = false;
        //up//
        if(preRow==5)
        {
            //up sh
            for(i=0;i<=preRow;i++)
            {
                for (l=0; l<7; l++)
                {
                    MonthDayView *MDV = [arrMDV objectAtIndex:i*7+l];
                    [UIView animateWithDuration:0.3 animations:^(void) {
                        intActioning++; //NSLog(@"%d",intActioning);
                        MDV.frame = CGRectApplyAffineTransform(MDV.frame, CGAffineTransformMakeTranslation(0, sh));
                    } completion:^(BOOL finished) {
                        intActioning--; //NSLog(@"%d",intActioning);
                    }];
                }
            }
            [UIView animateWithDuration:0.3 animations:^(void) {
                intActioning++; //NSLog(@"%d",intActioning);
                TVC.view.frame = CGRectMake(0,6*h_n,self.view.frame.size.width,0);
            } completion:^(BOOL finished) {
                intActioning--; //NSLog(@"%d",intActioning);
                [TVC.view setHidden:YES];
            }];
            
        }
        else if(preRow == 0)
        {
            // no up//
            [UIView animateWithDuration:0.3 animations:^(void) {
                intActioning++; //NSLog(@"%d",intActioning);
                TVC.view.frame = CGRectMake(0,h_n,self.view.frame.size.width,0);
            } completion:^(BOOL finished) {
                intActioning--; //NSLog(@"%d",intActioning);
                [TVC.view setHidden:YES];
            }];
        }
        else
        {
            //up sh-(4-k)*h/n
            for(i=0;i<=preRow;i++)
            {
                for (l=0; l<7; l++)
                {
                    MonthDayView *MDV = [arrMDV objectAtIndex:i*7+l];
                    [UIView animateWithDuration:0.3 animations:^(void) {
                        intActioning++; //NSLog(@"%d",intActioning);
                        MDV.frame = CGRectApplyAffineTransform(MDV.frame, CGAffineTransformMakeTranslation(0, sh-(4-preRow)*h_n));
                    } completion:^(BOOL finished) {
                        intActioning--; //NSLog(@"%d",intActioning);
                    }];
                }
            }
        }
        
        
        //down//
        if(preRow==5)
        {
            //no down
        }
        else if(preRow == 0)
        {
            //down sh//
            for(i=preRow+1;i<6;i++)
            {
                for (l=0; l<7; l++)
                {
                    MonthDayView *MDV = [arrMDV objectAtIndex:i*7+l];
                    [UIView animateWithDuration:0.3 animations:^(void) {
                        intActioning++; //NSLog(@"%d",intActioning);
                        MDV.frame = CGRectApplyAffineTransform(MDV.frame, CGAffineTransformMakeTranslation(0, -(sh)));
                    } completion:^(BOOL finished) {
                        intActioning--; //NSLog(@"%d",intActioning);
                    }];
                }
            }
        }
        else
        {
            //down sh-(4-k)*h/n
            for(i=preRow+1;i<6;i++)
            {
                for (l=0; l<7; l++)
                {
                    MonthDayView *MDV = [arrMDV objectAtIndex:i*7+l];
                    [UIView animateWithDuration:0.3 animations:^(void) {
                        intActioning++; //NSLog(@"%d",intActioning);
                        MDV.frame = CGRectApplyAffineTransform(MDV.frame, CGAffineTransformMakeTranslation(0,-(4-preRow)*h_n));
                    } completion:^(BOOL finished) {
                        intActioning--; //NSLog(@"%d",intActioning);
                    }];
                }
            }
            
            //and TVC do..
            [UIView animateWithDuration:0.3 animations:^(void) {
                intActioning++; //NSLog(@"%d",intActioning);
                TVC.view.frame = CGRectMake(0, (1+row)*h_n, self.view.frame.size.width, 0);
            } completion:^(BOOL finished) {
                intActioning--; //NSLog(@"%d",intActioning);
                [TVC.view setHidden:YES];
            }];
            
        }
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
