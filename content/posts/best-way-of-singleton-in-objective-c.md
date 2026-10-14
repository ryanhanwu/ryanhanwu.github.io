---
title: "Best way of singleton in Objective-C"
description: "It’s very useful during iOS development"
publishDate: "2013-07-01T04:46:39.000Z"
tags: ["ios","singleton","design-pattern","coding"]
---

It’s very useful during iOS development

```plain
static GeneralData __strong *generalDataObject = nil;
 
@synthesize currentUser;
 
+(GeneralData *) getInstance
{
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        generalDataObject = [self new];
    });
    return generalDataObject;
}
```

### Usage

1.  Add Data
    
    ```plain
    #import "GeneralData.h";
    
    - (IBAction) passValueButton:(id)sender { 
    {
        User *user = [User new];
        user.name = "Mary Jane";
        user.age = "21";
        [GeneralData sharedInstance].currentUser = user;
    }
    ```
    
2.  Read Data
    
    ```plain
    #import "GeneralData.h";
    
    - (void)viewDidLoad
    {
        [super viewDidLoad];
        User *loggedInUser = [GeneralData sharedInstance].currentUser;
        NSLog(@"Name : %@", loggedInUser.name);
        NSLog(@"Age : %@", loggedInUser.age);
        
    }
    ```
    

Reference : [StackOverflow](http://stackoverflow.com/questions/5720029/create-singleton-using-gcds-dispatch-once-in-objective-c)
