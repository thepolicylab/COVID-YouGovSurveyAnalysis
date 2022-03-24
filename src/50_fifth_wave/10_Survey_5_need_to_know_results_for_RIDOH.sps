* Encoding: UTF-8.

/* VACCINATION_____________________________________

/* 1.1.1. The vaccinated

/* Rhode Island 


WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 2).
VARIABLE LABELS filter_$ 'time = 0 & sample = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q120 q121 q122 q124 q125_1 q125_2 q125_3 q125_4 q125_5
  /ORDER=ANALYSIS.

/* US

WEIGHT BY weight.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 1).
VARIABLE LABELS filter_$ 'time = 0 & sample = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q120 q121 q122 q124 q125_1 q125_2 q125_3 q125_4 q125_5
  /ORDER=ANALYSIS.


/* 1.1.2. The unvaccinated

/* Rhode Island 

WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 2).
VARIABLE LABELS filter_$ 'time = 0 & sample = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q126
  /ORDER=ANALYSIS.

/* US

WEIGHT BY weight.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 1).
VARIABLE LABELS filter_$ 'time = 0 & sample = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q126
  /ORDER=ANALYSIS.



/* A closer look at vaccine intentions in RI
/* Who has been vaccinated?

WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 2).
VARIABLE LABELS filter_$ 'time = 0 & sample = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=vaccinated_yes_no BY gender_client race educ faminc_new pid3 core_city_excluding_Newport_and_noncentral_PVD
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT COLUMN
  /COUNT ROUND CELL.


CORRELATIONS
  /VARIABLES=vaccinated_yes_no age
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.


/* Do intentions to get vaccinated vary by demographic groups? 

WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 2 & vaccinated_yes_no = 0).
VARIABLE LABELS filter_$ 'time = 0 & sample = 2 & vaccinated_yes_no = 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=q126 BY gender_client race educ faminc_new pid3 core_city_excluding_Newport_and_noncentral_PVD
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT COLUMN
  /COUNT ROUND CELL.

CORRELATIONS
  /VARIABLES=q126 age
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.













