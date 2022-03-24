* Encoding: UTF-8.

/* This code should be used for BOTH datasets associated with Survey 6:
/* TPL_Testing_Survey_SixthWave_YouGov_RI.sav and TPL_Testing_Survey_SixthWave_YouGov_US.sav


/* Create weight variable combining parents & non-parents for analyses that compare the two groups
/* (NOTE: This variable simply merges the weights for the two subpopulations into a single column)

RECODE weight_parents weight_non_parents (SYSMIS=0) (ELSE=Copy) INTO weight_parents_temp 
    weight_non_parents_temp.
EXECUTE.

COMPUTE weight_for_parent_nonparent_comparisons=weight_parents_temp + weight_non_parents_temp.
EXECUTE.


/* Create binary variable for vaccination status

RECODE q120 (1=1) (2=1) (3=1) (4=1) (5=0) INTO vaccinated_yes_or_no.
EXECUTE.


/* Create binary variable for parent of minor

IF  (under = 2 | under = 3 | adolescent = 2 | adolescent = 3 | teens = 2 | teens = 3) 
    parent_of_minor=1.
EXECUTE.

RECODE parent_of_minor
    (1=1) (ELSE=0).
EXECUTE.


/* Create binary variable for will vaccinate or already has vaccinated children

IF  (q154 = 2 | q154 = 3 | q155 = 5 | q157 = 5) 
    definitely_will_vaccinate_underage_children_or_already_has=1.
EXECUTE.

RECODE definitely_will_vaccinate_underage_children_or_already_has (1=1) (ELSE=0).
EXECUTE.

/* Create combined Likert scale for vaccinating children
/* (NOTE: This variable allows a summary statistic of parents of minors' intentions, no matter the age of their children)

IF (q155=1 | q157=1) combined_intention_to_vaccinate_children=1.
IF (q155=2 | q157=2) combined_intention_to_vaccinate_children=2.
IF (q155=3 | q157=3) combined_intention_to_vaccinate_children=3.
IF (q155=4 | q157=4) combined_intention_to_vaccinate_children=4.
IF (q155=5 | q157=5 | q154=2 | q154=3) combined_intention_to_vaccinate_children=5.
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

/* Create combined Likert scale for vaccinating children FOR JUST THOSE WHO HAD NOT BEEN VACCINATED

IF (q155=1 | q157=1) combined_intention_to_vaccinate_unvaccinated_children=1.
IF (q155=2 | q157=2) combined_intention_to_vaccinate_unvaccinated_children=2.
IF (q155=3 | q157=3) combined_intention_to_vaccinate_unvaccinated_children=3.
IF (q155=4 | q157=4) combined_intention_to_vaccinate_unvaccinated_children=4.
IF (q155=5 | q157=5) combined_intention_to_vaccinate_unvaccinated_children=5.
EXECUTE.

* Define Variable Properties.
*combined_intention_to_vaccinate_unvaccinated_children.
VALUE LABELS combined_intention_to_vaccinate_unvaccinated_children
  1.00 "Definitely won't"
  2.00 "Maybe won't"
  3.00 'Not sure'
  4.00 'Maybe will'
  5.00 'Definitely will'.
EXECUTE.

/* Create binary variable reflecting vaccinated people who are unsure about vaccinating their kids

IF  (vaccinated_yes_or_no = 1 & combined_intention_to_vaccinate_children < 5) 
    vaccinated_parents_uncertain_about_vaccinating_kids=1.
EXECUTE.

RECODE vaccinated_parents_uncertain_about_vaccinating_kids
  (1=1) (ELSE=0).
EXECUTE.


/* Create experimental condition variable (whether people answered questions about mandates before or after questions about child vaccines)

RECODE q160a_treat (1=1) (ELSE=0) INTO mandate_beliefs_before_vaccine_beliefs.
EXECUTE.


/* Recode "select all that apply" variables to 1 or 0

RECODE q156a_m_1 q156a_m_2 q156a_m_3 q156a_m_4 q156a_m_5 q156a_m_6 q156a_m_8 q156a_m_9 q156a_m_10 
    (1=1) (9=SYSMIS) (ELSE=0).
EXECUTE.

RECODE q158a_m_1 q158a_m_2 q158a_m_3 q158a_m_4 q158a_m_5 q158a_m_6 q158a_m_8 q158a_m_9 q158a_m_10
    (1=1)  (9=SYSMIS) (ELSE=0).
EXECUTE.

RECODE q165_1 q165_2 q165_3 q165_4 q165_5 q165_6
    (1=1) (ELSE=0).
EXECUTE.

RECODE q173_m_1 q173_m_2 q173_m_3 q173_m_4 q173_m_5 q173_m_6 q173_m_7 q173_m_8 q173_m_9 q173_m_10
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

RECODE Gender (2=1) (ELSE=0) INTO gender_dummy_coded_female.
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


/* CREATING CORE CITY VARIABLES
/* Convert zipcodes into cities and towns in Rhode Island

STRING area_in_RI (A50)

RECODE inputzip (02801='Adamsville') (02802='Albion') (02804='Ashaway') (02806='Barrington') (02807='Block Island, New Shoreham') (02808='Bradford')
    (02809='Bristol') (02812='Carolina, Richmond') (02813='Charlestown') (02814='Chepachet') (02815='Clayville') (02816='Coventry') (02817='West Greenwich, W Greenwich')
    (02818='East Greenwich, E Greenwich') (02822='Exeter, Esocheag') (02823='Fiskeville') (02824='Forestdale') (02825='Foster') (02826='Glendale')
    (02827='Greene, Coventry') (02828='Greenville') (02829='Harmony') (02830='Harrisville, Burrillville') (02831='Hope') (02832='Hope Valley, Richmond')
    (02833='Hopkinton') (02835='Jamestown') (02836='Kenyon, Richmond') (02837='Little Compton, L Compton') (02838='Manville') (02839='Mapleville')
    (02840='Newport') (02841='Newport') (02842='Middletown') (02852='North Kingstown, N Kingstown') (02854='North Kingstown, N Kingstown') (02857='North Scituate, N Scituate, Scituate')
    (02858='Oakland') (02859='Pascoag') (02860='Pawtucket') (02861='Pawtucket') (02862='Pawtucket') (02863='Central Falls') (02864='Cumberland')
    (02865='Lincoln') (02871='Portsmouth') (02872='Prudence Island, Prudence Isl') (02873='Rockville') (02874='Saunderstown') (02875='Shannock, Richmond')
    (02876='Slatersville') (02877='Slocum') (02878='Tiverton') (02879='Wakefield, Narragansett, Peace Dale, S Kingstown,') (02880='Wakefield') (02881='Kingston')
    (02882='Narragansett, Point Judith') (02883='Peace Dale, S Kingstown, South Kingstown') (02885='Warren') (02886='Warwick') (02887='Warwick') (02888='Warwick')
    (02889='Warwick') (02891='Westerly') (02892='West Kingston, Richmond') (02893='West Warwick') (02894='Wood River Junction, Wood River Jt')
    (02895='Woonsocket') (02896='North Smithfield, N Smithfield') (02898='Wyoming, Richmond') (02901='Providence') (02902='Providence')
    (02903='Providence') (02904='Providence, N Providence, North Providence') (02905='Providence, Cranston') (02906='Providence') (02907='Providence, Cranston')
    (02908='Providence, N Providence, North Providence') (02909='Providence') (02910='Cranston, Providence') (02911='North Providence, N Providence, Providence')
    (02912='Providence, Brown Station') (02914='East Providence, E Providence') (02915='Riverside') (02916='Rumford') (02917='Smithfield')
    (02918='Providence, Friar Station') (02919='Johnston, Providence') (02920='Cranston') (02921='Cranston') (02940='Providence') INTO area_in_RI.

EXECUTE.


/* Convert cities and towns into core city (Y/N) variable

RECODE area_in_RI ('Newport'=1) ('Pawtucket'=1) ('Central Falls'=1) ('West Warwick'=1) ('Woonsocket'=1) 
    ('Providence'=1) ('Providence, N Providence, North Providence'=1) ('Providence, Cranston'=1) ('North Providence, N Providence, Providence'=1)
    ('Cranston, Providence'=1) ('Providence, Brown Station'=1) ('East Providence, E Providence'=1) 
    ('Providence, Friar Station'=1) ('Johnston, Providence'=1) (ELSE=0) INTO core_city.
EXECUTE.

* Define Variable Properties.
*core_city.
VALUE LABELS core_city
  .00 'Not core city'
  1.00 'Core city'.
EXECUTE.


/* Convert cities and towns into core city variable excluding Newport

RECODE area_in_RI ('Pawtucket'=1) ('Central Falls'=1) ('West Warwick'=1) ('Woonsocket'=1) 
    ('Providence'=1) ('Providence, N Providence, North Providence'=1) ('Providence, Cranston'=1) 
    ('Cranston, Providence'=1) ('Providence, Brown Station'=1) ('East Providence, E Providence'=1) 
    ('Providence, Friar Station'=1) ('Johnston, Providence'=1) (ELSE=0) INTO core_city_excluding_newport.
EXECUTE.

* Define Variable Properties.
*core_city.
VALUE LABELS core_city_excluding_newport
  .00 'Not core city'
  1.00 'Core city'.
EXECUTE.



/* Convert cities and towns into core cities (specified) and other

STRING area_in_RI_PVD_breakdown (A50)

RECODE inputzip (02801='Adamsville') (02802='Albion') (02804='Ashaway') (02806='Barrington') (02807='Block Island, New Shoreham') (02808='Bradford')
    (02809='Bristol') (02812='Carolina, Richmond') (02813='Charlestown') (02814='Chepachet') (02815='Clayville') (02816='Coventry') (02817='West Greenwich, W Greenwich')
    (02818='East Greenwich, E Greenwich') (02822='Exeter, Esocheag') (02823='Fiskeville') (02824='Forestdale') (02825='Foster') (02826='Glendale')
    (02827='Greene, Coventry') (02828='Greenville') (02829='Harmony') (02830='Harrisville, Burrillville') (02831='Hope') (02832='Hope Valley, Richmond')
    (02833='Hopkinton') (02835='Jamestown') (02836='Kenyon, Richmond') (02837='Little Compton, L Compton') (02838='Manville') (02839='Mapleville')
    (02840='Newport') (02841='Newport') (02842='Middletown') (02852='North Kingstown, N Kingstown') (02854='North Kingstown, N Kingstown') (02857='North Scituate, N Scituate, Scituate')
    (02858='Oakland') (02859='Pascoag') (02860='Pawtucket') (02861='Pawtucket') (02862='Pawtucket') (02863='Central Falls') (02864='Cumberland')
    (02865='Lincoln') (02871='Portsmouth') (02872='Prudence Island, Prudence Isl') (02873='Rockville') (02874='Saunderstown') (02875='Shannock, Richmond')
    (02876='Slatersville') (02877='Slocum') (02878='Tiverton') (02879='Wakefield, Narragansett, Peace Dale, S Kingstown,') (02880='Wakefield') (02881='Kingston')
    (02882='Narragansett, Point Judith') (02883='Peace Dale, S Kingstown, South Kingstown') (02885='Warren') (02886='Warwick') (02887='Warwick') (02888='Warwick')
    (02889='Warwick') (02891='Westerly') (02892='West Kingston, Richmond') (02893='West Warwick') (02894='Wood River Junction, Wood River Jt')
    (02895='Woonsocket') (02896='North Smithfield, N Smithfield') (02898='Wyoming, Richmond') (02901='Providence_other') (02902='Providence_other')
    (02903='Providence_02903') (02904='Providence_02904') (02905='Providence_02905') (02906='Providence_02906') (02907='Providence_02907')
    (02908='Providence_02908') (02909='Providence_02909') (02910='Providence_other') (02911='Providence_other')
    (02912='Providence_other') (02914='East Providence, E Providence') (02915='Riverside') (02916='Rumford') (02917='Smithfield')
    (02918='Providence_other') (02919='Johnston, Providence') (02920='Cranston') (02921='Cranston') (02940='Providence_other') INTO area_in_RI_PVD_breakdown.

EXECUTE.


RECODE area_in_RI_PVD_breakdown ('Newport'=5) ('Pawtucket'=2) ('Central Falls'=1) ('West Warwick'=3) ('Woonsocket'=4) 
    ('Providence_02903'=6) ('Providence_02904'=7) ('Providence_02905'=8) ('Providence_02906'=9) ('Providence_02907'=10) ('Providence_02908'=11) 
    ('Providence_02909'=12) ('Providence_other'=13) ('East Providence, E Providence'=0) 
    ('Johnston, Providence'=13) (ELSE=0) INTO core_cities_PVD_breakdown.
EXECUTE.

* Define Variable Properties.
*core_city_PVD_breakdown.
VALUE LABELS core_cities_PVD_breakdown
  .00 'Not core city'
  1.00 'Central Falls'
  2.00 'Pawtucket'
  3.00 'West Warwick'
  4.00 'Woonsocket'
  5.00 'Newport'
  6.00 'Providence 02903'
  7.00 'Providence 02904'
  8.00 'Providence 02905'
  9.00 'Providence 02906'
  10.00 'Providence 02907'
  11.00 'Providence 02908'
  12.00 'Providence 02909'
  13.00 'Providence other'. 
EXECUTE.


/* Generate new variable where PVD is 20903-02909 or everywhere else

RECODE area_in_RI_PVD_breakdown ('Newport'=5) ('Pawtucket'=2) ('Central Falls'=1) ('West Warwick'=3) ('Woonsocket'=4) 
    ('Providence_02903'=6) ('Providence_02904'=6) ('Providence_02905'=6) ('Providence_02906'=6) ('Providence_02907'=6) ('Providence_02908'=6) 
    ('Providence_02909'=6) ('Providence_other'=7) ('East Providence, E Providence'=0) 
    ('Johnston, Providence'=7) (ELSE=0) INTO core_cities_PVD_split.
EXECUTE.

* Define Variable Properties.
*core_city_PVD_split.
VALUE LABELS core_cities_PVD_split
  .00 'Not core city'
  1.00 'Central Falls'
  2.00 'Pawtucket'
  3.00 'West Warwick'
  4.00 'Woonsocket'
  5.00 'Newport'
  6.00 'Providence 02903-02909'
  7.00 'Providence other'. 
EXECUTE.


/* Generate variable for core city excluding Newport and parts of Providence other than 02903-02909

RECODE core_cities_PVD_split (1=1) (2=1) (3=1) (4=1) (5=0) (6=1) (7=0) (0=0) INTO 
    core_city_excluding_Newport_and_noncentral_PVD.
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


