(ns hiker-tests
  (:require [midje.sweet :refer :all]
            [hiker :refer :all]))

; The name of this file ends in _tests rather than _test. The checkable below
; fails, so a red outcome is what says the file was checked all the same.
(fact "the answer has three digits"
  (count (str (answer))) => 3)
