* Encoding: UTF-8.


/* These analyses are in preparation for RIDOH's focus on booster uptake 
/* This code should be used for the dataset associated with Survey 7:
/* TPL_Testing_Survey_SeventhWave_YouGov.sav


/* The direct mailing is focusing on Providence, Woonsocket, Pawtucket and Central Falls
/* QUESTION: Should we take our sample to be speaking for these areas?


USE ALL.
COMPUTE filter_$=(sample = 2 & vaccinated_yes_or_no = 1).
VARIABLE LABELS filter_$ 'sample = 2 & vaccinated_yes_or_no = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=boosted_yes_or_no BY area_in_RI
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.

/* ANSWER: Clearly not, since there are 11 people from CF, 53 from Pawtucket, and 34 from Woonsocket (Providence can be defined a number of ways)
/* And these people are not unusually low in booster uptake (except in Woonsocket)

/* QUESTION: How many people in our sample living in these focal areas have been vaccinated but have not had a booster?

USE ALL.
COMPUTE filter_$=(sample = 2 & vaccinated_yes_or_no = 1).
VARIABLE LABELS filter_$ 'sample = 2 & vaccinated_yes_or_no = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=boosted_yes_or_no BY areas_of_booster_blitz
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.

/* ANSWER: 56
/* So one thing we could do is simply look at what these people said

USE ALL.
COMPUTE filter_$=(sample = 2 & vaccinated_yes_or_no = 1 & boosted_yes_or_no = 0 & 
    areas_of_booster_blitz = 1).
VARIABLE LABELS filter_$ 'sample = 2 & vaccinated_yes_or_no = 1 & boosted_yes_or_no = 0 & '+
    'areas_of_booster_blitz = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q182
  /ORDER=ANALYSIS.

/* But as we can see, it runs the gamut. 

/* So another way to go is comparative:
/* QUESTION: Do RIers in the booster blitz areas have different concerns than RIers not in these areas?
/* Note that we're not using population weights here.

USE ALL.
COMPUTE filter_$=(sample = 2 & vaccinated_yes_or_no = 1 & boosted_yes_or_no = 0).
VARIABLE LABELS filter_$ 'sample = 2 & vaccinated_yes_or_no = 1 & boosted_yes_or_no = 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST GROUPS=areas_of_booster_blitz(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q183_1 q183_2 q183_3 q183_4 q183_5 q183_6 q183_7 q183_8 q183_9 q183_10 q183_11 q183_12
  /CRITERIA=CI(.95).

CROSSTABS
  /TABLES=q183_1 q183_2 q183_3 q183_4 q183_5 q183_6 q183_7 q183_8 q183_9 q183_10 q183_11 q183_12 BY 
    areas_of_booster_blitz
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.

/* ANSWER: Seemingly not.
/* QUESTION: Do unboosted RIers have different concerns than unboosted Americans more generally?

USE ALL.
COMPUTE filter_$=(vaccinated_yes_or_no = 1 & boosted_yes_or_no = 0).
VARIABLE LABELS filter_$ 'vaccinated_yes_or_no = 1 & boosted_yes_or_no = 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST GROUPS=sample(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=q183_1 q183_2 q183_3 q183_4 q183_5 q183_6 q183_7 q183_8 q183_9 q183_10 q183_11 q183_12
  /CRITERIA=CI(.95).

CROSSTABS
  /TABLES=q183_1 q183_2 q183_3 q183_4 q183_5 q183_6 q183_7 q183_8 q183_9 q183_10 q183_11 q183_12 BY 
    sample
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.


/* ANSWER: Seemingly not.

/* QUESTION: Does this picture change when you do apply population weights?

WEIGHT BY weight_RI_all.

USE ALL.
COMPUTE filter_$=(sample = 2 & vaccinated_yes_or_no = 1 & boosted_yes_or_no = 0).
VARIABLE LABELS filter_$ 'sample = 2 & vaccinated_yes_or_no = 1 & boosted_yes_or_no = 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST GROUPS=areas_of_booster_blitz(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q183_1 q183_2 q183_3 q183_4 q183_5 q183_6 q183_7 q183_8 q183_9 q183_10 q183_11 q183_12
  /CRITERIA=CI(.95).

WEIGHT BY weight_for_parent_nonparent_comparisons.

USE ALL.
COMPUTE filter_$=(vaccinated_yes_or_no = 1 & boosted_yes_or_no = 0).
VARIABLE LABELS filter_$ 'vaccinated_yes_or_no = 1 & boosted_yes_or_no = 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

T-TEST GROUPS=sample(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=q183_1 q183_2 q183_3 q183_4 q183_5 q183_6 q183_7 q183_8 q183_9 q183_10 q183_11 q183_12
  /CRITERIA=CI(.95).

/* ANSWER: Seemingly not.

/* In that case we could just describe these concerns. Maybe that's the best we can do.

/* Here's all booster reason scales by whether or not a vaccinated person has received a booster (whole sample)

WEIGHT OFF.

USE ALL.
COMPUTE filter_$=(vaccinated_yes_or_no = 1).
VARIABLE LABELS filter_$ 'vaccinated_yes_or_no = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=q183_1 q183_2 q183_3 q183_4 q183_5 q183_6 q183_7 q183_8 q183_9 q183_10 q183_11 q183_12 BY 
    boosted_yes_or_no
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.


/* Here's all booster reason scales by whether or not a vaccinated person has received a booster (RI sample)

WEIGHT OFF.

USE ALL.
COMPUTE filter_$=(sample = 2 & vaccinated_yes_or_no = 1).
VARIABLE LABELS filter_$ 'sample = 2 & vaccinated_yes_or_no = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=q183_1 q183_2 q183_3 q183_4 q183_5 q183_6 q183_7 q183_8 q183_9 q183_10 q183_11 q183_12 BY 
    boosted_yes_or_no
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.

/* And for comparison, here's the same thing in just the US sample

USE ALL.
COMPUTE filter_$=(sample = 1 & vaccinated_yes_or_no = 1).
VARIABLE LABELS filter_$ 'sample = 1 & vaccinated_yes_or_no = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=q183_1 q183_2 q183_3 q183_4 q183_5 q183_6 q183_7 q183_8 q183_9 q183_10 q183_11 q183_12 BY 
    boosted_yes_or_no
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.



/* Right, so every single one of them differs as a function of booster receipt.
/* This brings us back to the garbage can regressions—it might be worthwhile to
/* do them using just the people who are vaccinated (whole sample).

USE ALL.
COMPUTE filter_$=(vaccinated_yes_or_no = 1).
VARIABLE LABELS filter_$ 'vaccinated_yes_or_no = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT boosted_yes_or_no
  /METHOD=ENTER age gender_dummy_coded_female party_dummy_coded_republican 
    party_dummy_coded_independent college_degree_or_higher_dummy_coded race_dummy_coded_white 
    q183_1 q183_2 q183_3 q183_4 q183_5 q183_6 q183_7 q183_8 q183_9 q183_10 q183_11 q183_12.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT boosted_yes_or_no
  /METHOD=ENTER age gender_dummy_coded_female trump_vote_dummy_code 
    college_degree_or_higher_dummy_coded race_dummy_coded_white 
    q183_1 q183_2 q183_3 q183_4 q183_5 q183_6 q183_7 q183_8 q183_9 q183_10 q183_11 q183_12.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT boosted_yes_or_no
  /METHOD=ENTER age gender_dummy_coded_female party_dummy_coded_republican 
    party_dummy_coded_independent college_degree_or_higher_dummy_coded race_dummy_coded_black 
    race_dummy_coded_latino q183_1 q183_2 q183_3 q183_4 q183_5 q183_6 q183_7 q183_8 q183_9 q183_10 q183_11 q183_12.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT boosted_yes_or_no
  /METHOD=ENTER age gender_dummy_coded_female trump_vote_dummy_code 
    college_degree_or_higher_dummy_coded race_dummy_coded_black race_dummy_coded_latino 
    q183_1 q183_2 q183_3 q183_4 q183_5 q183_6 q183_7 q183_8 q183_9 q183_10 q183_11 q183_12.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT boosted_yes_or_no
  /METHOD=ENTER age gender_dummy_coded_female party_dummy_coded_republican 
    party_dummy_coded_independent race_dummy_coded_black race_dummy_coded_latino No_HS_dummy_coded 
    HS_dummy_coded Some_college_dummy_coded two_year_degree_dummy_coded 
    q183_1 q183_2 q183_3 q183_4 q183_5 q183_6 q183_7 q183_8 q183_9 q183_10 q183_11 q183_12.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT boosted_yes_or_no
  /METHOD=ENTER age gender_dummy_coded_female trump_vote_dummy_code race_dummy_coded_black 
    race_dummy_coded_latino No_HS_dummy_coded HS_dummy_coded Some_college_dummy_coded 
    two_year_degree_dummy_coded q183_1 q183_2 q183_3 q183_4 q183_5 q183_6 q183_7 q183_8 q183_9 q183_10 q183_11 q183_12.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT boosted_yes_or_no
  /METHOD=ENTER age gender_dummy_coded_female party_dummy_coded_republican 
    party_dummy_coded_independent race_dummy_coded_white No_HS_dummy_coded HS_dummy_coded 
    Some_college_dummy_coded two_year_degree_dummy_coded q183_1 q183_2 q183_3 q183_4 q183_5 q183_6 q183_7 q183_8 q183_9 q183_10 q183_11 q183_12.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT boosted_yes_or_no
  /METHOD=ENTER age gender_dummy_coded_female trump_vote_dummy_code 
    race_dummy_coded_white No_HS_dummy_coded HS_dummy_coded 
    Some_college_dummy_coded two_year_degree_dummy_coded q183_1 q183_2 q183_3 q183_4 q183_5 q183_6 q183_7 q183_8 q183_9 q183_10 q183_11 q183_12.


/* Then we could ask if you see the same patterns just in RI

USE ALL.
COMPUTE filter_$=(sample = 2 & vaccinated_yes_or_no = 1).
VARIABLE LABELS filter_$ 'sample = 2 & vaccinated_yes_or_no = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT boosted_yes_or_no
  /METHOD=ENTER age gender_dummy_coded_female party_dummy_coded_republican 
    party_dummy_coded_independent college_degree_or_higher_dummy_coded race_dummy_coded_white 
    q183_1 q183_2 q183_3 q183_4 q183_5 q183_6 q183_7 q183_8 q183_9 q183_10 q183_11 q183_12.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT boosted_yes_or_no
  /METHOD=ENTER age gender_dummy_coded_female trump_vote_dummy_code 
    college_degree_or_higher_dummy_coded race_dummy_coded_white 
    q183_1 q183_2 q183_3 q183_4 q183_5 q183_6 q183_7 q183_8 q183_9 q183_10 q183_11 q183_12.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT boosted_yes_or_no
  /METHOD=ENTER age gender_dummy_coded_female party_dummy_coded_republican 
    party_dummy_coded_independent college_degree_or_higher_dummy_coded race_dummy_coded_black 
    race_dummy_coded_latino q183_1 q183_2 q183_3 q183_4 q183_5 q183_6 q183_7 q183_8 q183_9 q183_10 q183_11 q183_12.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT boosted_yes_or_no
  /METHOD=ENTER age gender_dummy_coded_female trump_vote_dummy_code 
    college_degree_or_higher_dummy_coded race_dummy_coded_black race_dummy_coded_latino 
    q183_1 q183_2 q183_3 q183_4 q183_5 q183_6 q183_7 q183_8 q183_9 q183_10 q183_11 q183_12.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT boosted_yes_or_no
  /METHOD=ENTER age gender_dummy_coded_female party_dummy_coded_republican 
    party_dummy_coded_independent race_dummy_coded_black race_dummy_coded_latino No_HS_dummy_coded 
    HS_dummy_coded Some_college_dummy_coded two_year_degree_dummy_coded 
    q183_1 q183_2 q183_3 q183_4 q183_5 q183_6 q183_7 q183_8 q183_9 q183_10 q183_11 q183_12.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT boosted_yes_or_no
  /METHOD=ENTER age gender_dummy_coded_female trump_vote_dummy_code race_dummy_coded_black 
    race_dummy_coded_latino No_HS_dummy_coded HS_dummy_coded Some_college_dummy_coded 
    two_year_degree_dummy_coded q183_1 q183_2 q183_3 q183_4 q183_5 q183_6 q183_7 q183_8 q183_9 q183_10 q183_11 q183_12.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT boosted_yes_or_no
  /METHOD=ENTER age gender_dummy_coded_female party_dummy_coded_republican 
    party_dummy_coded_independent race_dummy_coded_white No_HS_dummy_coded HS_dummy_coded 
    Some_college_dummy_coded two_year_degree_dummy_coded q183_1 q183_2 q183_3 q183_4 q183_5 q183_6 q183_7 q183_8 q183_9 q183_10 q183_11 q183_12.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT boosted_yes_or_no
  /METHOD=ENTER age gender_dummy_coded_female trump_vote_dummy_code 
    race_dummy_coded_white No_HS_dummy_coded HS_dummy_coded 
    Some_college_dummy_coded two_year_degree_dummy_coded q183_1 q183_2 q183_3 q183_4 q183_5 q183_6 q183_7 q183_8 q183_9 q183_10 q183_11 q183_12.



/* There's an argument for running these regressions without the demographics, 
/* since we're not necessarily trying to lift population characteristics out of the picture.
/* Here's that in RI:

USE ALL.
COMPUTE filter_$=(sample = 2 & vaccinated_yes_or_no = 1).
VARIABLE LABELS filter_$ 'sample = 2 & vaccinated_yes_or_no = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT boosted_yes_or_no
  /METHOD=ENTER q183_1 q183_2 q183_3 q183_4 q183_5 q183_6 q183_7 q183_8 q183_9 q183_10 q183_11 q183_12.


/* And here it is in the US:

USE ALL.
COMPUTE filter_$=(vaccinated_yes_or_no = 1).
VARIABLE LABELS filter_$ 'vaccinated_yes_or_no = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT boosted_yes_or_no
  /METHOD=ENTER q183_1 q183_2 q183_3 q183_4 q183_5 q183_6 q183_7 q183_8 q183_9 q183_10 q183_11 q183_12.


/* There's also an argument for looking at just the Latino respondents in the sample.
/* It's not a great argument, though, because there are 127 of them.

/* And then we might just show responses among the boosted and unboosted 
/* and look for the things that people are agreeing with the most
/* (or equivalently, compare effect sizes across the t tests on booster reasons scales)






