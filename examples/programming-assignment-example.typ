#import "../src/lib.typ": dtu-programming-assignment, code-specification, test-case, algorithm-analysis, complexity-table, code-implementation, programming-problem, code-output, debugging-tip, performance-note, important, note-box

#show: dtu-programming-assignment.with(
  course: "02101",
  course-name: "Introduction to Programming",
  title: "Assignment 5: Data Structures and Algorithms",
  due-date: datetime(year: 2024, month: 4, day: 25),
  author: "Your Name",
  semester: "Spring 2024",
  programming-language: "Python 3.9+"
)

#programming-problem(number: "1", points: "30", difficulty: "Medium")[
  Implement a Binary Search Tree (BST) class with insertion, search, and deletion operations.
]

#code-specification([
  Create a `BinarySearchTree` class with the following methods:
  - `insert(value)`: Insert a value into the BST
  - `search(value)`: Return True if value exists, False otherwise
  - `delete(value)`: Remove a value from the BST
  - `inorder()`: Return list of values in inorder traversal
])

#test-case(description: "Basic insertion and search")[
  ```python
  bst = BinarySearchTree()
  bst.insert(50)
  bst.insert(30)
  print(bst.search(30))
  # Expected Output:
  # True
  # [20, 30, 40, 50, 70]
  ```]

#code-implementation(
  caption: "Binary Search Tree Implementation"
)[
```python
class TreeNode:
    def __init__(self, value):
        self.value = value
        self.left = None
        self.right = None

class BinarySearchTree:
    def __init__(self):
        self.root = None

    def insert(self, value):
        """Insert a value into the BST."""
        if self.root is None:
            self.root = TreeNode(value)
        else:
            self._insert_recursive(self.root, value)

    def _insert_recursive(self, node, value):
        if value < node.value:
            if node.left is None:
                node.left = TreeNode(value)
            else:
                self._insert_recursive(node.left, value)
        elif value > node.value:
            if node.right is None:
                node.right = TreeNode(value)
            else:
                self._insert_recursive(node.right, value)
        # If value == node.value, do nothing (no duplicates)

    def search(self, value):
        """Search for a value in the BST."""
        return self._search_recursive(self.root, value)

    def _search_recursive(self, node, value):
        if node is None:
            return False
        if value == node.value:
            return True
        elif value < node.value:
            return self._search_recursive(node.left, value)
        else:
            return self._search_recursive(node.right, value)

    def delete(self, value):
        """Delete a value from the BST."""
        self.root = self._delete_recursive(self.root, value)

    def _delete_recursive(self, node, value):
        if node is None:
            return node

        if value < node.value:
            node.left = self._delete_recursive(node.left, value)
        elif value > node.value:
            node.right = self._delete_recursive(node.right, value)
        else:
            # Node to be deleted found
            if node.left is None:
                return node.right
            elif node.right is None:
                return node.left

            # Node has two children
            min_larger_node = self._find_min(node.right)
            node.value = min_larger_node.value
            node.right = self._delete_recursive(node.right, min_larger_node.value)

        return node

    def _find_min(self, node):
        while node.left is not None:
            node = node.left
        return node

    def inorder(self):
        """Return inorder traversal of the BST."""
        result = []
        self._inorder_recursive(self.root, result)
        return result

    def _inorder_recursive(self, node, result):
        if node is not None:
            self._inorder_recursive(node.left, result)
            result.append(node.value)
            self._inorder_recursive(node.right, result)
```
]

#algorithm-analysis([
  #complexity-table(
    time-best: "O(log n)",
    time-avg: "O(log n)",
    time-worst: "O(n)",
    space: "O(h)"
  )

  Where `h` is the height of the tree. In a balanced BST, h = log n, but in the worst case (completely unbalanced), h = n.
])

#debugging-tip([
  When implementing deletion, be careful with the three cases:
  1. Node has no children (leaf node)
  2. Node has one child
  3. Node has two children (requires finding inorder successor)
])

#programming-problem(number: "2", points: "25", difficulty: "Easy")[
  Implement a function to find the maximum sum of a contiguous subarray (Kadane's Algorithm).
]

#code-specification([
  Write a function `max_subarray_sum(arr)` that returns the maximum sum of any contiguous subarray.
  - Handle arrays with all negative numbers
  - Return 0 for empty arrays
  - Time complexity should be O(n)
])

#test-case(
  description: "Subarray [4, -1, 2, 1] has the maximum sum of 6"
)[
  ```python
  max_subarray_sum([-2, 1, -3, 4, -1, 2, 1, -5, 4])
  # Expected output: 6
  ```
]

#test-case(
  description: "All negative numbers - return the least negative"
)[
  ```python
  max_subarray_sum([-2, -3, -1, -4])
  # Expected output: -1
  ```
]

#code-implementation(
  caption: "Kadane's Algorithm - Maximum Subarray Sum"
)[
  ```python
def max_subarray_sum(arr):
    """
    Find maximum sum of contiguous subarray using Kadane's algorithm.

    Args:
        arr: List of integers

    Returns:
        Maximum sum of any contiguous subarray
    """
    if not arr:
        return 0

    max_so_far = arr[0]
    max_ending_here = arr[0]

    for i in range(1, len(arr)):
        # Either extend the existing subarray or start a new one
        max_ending_here = max(arr[i], max_ending_here + arr[i])

        # Update the overall maximum
        max_so_far = max(max_so_far, max_ending_here)

    return max_so_far

# Alternative implementation that tracks indices
def max_subarray_with_indices(arr):
    """Return max sum and the start, end indices of the subarray."""
    if not arr:
        return 0, 0, 0

    max_sum = arr[0]
    current_sum = arr[0]
    start = end = 0
    temp_start = 0

    for i in range(1, len(arr)):
        if current_sum < 0:
            current_sum = arr[i]
            temp_start = i
        else:
            current_sum += arr[i]

        if current_sum > max_sum:
            max_sum = current_sum
            start = temp_start
            end = i

    return max_sum, start, end
```
]

#algorithm-analysis([
  *Time Complexity:* O(n) - Single pass through the array

  *Space Complexity:* O(1) - Only using a constant amount of extra space

  *Key Insight:* At each position, we decide whether to extend the current subarray or start a new one. We start a new subarray when the current sum becomes negative.
])

#performance-note([
  Kadane's algorithm is optimal for this problem. The naive approach of checking all possible subarrays would take O(n³) time.
])

#programming-problem(number: "3", points: "35", difficulty: "Hard")[
  Implement a hash table with separate chaining collision resolution. Include automatic resizing when load factor exceeds 0.75.
]

#code-specification([
  Create a `HashTable` class with:
  - `put(key, value)`: Insert/update key-value pair
  - `get(key)`: Retrieve value for key (raise KeyError if not found)
  - `remove(key)`: Delete key-value pair
  - `size()`: Return number of key-value pairs
  - Automatic resizing when load factor > 0.75
])

#code-implementation(
  caption: "Hash Table with Separate Chaining"
)[
  ```python
  class HashTable:
      def __init__(self, initial_capacity=8):
          self.capacity = initial_capacity
          self.size_count = 0
          self.buckets = [[] for _ in range(self.capacity)]

      def _hash(self, key):
          """Simple hash function using built-in hash()."""
          return hash(key) % self.capacity
          ```
]
