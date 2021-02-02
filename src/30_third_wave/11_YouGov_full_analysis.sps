* Encoding: UTF-8.


WEIGHT BY weight.

/* Select Rhode Island Survey 3 sample.

USE ALL.
COMPUTE filter_$=(inputstate = 44 & time = 1).
VARIABLE LABELS filter_$ 'inputstate = 44 & time = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.



/* Age breakdown

FREQUENCIES VARIABLES=age_range
  /ORDER=ANALYSIS.



/* Preventive behaviors and risk factors_____________________________________

/* Vaccine intention

FREQUENCIES VARIABLES=q1
  /ORDER=ANALYSIS.

USE ALL.
COMPUTE filter_$=(inputstate = 44).
VARIABLE LABELS filter_$ 'inputstate = 44 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST GROUPS=time(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q1
  /CRITERIA=CI(.95).



/* Mask wearing

USE ALL.
COMPUTE filter_$=(inputstate = 44 & time = 1).
VARIABLE LABELS filter_$ 'inputstate = 44 & time = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q6 q7 q8
  /ORDER=ANALYSIS.

USE ALL.
COMPUTE filter_$=(inputstate = 44).
VARIABLE LABELS filter_$ 'inputstate = 44 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST GROUPS=time(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q6 q7 q8
  /CRITERIA=CI(.95).




/* Social distancing

USE ALL.
COMPUTE filter_$=(inputstate = 44 & time = 1).
VARIABLE LABELS filter_$ 'inputstate = 44 & time = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q9
  /ORDER=ANALYSIS.

USE ALL.
COMPUTE filter_$=(inputstate = 44).
VARIABLE LABELS filter_$ 'inputstate = 44 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST GROUPS=time(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q9
  /CRITERIA=CI(.95).



/* Number of people socialized with

USE ALL.
COMPUTE filter_$=(inputstate = 44 & time = 1).
VARIABLE LABELS filter_$ 'inputstate = 44 & time = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q10
  /ORDER=ANALYSIS.

USE ALL.
COMPUTE filter_$=(inputstate = 44).
VARIABLE LABELS filter_$ 'inputstate = 44 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=time BY q10
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.


/* Risk events

USE ALL.
COMPUTE filter_$=(inputstate = 44 & time = 1).
VARIABLE LABELS filter_$ 'inputstate = 44 & time = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q4_1 q4_2 q4_3 q4_4
  /ORDER=ANALYSIS.

USE ALL.
COMPUTE filter_$=(inputstate = 44).
VARIABLE LABELS filter_$ 'inputstate = 44 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=time BY q4_1 q4_2 q4_3 q4_4
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.


/* Beliefs and attitudes about the pandemic__________________________

/* Forecast for the pandemic

USE ALL.
COMPUTE filter_$=(inputstate = 44 & time = 1).
VARIABLE LABELS filter_$ 'inputstate = 44 & time = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q26
  /ORDER=ANALYSIS.

USE ALL.
COMPUTE filter_$=(inputstate = 44).
VARIABLE LABELS filter_$ 'inputstate = 44 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=time BY q26
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.


/* Risk perception


USE ALL.
COMPUTE filter_$=(inputstate = 44).
VARIABLE LABELS filter_$ 'inputstate = 44 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST GROUPS=time(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q21
  /CRITERIA=CI(.95).

T-TEST GROUPS=time(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q22
  /CRITERIA=CI(.95).


/* Tested in the last month

USE ALL.
COMPUTE filter_$=(inputstate = 44 & time = 1).
VARIABLE LABELS filter_$ 'inputstate = 44 & time = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q62
  /ORDER=ANALYSIS.


/* Willingness and intention

USE ALL.
COMPUTE filter_$=(inputstate = 44 & time = 1).
VARIABLE LABELS filter_$ 'inputstate = 44 & time = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q29
  /ORDER=ANALYSIS.

USE ALL.
COMPUTE filter_$=(inputstate = 44).
VARIABLE LABELS filter_$ 'inputstate = 44 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST GROUPS=time(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q29
  /CRITERIA=CI(.95).

USE ALL.
COMPUTE filter_$=(inputstate = 44 & time = 1).
VARIABLE LABELS filter_$ 'inputstate = 44 & time = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q30
  /ORDER=ANALYSIS.

USE ALL.
COMPUTE filter_$=(inputstate = 44).
VARIABLE LABELS filter_$ 'inputstate = 44 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST GROUPS=time(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q30
  /CRITERIA=CI(.95).



/* Testing beliefs battery

USE ALL.
COMPUTE filter_$=(inputstate = 44 & time = 1).
VARIABLE LABELS filter_$ 'inputstate = 44 & time = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q23_1 q23_2 q23_3 q23_4 q23_5 q23_6 q23_7 q23_8 q23_9 q23_10
  /ORDER=ANALYSIS.

USE ALL.
COMPUTE filter_$=(inputstate = 44).
VARIABLE LABELS filter_$ 'inputstate = 44 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST GROUPS=time(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q23_1 q23_2 q23_3 q23_4 q23_5 q23_6 q23_7 q23_8 q23_9 q23_10
  /CRITERIA=CI(.95).


/* Friends/family intend to get tested

USE ALL.
COMPUTE filter_$=(inputstate = 44 & time = 1).
VARIABLE LABELS filter_$ 'inputstate = 44 & time = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q25
  /ORDER=ANALYSIS.


/* Comfort getting children tested

USE ALL.
COMPUTE filter_$=(inputstate = 44 & time = 1).
VARIABLE LABELS filter_$ 'inputstate = 44 & time = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q33
  /ORDER=ANALYSIS.

USE ALL.
COMPUTE filter_$=(inputstate = 44).
VARIABLE LABELS filter_$ 'inputstate = 44 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST GROUPS=time(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q33
  /CRITERIA=CI(.95).


/* Knowledge test scores

USE ALL.
COMPUTE filter_$=(inputstate = 44 & time = 1).
VARIABLE LABELS filter_$ 'inputstate = 44 & time = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

GRAPH
  /HISTOGRAM=covid_knowledge_score.


/* Age group with most cases

USE ALL.
COMPUTE filter_$=(inputstate = 44 & time = 1).
VARIABLE LABELS filter_$ 'inputstate = 44 & time = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q20
  /ORDER=ANALYSIS.

USE ALL.
COMPUTE filter_$=(inputstate = 44).
VARIABLE LABELS filter_$ 'inputstate = 44 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=time BY q20
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.


/* Rach/ethnicity with most cases

USE ALL.
COMPUTE filter_$=(inputstate = 44 & time = 1).
VARIABLE LABELS filter_$ 'inputstate = 44 & time = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q52
  /ORDER=ANALYSIS.


/* Number of deaths in the US

USE ALL.
COMPUTE filter_$=(inputstate = 44 & time = 1).
VARIABLE LABELS filter_$ 'inputstate = 44 & time = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=US_deaths_estimate_low_right_high
  /ORDER=ANALYSIS.


/* Beliefs about own knowledge 

USE ALL.
COMPUTE filter_$=(inputstate = 44 & time = 1).
VARIABLE LABELS filter_$ 'inputstate = 44 & time = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q51
  /ORDER=ANALYSIS.


/* Beliefs about scientists' knowledge

USE ALL.
COMPUTE filter_$=(inputstate = 44 & time = 1).
VARIABLE LABELS filter_$ 'inputstate = 44 & time = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q54
  /ORDER=ANALYSIS.


/* Reliability of public health scientists

USE ALL.
COMPUTE filter_$=(inputstate = 44 & time = 1).
VARIABLE LABELS filter_$ 'inputstate = 44 & time = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q18
  /ORDER=ANALYSIS.

USE ALL.
COMPUTE filter_$=(inputstate = 44).
VARIABLE LABELS filter_$ 'inputstate = 44 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST GROUPS=time(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q18
  /CRITERIA=CI(.95).


/* Federal gov't do more?

USE ALL.
COMPUTE filter_$=(inputstate = 44 & time = 1).
VARIABLE LABELS filter_$ 'inputstate = 44 & time = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q56_b
  /ORDER=ANALYSIS.

/* State gov't do more?

USE ALL.
COMPUTE filter_$=(inputstate = 44 & time = 1).
VARIABLE LABELS filter_$ 'inputstate = 44 & time = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q57_b
  /ORDER=ANALYSIS.

T-TEST PAIRS=q56_b WITH q57_b (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.


/*Vaccination beliefs________________________________________

/* Vaccine benefits

USE ALL.
COMPUTE filter_$=(inputstate = 44 & time = 1).
VARIABLE LABELS filter_$ 'inputstate = 44 & time = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q58_1 q58_2 q58_3 q58_4 q58_5 q58_6 q58_7
  /ORDER=ANALYSIS.


/* Vaccine costs

USE ALL.
COMPUTE filter_$=(inputstate = 44 & time = 1).
VARIABLE LABELS filter_$ 'inputstate = 44 & time = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q59_1 q59_2 q59_3 q59_4 q59_5 q59_6
  /ORDER=ANALYSIS.


/* Proportions of groups that will get vaccinated

USE ALL.
COMPUTE filter_$=(inputstate = 44 & time = 1).
VARIABLE LABELS filter_$ 'inputstate = 44 & time = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q60_1 q60_2 q60_3 q60_4
  /ORDER=ANALYSIS.


/* Flu shot

USE ALL.
COMPUTE filter_$=(inputstate = 44 & time = 1).
VARIABLE LABELS filter_$ 'inputstate = 44 & time = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q61
  /ORDER=ANALYSIS.


/* Demographics




FREQUENCIES VARIABLES=gender race educ faminc_new pid3 q14
  /ORDER=ANALYSIS.
