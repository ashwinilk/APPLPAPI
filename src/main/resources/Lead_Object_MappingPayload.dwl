%dw 2.0
output application/json
---
(vars.registrantMainPayload) map ((item, index) -> 
{
    "FirstName" : item.firstName,
    "LastName" : item.lastName default "Mandal",
    "Email" : item.email,
    "Overall_satisfaction_with_webinar__c": (vars.question_Answers filter $.registrantKey == item.registrantKey)."Overall satisfaction with webinar"[0],
    "How_well_questions_were_answered__c": (vars.question_Answers filter $.registrantKey == item.registrantKey)."How well questions were answered"[0],
    "Quality_of_the_Audio_Visual__c": (vars.question_Answers filter $.registrantKey == item.registrantKey)."Quality of the Audio/Visual"[0],
    "Country__c": (vars.registrantMainPayload filter $.registrantKey == item.registrantKey)."country"[0] default "India",
	 "Company": (vars.registrantMainPayload filter $.registrantKey == item.registrantKey)."company"[0] default "Apisero",
	  "Webinar_Organization__c": (vars.registrantMainPayload filter $.registrantKey == item.registrantKey)."organization"[0],
	   "Registration_Source_Webinar__c": "GoToWebinar",
	   "Interest_Rating_During_Webinar__c": "Attendee Interest Rating",
	   "Time_in_Webinar_Session__c": (vars.current_attendee_Main_Payload filter $.registrantKey == item.registrantKey)."attendanceTimeInSeconds"[0],
	   "Webinar_Attendance__c": 90 as Number,
	   "Number_of_Respondents__c": sum(vars.survey_Main_Variable.numberOfResponses),
	   "Percent_Responded__c": sum(vars.survey_Main_Variable.numberOfResponses)/(sizeOf(vars.registrantMainPayload.*registrantKey)*3)
})