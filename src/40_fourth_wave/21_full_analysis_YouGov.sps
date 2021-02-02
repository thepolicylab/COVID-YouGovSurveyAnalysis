* Encoding: UTF-8.

/* Apply weights

WEIGHT BY weight.


/* Show age distribution

USE ALL.
COMPUTE filter_$=(time = 0).
VARIABLE LABELS filter_$ 'time = 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=age_range
  /ORDER=ANALYSIS.


/*PREVENTIVE BEHAVIORS AND RISK FACTORS__________________________

/* Vaccine intention December

USE ALL.
COMPUTE filter_$=(time = 0).
VARIABLE LABELS filter_$ 'time = 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q1
  /ORDER=ANALYSIS.

/* Change in vaccine intention

FILTER OFF.
USE ALL.
EXECUTE.

CROSSTABS
  /TABLES=q1 BY time
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT
  /COUNT ROUND CELL.

T-TEST GROUPS=time(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q1
  /CRITERIA=CI(.95).


/* Mask wearing in December

USE ALL.
COMPUTE filter_$=(time = 0).
VARIABLE LABELS filter_$ 'time = 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q6 q7 q100 q8 q101
  /ORDER=ANALYSIS.

/* Change in mask wearing

FILTER OFF.
USE ALL.
EXECUTE.

CROSSTABS
  /TABLES=q6 q7 q8 BY time
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT
  /COUNT ROUND CELL.

T-TEST GROUPS=time(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q6 q7 q8
  /CRITERIA=CI(.95).

/* Compare of own to others' mask wearing

USE ALL.
COMPUTE filter_$=(time = 0).
VARIABLE LABELS filter_$ 'time = 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST PAIRS=q7 WITH q100 (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.


/* Social distancing in December

USE ALL.
COMPUTE filter_$=(time = 0).
VARIABLE LABELS filter_$ 'time = 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q9 q102
  /ORDER=ANALYSIS.

/* Change in social distancing

FILTER OFF.
USE ALL.
EXECUTE.

CROSSTABS
  /TABLES=q9 BY time
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT
  /COUNT ROUND CELL.

T-TEST GROUPS=time(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q9
  /CRITERIA=CI(.95).

/* Comparison of own to others' social distancing

USE ALL.
COMPUTE filter_$=(time = 0).
VARIABLE LABELS filter_$ 'time = 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST PAIRS=q9 WITH q102 (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.


/* Number of people socialized with in December

USE ALL.
COMPUTE filter_$=(time = 0).
VARIABLE LABELS filter_$ 'time = 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q10
  /ORDER=ANALYSIS.

/* Change in number of people socialized with

FILTER OFF.
USE ALL.
EXECUTE.

CROSSTABS
  /TABLES=q10 BY time
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT
  /COUNT ROUND CELL.

T-TEST GROUPS=time(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q10
  /CRITERIA=CI(.95).


/* Risk events in December

USE ALL.
COMPUTE filter_$=(time = 0).
VARIABLE LABELS filter_$ 'time = 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q4_1 q4_2 q4_3 q4_4
  /ORDER=ANALYSIS.

/* Change in risk events

FILTER OFF.
USE ALL.
EXECUTE.

CROSSTABS
  /TABLES=q4_1 q4_2 q4_3 q4_4 BY time
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT
  /COUNT ROUND CELL.


/* The Pause: reported changes and overal attitudes

USE ALL.
COMPUTE filter_$=(time = 0).
VARIABLE LABELS filter_$ 'time = 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q103 q104 q105 q106
  /ORDER=ANALYSIS.

/* Reasons given

FREQUENCIES VARIABLES=q103_free_response q104_free_response
  /ORDER=ANALYSIS.


/* BELIEFS AND ATTITUDES ABOUT THE PANDEMIC__________________________


/* Forecast in December

USE ALL.
COMPUTE filter_$=(time = 0).
VARIABLE LABELS filter_$ 'time = 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q26
  /ORDER=ANALYSIS.

/* Change in forecast

FILTER OFF.
USE ALL.
EXECUTE.

CROSSTABS
  /TABLES=q26 BY time
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT
  /COUNT ROUND CELL.


/* Change in risk perceptions

FILTER OFF.
USE ALL.
EXECUTE.

T-TEST GROUPS=time(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q21 q22
  /CRITERIA=CI(.95).



/* Willigness and intention to get tested in December

USE ALL.
COMPUTE filter_$=(time = 0).
VARIABLE LABELS filter_$ 'time = 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q29 q30
  /ORDER=ANALYSIS.

/* Change in willingness and intention

FILTER OFF.
USE ALL.
EXECUTE.

CROSSTABS
  /TABLES=q29 q30 BY time
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT
  /COUNT ROUND CELL.

T-TEST GROUPS=time(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q29 q30
  /CRITERIA=CI(.95).

/* Reasons given by the unwilling

USE ALL.
COMPUTE filter_$=(time = 0).
VARIABLE LABELS filter_$ 'time = 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q29_why_not
  /ORDER=ANALYSIS.


/* Beliefs about testing in December

USE ALL.
COMPUTE filter_$=(time = 0).
VARIABLE LABELS filter_$ 'time = 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q23_1 q23_2 q23_3 q23_4 q23_5 q23_11 q23_7 q23_8 q23_9 q23_12 q23_10 
  /ORDER=ANALYSIS.

/* Change in beliefs about testing

FILTER OFF.
USE ALL.
EXECUTE.

CROSSTABS
  /TABLES=q23_1 q23_2 q23_3 q23_4 q23_5 q23_7 q23_8 q23_9 q23_10 BY time
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT
  /COUNT ROUND CELL.

T-TEST GROUPS=time(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q23_1 q23_2 q23_3 q23_4 q23_5 q23_7 q23_8 q23_9 q23_10
  /CRITERIA=CI(.95).

/* Bad things that will happen

USE ALL.
COMPUTE filter_$=(time = 0).
VARIABLE LABELS filter_$ 'time = 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q23_follow_up
  /ORDER=ANALYSIS.

/* Comparison of standard to rapid testing

T-TEST PAIRS=q23_11 WITH q23_12 (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.



/* Beliefs about friends/family intention to get tested in December

USE ALL.
COMPUTE filter_$=(time = 0).
VARIABLE LABELS filter_$ 'time = 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q25 
  /ORDER=ANALYSIS.

/* Change in beliefs about about friends/family intention to get tested in

FILTER OFF.
USE ALL.
EXECUTE.

CROSSTABS
  /TABLES=q25 BY time
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT
  /COUNT ROUND CELL.

T-TEST GROUPS=time(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q25
  /CRITERIA=CI(.95).


/* Comfort getting children tested in December

USE ALL.
COMPUTE filter_$=(time = 0).
VARIABLE LABELS filter_$ 'time = 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q33
  /ORDER=ANALYSIS.

/* Change in comfort getting children tested

FILTER OFF.
USE ALL.
EXECUTE.

CROSSTABS
  /TABLES=q33 BY time
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT
  /COUNT ROUND CELL.

T-TEST GROUPS=time(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q33
  /CRITERIA=CI(.95).


/* Perceived age group with highest cases in December

USE ALL.
COMPUTE filter_$=(time = 0).
VARIABLE LABELS filter_$ 'time = 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q20
  /ORDER=ANALYSIS.

/* Change in perceived age group with highest cases

FILTER OFF.
USE ALL.
EXECUTE.

CROSSTABS
  /TABLES=q20 BY time
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT
  /COUNT ROUND CELL.

T-TEST GROUPS=time(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q20
  /CRITERIA=CI(.95).


/* US death estimates n December

USE ALL.
COMPUTE filter_$=(time = 0).
VARIABLE LABELS filter_$ 'time = 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=US_deaths_estimate_low_right_high
  /ORDER=ANALYSIS.

/* Change in US death estimates

FILTER OFF.
USE ALL.
EXECUTE.

CROSSTABS
  /TABLES=US_deaths_estimate_low_right_high BY time
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT
  /COUNT ROUND CELL.

T-TEST GROUPS=time(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=US_deaths_estimate_low_right_high
  /CRITERIA=CI(.95).


/* Reliability of public health scientists in December

USE ALL.
COMPUTE filter_$=(time = 0).
VARIABLE LABELS filter_$ 'time = 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q18
  /ORDER=ANALYSIS.

/* Change in reliability of public health scientists

FILTER OFF.
USE ALL.
EXECUTE.

CROSSTABS
  /TABLES=q18 BY time
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT
  /COUNT ROUND CELL.

T-TEST GROUPS=time(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q18
  /CRITERIA=CI(.95).


/* VACCINATION BELIEFS_____________________________________


/* Perceived vaccine benefits in December

USE ALL.
COMPUTE filter_$=(time = 0).
VARIABLE LABELS filter_$ 'time = 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q58_1 q58_2 q58_3 q58_4 q58_5 q58_6 q58_7 q58_8
  /ORDER=ANALYSIS.

/* Change in perceived vaccine benefits

FILTER OFF.
USE ALL.
EXECUTE.

CROSSTABS
  /TABLES=q58_1 q58_2 q58_3 q58_4 q58_5 q58_6 q58_7 BY time
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT
  /COUNT ROUND CELL.

T-TEST GROUPS=time(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q58_1 q58_2 q58_3 q58_4 q58_5 q58_6 q58_7
  /CRITERIA=CI(.95).

/* Burden on community health versus burden on community's economy

USE ALL.
COMPUTE filter_$=(time = 0).
VARIABLE LABELS filter_$ 'time = 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST PAIRS=q58_3 WITH q58_8 (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.



/* Perceived vaccine costs in December

USE ALL.
COMPUTE filter_$=(time = 0).
VARIABLE LABELS filter_$ 'time = 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q59_1 q59_2 q59_3 q59_4 q59_5 q59_6
  /ORDER=ANALYSIS.

/* Change in perceived vaccine costs

FILTER OFF.
USE ALL.
EXECUTE.

CROSSTABS
  /TABLES=q59_1 q59_2 q59_3 q59_4 q59_5 q59_6 BY time
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT
  /COUNT ROUND CELL.

T-TEST GROUPS=time(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q59_1 q59_2 q59_3 q59_4 q59_5 q59_6
  /CRITERIA=CI(.95).



/* Perceived others' intentions to vaccinate in December

USE ALL.
COMPUTE filter_$=(time = 0).
VARIABLE LABELS filter_$ 'time = 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q60_1 q60_2 q60_3 q60_4 
  /ORDER=ANALYSIS.

/* Change in perceived others' intentions to vaccinate

FILTER OFF.
USE ALL.
EXECUTE.

CROSSTABS
  /TABLES=q60_1 q60_2 q60_3 q60_4 BY time
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT
  /COUNT ROUND CELL.

T-TEST GROUPS=time(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q60_1 q60_2 q60_3 q60_4
  /CRITERIA=CI(.95).

/* Correlation staircase

USE ALL.
COMPUTE filter_$=(time = 0).
VARIABLE LABELS filter_$ 'time = 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CORRELATIONS
  /VARIABLES=q1 q60_1 q60_2 q60_3 q60_4
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

/* Testing for effect of others' first vs. own first

USE ALL.
COMPUTE filter_$=(time = 0).
VARIABLE LABELS filter_$ 'time = 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=q60_treat BY q1
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT
  /COUNT ROUND CELL.

T-TEST GROUPS=q60_treat(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=q1
  /CRITERIA=CI(.95).


/* Seasonal flu vaccine uptake in December

USE ALL.
COMPUTE filter_$=(time = 0).
VARIABLE LABELS filter_$ 'time = 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q61 
  /ORDER=ANALYSIS.

/* Change in seasonal flu vaccine uptake

FILTER OFF.
USE ALL.
EXECUTE.

CROSSTABS
  /TABLES=q61 BY time
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT
  /COUNT ROUND CELL.

T-TEST GROUPS=time(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q61
  /CRITERIA=CI(.95).


/* Knowledge of Covid vaccine

USE ALL.
COMPUTE filter_$=(time = 0).
VARIABLE LABELS filter_$ 'time = 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q109 q110 
  /ORDER=ANALYSIS.

GRAPH
  /HISTOGRAM=q111.

GRAPH
  /HISTOGRAM=q112.


/* Comparisons of efficacy estimates with severe side effect likelihoods
/* For people whose efficacy estimates were > 50

USE ALL.
COMPUTE filter_$=(time = 0 & q111 < 50).
VARIABLE LABELS filter_$ 'time = 0 & q111 < 50 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


T-TEST PAIRS=q111 WITH q112 (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

/* For people whose efficacy estimates were < 50

USE ALL.
COMPUTE filter_$=(time = 0 & q111 > 50).
VARIABLE LABELS filter_$ 'time = 0 & q111 > 50 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


T-TEST PAIRS=q111 WITH q112 (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

/*For people whose efficacy estimates were spot on

USE ALL.
COMPUTE filter_$=(time = 0 & q111 < 11).
VARIABLE LABELS filter_$ 'time = 0 & q111 < 11 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST PAIRS=q111 WITH q112 (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.


/* Perceived knowledge of Covid vaccine

USE ALL.
COMPUTE filter_$=(time = 0).
VARIABLE LABELS filter_$ 'time = 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q107 q108 
  /ORDER=ANALYSIS.

/* Preventive behaviors by beliefs about Covid vaccine knowledge

USE ALL.
COMPUTE filter_$=(time = 0).
VARIABLE LABELS filter_$ 'time = 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


T-TEST GROUPS=scientists_knowledge_lower_than_own(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q1 q6 q7 q8 q101 q9
  /CRITERIA=CI(.95).



/* THANKSGIVING AND WINTER________________________________

/* Retrospective size of TG dinner

USE ALL.
COMPUTE filter_$=(time = 0).
VARIABLE LABELS filter_$ 'time = 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q113
  /ORDER=ANALYSIS.

/* Retrospective precautions taken

USE ALL.
COMPUTE filter_$=(time = 0 & q114_6 = 2).
VARIABLE LABELS filter_$ 'time = 0 & q114_6 = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q114_1 q114_2 q114_3 q114_4 q114_5
  /ORDER=ANALYSIS.

/* Winter activities that are important

USE ALL.
COMPUTE filter_$=(time = 0).
VARIABLE LABELS filter_$ 'time = 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q56_1 q56_2 q56_3 q56_4 q56_5 q56_6 q56_7 q56_8 q56_9 q56_10 q56_11 q56_12 q56_13
  /ORDER=ANALYSIS.


/* DEMOGRAPHICS_______________________________________


WEIGHT OFF.

FREQUENCIES VARIABLES=gender_client race educ faminc_new pid3 q14
  /ORDER=ANALYSIS.




