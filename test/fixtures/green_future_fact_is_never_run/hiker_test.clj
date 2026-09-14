(ns hiker-test
  (:require [midje.sweet :refer :all]
            [hiker :refer :all]))

(fact "the answer is forty two"
  (answer) => 42)

; answer-size answers 1, so this checkable would fail if it were run.
(future-fact "the answer has two digits"
  (answer-size) => 2)
