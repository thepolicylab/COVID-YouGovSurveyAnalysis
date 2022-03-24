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


/* 1.2. Perceived vaccine benefits 

/* Rhode Island 

WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 2).
VARIABLE LABELS filter_$ 'time = 0 & sample = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q58_1 q58_2 q58_3 q58_4 q58_5 q58_6 q58_7 q58_8
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

FREQUENCIES VARIABLES=q58_1 q58_2 q58_3 q58_4 q58_5 q58_6 q58_7 q58_8
  /ORDER=ANALYSIS.

/* Change in perceived vaccine benefits

WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(sample  ~=  1).
VARIABLE LABELS filter_$ 'sample  ~=  1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=q58_1 q58_2 q58_3 q58_4 q58_5 q58_6 q58_7 q58_8 BY time
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT
  /COUNT ROUND CELL.

T-TEST GROUPS=time(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q58_1 q58_2 q58_3 q58_4 q58_5 q58_6 q58_7 q58_8
  /CRITERIA=CI(.95).

/* Burden on community health versus burden on community's economy

WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 2).
VARIABLE LABELS filter_$ 'time = 0 & sample = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST PAIRS=q58_3 WITH q58_8 (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.


/* 1.3. Perceived vaccine costs

/* Rhode Island 

WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 2).
VARIABLE LABELS filter_$ 'time = 0 & sample = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q59_1 q59_2 q59_3 q59_4 q59_5 q59_6
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

FREQUENCIES VARIABLES=q59_1 q59_2 q59_3 q59_4 q59_5 q59_6
  /ORDER=ANALYSIS.

/* Change in perceived vaccine costs

WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(sample  ~=  1).
VARIABLE LABELS filter_$ 'sample  ~=  1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
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



/* 1.4.1. Perceived others' intentions to vaccinate

/* Rhode Island 

WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 2).
VARIABLE LABELS filter_$ 'time = 0 & sample = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q60_1 q60_2 q60_3 q60_4 q60_5 q60_6 q60_7
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

FREQUENCIES VARIABLES=q60_1 q60_2 q60_3 q60_4 q60_5 q60_6 q60_7
  /ORDER=ANALYSIS.


/* Change in perceived others' intentions to vaccinate


WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(sample  ~=  1).
VARIABLE LABELS filter_$ 'sample  ~=  1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
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

/* Rhode Island 

WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 2).
VARIABLE LABELS filter_$ 'time = 0 & sample = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CORRELATIONS
  /VARIABLES=q126 q60_1 q60_2 q60_3 q60_4 q60_5 q60_6 q60_7
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

/* US

WEIGHT BY weight.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 1).
VARIABLE LABELS filter_$ 'time = 0 & sample = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CORRELATIONS
  /VARIABLES=q126 q60_1 q60_2 q60_3 q60_4 q60_5 q60_6 q60_7
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.


/* Correlation staircase by party ID

/* RI Democrats

WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 2 & pid3 = 1).
VARIABLE LABELS filter_$ 'time = 0 & sample = 2 & pid3 = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CORRELATIONS
  /VARIABLES=q126 q60_1 q60_2 q60_3 q60_4 q60_5 q60_6 q60_7
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

/* RI Republicans

WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 2 & pid3 = 2).
VARIABLE LABELS filter_$ 'time = 0 & sample = 2 & pid3 = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CORRELATIONS
  /VARIABLES=q126 q60_1 q60_2 q60_3 q60_4 q60_5 q60_6 q60_7
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

/* US Democrats

WEIGHT BY weight.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 1 & pid3 = 1).
VARIABLE LABELS filter_$ 'time = 0 & sample = 1 & pid3 = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CORRELATIONS
  /VARIABLES=q126 q60_1 q60_2 q60_3 q60_4 q60_5 q60_6 q60_7
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

/* US Republicans

WEIGHT BY weight.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 1 & pid3 = 2).
VARIABLE LABELS filter_$ 'time = 0 & sample = 1  & pid3 = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CORRELATIONS
  /VARIABLES=q126 q60_1 q60_2 q60_3 q60_4 q60_5 q60_6 q60_7
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.


/* Comparing groups of others esp party ID
/* Barring a more direct way of doing it in SPSS, try https://www.psychometrica.de/correlation.html


/* 1.4.2. Others' vaccination experiences

/* Rhode Island 

WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 2).
VARIABLE LABELS filter_$ 'time = 0 & sample = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q129 q130 q131 
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

FREQUENCIES VARIABLES=q129 q130 q131 
  /ORDER=ANALYSIS.


/* 1.5.1. Knowledge of Covid vaccine

/* Rhode Island 

WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 2).
VARIABLE LABELS filter_$ 'time = 0 & sample = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

GRAPH
  /HISTOGRAM=q111.

GRAPH
  /HISTOGRAM=q112.

/* US

WEIGHT BY weight.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 1).
VARIABLE LABELS filter_$ 'time = 0 & sample = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

GRAPH
  /HISTOGRAM=q111.

GRAPH
  /HISTOGRAM=q112.


/* Change in vaccine knowledge


WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(sample  ~=  1).
VARIABLE LABELS filter_$ 'sample  ~=  1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST GROUPS=time(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q111 q112
  /CRITERIA=CI(.95).



/* 1.5.2. J&J versus Moderna/Pfizer

/* Rhode Island 


WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 2).
VARIABLE LABELS filter_$ 'time = 0 & sample = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q132
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

FREQUENCIES VARIABLES=q132
  /ORDER=ANALYSIS.


/* 1.5.3. Risk behaviors after vaccination

/* Rhode Island 

WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 2).
VARIABLE LABELS filter_$ 'time = 0 & sample = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q133_covid_guidance dg_134_1 dg_134_2 dg_134_3 dg_134_4
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

FREQUENCIES VARIABLES=q133_covid_guidance dg_134_1 dg_134_2 dg_134_3 dg_134_4
  /ORDER=ANALYSIS.


/* Are low proportions of people saying we should continue wearing masks around family & friends at current levels due to people who have been vaccinated interpreting this to mean when around other vaccinated people?

/* Rhode Island 

WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 2).
VARIABLE LABELS filter_$ 'time = 0 & sample = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=dg_134_3 BY vaccinated_and_friends_family_vaccinated
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.


/* US

WEIGHT BY weight.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 1).
VARIABLE LABELS filter_$ 'time = 0 & sample = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=dg_134_3 BY vaccinated_and_friends_family_vaccinated
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.

/* Did ratings about relaxing restrictions differ depending on whether people have been vaccinated?


WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 2).
VARIABLE LABELS filter_$ 'time = 0 & sample = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST GROUPS=vaccinated_yes_no(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q133_covid_guidance 
  /CRITERIA=CI(.95).

CROSSTABS
  /TABLES=vaccinated_yes_no BY dg_134_1 dg_134_2 dg_134_3 dg_134_4
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.

/* US

WEIGHT BY weight.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 1).
VARIABLE LABELS filter_$ 'time = 0 & sample = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST GROUPS=vaccinated_yes_no(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q133_covid_guidance 
  /CRITERIA=CI(.95).

CROSSTABS
  /TABLES=vaccinated_yes_no BY dg_134_1 dg_134_2 dg_134_3 dg_134_4
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.

/* 1.6. Perceived knowledge of Covid vaccine

/* Rhode Island 

WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 2).
VARIABLE LABELS filter_$ 'time = 0 & sample = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q107 q108 
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

FREQUENCIES VARIABLES=q107 q108 
  /ORDER=ANALYSIS.

/* Change in perceived knowledge 

WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(sample  ~=  1).
VARIABLE LABELS filter_$ 'sample  ~=  1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST GROUPS=time(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q107 q108
  /CRITERIA=CI(.95).


/* Preventive behaviors by beliefs about Covid vaccine knowledge

/* Rhode Island 

WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 2).
VARIABLE LABELS filter_$ 'time = 0 & sample = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST GROUPS=scientists_knowledge_lower_than_own(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=vaccinated_yes_no q126 q6 q7 q8 q9
  /CRITERIA=CI(.95).


/* US

WEIGHT BY weight.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 1).
VARIABLE LABELS filter_$ 'time = 0 & sample = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST GROUPS=scientists_knowledge_lower_than_own(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=vaccinated_yes_no q126 q6 q7 q8 q9
  /CRITERIA=CI(.95).



/*PREVENTIVE BEHAVIORS AND RISK FACTORS__________________________



/* 2.1.1. Mask wearing

/* Rhode Island 

WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 2).
VARIABLE LABELS filter_$ 'time = 0 & sample = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q6 q7 q100 q8
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

FREQUENCIES VARIABLES=q6 q7 q100 q8
  /ORDER=ANALYSIS.


/* Change in mask wearing


WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(sample  ~=  1).
VARIABLE LABELS filter_$ 'sample  ~=  1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


CROSSTABS
  /TABLES=q6 q7 q8 q100 BY time
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT
  /COUNT ROUND CELL.

T-TEST GROUPS=time(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q6 q7 q100 q8
  /CRITERIA=CI(.95).

/* Compare own to others' mask wearing

/* Rhode Island 

WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 2).
VARIABLE LABELS filter_$ 'time = 0 & sample = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST PAIRS=q7 WITH q100 (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.


/* US

WEIGHT BY weight.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 1).
VARIABLE LABELS filter_$ 'time = 0 & sample = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST PAIRS=q7 WITH q100 (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.


/* 2.1.2. Social distancing

/* Rhode Island 

WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 2).
VARIABLE LABELS filter_$ 'time = 0 & sample = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q9 q102
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

FREQUENCIES VARIABLES=q9 q102
  /ORDER=ANALYSIS.


/* Change in social distancing


WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(sample  ~=  1).
VARIABLE LABELS filter_$ 'sample  ~=  1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
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

/* Rhode Island 

WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 2).
VARIABLE LABELS filter_$ 'time = 0 & sample = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST PAIRS=q9 WITH q102 (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

/* US

WEIGHT BY weight.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 1).
VARIABLE LABELS filter_$ 'time = 0 & sample = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST PAIRS=q9 WITH q102 (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.


/* 2.2.1. Number of people socialized with

/* Rhode Island 

WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 2).
VARIABLE LABELS filter_$ 'time = 0 & sample = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q10
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

FREQUENCIES VARIABLES=q10
  /ORDER=ANALYSIS.


/* Change in number of people socialized with


WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(sample  ~=  1).
VARIABLE LABELS filter_$ 'sample  ~=  1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
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
  

/* 2.2.2. Risk events

/* Rhode Island 

WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 2).
VARIABLE LABELS filter_$ 'time = 0 & sample = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q4_1 q4_2 q4_3 q4_4
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

FREQUENCIES VARIABLES=q4_1 q4_2 q4_3 q4_4
  /ORDER=ANALYSIS.


/* Change in risk events


WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(sample  ~=  1).
VARIABLE LABELS filter_$ 'sample  ~=  1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=q4_1 q4_2 q4_3 q4_4 BY time
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT
  /COUNT ROUND CELL.


/* Are differences in prevventive and risk behaviors being driven by people who have been vaccinated?

/* Rhode Island 

WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 2).
VARIABLE LABELS filter_$ 'time = 0 & sample = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


T-TEST GROUPS=vaccinated_yes_no(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q6 q7 q100 q8 q9 
  /CRITERIA=CI(.95).


CROSSTABS
  /TABLES=q10 q4_1 q4_2 q4_3 q4_4 BY vaccinated_yes_no
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.

/* US

WEIGHT BY weight.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 1).
VARIABLE LABELS filter_$ 'time = 0 & sample = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST GROUPS=vaccinated_yes_no(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q6 q7 q100 q8 q9
  /CRITERIA=CI(.95).

CROSSTABS
  /TABLES=q10 q4_1 q4_2 q4_3 q4_4 BY vaccinated_yes_no
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.





/* BELIEFS AND ATTITUDES ABOUT THE PANDEMIC__________________________


/* 3.1.1. Forecast

/* Rhode Island 

WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 2).
VARIABLE LABELS filter_$ 'time = 0 & sample = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q26
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

FREQUENCIES VARIABLES=q26
  /ORDER=ANALYSIS.

/* Change in forecast


WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(sample  ~=  1).
VARIABLE LABELS filter_$ 'sample  ~=  1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=q26 BY time
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT
  /COUNT ROUND CELL.


/* Risk perceptions

/* Rhode Island 

WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 2).
VARIABLE LABELS filter_$ 'time = 0 & sample = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

GRAPH
  /HISTOGRAM=q21.

GRAPH
  /HISTOGRAM=q22.

/* US

WEIGHT BY weight.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 1).
VARIABLE LABELS filter_$ 'time = 0 & sample = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

GRAPH
  /HISTOGRAM=q21.

GRAPH
  /HISTOGRAM=q22.


/* Change in risk perceptions


WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(sample  ~=  1).
VARIABLE LABELS filter_$ 'sample  ~=  1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST GROUPS=time(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q21 q22
  /CRITERIA=CI(.95).


/* 3.1.4. Seriousness of the virus

/* Rhode Island 

WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 2).
VARIABLE LABELS filter_$ 'time = 0 & sample = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q23_9 
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

FREQUENCIES VARIABLES=q23_9 
  /ORDER=ANALYSIS.

/* Change in seriousness


WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(sample  ~=  1).
VARIABLE LABELS filter_$ 'sample  ~=  1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=q23_9 BY time
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT
  /COUNT ROUND CELL.

T-TEST GROUPS=time(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q23_9
  /CRITERIA=CI(.95).


/* Tested in last month

/* Rhode Island 

WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 2).
VARIABLE LABELS filter_$ 'time = 0 & sample = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q62
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

FREQUENCIES VARIABLES=q62
  /ORDER=ANALYSIS.


/* 3.2.1. Willigness and intention to get tested

/* Rhode Island 

WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 2).
VARIABLE LABELS filter_$ 'time = 0 & sample = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q29 q30
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

FREQUENCIES VARIABLES=q29 q30
  /ORDER=ANALYSIS.


/* Change in willingness and intention


WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(sample  ~=  1).
VARIABLE LABELS filter_$ 'sample  ~=  1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
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


/* Is this change due to lots of vaccinated people saying they don't intend to get tested? 


WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(sample  ~=  1).
VARIABLE LABELS filter_$ 'sample  ~=  1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=vaccinated_yes_no BY q30
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.




/* 3.2.2. Beliefs about friends/family intention to get tested

/* Rhode Island 

WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 2).
VARIABLE LABELS filter_$ 'time = 0 & sample = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q25_new 
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

FREQUENCIES VARIABLES=q25_new 
  /ORDER=ANALYSIS.



/* Change in beliefs about friends/family intention to get tested


WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(sample  ~=  1).
VARIABLE LABELS filter_$ 'sample  ~=  1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=q25_new BY time
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT
  /COUNT ROUND CELL.

T-TEST GROUPS=time(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q25_new
  /CRITERIA=CI(.95).


/* 3.3.1. US death estimates

/* Rhode Island 

WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 2).
VARIABLE LABELS filter_$ 'time = 0 & sample = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=US_deaths_estimate_low_right_high
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

FREQUENCIES VARIABLES=US_deaths_estimate_low_right_high
  /ORDER=ANALYSIS.

/* Change in US death estimates

WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(sample  ~=  1).
VARIABLE LABELS filter_$ 'sample  ~=  1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
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


/* 3.3.2. Reliability of public health scientists 

/* Rhode Island 

WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 2).
VARIABLE LABELS filter_$ 'time = 0 & sample = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q18
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

FREQUENCIES VARIABLES=q18
  /ORDER=ANALYSIS.


/* Change in reliability of public health scientists

WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(sample  ~=  1).
VARIABLE LABELS filter_$ 'sample  ~=  1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
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


/* 3.3.3. Information source use
/* THIS ONE MIGHT BE CODED WITH UNDERSCORED SUBNUMBERS...

/* Rhode Island 

WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 2).
VARIABLE LABELS filter_$ 'time = 0 & sample = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q127_1 q127_2 q127_3 q127_4 q127_5 q127_6 q127_7 q127_8 q127_9 q127_10 q127_11 q127_12 
    q127_13 q127_14 q127_15 q127_16 q127_17 q127_18 q127_19 q127_20 q127_21 q127_22
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

FREQUENCIES VARIABLES=q127_1 q127_2 q127_3 q127_4 q127_5 q127_6 q127_7 q127_8 q127_9 q127_10 q127_11 q127_12 
    q127_13 q127_14 q127_15 q127_16 q127_17 q127_18 q127_19 q127_20 q127_21 q127_22
  /ORDER=ANALYSIS.


/* 3.3.4. Trust in gov't

/* Rhode Island 

WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 2).
VARIABLE LABELS filter_$ 'time = 0 & sample = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q128_1 q128_2 q128_3
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

FREQUENCIES VARIABLES=q128_1 q128_2 q128_3
  /ORDER=ANALYSIS.




/* DEMOGRAPHICS_______________________________________


/* Rhode Island 

WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 2).
VARIABLE LABELS filter_$ 'time = 0 & sample = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=gender_client race educ faminc_new pid3 q14 q32 q36
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

FREQUENCIES VARIABLES=gender_client race educ faminc_new pid3 q14 q32 q36
  /ORDER=ANALYSIS.


/* A closer look at vaccine intentions
/* Who has been vaccinated?

/* RI

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

/* US

WEIGHT BY weight.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 1).
VARIABLE LABELS filter_$ 'time = 0 & sample = 1 (FILTER)'.
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

/* RI

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

/* US

WEIGHT BY weight.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 1).
VARIABLE LABELS filter_$ 'time = 0 & sample = 1 (FILTER)'.
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



/* Or in the interest of brevity, how already-vaccinated-or-definitely-will varies by demographics

/* RI

WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 2).
VARIABLE LABELS filter_$ 'time = 0 & sample = 2 & vaccinated_yes_no = 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=already_vaccinated_or_definitely_will_get_vaccinated BY gender_client race educ family_incom_binned_evenly pid3 age_ranges_by_eligbility HDC_tiers
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT COLUMN
  /COUNT ROUND CELL.

CORRELATIONS
  /VARIABLES=already_vaccinated_or_definitely_will_get_vaccinated age family_incom_binned_evenly
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

/* US 

WEIGHT BY weight.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 1).
VARIABLE LABELS filter_$ 'time = 0 & sample = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=already_vaccinated_or_definitely_will_get_vaccinated BY gender_client race educ family_incom_binned_evenly pid3 age_ranges_by_eligbility
  /CELLS=COUNT COLUMN
  /COUNT ROUND CELL.

CORRELATIONS
  /VARIABLES=already_vaccinated_or_definitely_will_get_vaccinated age family_incom_binned_evenly
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.


/* And just for fun, all of that in a giant regression


/* RI

WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 2).
VARIABLE LABELS filter_$ 'time = 0 & sample = 2 & vaccinated_yes_no = 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT already_vaccinated_or_definitely_will_get_vaccinated
  /METHOD=ENTER gender_dummy_coded_female race_dummy_coded_black race_dummy_coded_latino 
    No_HS_dummy_coded HS_dummy_coded Some_college_dummy_coded two_year_degree_dummy_coded 
    family_incom_binned_evenly party_dummy_coded_republican party_dummy_coded_independent age 
    HDC_tier_1_dummy_coded HDC_tier_2_dummy_coded.


/* US

WEIGHT BY weight.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 1).
VARIABLE LABELS filter_$ 'time = 0 & sample = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT already_vaccinated_or_definitely_will_get_vaccinated
  /METHOD=ENTER gender_dummy_coded_female race_dummy_coded_black race_dummy_coded_latino 
    No_HS_dummy_coded HS_dummy_coded Some_college_dummy_coded two_year_degree_dummy_coded 
    family_incom_binned_evenly party_dummy_coded_republican party_dummy_coded_independent age.

