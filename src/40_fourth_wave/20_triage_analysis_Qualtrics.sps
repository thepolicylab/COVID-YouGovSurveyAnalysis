* Encoding: UTF-8.


/* Exclude people who have taken before.

USE ALL.
COMPUTE filter_$=(taken_before = 1).
VARIABLE LABELS filter_$ 'taken_before = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


/* Activities in the last 2 weeks  
  
FREQUENCIES VARIABLES=q4_1 q4_2 q4_3 q4_4 q4_5
  /ORDER=ANALYSIS.


/* Various preventive behaviors

FREQUENCIES VARIABLES=q1 q6 q7 q100 q8 q101 q9 q102 q10
  /ORDER=ANALYSIS.


/* Changes due to and attitudes towards The Pause

FREQUENCIES VARIABLES=q103 q104 q105 q106
  /ORDER=ANALYSIS.


/* Test of family versus community manipulation

CROSSTABS
  /TABLES=vaccine_timing_interest BY q115_treat
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT
  /COUNT ROUND CELL.


/* Vaccines

FREQUENCIES VARIABLES=q1 q109 q110 q60_1 q60_2 q60_3 q60_4 q61
  /ORDER=ANALYSIS.

GRAPH
  /HISTOGRAM=q111_1.

GRAPH
  /HISTOGRAM=q112_1.


/* Thanksgiving in hindsight


FREQUENCIES VARIABLES=q113
  /ORDER=ANALYSIS.

USE ALL.
COMPUTE filter_$=(taken_before = 1 & q114_6 = 0).
VARIABLE LABELS filter_$ 'taken_before = 1 & q114_6 = 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q113 q114_1 q114_2 q114_3 q114_4 q114_5 q114_6 
  /ORDER=ANALYSIS.


USE ALL.
COMPUTE filter_$=(taken_before = 1).
VARIABLE LABELS filter_$ 'taken_before = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.



