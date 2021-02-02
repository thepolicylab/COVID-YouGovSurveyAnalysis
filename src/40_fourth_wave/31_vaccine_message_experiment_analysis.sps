* Encoding: UTF-8.

/* Apply weights

WEIGHT BY weight.


/* Main result

USE ALL.
COMPUTE filter_$=(time = 0).
VARIABLE LABELS filter_$ 'time = 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=q115_treat BY vaccine_timing_interest
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.


/* Did it just so happen that there are more vaccine intenders in the family condition?

CROSSTABS
  /TABLES=q115_treat BY vaccine_definitely vaccine_definitely_and_maybe
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT
  /COUNT ROUND CELL.

T-TEST GROUPS=q115_treat(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=q1
  /CRITERIA=CI(.95).


/* Did demographics vary by condition? (YouGov only balanced party ID across cells)

T-TEST GROUPS=q115_treat(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=age
  /CRITERIA=CI(.95).

CROSSTABS
  /TABLES=q115_treat BY gender_client race educ pid3 faminc_new
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT 
  /COUNT ROUND CELL.


/* Does the result survive when demographics are added?

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT vaccine_timing_interest
  /METHOD=ENTER q115_treat age gender_dummy_coded_female party_dummy_coded_republican 
    race_dummy_coded_black race_dummy_coded_latino core_city_excluding_Newport_and_noncentral_PVD 
    eighteen_to_twentynine_dummy_coded sixty_and_over_dummy_coded low_SES_dummy_coded No_HS_dummy_coded 
    HS_dummy_coded Some_college_dummy_coded two_year_degree_dummy_coded dependents_dummy_coded.


/* Does the result survive when excluding the most likely to get vaccinated (people who responded "Definitely")?

USE ALL.
COMPUTE filter_$=(time = 0 & q1 < 5).
VARIABLE LABELS filter_$ 'time = 0 & q1 < 5 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=q115_treat BY vaccine_timing_interest
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT
  /COUNT ROUND CELL.


/* Does the result survive when excluding "Definitely" and "Maybe" people?

USE ALL.
COMPUTE filter_$=(time = 0 & q1 < 4).
VARIABLE LABELS filter_$ 'time = 0 & q1 < 4 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=q115_treat BY vaccine_timing_interest
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT
  /COUNT ROUND CELL.

