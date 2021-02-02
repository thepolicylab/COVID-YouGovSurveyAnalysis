* Encoding: UTF-8.

/* Exclude respondents who took the survey before or didn't complete.

USE ALL.
COMPUTE filter_$=(include = 1).
VARIABLE LABELS filter_$ 'include = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


/* AGE BREAKDOWN_____________________________________


DATASET ACTIVATE DataSet2.
FREQUENCIES VARIABLES=age age_range eighteen_to_twentynine_versus_everybody_else 
    eighteen_twentynine_vs_thirty_thirtynine_vs_everybody_else
  /ORDER=ANALYSIS.
                                                                                                         

/* PREVENTIVE AND RISK BEHAVIORS__________________________

/*Intention to vaccinate

CROSSTABS
  /TABLES=age_range BY q1
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

ONEWAY q1 BY age_range
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).

  T-TEST GROUPS=eighteen_to_twentynine_versus_everybody_else(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q1
  /CRITERIA=CI(.95).

ONEWAY q1 BY eighteen_twentynine_vs_thirty_thirtynine_vs_everybody_else
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).


/* Cooperate with contact tracers

CROSSTABS
  /TABLES=age_range BY q3
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

ONEWAY q3 BY age_range
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).

  T-TEST GROUPS=eighteen_to_twentynine_versus_everybody_else(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q3
  /CRITERIA=CI(.95).

ONEWAY q3 BY eighteen_twentynine_vs_thirty_thirtynine_vs_everybody_else
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).


/* Mask wearing outside of the home

CROSSTABS
  /TABLES=age_range BY q6
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

ONEWAY q6 BY age_range
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).

  T-TEST GROUPS=eighteen_to_twentynine_versus_everybody_else(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q6
  /CRITERIA=CI(.95).

ONEWAY q6 BY eighteen_twentynine_vs_thirty_thirtynine_vs_everybody_else
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).


/* Mask wearing entering businesses

CROSSTABS
  /TABLES=age_range BY q8
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

ONEWAY q8 BY age_range
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).

  T-TEST GROUPS=eighteen_to_twentynine_versus_everybody_else(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q8
  /CRITERIA=CI(.95).

ONEWAY q8 BY eighteen_twentynine_vs_thirty_thirtynine_vs_everybody_else
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).


/* Mask wearing while visiting friends or family

CROSSTABS
  /TABLES=age_range BY q7
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

ONEWAY q7 BY age_range
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).

  T-TEST GROUPS=eighteen_to_twentynine_versus_everybody_else(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q7
  /CRITERIA=CI(.95).

ONEWAY q7 BY eighteen_twentynine_vs_thirty_thirtynine_vs_everybody_else
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).


/* Contact tracing app

CROSSTABS
  /TABLES=age_range BY q2
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

ONEWAY q2 BY age_range
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).

  T-TEST GROUPS=eighteen_to_twentynine_versus_everybody_else(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q2
  /CRITERIA=CI(.95).

ONEWAY q2 BY eighteen_twentynine_vs_thirty_thirtynine_vs_everybody_else
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).
'

/* Social distancing outside of the home

CROSSTABS
  /TABLES=age_range BY q9
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

ONEWAY q9 BY age_range
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).

  T-TEST GROUPS=eighteen_to_twentynine_versus_everybody_else(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q9
  /CRITERIA=CI(.95).

ONEWAY q9 BY eighteen_twentynine_vs_thirty_thirtynine_vs_everybody_else
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).


/* Number of people socialized with in-person 

CROSSTABS
  /TABLES=age_range BY q10
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

ONEWAY q10 BY age_range
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).

  T-TEST GROUPS=eighteen_to_twentynine_versus_everybody_else(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q10
  /CRITERIA=CI(.95).

ONEWAY q10 BY eighteen_twentynine_vs_thirty_thirtynine_vs_everybody_else
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).


/* Types of social gathering in the last two weeks.

CROSSTABS
  /TABLES=age_range eighteen_to_twentynine_versus_everybody_else 
    eighteen_twentynine_vs_thirty_thirtynine_vs_everybody_else BY q4_1 q4_2 q4_3 q4_4
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.


/* Likelihood of interacting with people outside of their school in personal setting

CROSSTABS
  /TABLES=age_range BY q13
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

ONEWAY q13 BY age_range
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).

  T-TEST GROUPS=eighteen_to_twentynine_versus_everybody_else(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q13
  /CRITERIA=CI(.95).

ONEWAY q13 BY eighteen_twentynine_vs_thirty_thirtynine_vs_everybody_else
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).


/* Are 18-29ers more or less likely to be working than everyone else?

CROSSTABS
  /TABLES=age_range eighteen_to_twentynine_versus_everybody_else 
    eighteen_twentynine_vs_thirty_thirtynine_vs_everybody_else BY working
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW COLUMN TOTAL 
  /COUNT ROUND CELL.


/* What kinds of jobs do they have?

CROSSTABS
  /TABLES=age_range eighteen_to_twentynine_versus_everybody_else 
    eighteen_twentynine_vs_thirty_thirtynine_vs_everybody_else BY q14
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW COLUMN TOTAL 
  /COUNT ROUND CELL.


/* Do they vary in number of people they interact with at work?

CROSSTABS
  /TABLES=age_range eighteen_to_twentynine_versus_everybody_else 
    eighteen_twentynine_vs_thirty_thirtynine_vs_everybody_else BY q15
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW COLUMN TOTAL 
  /COUNT ROUND CELL.


/* Likelihood of interacting with people outside of their school in job setting

CROSSTABS
  /TABLES=age_range BY q12
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

ONEWAY q12 BY age_range
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).

  T-TEST GROUPS=eighteen_to_twentynine_versus_everybody_else(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q12
  /CRITERIA=CI(.95).

ONEWAY q12 BY eighteen_twentynine_vs_thirty_thirtynine_vs_everybody_else
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).


/* BELIEFS ABOUT THE PANDEMIC__________________________

/* Age group with most cases

CROSSTABS
  /TABLES=age_range BY q20
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

/* How bad the pandemic is going to get

CROSSTABS
  /TABLES=age_range BY q26
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.


/* Proportion infected in your state

ONEWAY q21 BY age_range
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).

  T-TEST GROUPS=eighteen_to_twentynine_versus_everybody_else(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q21
  /CRITERIA=CI(.95).

ONEWAY q21 BY eighteen_twentynine_vs_thirty_thirtynine_vs_everybody_else
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).


/* Likelihood of becoming infected

ONEWAY q22 BY age_range
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).

  T-TEST GROUPS=eighteen_to_twentynine_versus_everybody_else(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q22
  /CRITERIA=CI(.95).

ONEWAY q22 BY eighteen_twentynine_vs_thirty_thirtynine_vs_everybody_else
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).


/* Reliability of information from public health

CROSSTABS
  /TABLES=age_range BY q18
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

ONEWAY q18 BY age_range
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).

  T-TEST GROUPS=eighteen_to_twentynine_versus_everybody_else(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q18
  /CRITERIA=CI(.95).

ONEWAY q18 BY eighteen_twentynine_vs_thirty_thirtynine_vs_everybody_else
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).



/* Desired format for communication about Covid

CROSSTABS
  /TABLES=age_range BY q28
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.


/* Willingness to get tested

CROSSTABS
  /TABLES=age_range BY q29
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

ONEWAY q29 BY age_range
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).

  T-TEST GROUPS=eighteen_to_twentynine_versus_everybody_else(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q29
  /CRITERIA=CI(.95).

ONEWAY q29 BY eighteen_twentynine_vs_thirty_thirtynine_vs_everybody_else
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).


/* Intention to get tested in the next 2 weeks

CROSSTABS
  /TABLES=age_range BY q30
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

ONEWAY q30 BY age_range
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).

  T-TEST GROUPS=eighteen_to_twentynine_versus_everybody_else(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q30
  /CRITERIA=CI(.95).

ONEWAY q30 BY eighteen_twentynine_vs_thirty_thirtynine_vs_everybody_else
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).


/* Testing beliefs battery 

CROSSTABS
  /TABLES=age_range eighteen_to_twentynine_versus_everybody_else 
    eighteen_twentynine_vs_thirty_thirtynine_vs_everybody_else BY q23_1 q23_2 q23_3 q23_4 q23_5 q23_6 
    q23_7 q23_8 q23_9 q23_10
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

ONEWAY q23_1 q23_2 q23_3 q23_4 q23_5 q23_6 q23_7 q23_8 q23_9 q23_10 BY age_range
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).

T-TEST GROUPS=eighteen_to_twentynine_versus_everybody_else(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q23_1 q23_2 q23_3 q23_4 q23_5 q23_6 q23_7 q23_8 q23_9 q23_10
  /CRITERIA=CI(.95).

ONEWAY q23_1 q23_2 q23_3 q23_4 q23_5 q23_6 q23_7 q23_8 q23_9 q23_10 BY 
    eighteen_twentynine_vs_thirty_thirtynine_vs_everybody_else
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).


/* Estimate of number of friends/family that intend to get tested

CROSSTABS
  /TABLES=age_range BY q25
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

ONEWAY q25 BY age_range
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).

  T-TEST GROUPS=eighteen_to_twentynine_versus_everybody_else(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q25
  /CRITERIA=CI(.95).

ONEWAY q25 BY eighteen_twentynine_vs_thirty_thirtynine_vs_everybody_else
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).


/* TESTING LOGISTICS________________________________

CROSSTABS
  /TABLES=age_range eighteen_to_twentynine_versus_everybody_else 
    eighteen_twentynine_vs_thirty_thirtynine_vs_everybody_else BY q27 q32 q33 q34 q35 q36 q37 
    q40 q41 q42_1 q42_2 q42_3 q42_4 q42_5 q43 q44 q38 q39 
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.


/* DEMOGRAPHICS_____________________________________

/* Out of state residents that plan to be in RI

CROSSTABS
  /TABLES=age_range BY q47
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

  
/* Gender, race/ethnicity, protest, party ID, education, income
  
CROSSTABS
  /TABLES=age_range eighteen_to_twentynine_versus_everybody_else 
    eighteen_twentynine_vs_thirty_thirtynine_vs_everybody_else BY gender race educ faminc_new q16 q17 
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

