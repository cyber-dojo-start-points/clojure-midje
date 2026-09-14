(ns fizz-buzz)

(defn fizz-buzz [n]
    (cond
      (zero? (mod n 15)) "FizzBuzz"
      (zero? (mod n 3)) "Fizz"
      (zero? (mod n 5)) "Buzz"
      :else (str n)))
