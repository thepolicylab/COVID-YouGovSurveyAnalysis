* Encoding: UTF-8.



DATASET ACTIVATE DataSet3.
USE ALL.
COMPUTE filter_$=(taken_before = 1 & age_group = 1 & time = 0).
VARIABLE LABELS filter_$ 'taken_before = 1 & age_group = 1 & time = 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.



/* Proportions for Thanksgiving, just 18-29

FREQUENCIES VARIABLES=q57 q58 q59 q59_free q60 q60_free
  /ORDER=ANALYSIS.


/* Proportions for winter activities, just 18-29

FREQUENCIES VARIABLES=q56_1 q56_2 q56_3 q56_4 q56_5 q56_6 q56_7 q56_8 q56_9 q56_10 q56_11 q56_12
  /ORDER=ANALYSIS.



