#import "../src/lib.typ": dtu-note, definition, theorem, example, important, note-box, dtu-highlight

#show: dtu-note.with(
  course: "02101",
  course-name: "Introduction to Programming", 
  title: "Data Structures and Algorithms",
  date: datetime(year: 2024, month: 3, day: 15),
  author: "Student Name",
  semester: "Spring 2024"
)

= Introduction to Data Structures

Data structures are fundamental building blocks in computer science that allow us to organize and store data efficiently.

== What is a Data Structure?

#definition("Data Structure", [
  A data structure is a particular way of organizing data in a computer so that it can be used effectively.
])

The choice of data structure often depends on the specific requirements of your program:
- How will the data be accessed?
- How often will data be inserted or removed?  
- What are the memory constraints?

== Common Data Structures

=== Arrays

Arrays are the most basic data structure, storing elements of the same type in contiguous memory locations.

#example([
  In Python, we can create an array (list) like this:
  ```python
  numbers = [1, 2, 3, 4, 5]
  print(numbers[0])  # Output: 1
  ```
])

#important([
  Array indexing typically starts at 0 in most programming languages!
])

=== Linked Lists

A linked list is a linear data structure where elements are stored in nodes, and each node contains data and a reference to the next node.

#theorem(name: "Linked List Access Time", [
  Accessing an element at position $n$ in a linked list requires $O(n)$ time complexity.
])

Advantages of linked lists:
- Dynamic size
- Efficient insertion/deletion at the beginning

Disadvantages:
- No random access
- Extra memory overhead for pointers

=== Stacks

A stack follows the Last-In-First-Out (LIFO) principle.

#note-box([
  Think of a stack of plates - you can only add or remove plates from the top!
])

Key operations:
- *Push*: Add element to top
- *Pop*: Remove element from top  
- *Peek/Top*: Look at top element without removing

=== Queues

A queue follows the First-In-First-Out (FIFO) principle.

Basic queue operations:
- *Enqueue*: Add element to rear
- *Dequeue*: Remove element from front

== Time Complexity Analysis

Understanding the efficiency of operations is crucial:

| Operation | Array | Linked List | Stack | Queue |
|-----------|-------|-------------|-------|-------|
| Access    | O(1)  | O(n)        | O(1)  | O(1)  |
| Search    | O(n)  | O(n)        | O(n)  | O(n)  |
| Insertion | O(n)  | O(1)        | O(1)  | O(1)  |
| Deletion  | O(n)  | O(1)        | O(1)  | O(1)  |

#dtu-highlight([
  Big O notation describes the upper bound of time complexity as input size approaches infinity.
])

== Mathematical Foundations

Many data structure operations can be analyzed mathematically.

For a binary search on a sorted array of size $n$:
$ T(n) = T(n/2) + O(1) $

This recurrence relation gives us:
$ T(n) = O(log n) $

== Advanced Topics

=== Hash Tables

Hash tables provide average-case $O(1)$ lookup time using hash functions.

#example([
  A simple hash function for integers might be:
  $ h(k) = k mod m $
  where $m$ is the size of the hash table.
])

=== Trees

Tree structures are hierarchical data structures with many variants:
- Binary trees
- Binary search trees  
- AVL trees
- Red-black trees

== Conclusion

Choosing the right data structure is essential for writing efficient programs. Consider:

1. What operations will be performed most frequently?
2. What are the memory constraints?
3. Is the data size known in advance?

#important([
  Practice implementing these data structures to better understand their behavior and performance characteristics.
])

== Next Steps

In the next lecture, we'll dive deeper into:
- Tree traversal algorithms
- Graph representations
- Advanced sorting algorithms

#note-box([
  Don't forget to complete the programming exercises for this week! They're essential for understanding these concepts.
])
