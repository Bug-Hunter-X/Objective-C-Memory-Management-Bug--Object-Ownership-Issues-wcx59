To fix the memory leak in the original code, ensure that the string's ownership is appropriately managed, depending on the class's design. Here are two potential solutions:

**Solution 1: Using `copy` instead of `strong`:** 
If `MyClass` does not need to retain the original string instance, the property should be declared with the `copy` attribute:
```objectivec
@interface MyClass : NSObject
@property (copy, nonatomic) NSString *myString;
@end
```
With this solution, the string is copied internally, therefore solving the memory management problem. This approach is safer and often preferable if the original string isn't expected to change and won't cause retain cycles.

**Solution 2:  Explicitly managing memory (if using non-ARC):**
If you're not using ARC (Automatic Reference Counting), and the class *does* need to retain the string, you must release it when it is no longer required. For instance, you may need to explicitly release the `myString` property within a `dealloc` method or at other appropriate points in your class's lifecycle:
```objectivec
@implementation MyClass
- (void)someMethod:(NSString *)aString {
    if (self.myString) {
        [self.myString release];
    }
    self.myString = [aString retain]; // Retain aString 
}

- (void)dealloc {
    [self.myString release];
    [super dealloc];
}
@end
```
**Note:** This example is for non-ARC Objective-C. In modern Objective-C development, ARC is almost universally used, making explicit memory management unnecessary and Solution 1 or modern approaches to memory management are preferred.  Avoid manual memory management unless absolutely necessary.