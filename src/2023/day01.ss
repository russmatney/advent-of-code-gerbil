(import
  :std/iter
  :std/source
  :std/pregexp)

(def (line->numeric line)


  0)

(def (tests)
  (let ((cases [["1abc2" . 12]
                ["pqr3stu8vwx" . 38]
                ["a1b2c3d4e5f" . 15]
                ["treb7uchet" . 77]
                ["4dtlmkfnm" . 44]
                ["two1nine" . 29]
                ["eightwothree" . 83]
                ["abcone2threexyz" . 13]
                ["xtwone3four" . 24]
                ["4nineeightseven2" . 42]
                ["zoneight234" . 14]
                ["7pqrstsixteen" . 76]
                ]))
    (for ([input . expected] cases)
      (let* ((final (line->numeric input))
             (pass? (= final expected)))
        (displayln (if pass? "PASS" "FAIL") " case: " input " " expected " =?= " final)))))

(def (run . args)
  (let* ((content (bytes->string (this-source-content "day01_input.txt")))
         (lines (string-split content #\n)))
    (displayln "Hello!")

    (displayln "Sum: "
               (for/fold (sum 0) (line lines)
                 (+ sum (line->numeric line))))))

;; (run)
;; (tests)
;;

(displayln "hi")

(displayln
 (pregexp-match-positions (pregexp "\\d") "pqr3ts8wv"))
