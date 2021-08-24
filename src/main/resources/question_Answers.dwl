%dw 2.0
output application/json
import divideBy from dw::core::Objects
var registrantKeys = vars.surveyVariable.*registrantKey
var size = sizeOf(vars.surveyVariable)
var batch = size / sizeOf(registrantKeys)
---
vars.surveyVariable divideBy batch