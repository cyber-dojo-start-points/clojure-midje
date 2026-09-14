(ns hiker-test
  (:require [midje.sweet :refer :all]
            [sums.checksum :refer :all]
            [hiker :refer :all]))

(fact "the answer is forty two"
  (answer) => 42)

(fact "the digits of the answer add up to six"
  (checksum (answer)) => 6)
