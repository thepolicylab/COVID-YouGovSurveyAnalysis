* Encoding: UTF-8.



/* This code should be used for BOTH datasets associated with Survey 6:
/* TPL_Testing_Survey_SixthWave_YouGov_RI.sav and TPL_Testing_Survey_SixthWave_YouGov_US.sav
/* Note that the two variables picking out high-density communuties in RI, 
/* HDC_tier_1_dummy_coded and HDC_tier_2_dummy_coded, are not found in
/* the US dataset. The regressions will simply ignore these variables.


/* Are there question order x party ID interactions? (Independents are excluded from this analysis)

COMPUTE question_order_by_republican_interaction=mandate_beliefs_before_vaccine_beliefs * 
    party_dummy_coded_republican.
EXECUTE.

USE ALL.
COMPUTE filter_$=(pid3 < 3).
VARIABLE LABELS filter_$ 'pid3 < 3 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

WEIGHT BY weight.

/* ...for child vaccine risk perceptions

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q162_1
  /METHOD=ENTER mandate_beliefs_before_vaccine_beliefs party_dummy_coded_republican 
    question_order_by_republican_interaction.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q162_1
  /METHOD=ENTER mandate_beliefs_before_vaccine_beliefs party_dummy_coded_republican 
    question_order_by_republican_interaction gender_dummy_coded_female race_dummy_coded_black 
    race_dummy_coded_latino No_HS_dummy_coded HS_dummy_coded Some_college_dummy_coded 
    two_year_degree_dummy_coded age.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q162_2
  /METHOD=ENTER mandate_beliefs_before_vaccine_beliefs party_dummy_coded_republican 
    question_order_by_republican_interaction.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q162_2
  /METHOD=ENTER mandate_beliefs_before_vaccine_beliefs party_dummy_coded_republican 
    question_order_by_republican_interaction gender_dummy_coded_female race_dummy_coded_black 
    race_dummy_coded_latino No_HS_dummy_coded HS_dummy_coded Some_college_dummy_coded 
    two_year_degree_dummy_coded age.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q162_3
  /METHOD=ENTER mandate_beliefs_before_vaccine_beliefs party_dummy_coded_republican 
    question_order_by_republican_interaction.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q162_3
  /METHOD=ENTER mandate_beliefs_before_vaccine_beliefs party_dummy_coded_republican 
    question_order_by_republican_interaction gender_dummy_coded_female race_dummy_coded_black 
    race_dummy_coded_latino No_HS_dummy_coded HS_dummy_coded Some_college_dummy_coded 
    two_year_degree_dummy_coded age.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q162_4
  /METHOD=ENTER mandate_beliefs_before_vaccine_beliefs party_dummy_coded_republican 
    question_order_by_republican_interaction.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q162_4
  /METHOD=ENTER mandate_beliefs_before_vaccine_beliefs party_dummy_coded_republican 
    question_order_by_republican_interaction gender_dummy_coded_female race_dummy_coded_black 
    race_dummy_coded_latino No_HS_dummy_coded HS_dummy_coded Some_college_dummy_coded 
    two_year_degree_dummy_coded age.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q162_5
  /METHOD=ENTER mandate_beliefs_before_vaccine_beliefs party_dummy_coded_republican 
    question_order_by_republican_interaction.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q162_5
  /METHOD=ENTER mandate_beliefs_before_vaccine_beliefs party_dummy_coded_republican 
    question_order_by_republican_interaction gender_dummy_coded_female race_dummy_coded_black 
    race_dummy_coded_latino No_HS_dummy_coded HS_dummy_coded Some_college_dummy_coded 
    two_year_degree_dummy_coded age.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q162_6
  /METHOD=ENTER mandate_beliefs_before_vaccine_beliefs party_dummy_coded_republican 
    question_order_by_republican_interaction.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q162_6
  /METHOD=ENTER mandate_beliefs_before_vaccine_beliefs party_dummy_coded_republican 
    question_order_by_republican_interaction gender_dummy_coded_female race_dummy_coded_black 
    race_dummy_coded_latino No_HS_dummy_coded HS_dummy_coded Some_college_dummy_coded 
    two_year_degree_dummy_coded age.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q162_7
  /METHOD=ENTER mandate_beliefs_before_vaccine_beliefs party_dummy_coded_republican 
    question_order_by_republican_interaction.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q162_7
  /METHOD=ENTER mandate_beliefs_before_vaccine_beliefs party_dummy_coded_republican 
    question_order_by_republican_interaction gender_dummy_coded_female race_dummy_coded_black 
    race_dummy_coded_latino No_HS_dummy_coded HS_dummy_coded Some_college_dummy_coded 
    two_year_degree_dummy_coded age.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q162_8
  /METHOD=ENTER mandate_beliefs_before_vaccine_beliefs party_dummy_coded_republican 
    question_order_by_republican_interaction.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q162_8
  /METHOD=ENTER mandate_beliefs_before_vaccine_beliefs party_dummy_coded_republican 
    question_order_by_republican_interaction gender_dummy_coded_female race_dummy_coded_black 
    race_dummy_coded_latino No_HS_dummy_coded HS_dummy_coded Some_college_dummy_coded 
    two_year_degree_dummy_coded age.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q162_9
  /METHOD=ENTER mandate_beliefs_before_vaccine_beliefs party_dummy_coded_republican 
    question_order_by_republican_interaction.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q162_9
  /METHOD=ENTER mandate_beliefs_before_vaccine_beliefs party_dummy_coded_republican 
    question_order_by_republican_interaction gender_dummy_coded_female race_dummy_coded_black 
    race_dummy_coded_latino No_HS_dummy_coded HS_dummy_coded Some_college_dummy_coded 
    two_year_degree_dummy_coded age.


/*...for beliefs about emergency use authorization 

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q166_a
  /METHOD=ENTER mandate_beliefs_before_vaccine_beliefs party_dummy_coded_republican 
    question_order_by_republican_interaction.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q166_a
  /METHOD=ENTER mandate_beliefs_before_vaccine_beliefs party_dummy_coded_republican 
    question_order_by_republican_interaction gender_dummy_coded_female race_dummy_coded_black 
    race_dummy_coded_latino No_HS_dummy_coded HS_dummy_coded Some_college_dummy_coded 
    two_year_degree_dummy_coded age.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q166_b
  /METHOD=ENTER mandate_beliefs_before_vaccine_beliefs party_dummy_coded_republican 
    question_order_by_republican_interaction.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q166_b
  /METHOD=ENTER mandate_beliefs_before_vaccine_beliefs party_dummy_coded_republican 
    question_order_by_republican_interaction gender_dummy_coded_female race_dummy_coded_black 
    race_dummy_coded_latino No_HS_dummy_coded HS_dummy_coded Some_college_dummy_coded 
    two_year_degree_dummy_coded age.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q166_c
  /METHOD=ENTER mandate_beliefs_before_vaccine_beliefs party_dummy_coded_republican 
    question_order_by_republican_interaction.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q166_c
  /METHOD=ENTER mandate_beliefs_before_vaccine_beliefs party_dummy_coded_republican 
    question_order_by_republican_interaction gender_dummy_coded_female race_dummy_coded_black 
    race_dummy_coded_latino No_HS_dummy_coded HS_dummy_coded Some_college_dummy_coded 
    two_year_degree_dummy_coded age.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q166_d
  /METHOD=ENTER mandate_beliefs_before_vaccine_beliefs party_dummy_coded_republican 
    question_order_by_republican_interaction.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q166_d
  /METHOD=ENTER mandate_beliefs_before_vaccine_beliefs party_dummy_coded_republican 
    question_order_by_republican_interaction gender_dummy_coded_female race_dummy_coded_black 
    race_dummy_coded_latino No_HS_dummy_coded HS_dummy_coded Some_college_dummy_coded 
    two_year_degree_dummy_coded age.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q166_e
  /METHOD=ENTER mandate_beliefs_before_vaccine_beliefs party_dummy_coded_republican 
    question_order_by_republican_interaction.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q166_e
  /METHOD=ENTER mandate_beliefs_before_vaccine_beliefs party_dummy_coded_republican 
    question_order_by_republican_interaction gender_dummy_coded_female race_dummy_coded_black 
    race_dummy_coded_latino No_HS_dummy_coded HS_dummy_coded Some_college_dummy_coded 
    two_year_degree_dummy_coded age.


/* Okay, let's see those means

MEANS TABLES=q162_1 q162_2 q162_3 q162_4 q162_5 q162_6 q162_7 q162_8 q162_9 BY 
    mandate_beliefs_before_vaccine_beliefs BY party_dummy_coded_republican
  /CELLS=MEAN COUNT STDDEV.



