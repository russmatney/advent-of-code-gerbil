(module day01year2015
  (export day01)

  (def (calc-final-floor path)
    (displayln "calcing floor for path " path)
    0)

  (def (day01 . args)
    (displayln "final floor: " (calc-final-floor "^v^v^^v"))))

(import day01year2015)
(day01)
