* Encoding: UTF-8.


/* Exclude respondents who report having taken the survey before.

USE ALL.
COMPUTE filter_$=(taken_before = 1).
VARIABLE LABELS filter_$ 'taken_before = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

/* Calculate respondent age.

COMPUTE age=2020 - birthyr.
EXECUTE.


/* Show age breakdown.

FREQUENCIES VARIABLES=age
  /HISTOGRAM
  /ORDER=ANALYSIS.


/* Show descriptives for Employment.

FREQUENCIES VARIABLES=q14 q15
  /ORDER=ANALYSIS.


/* Show descriptives for Preventive Behaviors.

FREQUENCIES VARIABLES=q1 q2 q3 q4_1 q4_2 q4_3 q4_4 q5 q6 q7 q8 q9 q10 q11_1 q11_2 q11_3 q11_4 q11_5 
    q11_6 q11_7 q11_7_TEXT q12 q13 q14 q14_22_TEXT q15
  /ORDER=ANALYSIS.


/* Show descriptives for Institutions and Ideology.

FREQUENCIES VARIABLES=q16 q17 q18 q19
  /ORDER=ANALYSIS.


/* Show descriptives for Knowledge and Beliefs.

FREQUENCIES VARIABLES=q20 q23_1 q23_2 q23_3 q_23_follow_up q23_4 q23_5 q23_6 q23_7 q23_8 q23_9 
    q23_10 q24 q25 q26
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=q21_1 q22_1
  /HISTOGRAM
  /ORDER=ANALYSIS.


/* Show descriptives for Logistical and Testing Considerations.

FREQUENCIES VARIABLES=q27 q27_8_TEXT q28 q29 q30 q31 q32 q33 q34 q35 q36 q37 q38 q39 q40 q41 q42_1 
    q42_2 q42_3 q42_4 q42_5 q42_6 q42_6_TEXT q43 q44 q45
  /ORDER=ANALYSIS.


/* Show Demographics.



FREQUENCIES VARIABLES=gender race educ q46 faminc_new inputstate q47
  /ORDER=ANALYSIS.
