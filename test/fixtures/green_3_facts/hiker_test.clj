(ns hiker-test
  (:require [midje.sweet :refer :all]
            [hiker :refer :all]))

(fact "the answer is forty two"
  (answer) => 42)

(fact "the answer is even"
  (even? (answer)) => true)

(fact "the answer has two digits"
  (answer-size) => 2)
