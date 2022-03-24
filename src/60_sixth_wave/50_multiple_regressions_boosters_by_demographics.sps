* Encoding: UTF-8.
/* Boosters by demographics



/* This code should be used for BOTH datasets associated with Survey 6:
/* TPL_Testing_Survey_SixthWave_YouGov_RI.sav and TPL_Testing_Survey_SixthWave_YouGov_US.sav
/* Note that the two variables picking out high-density communuties in RI, 
/* HDC_tier_1_dummy_coded and HDC_tier_2_dummy_coded, are not found in
/* the US dataset. The regressions will simply ignore these variables.


FILTER OFF.
USE ALL.
EXECUTE.

WEIGHT BY weight.
  
REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q174
  /METHOD=ENTER age gender_dummy_coded_female party_dummy_coded_republican 
    party_dummy_coded_independent college_degree_or_higher_dummy_coded race_dummy_coded_white 
    HDC_tier_1_dummy_coded HDC_tier_2_dummy_coded.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q174
  /METHOD=ENTER age gender_dummy_coded_female trump_vote_dummy_code 
    college_degree_or_higher_dummy_coded race_dummy_coded_white HDC_tier_1_dummy_coded 
    HDC_tier_2_dummy_coded.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q174
  /METHOD=ENTER age gender_dummy_coded_female party_dummy_coded_republican 
    party_dummy_coded_independent college_degree_or_higher_dummy_coded race_dummy_coded_black 
    race_dummy_coded_latino HDC_tier_1_dummy_coded HDC_tier_2_dummy_coded.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q174
  /METHOD=ENTER age gender_dummy_coded_female trump_vote_dummy_code 
    college_degree_or_higher_dummy_coded race_dummy_coded_black race_dummy_coded_latino 
    HDC_tier_1_dummy_coded HDC_tier_2_dummy_coded.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q174
  /METHOD=ENTER age gender_dummy_coded_female party_dummy_coded_republican 
    party_dummy_coded_independent race_dummy_coded_black race_dummy_coded_latino No_HS_dummy_coded 
    HS_dummy_coded Some_college_dummy_coded two_year_degree_dummy_coded HDC_tier_1_dummy_coded 
    HDC_tier_2_dummy_coded.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q174
  /METHOD=ENTER age gender_dummy_coded_female trump_vote_dummy_code race_dummy_coded_black 
    race_dummy_coded_latino No_HS_dummy_coded HS_dummy_coded Some_college_dummy_coded 
    two_year_degree_dummy_coded HDC_tier_1_dummy_coded HDC_tier_2_dummy_coded.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q174
  /METHOD=ENTER age gender_dummy_coded_female party_dummy_coded_republican 
    party_dummy_coded_independent race_dummy_coded_white No_HS_dummy_coded HS_dummy_coded 
    Some_college_dummy_coded two_year_degree_dummy_coded HDC_tier_1_dummy_coded HDC_tier_2_dummy_coded.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q174
  /METHOD=ENTER age gender_dummy_coded_female trump_vote_dummy_code 
    race_dummy_coded_white No_HS_dummy_coded HS_dummy_coded 
    Some_college_dummy_coded two_year_degree_dummy_coded HDC_tier_1_dummy_coded HDC_tier_2_dummy_coded.


/* Now let's see those percentages

CROSSTABS
  /TABLES=q174 BY age_range gender pid3 educ race
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.
