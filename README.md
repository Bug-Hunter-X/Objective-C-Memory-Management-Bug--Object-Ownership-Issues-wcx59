# Objective-C Memory Management Bug: Object Ownership Issues

This repository demonstrates a common bug in Objective-C related to memory management.  The bug involves improper handling of object ownership within methods, potentially leading to memory leaks or crashes. The solution highlights best practices for avoiding this type of error.

## Bug Description

The bug lies in the `someMethod` of `MyClass`. When a string is passed to the method it is retained via the `self.myString` property, but there's no mechanism to release the string when it's no longer needed, leading to a memory leak. If this method was called repeatedly, memory consumption would grow until the application crashed.

## Solution

The solution addresses the memory leak by ensuring the `myString` property is properly managed.  There are several approaches depending on how `myString` is utilized within the class. 