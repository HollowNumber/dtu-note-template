#import "../src/lib.typ": dtu-note, code-block

#show: dtu-note.with(
  course: "02101",
  title: "Code Examples",
  author: "Developer"
)

= Programming Examples

== Python Code

#code-block(caption: "Python Algorithm")[
```python
def quicksort(arr):
    if len(arr) <= 1:
        return arr
    
    pivot = arr[len(arr) // 2]
    left = [x for x in arr if x < pivot]
    middle = [x for x in arr if x == pivot]
    right = [x for x in arr if x > pivot]
    
    return quicksort(left) + middle + quicksort(right)

# Example usage
numbers = [3, 6, 8, 10, 1, 2, 1]
print(quicksort(numbers))
```
]

== Java Code

#code-block(caption: "Java Class Example")[
```java
public class BinarySearch {
    public static int search(int[] arr, int target) {
        int left = 0;
        int right = arr.length - 1;
        
        while (left <= right) {
            int mid = left + (right - left) / 2;
            
            if (arr[mid] == target) {
                return mid;
            }
            
            if (arr[mid] < target) {
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }
        
        return -1;
    }
}
```
]

== C Code

#code-block(caption: "C Implementation")[
```c
#include <stdio.h>
#include <stdlib.h>

typedef struct Node {
    int data;
    struct Node* next;
} Node;

Node* createNode(int data) {
    Node* newNode = malloc(sizeof(Node));
    newNode->data = data;
    newNode->next = NULL;
    return newNode;
}

void printList(Node* head) {
    while (head != NULL) {
        printf("%d -> ", head->data);
        head = head->next;
    }
    printf("NULL\n");
}
```
]

== TypeScript Code

#code-block(caption: "TypeScript Interface")[
```typescript
interface Student {
    id: number;
    name: string;
    courses: Course[];
    gpa?: number;
}

interface Course {
    code: string;
    name: string;
    credits: number;
    grade: 'A' | 'B' | 'C' | 'D' | 'F';
}

class GradeCalculator {
    static calculateGPA(student: Student): number {
        const gradePoints = { 'A': 4, 'B': 3, 'C': 2, 'D': 1, 'F': 0 };
        
        const totalPoints = student.courses.reduce((sum, course) => 
            sum + gradePoints[course.grade] * course.credits, 0
        );
        
        const totalCredits = student.courses.reduce((sum, course) => 
            sum + course.credits, 0
        );
        
        return totalCredits > 0 ? totalPoints / totalCredits : 0;
    }
}
```
]

= Advanced Features

The enhanced DTU template now supports:

- Syntax highlighting with `codelst`
- Multiple programming languages
- Code captions and numbering
- Consistent DTU styling
- Professional code presentation
