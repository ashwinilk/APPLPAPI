%dw 2.0
import divideBy from dw::core::Arrays
output application/json
var size = sizeOf(vars.webinar_survey_responses)
var qa = (vars.webinar_survey_responses map ((item, index) -> (item.question) : (item.answer)))
var registrantKeys = qa.*registrantKey
var batch = floor(size / sizeOf(registrantKeys))
---
flatten(vars.webinar_survey_responses divideBy batch)