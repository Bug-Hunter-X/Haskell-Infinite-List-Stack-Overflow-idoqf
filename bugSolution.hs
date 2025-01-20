The issue is that `fibs` generates an infinite list.  The expression `take 10 fibs` *attempts* to take only the first 10 elements, but it must first generate those 10 elements, requiring the evaluation of the infinite list up to that point.  The corrected version uses lazy evaluation effectively by only computing the elements as needed.

```haskell
fibs = 0 : 1 : zipWith (+) fibs (tail fibs)

main :: IO ()
main = print $ take 10 fibs
```

This version is still lazy but more efficient because it only evaluates as much of the list as `take` needs.  Alternative, more efficient solutions would involve using a loop or recursion with explicit limits instead of relying on `take` with an infinite list.