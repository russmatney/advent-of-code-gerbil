(import
  :std/iter
  :std/source
  :std/pregexp)

(def (reg-digits)
  (pregexp "(\\d|one|two|three|four|five|six|seven|eight|nine)"))

(displayln
 (pregexp-match-positions (reg-digits) "pqr3ts8wv"))

(displayln
 (pregexp-match-positions (reg-digits) "pqoner3ts8wv")
 "\n"
 (pregexp-match-positions (reg-digits) "pqoner3ts8wv" 3)
 )

(displayln "range " (string-length "hello"))

(def (word->digit word)
  (match word
    ((equal? "one") "1")
    ((equal? "two") "2")
    ((equal? "three") "3")
    ((equal? "four") "4")
    ((equal? "five") "5")
    ((equal? "six") "6")
    ((equal? "seven") "7")
    ((equal? "eight") "8")
    ((equal? "nine") "9")
    (else word)))

(displayln "word->digit " (word->digit "one"))
(displayln "word->digit " (word->digit "eight"))
(displayln "word->digit " (word->digit "3"))

(def (line->numeric line)
  (let* ((parsed
          (for/fold (ixs []) (ix (in-range (string-length line)))
            (let ((m (pregexp-match (reg-digits) line ix)))
              (if m
                (cons (car m) ixs)
                ixs))))
         (digits (string-append
                  "" (word->digit (last parsed))
                  (word->digit (car parsed)))))
    digits))


(displayln
 "parsed "
 (line->numeric "pqoner3ts8woneightv"))

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
