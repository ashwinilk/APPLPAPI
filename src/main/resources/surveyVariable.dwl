%dw 2.0
output application/json
---
(vars.surveyVariable1 map ((item, index) -> (item.question) : (item.answer) ) 
reduce ((item, accumulator) -> accumulator ++ item))
//reduce ((item, accumulator) -> item ++ accumulator)