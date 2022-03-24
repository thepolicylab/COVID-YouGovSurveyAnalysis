* Encoding: UTF-8.

/* This code should be used for the dataset associated with Survey 7:
/* TPL_Testing_Survey_SeventhWave_YouGov.sav



/* Create numeric variable indicating sample is US or RI

RECODE instance ('National'=1) ('Rhode Island'=2) INTO sample.
EXECUTE.

* Define Variable Properties.
*sample.
VALUE LABELS sample
  1.00 'US'
  2.00 'RI'.
EXECUTE.



/* Create weight variable combining parents & non-parents for analyses that compare the two groups
/* (NOTE: This variable simply merges the weights for the two subpopulations into a single column)

RECODE weight_US_parents weight_US_nonparents weight_RI_parents weight_RI_nonparents (SYSMIS=0) (ELSE=Copy) INTO weight_US_parents_temp 
    weight_US_nonparents_temp weight_RI_parents_temp weight_RI_nonparents_temp.
EXECUTE.

COMPUTE weight_for_parent_nonparent_comparisons=weight_US_parents_temp + weight_US_nonparents_temp + weight_RI_parents_temp + weight_RI_nonparents_temp.
EXECUTE.


/* Create binary variable for vaccination status

RECODE q180 (1=1) (2=1) (3=1) (4=1) (5=1) (6=1) (7=1) (8=0) INTO vaccinated_yes_or_no.
EXECUTE.


/* Create binary variable for already received a booster or definitely will get one

IF  (q180 = 4 | q180 = 5 | q180 = 7 | q181 = 5) already_boosted_or_definitely_will=1.
EXECUTE.

RECODE already_boosted_or_definitely_will (1=1) (SYSMIS=0).
EXECUTE.


/* Create binary variable for parent of minor

IF  (under = 2 | under = 3 | adolescent = 2 | adolescent = 3 | teens = 2 | teens = 3) 
    parent_of_minor=1.
EXECUTE.

RECODE parent_of_minor
    (1=1) (ELSE=0).
EXECUTE.

/* Why does this variable have 292 instances in the Rhode Island sample instead of 300?

IF  (under = 1 & adolescent = 1 & teens = 1 & weight_RI_parents > 0) 
    are_there_people_in_the_RI_parent_sample_without_kids=1.
EXECUTE.

USE ALL.
COMPUTE filter_$=(sample = 2).
VARIABLE LABELS filter_$ 'sample = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=are_there_people_in_the_RI_parent_sample_without_kids
  /ORDER=ANALYSIS.

/* Because, as the above shows, there are 8 people who somehow slipped through the cracks,
/* signing up for the parent survey but then reporting that they don't have underage children
/* (the value 1 for the variables under, adolescent, and teens means "no children in this age group")

IF  (under = 1 & adolescent = 1 & teens = 1 & weight_US_parents > 0) 
    are_there_people_in_the_US_parent_sample_without_kids=1.
EXECUTE.

USE ALL.
COMPUTE filter_$=(sample = 1).
VARIABLE LABELS filter_$ 'sample = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

FREQUENCIES VARIABLES=are_there_people_in_the_US_parent_sample_without_kids
  /ORDER=ANALYSIS.

/* The US sample had 2.


/* Create binary variable for definitely will vaccinate or already has vaccinated children

IF  (q155 = 5 | q155 = 6 | q157 = 5 | q157 = 6 | q184 = 5) 
    definitely_will_vaccinate_underage_children_or_already_has=1.
EXECUTE.

RECODE definitely_will_vaccinate_underage_children_or_already_has (1=1) (ELSE=0).
EXECUTE.


/* Create combined Likert scale for vaccinating children
/* (NOTE: This variable allows a summary statistic of parents of minors' intentions, no matter the age of their children)

IF (q155=1 | q157=1 | q184=1) combined_intention_to_vaccinate_children=1.
IF (q155=2 | q157=2 | q184=2) combined_intention_to_vaccinate_children=2.
IF (q155=3 | q157=3 | q184=3) combined_intention_to_vaccinate_children=3.
IF (q155=4 | q157=4 | q184=4) combined_intention_to_vaccinate_children=4.
IF (q155=5 | q157=5 | q184=5 | q155 = 6 | q157 = 6) combined_intention_to_vaccinate_children=5.
EXECUTE.

* Define Variable Properties.
*combined_intention_to_vaccinate_children.
VALUE LABELS combined_intention_to_vaccinate_children
  1.00 "Definitely won't"
  2.00 "Maybe won't"
  3.00 'Not sure'
  4.00 'Maybe will'
  5.00 'Definitely will/Already did'.
EXECUTE.


/* Create binary variable reflecting vaccinated people who are unsure about vaccinating their kids

IF  (vaccinated_yes_or_no = 1 & combined_intention_to_vaccinate_children < 5) 
    vaccinated_parents_uncertain_about_vaccinating_kids=1.
EXECUTE.

RECODE vaccinated_parents_uncertain_about_vaccinating_kids
  (1=1) (ELSE=0).
EXECUTE.


/* Recode "select all that apply" variables to 1 or 0

RECODE q156a_m_1 q156a_m_2 q156a_m_3 q156a_m_4 q156a_m_5 q156a_m_6 q156a_m_8 q156a_m_9 q156a_m_10 
    (1=1) (9=SYSMIS) (ELSE=0).
EXECUTE.

RECODE q173_m_1 q173_m_2 q173_m_3 q173_m_4 q173_m_5 q173_m_6 q173_m_7 q173_m_8 q173_m_9 q173_m_10
    (1=1) (ELSE=0).
EXECUTE.

RECODE q190_1 q190_2 q190_3 q190_4 q190_5 q190_6 q190_7
    (1=1) (ELSE=0).
EXECUTE.

RECODE q4_1 q4_2 q4_3 q4_4 q4_5 q4_6
    (1=1) (ELSE=0).
EXECUTE.

RECODE q191_1 q191_2 q191_3 q191_4
    (1=1) (ELSE=0).
EXECUTE.

RECODE q193_1 q193_2 q193_3 q193_4 q193_5 q193_6
    (1=1) (ELSE=0).
EXECUTE.

RECODE q203_1 q203_2 q203_4 q203_5 q203_6 q203_7 q203_8 q203_9 q203_10 q203_11 q203_12 
    (1=1) (ELSE=0).
EXECUTE.

RECODE q200_1 q200_2 q200_3 q200_4 q200_5 q200_6 q200_7
    (1=1) (ELSE=0).
EXECUTE.

RECODE q201_1 q201_2 q201_3 q201_4 q201_5 q201_6 q201_7 q201_8 q201_9 q201_10 q201_11 q201_12 q201_13 q201_14 q201_15 q201_16 q201_17 q201_18 q201_19 q201_20 q201_21
    (1=1) (ELSE=0).
EXECUTE.


/* Create variable showing whether respondents reported their home test result to any organization 

IF  (q193_1 = 5 | q193_2 = 1 | q193_3 = 1 | q193_4 = 1 | q193_5 = 1) 
    reported_home_test_to_anyone=1.
EXECUTE.

RECODE reported_home_test_to_anyone (1=1) (ELSE=0).
EXECUTE.


/* Create variable indicating whether respondents provide incoherent views against boosters
/* (agreeing or strongly agreeing that boosters aren't necessary because initial vaccines are sufficient
/* and that boosters aren't necessary because vaccines don't work)

IF  (q183_6 > 3 & q183_8 > 3) vaccines_dont_work_and_vaccines_work_too_well=1.
EXECUTE.

RECODE vaccines_dont_work_and_vaccines_work_too_well (SYSMIS=0) (1=1).
EXECUTE.



/* Create binary variable indicating parents of minors who are vaccinated but whose children are not and did not reply that their children "definitely will" get vaccinated


IF  (vaccinated_yes_or_no = 1 & parent_of_minor = 1 & 
    definitely_will_vaccinate_underage_children_or_already_has = 0) reluctant_vaccinated_parents=1.
EXECUTE.

RECODE reluctant_vaccinated_parents
  (1=1) (ELSE=0).
EXECUTE.


/* Calculate variable showing whether respondents rated their own knowledge higher than scientists'

IF  (q107 > q108) scientists_knowledge_lower_than_own=1.
EXECUTE.

RECODE scientists_knowledge_lower_than_own (1=1) (ELSE=0).
EXECUTE.


/* Create variables to examine social norms and discussions of vaccination status

IF  (q168_1 > 4) more_than_half_friends_family_vaccinated=1.
EXECUTE.

RECODE more_than_half_friends_family_vaccinated (1=1) (SYSMIS=0).
EXECUTE.

IF  (more_than_half_friends_family_vaccinated = 1 & vaccinated_yes_or_no = 0 | 
    more_than_half_friends_family_vaccinated = 0 & vaccinated_yes_or_no = 1) 
    self_group_vaccination_status_discrepant=1.
EXECUTE.

RECODE self_group_vaccination_status_discrepant (1=1) (SYSMIS=0).
EXECUTE.


/* Create age variable

COMPUTE age=2021 - birthyr.
EXECUTE.


/*  Create age range variable

RECODE age (18 thru 29=1) (30 thru 39=2) (40 thru 49=3) (50 thru 64=4) (65 thru Highest=5) INTO 
    age_range.
EXECUTE.

* Define Variable Properties.
*age_range.
VALUE LABELS age_range
  1.00 '18-29'
  2.00 '30-39'
  3.00 '40-49'
  4.00 '50-64'
  5.00 '65+'.
EXECUTE.


/* Create dummy coded demographic variables

RECODE gender4 (2=1) (ELSE=0) INTO gender_dummy_coded_female.
EXECUTE.

RECODE pid3 (2=1) (ELSE=0) INTO party_dummy_coded_republican.
EXECUTE.

RECODE pid3 (3=1) (ELSE=0) INTO party_dummy_coded_independent.
EXECUTE.

RECODE race (2=1) (ELSE=0) INTO race_dummy_coded_black.
EXECUTE.

RECODE race (3=1) (ELSE=0) INTO race_dummy_coded_latino.
EXECUTE.

RECODE educ (1=1) (ELSE=0) INTO No_HS_dummy_coded.
EXECUTE.

RECODE educ (2=1) (ELSE=0) INTO HS_dummy_coded.
EXECUTE.

RECODE educ (3=1) (ELSE=0) INTO Some_college_dummy_coded.
EXECUTE.

RECODE educ (4=1) (ELSE=0) INTO two_year_degree_dummy_coded.
EXECUTE.


/* Create alternate dummy codes for race and education given small N issue
/* (There aren't a ton of parents of minors in the Rhode Island sample, so the subset that's Latinx or has no high school diploma is very small.) 

RECODE race (1=1) (ELSE=0) INTO race_dummy_coded_white.
EXECUTE.

RECODE educ (4=1) (5=1) (6=1) (ELSE=0) INTO college_degree_or_higher_dummy_coded.
EXECUTE.


/* Create alternate dummy code for political ideology given (arguably) insufficiency of 3-point part ID

RECODE presvote20post (2=1) (ELSE=0) INTO trump_vote_dummy_code.
EXECUTE.

/* Bin family income into even intervals

RECODE faminc_new (1=1) (2=1) (3=2) (4=2) (5=3) (6=3) (7=4) (8=4) (9=5) (10=6) (11=7) (12=8) (13=8) 
    (14=8) (15=8) (16=8) (ELSE=SYSMIS) INTO family_incom_binned_evenly.
EXECUTE.

* Define Variable Properties.
*family_incom_binned_evenly.
VALUE LABELS family_incom_binned_evenly
  1.00 '<10,000–19,000'
  2.00 '20,000– 39,000'
  3.00 '40,000– 59,000'
  4.00 '60,000– 79,000'
  5.00 '80,000– 99,000'
  6.00 '100,000–119,000'
  7.00 '120,000–149,000'
  8.00 '>150,000  '.
EXECUTE.


/* Create variable for RIDOH's high density community tiers

RECODE inputzip (02860=1) (02863=1) (02904=1) (02905=1) (02907=1) (02908=1) (02909=1) (02861=2) 
    (02893=2) (02895=2) (02906=2) (02910=2) (02911=2) (02914=2) (02919=2) (02920=2) (ELSE=3) INTO 
    HDC_tiers.
EXECUTE.

* Define Variable Properties.
*HDC_tiers.
VALUE LABELS HDC_tiers
  1.00 'HDC Tier 1 (Focus)'
  2.00 'HDC Tier 2 (Monitoring)'
  3.00 'Non-HDC'.
EXECUTE.

RECODE HDC_tiers (1=1) (ELSE=0) INTO HDC_tier_1_dummy_coded.
EXECUTE.

RECODE HDC_tiers (2=1) (ELSE=0) INTO HDC_tier_2_dummy_coded.
EXECUTE.


















