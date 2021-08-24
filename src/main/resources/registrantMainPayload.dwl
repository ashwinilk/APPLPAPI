%dw 2.0
import divideBy from dw::core::Objects
output application/json
var registrantKeys = vars.getRegistrant_Payload.*registrantKey
var size = sizeOf(vars.getRegistrant_Payload)
var batch = size / sizeOf(registrantKeys)
---
vars.getRegistrant_Payload divideBy batch