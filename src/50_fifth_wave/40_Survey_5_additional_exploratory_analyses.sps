* Encoding: UTF-8.
/* EXPLORATORY ANALYSES

/* 1. Effects of being vaccinated on preventive behaviors
/* NOTE: not testing risk behaviors because they're dichotomous outcomes (need some kinda logit regression)

/* RI

WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 2).
VARIABLE LABELS filter_$ 'time = 0 & sample = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q6
  /METHOD=ENTER vaccinated_yes_no age gender_dummy_coded_female party_dummy_coded_republican 
    party_dummy_coded_independent race_dummy_coded_black race_dummy_coded_latino No_HS_dummy_coded 
    HS_dummy_coded Some_college_dummy_coded two_year_degree_dummy_coded faminc_new.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q7
  /METHOD=ENTER vaccinated_yes_no age gender_dummy_coded_female party_dummy_coded_republican 
    party_dummy_coded_independent race_dummy_coded_black race_dummy_coded_latino No_HS_dummy_coded 
    HS_dummy_coded Some_college_dummy_coded two_year_degree_dummy_coded faminc_new.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q8
  /METHOD=ENTER vaccinated_yes_no age gender_dummy_coded_female party_dummy_coded_republican 
    party_dummy_coded_independent race_dummy_coded_black race_dummy_coded_latino No_HS_dummy_coded 
    HS_dummy_coded Some_college_dummy_coded two_year_degree_dummy_coded faminc_new.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q9
  /METHOD=ENTER vaccinated_yes_no age gender_dummy_coded_female party_dummy_coded_republican 
    party_dummy_coded_independent race_dummy_coded_black race_dummy_coded_latino No_HS_dummy_coded 
    HS_dummy_coded Some_college_dummy_coded two_year_degree_dummy_coded faminc_new.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q10
  /METHOD=ENTER vaccinated_yes_no age gender_dummy_coded_female party_dummy_coded_republican 
    party_dummy_coded_independent race_dummy_coded_black race_dummy_coded_latino No_HS_dummy_coded 
    HS_dummy_coded Some_college_dummy_coded two_year_degree_dummy_coded faminc_new.


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
  /DEPENDENT q6
  /METHOD=ENTER vaccinated_yes_no age gender_dummy_coded_female party_dummy_coded_republican 
    party_dummy_coded_independent race_dummy_coded_black race_dummy_coded_latino No_HS_dummy_coded 
    HS_dummy_coded Some_college_dummy_coded two_year_degree_dummy_coded faminc_new.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q7
  /METHOD=ENTER vaccinated_yes_no age gender_dummy_coded_female party_dummy_coded_republican 
    party_dummy_coded_independent race_dummy_coded_black race_dummy_coded_latino No_HS_dummy_coded 
    HS_dummy_coded Some_college_dummy_coded two_year_degree_dummy_coded faminc_new.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q8
  /METHOD=ENTER vaccinated_yes_no age gender_dummy_coded_female party_dummy_coded_republican 
    party_dummy_coded_independent race_dummy_coded_black race_dummy_coded_latino No_HS_dummy_coded 
    HS_dummy_coded Some_college_dummy_coded two_year_degree_dummy_coded faminc_new.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q9
  /METHOD=ENTER vaccinated_yes_no age gender_dummy_coded_female party_dummy_coded_republican 
    party_dummy_coded_independent race_dummy_coded_black race_dummy_coded_latino No_HS_dummy_coded 
    HS_dummy_coded Some_college_dummy_coded two_year_degree_dummy_coded faminc_new.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q10
  /METHOD=ENTER vaccinated_yes_no age gender_dummy_coded_female party_dummy_coded_republican 
    party_dummy_coded_independent race_dummy_coded_black race_dummy_coded_latino No_HS_dummy_coded 
    HS_dummy_coded Some_college_dummy_coded two_year_degree_dummy_coded faminc_new.


/* 2. Trust in gov't by vaccination experience

/* RI

WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 2).
VARIABLE LABELS filter_$ 'time = 0 & sample = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT mean_trust_in_govt
  /METHOD=ENTER mean_vaccination_experience age gender_dummy_coded_female party_dummy_coded_republican 
    party_dummy_coded_independent race_dummy_coded_black race_dummy_coded_latino No_HS_dummy_coded 
    HS_dummy_coded Some_college_dummy_coded two_year_degree_dummy_coded faminc_new.

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
  /DEPENDENT mean_trust_in_govt
  /METHOD=ENTER mean_vaccination_experience age gender_dummy_coded_female party_dummy_coded_republican 
    party_dummy_coded_independent race_dummy_coded_black race_dummy_coded_latino No_HS_dummy_coded 
    HS_dummy_coded Some_college_dummy_coded two_year_degree_dummy_coded faminc_new.


/* 3. Others' intentions by own vaccination experience 

WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 2).
VARIABLE LABELS filter_$ 'time = 0 & sample = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CORRELATIONS
  /VARIABLES=mean_vaccination_experience q60_1 q60_2 q60_3 q60_4
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


/* 4. Own intentions by others' vaccination experiences

/* RI

WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 2).
VARIABLE LABELS filter_$ 'time = 0 & sample = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


CORRELATIONS
  /VARIABLES=q131 q126
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
  /VARIABLES=mean_vaccination_experience q60_1 q60_2 q60_3 q60_4
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.



/* Relaxing by vigilance by trust in public health information

/* RI

WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 2).
VARIABLE LABELS filter_$ 'time = 0 & sample = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


CORRELATIONS
  /VARIABLES=q133_covid_guidance dg_134_1 dg_134_2 dg_134_3 dg_134_4 q18
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
  /VARIABLES=q133_covid_guidance dg_134_1 dg_134_2 dg_134_3 dg_134_4 q18
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.


/* Days since vaccination by outlook

/* RI

WEIGHT BY weight_RI.

USE ALL.
COMPUTE filter_$=(time = 0 & sample = 2).
VARIABLE LABELS filter_$ 'time = 0 & sample = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


CORRELATIONS
  /VARIABLES=q121 q26 
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
  /VARIABLES=q121 q26 
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.
