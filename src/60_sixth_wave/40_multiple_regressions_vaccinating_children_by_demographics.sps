* Encoding: UTF-8.

/* This code should be used for BOTH datasets associated with Survey 6:
/* TPL_Testing_Survey_SixthWave_YouGov_RI.sav and TPL_Testing_Survey_SixthWave_YouGov_US.sav
/* Note that the two variables picking out high-density communuties in RI, 
/* HDC_tier_1_dummy_coded and HDC_tier_2_dummy_coded, are not found in
/* the US dataset. The regressions will simply ignore these variables.



/* Which demographics predict parents' intention to vaccinate their children?
/* No analysis is completely unproblematic, so we look for patterns that are stable across ways of operationalizing predictors.



USE ALL.
COMPUTE filter_$=(parent_of_minor = 1).
VARIABLE LABELS filter_$ 'parent_of_minor = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

WEIGHT BY weight_parents.

/* All 8 versions (political identity 2 x race 2 x education 2) using a binary outcome variable (1 = definitely will vaccinate/already has vaccinated children, 0 = not definite)
  
REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT definitely_will_vaccinate_underage_children_or_already_has
  /METHOD=ENTER age
  gender_dummy_coded_female
  party_dummy_coded_republican 
  party_dummy_coded_independent
  college_degree_or_higher_dummy_coded
  race_dummy_coded_white 
  HDC_tier_1_dummy_coded
  HDC_tier_2_dummy_coded.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT definitely_will_vaccinate_underage_children_or_already_has
  /METHOD=ENTER age 
  gender_dummy_coded_female 
  trump_vote_dummy_code 
  college_degree_or_higher_dummy_coded 
  race_dummy_coded_white 
  HDC_tier_1_dummy_coded 
  HDC_tier_2_dummy_coded.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT definitely_will_vaccinate_underage_children_or_already_has
  /METHOD=ENTER age 
  gender_dummy_coded_female 
  party_dummy_coded_republican 
  party_dummy_coded_independent 
  college_degree_or_higher_dummy_coded 
  race_dummy_coded_black 
  race_dummy_coded_latino 
  HDC_tier_1_dummy_coded 
  HDC_tier_2_dummy_coded.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT definitely_will_vaccinate_underage_children_or_already_has
  /METHOD=ENTER age 
  gender_dummy_coded_female 
  trump_vote_dummy_code 
  college_degree_or_higher_dummy_coded 
  race_dummy_coded_black 
  race_dummy_coded_latino 
  HDC_tier_1_dummy_coded 
  HDC_tier_2_dummy_coded.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT definitely_will_vaccinate_underage_children_or_already_has
  /METHOD=ENTER age 
  gender_dummy_coded_female 
  party_dummy_coded_republican 
  party_dummy_coded_independent 
  race_dummy_coded_black 
  race_dummy_coded_latino 
  No_HS_dummy_coded 
  HS_dummy_coded 
  Some_college_dummy_coded 
  two_year_degree_dummy_coded 
  HDC_tier_1_dummy_coded 
  HDC_tier_2_dummy_coded.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT definitely_will_vaccinate_underage_children_or_already_has
  /METHOD=ENTER age 
  gender_dummy_coded_female 
  trump_vote_dummy_code 
  race_dummy_coded_black 
  race_dummy_coded_latino 
  No_HS_dummy_coded 
  HS_dummy_coded 
  Some_college_dummy_coded 
  two_year_degree_dummy_coded 
  HDC_tier_1_dummy_coded 
  HDC_tier_2_dummy_coded.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT definitely_will_vaccinate_underage_children_or_already_has
  /METHOD=ENTER age 
  gender_dummy_coded_female 
  party_dummy_coded_republican 
  party_dummy_coded_independent 
  race_dummy_coded_white 
  No_HS_dummy_coded 
  HS_dummy_coded 
  Some_college_dummy_coded 
  two_year_degree_dummy_coded 
  HDC_tier_1_dummy_coded 
  HDC_tier_2_dummy_coded.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT definitely_will_vaccinate_underage_children_or_already_has
  /METHOD=ENTER age 
  gender_dummy_coded_female 
  trump_vote_dummy_code
  race_dummy_coded_white 
  No_HS_dummy_coded 
  HS_dummy_coded 
  Some_college_dummy_coded 
  two_year_degree_dummy_coded 
  HDC_tier_1_dummy_coded 
  HDC_tier_2_dummy_coded.


USE ALL.
COMPUTE filter_$=(parent_of_minor = 1).
VARIABLE LABELS filter_$ 'parent_of_minor = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

WEIGHT BY weight_parents.

CROSSTABS
  /TABLES=definitely_will_vaccinate_underage_children_or_already_has BY age_range pid3 educ race
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.




