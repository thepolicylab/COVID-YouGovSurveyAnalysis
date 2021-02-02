* Encoding: UTF-8.

WEIGHT BY weight.


/* Perceived/actual knowledge correlation

USE ALL.
COMPUTE filter_$=(inputstate = 44  & time = 1).
VARIABLE LABELS filter_$ 'inputstate = 44  & time = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CORRELATIONS
  /VARIABLES=covid_knowledge_score q51
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.


/* Calculate participant mean across vaccine benefits and costs

COMPUTE mean_vaccine_benefit=MEAN(q58_1,q58_2,q58_3,q58_4,q58_5,q58_6,q58_7).
EXECUTE.

COMPUTE mean_vaccine_cost=MEAN(q59_1,q59_2,q59_3,q59_4,q59_5,q59_6).
EXECUTE.

IF  (mean_vaccine_benefit > mean_vaccine_cost) vaccine_benefit_greater_than_cost=1.
EXECUTE.

IF  (mean_vaccine_benefit  =  mean_vaccine_cost) vaccine_benefit_equal_to_cost=1.
EXECUTE.

IF  (mean_vaccine_benefit < mean_vaccine_cost) vaccine_cost_greater_than_benefit=1.
EXECUTE.

RECODE vaccine_benefit_greater_than_cost vaccine_benefit_equal_to_cost 
    vaccine_cost_greater_than_benefit (1=1) (SYSMIS=0).
EXECUTE.


/* Calculate participant sums across vaccine benefits and costs

COMPUTE sum_vaccine_benefit=SUM(q58_1,q58_2,q58_3,q58_4,q58_5,q58_6,q58_7).
EXECUTE.

COMPUTE sum_vaccine_cost=SUM(q59_1,q59_2,q59_3,q59_4,q59_5,q59_6).
EXECUTE.


/* Show knowledge measure proportions correct by item

FREQUENCIES VARIABLES=q55_1_correct q55_2_correct q55_3_correct q55_4_correct q55_5_correct 
    q55_6_correct q55_7_correct q55_8_correct
  /ORDER=ANALYSIS.


/* Compute measure of worried about various vaccine costs (Y/N)

RECODE q59_1 q59_2 q59_3 q59_4 q59_5 q59_6 (4=1) (5=1) (ELSE=0) INTO 
    vaccine_worried_about_side_effects vaccine_worried_about_minimal_protection 
    vaccine_worried_about_physical_discomfort vaccine_worried_about_expense 
    vaccine_worried_about_time_convenience vaccine_worried_about_taking_from_others.
EXECUTE.

/* Compute participant vaccine worry scores

COMPUTE participant_vaccine_worry_sum=SUM(vaccine_worried_about_side_effects,
    vaccine_worried_about_minimal_protection,vaccine_worried_about_physical_discomfort,
    vaccine_worried_about_expense,vaccine_worried_about_time_convenience,
    vaccine_worried_about_taking_from_others).
EXECUTE.


/* Repeated measures comparisons of mask wearing

T-TEST PAIRS=q6 q6 q7 WITH q7 q8 q8 (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.


/* Repeated mesaures comparison of state and federal gov't should do more

T-TEST PAIRS=q56_b WITH q57_b (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.


/* Repeated measures comparison of vaccine costs and benefits

T-TEST PAIRS=mean_vaccine_benefit WITH mean_vaccine_cost (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.


/* Compute people unlikely to get flu shot


RECODE q61 (4=1) (5=1) (ELSE=0) INTO flu_vaccine_notlikely_and_definitelywont.
EXECUTE.

/* Compute people likely to get flu shot or who already have

RECODE q61 (1=1) (2=1) (3=1) (ELSE=0) INTO flu_vaccine_likely_or_already_have.
EXECUTE.

