* Encoding: UTF-8.


/* Bin US death estimates appropriate to time of Survey 4

DATASET ACTIVATE DataSet2.
RECODE q53 (Lowest thru 249999=1) (250000 thru 350000=2) (350000 thru Highest=3) INTO 
    US_deaths_estimate_low_right_high.
EXECUTE.


* Define Variable Properties.
*US_deaths_estimate_low_right_high.
VALUE LABELS US_deaths_estimate_low_right_high
  1.00 'Low (<250,000)'
  2.00 'About right (250,000-349,999)'
  3.00 'High (≥350,000)'.
EXECUTE.


/* Bin US death estimates appropriate to time of Survey 3 

DATASET ACTIVATE DataSet1.
RECODE q53 (Lowest thru 199999=1) (200000 thru 299999=2) (300000 thru Highest=3) INTO 
    US_deaths_estimate_low_right_high.
EXECUTE.

* Define Variable Properties.
*US_deaths_estimate_low_right_high.
VALUE LABELS US_deaths_estimate_low_right_high
  1.00 'Low (<250,000)'
  2.00 'About right (250,000-349,999)'
  3.00 'High (≥350,000)'.
EXECUTE.



/* Merge Survey 4 and Survey 3

DATASET ACTIVATE DataSet2.

ADD FILES /FILE=*
  /RENAME weight_RI=weight
  /FILE='DataSet1'
  /IN=time.
VARIABLE LABELS time
 'Case source is DataSet1'.
EXECUTE.

* Define Variable Properties.
*time.
VALUE LABELS time
  0 'Time 2 (December 11-23, 2020)'
  1 'Time 1 (November 10-17, 2020)'.
EXECUTE.


/* Create single vaccine timing interest variable


RECODE q115_family q115_community (1=1) (ELSE=0) INTO q115_family_recoded q115_community_recoded.
EXECUTE.

COMPUTE vaccine_timing_interest=q115_family_recoded + q115_community_recoded.
EXECUTE.

* Define Variable Properties.
*vaccine_timing_interest.
VALUE LABELS vaccine_timing_interest
  .00 'Did not click on list'
  1.00 'Clicked on list'.
EXECUTE.


/* Create age variable

COMPUTE age=2020 - birthyr.
EXECUTE.


/* Bin ages

RECODE age (18 thru 29=1) (30 thru 39=2) (40 thru 49=3) (50 thru 59=4) (60 thru 69=5) (70 thru 
    Highest=6) INTO age_range.
EXECUTE.

* Define Variable Properties.
*age_range.
VALUE LABELS age_range
  1.00 '18-29'
  2.00 '30-39'
  3.00 '40-49'
  4.00 '50-59'
  5.00 '60-69'
  6.00 '70+'.
EXECUTE.


/* Recode risk activities

RECODE q4_1 q4_2 q4_3 q4_4 q4_5 (1=1) (2=0) (8=0) (9=0) (SYSMIS=0).
EXECUTE.


/* Create variable for definitely will get vaccinated vs. everyone else

RECODE q1 (5=1) (ELSE=0) INTO vaccine_definitely.
EXECUTE.


/* Create variable for definitely or maybe will get vaccinated

RECODE q1 (5=1) (4=1) (ELSE=0) INTO vaccine_definitely_and_maybe.
EXECUTE.


/* Create dummy coded variables


RECODE gender_client (2=1) (ELSE=0) INTO gender_dummy_coded_female.
EXECUTE.

RECODE pid3 (2=1) (ELSE=0) INTO party_dummy_coded_republican.
EXECUTE.

RECODE pid3 (3=1) (ELSE=0) INTO party_dummy_coded_independent.
EXECUTE.

RECODE race (2=1) (ELSE=0) INTO race_dummy_coded_black.
EXECUTE.

RECODE race (3=1) (ELSE=0) INTO race_dummy_coded_latino.
EXECUTE.

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
    ('Providence'=1) ('Providence, N Providence, North Providence'=1) ('Providence, Cranston'=1) 
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



/* Compute coarse SES

RECODE faminc_new (1=1) (2=1) (3=1) (4=2) (5=2) (6=2) (97=0) (998=0) (999=0) (ELSE=3) INTO 
    SES_coarse.
EXECUTE.

* Define Variable Properties.
*SES_coarse.
VALUE LABELS SES_coarse
  .00 'No response'
  1.00 'Low (≤29,000)'
  2.00 'Medium (30,000–59,000)'
  3.00 'High (≥60,000)'.
EXECUTE.


/* Dummy code age 18-29

RECODE age_range (1=1) (ELSE=0) INTO eighteen_to_twentynine_dummy_coded.
EXECUTE.


/* Dummy code 60 and over

RECODE age_range (5=1) (6=1) (ELSE=0) INTO sixty_and_over_dummy_coded.
EXECUTE.


/* Dummy code low SES

RECODE SES_coarse (1=1) (ELSE=0) INTO low_SES_dummy_coded.
EXECUTE.


/* Dummy code education

RECODE educ (1=1) (ELSE=0) INTO No_HS_dummy_coded.
EXECUTE.

RECODE educ (2=1) (ELSE=0) INTO HS_dummy_coded.
EXECUTE.

RECODE educ (3=1) (ELSE=0) INTO Some_college_dummy_coded.
EXECUTE.

RECODE educ (4=1) (ELSE=0) INTO two_year_degree_dummy_coded.
EXECUTE.



/* Number of shots correct or incorrect

RECODE q109 (2=1) (ELSE=0) INTO number_of_shots_correct.
EXECUTE.

/* Authorization correct or incorrect

RECODE q110 (2=1) (ELSE=0) INTO authorization_correct.
EXECUTE.


/* Dummy code dependents in household

RECODE q32 (1=1) (ELSE=0) INTO dependents_dummy_coded.
EXECUTE.


/* Calculate variable showing whether respondents rated their own knowledge higher than scientists'

IF  (q107 > q108) scientists_knowledge_lower_than_own=1.
EXECUTE.

RECODE scientists_knowledge_lower_than_own (1=1) (ELSE=0).
EXECUTE.

