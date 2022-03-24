* Encoding: UTF-8.


/* This code was used for Survey 7 preliminary results to present to RIDOH ahead of the full report and should be used with the dataset:
/* TPL_Testing_Survey_SeventhWave_YouGov.sav


/*________________________________________________________________________________________________________
/* OVERALL VACCINATION DESCRIPTIVES

WEIGHT BY weight_RI_all.

 USE ALL.
COMPUTE filter_$=(sample = 2).
VARIABLE LABELS filter_$ 'sample = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=vaccinated_yes_or_no q180 q150 q151
  /ORDER=ANALYSIS.


/*________________________________________________________________________________________________________
/* CHILD VACCINES
/* Basic descriptives for child vaccination


WEIGHT BY weight_RI_parents.

USE ALL.
COMPUTE filter_$=(sample = 2 & parent_of_minor = 1).
VARIABLE LABELS filter_$ 'sample = 2 & parent_of_minor = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q155 q157 definitely_will_vaccinate_underage_children_or_already_has combined_intention_to_vaccinate_children combined_intention_to_vaccinate_children q184 reluctant_vaccinated_parents
  /ORDER=ANALYSIS. 


/* Intentions to vaccinate children under 5 in the US

WEIGHT BY weight_US_parents.

USE ALL.
COMPUTE filter_$=(sample = 1 & parent_of_minor = 1).
VARIABLE LABELS filter_$ 'sample = 1 & parent_of_minor = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q184
  /ORDER=ANALYSIS. 



/* Reasons for not vaccinating child

WEIGHT BY weight_RI_parents.

USE ALL.
COMPUTE filter_$=(sample = 2 & parent_of_minor = 1).
VARIABLE LABELS filter_$ 'sample = 2 & parent_of_minor = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


FREQUENCIES VARIABLES=q156a_m_1 q156a_m_2 q156a_m_3 q156a_m_4 q156a_m_5 q156a_m_6 q156a_m_7 q156a_m_8 q156a_m_9 q156a_m_10 q156a_t
  /ORDER=ANALYSIS.

/* Preferred location for vaccinating child

FREQUENCIES VARIABLES=q159 
  /ORDER=ANALYSIS.

/* Do reluctant parents have different beliefs than nonreluctant parents about other vaccines' long-term side effects?

CROSSTABS
  /TABLES=q170 BY definitely_will_vaccinate_underage_children_or_already_has
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.


/*________________________________________________________________________________________________________
/* BOOSTERS

/* Why don't people who are vaccinated get boosters?
/* First,  select just those people who (a) have been vaccinated and (b) don't say incoherent things against boosters

WEIGHT BY weight_RI_all.

USE ALL.
COMPUTE filter_$=(sample = 2 & vaccinated_yes_or_no = 1 & 
    vaccines_dont_work_and_vaccines_work_too_well = 0 ).
VARIABLE LABELS filter_$ 'sample = 2 & vaccinated_yes_or_no = 1 & '+
    'vaccines_dont_work_and_vaccines_work_too_well = 0  (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

/* Then, regress "on board with boosters" on to demographics (in multiple permutations) and the questions from the booster beliefs grid
/* We consider variables that are significant across all models to be the most important because they are least subject to the whims of operationalization

  
REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT already_boosted_or_definitely_will
  /METHOD=ENTER age gender_dummy_coded_female party_dummy_coded_republican 
    party_dummy_coded_independent college_degree_or_higher_dummy_coded race_dummy_coded_white 
    HDC_tier_1_dummy_coded HDC_tier_2_dummy_coded q183_1 q183_2 q183_3 q183_4 q183_5 q183_6 q183_7 q183_8 q183_9 q183_10 q183_11 q183_12.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT already_boosted_or_definitely_will
  /METHOD=ENTER age gender_dummy_coded_female trump_vote_dummy_code 
    college_degree_or_higher_dummy_coded race_dummy_coded_white HDC_tier_1_dummy_coded 
    HDC_tier_2_dummy_coded q183_1 q183_2 q183_3 q183_4 q183_5 q183_6 q183_7 q183_8 q183_9 q183_10 q183_11 q183_12.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT already_boosted_or_definitely_will
  /METHOD=ENTER age gender_dummy_coded_female party_dummy_coded_republican 
    party_dummy_coded_independent college_degree_or_higher_dummy_coded race_dummy_coded_black 
    race_dummy_coded_latino HDC_tier_1_dummy_coded HDC_tier_2_dummy_coded q183_1 q183_2 q183_3 q183_4 q183_5 q183_6 q183_7 q183_8 q183_9 q183_10 q183_11 q183_12.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT already_boosted_or_definitely_will
  /METHOD=ENTER age gender_dummy_coded_female trump_vote_dummy_code 
    college_degree_or_higher_dummy_coded race_dummy_coded_black race_dummy_coded_latino 
    HDC_tier_1_dummy_coded HDC_tier_2_dummy_coded q183_1 q183_2 q183_3 q183_4 q183_5 q183_6 q183_7 q183_8 q183_9 q183_10 q183_11 q183_12.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT already_boosted_or_definitely_will
  /METHOD=ENTER age gender_dummy_coded_female party_dummy_coded_republican 
    party_dummy_coded_independent race_dummy_coded_black race_dummy_coded_latino No_HS_dummy_coded 
    HS_dummy_coded Some_college_dummy_coded two_year_degree_dummy_coded HDC_tier_1_dummy_coded 
    HDC_tier_2_dummy_coded q183_1 q183_2 q183_3 q183_4 q183_5 q183_6 q183_7 q183_8 q183_9 q183_10 q183_11 q183_12.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT already_boosted_or_definitely_will
  /METHOD=ENTER age gender_dummy_coded_female trump_vote_dummy_code race_dummy_coded_black 
    race_dummy_coded_latino No_HS_dummy_coded HS_dummy_coded Some_college_dummy_coded 
    two_year_degree_dummy_coded HDC_tier_1_dummy_coded HDC_tier_2_dummy_coded q183_1 q183_2 q183_3 q183_4 q183_5 q183_6 q183_7 q183_8 q183_9 q183_10 q183_11 q183_12.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT already_boosted_or_definitely_will
  /METHOD=ENTER age gender_dummy_coded_female party_dummy_coded_republican 
    party_dummy_coded_independent race_dummy_coded_white No_HS_dummy_coded HS_dummy_coded 
    Some_college_dummy_coded two_year_degree_dummy_coded HDC_tier_1_dummy_coded HDC_tier_2_dummy_coded q183_1 q183_2 q183_3 q183_4 q183_5 q183_6 q183_7 q183_8 q183_9 q183_10 q183_11 q183_12.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT already_boosted_or_definitely_will
  /METHOD=ENTER age gender_dummy_coded_female trump_vote_dummy_code 
    race_dummy_coded_white No_HS_dummy_coded HS_dummy_coded 
    Some_college_dummy_coded two_year_degree_dummy_coded HDC_tier_1_dummy_coded HDC_tier_2_dummy_coded q183_1 q183_2 q183_3 q183_4 q183_5 q183_6 q183_7 q183_8 q183_9 q183_10 q183_11 q183_12.


/* Could reluctance to getting boosters be related to the existence of effective treatments?
/* First, look at on-board-with-booster-ness by trust in treatments for the whole population 

WEIGHT BY weight_RI_all.

USE ALL.
COMPUTE filter_$=(sample = 2).
VARIABLE LABELS filter_$ 'sample = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=q185_2 q185_3 BY already_boosted_or_definitely_will
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.

/* Second, same thing but with just people who have been partially vaccinated

USE ALL.
COMPUTE filter_$=(sample = 2 & vaccinated_yes_or_no = 1).
VARIABLE LABELS filter_$ 'sample = 2 & vaccinated_yes_or_no = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=q185_2 q185_3 BY already_boosted_or_definitely_will
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.

/* But now what do we see in the questions directly comparing vaccines and treatments?

WEIGHT BY weight_RI_all.

USE ALL.
COMPUTE filter_$=(sample = 2).
VARIABLE LABELS filter_$ 'sample = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=q187_a q187_b q187_c q188_a q188_b q188_c BY already_boosted_or_definitely_will
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.

USE ALL.
COMPUTE filter_$=(sample = 2 & vaccinated_yes_or_no = 1).
VARIABLE LABELS filter_$ 'sample = 2 & vaccinated_yes_or_no = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=q187_a q187_b q187_c q188_a q188_b q188_c BY already_boosted_or_definitely_will
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.



/*________________________________________________________________________________________________________
/* HOME TESTING

 USE ALL.
COMPUTE filter_$=(sample = 2).
VARIABLE LABELS filter_$ 'sample = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

WEIGHT BY weight_RI_all.

/* Basic descriptives for testing

FREQUENCIES VARIABLES=q191_1 q191_2 q191_3 q191_4 q192 q204
  /ORDER=ANALYSIS.

/* Reporting home tests

USE ALL.
COMPUTE filter_$=(sample = 2 & q191_2 = 1).
VARIABLE LABELS filter_$ 'sample = 2 & q191_2 = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q193_1 q193_2 q193_3 q193_4 q193_5 q193_6 reported_home_test_to_anyone
  /ORDER=ANALYSIS.

/* Reporting home tests (just people who tested positive)

USE ALL.
COMPUTE filter_$=(sample = 2 & q192 = 1 | sample = 2 & q192 = 3).
VARIABLE LABELS filter_$ 'sample = 2 & q192 = 1 | sample = 2 & q192 = 3 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q193_1 q193_2 q193_3 q193_4 q193_5 q193_6 reported_home_test_to_anyone
  /ORDER=ANALYSIS.

/* Beliefs about home testing

USE ALL.
COMPUTE filter_$=(sample = 2).
VARIABLE LABELS filter_$ 'sample = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=q194_1 q194_2 q194_3 q194_4 q194_5 q194_6 q194_7 q194_8
  /ORDER=ANALYSIS.


/*________________________________________________________________________________________________________
/* TRUST

 USE ALL.
COMPUTE filter_$=(sample = 2).
VARIABLE LABELS filter_$ 'sample = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

WEIGHT BY weight_RI_all.

/* Are we still seeing partisan differences in trust in public health scientists? Are we seeing it in trust in doctors?

CROSSTABS
  /TABLES=q18 q195 BY pid3
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.

/* How does RI compare with the national sample?

WEIGHT BY weight_US_all.

 USE ALL.
COMPUTE filter_$=(sample = 1).
VARIABLE LABELS filter_$ 'sample = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


CROSSTABS
  /TABLES=q18 q195 BY pid3
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.
