(ns fizz-buzz-test
  (:require [midje.sweet :refer :all]
            [fizz-buzz :refer :all]))

(facts "about the fizz buzz game"
  (fizz-buzz 1) => "1"
  (fizz-buzz 3) => "Fizz"
  (fizz-buzz 5) => "Buzz"
  (fizz-buzz 15) => "FizzBuzz")
