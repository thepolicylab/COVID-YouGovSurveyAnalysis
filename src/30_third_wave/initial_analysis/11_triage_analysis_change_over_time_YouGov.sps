﻿* Encoding: UTF-8.

/* DIFFERENCES FROM BEFORE AND AFTER NEW RESTRICTIONS.


WEIGHT BY weight.

/* Compare Time 1 and Time 2 for continuous variables.

T-TEST GROUPS=time(1 0)
  /MISSING=ANALYSIS
  /VARIABLES=q6 q7 q8 q9 q29 q30
  /CRITERIA=CI(.95).

/* Compare Time 1 and Time 2 for dichotomous or categorical variables.

CROSSTABS
  /TABLES=time BY q4_1  q4_2 q4_3 q4_4 q4_5 q26 q10
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.



