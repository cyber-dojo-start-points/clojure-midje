(ns hiker-test
  (:require [midje.sweet :refer :all]
            [hiker :refer :all]))

(def hikers-share (/ (answer) 0))

(fact "the answer is forty two"
  (answer) => 42)

(fact "the answer is even"
  (even? (answer)) => true)
