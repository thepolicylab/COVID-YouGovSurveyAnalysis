* Encoding: UTF-8.
* Encoding: .




/* Bin US death estimates appropriate to time of Survey 5

RECODE q53 (Lowest thru 499999=1) (500000 thru 599999=2) (600000 thru Highest=3) INTO 
    US_deaths_estimate_low_right_high.
EXECUTE.

* Define Variable Properties.
*US_deaths_estimate_low_right_high.
VALUE LABELS US_deaths_estimate_low_right_high
  1.00 'Low (<500,000)'
  2.00 'About right (500,000-599,999)'
  3.00 'High (≥600,000)'.
EXECUTE.


/* Bin US death estimates appropriate to time of Survey 4

DATASET ACTIVATE DataSet1.

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


/* MERGE SURVEYS 4 AND 5


DATASET ACTIVATE DataSet2.
ADD FILES /FILE=*
  /FILE='DataSet1'
  /RENAME q25=q25_new
  /IN=time.
VARIABLE LABELS time
 'Case source is DataSet1'.
EXECUTE.


* Define Variable Properties.
*time.
VALUE LABELS time
  0 'March 2021'
  1 'December 2020'.
EXECUTE.

/* Calculate age

COMPUTE age=2021 - birthyr.
EXECUTE.


/* Recode risk activities

RECODE q4_1 q4_2 q4_3 q4_4 q4_5 (1=1) (ELSE=0).
EXECUTE.


/* Recode information sources (also change source code if they're called _1, _2, etc.)


RECODE q127_1 q127_2 q127_3 q127_4 q127_5 q127_6 q127_7 q127_8 q127_9 q127_10 q127_11 q127_12 
    q127_13 q127_14 q127_15 q127_16 q127_17 q127_18 q127_19 q127_20 q127_21 q127_22 (1=1) (ELSE=0).
EXECUTE.


/* Create dummy coded vaccinated or not

RECODE q120 (1=1) (2=0) (ELSE=SYSMIS) INTO vaccinated_yes_no.
EXECUTE.


/* Create dummy coded vaccinated or likely to get vaccinated

IF  (q120 = 1  | q126 > 3) vaccinated_or_leaning_toward_it=1.
EXECUTE.

RECODE vaccinated_or_leaning_toward_it (1=1) (ELSE=0).
EXECUTE.


/* Create vaccination interest variable

RECODE manipulation_1_link_click_status manipulation_2_link_click_status 
    manipulation_3_link_click_status manipulation_4_link_click_status ('clicked link'=1) (ELSE=0) INTO 
    C1_clicked C2_clicked C3_clicked C4_clicked.
EXECUTE.


COMPUTE vaccine_signup_interest=SUM(C1_clicked,C2_clicked,C3_clicked,C4_clicked).
EXECUTE.


/* Generate overall vaccination experience variable 

RELIABILITY
  /VARIABLES=q125_1, q125_2, q125_3, q125_4, q125_5
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.

COMPUTE mean_vaccination_experience=MEAN(q125_1, q125_2, q125_3, q125_4, q125_5).
EXECUTE.


/* Generate trust in government variable

RELIABILITY
  /VARIABLES=q128_1, q128_2, q128_3
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.

COMPUTE mean_trust_in_govt=MEAN(q128_1, q128_2, q128_3).
EXECUTE.



/* CREATING DUMMY CODED DEMOGRAPHICS


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

RECODE educ (1=1) (ELSE=0) INTO No_HS_dummy_coded.
EXECUTE.

RECODE educ (2=1) (ELSE=0) INTO HS_dummy_coded.
EXECUTE.

RECODE educ (3=1) (ELSE=0) INTO Some_college_dummy_coded.
EXECUTE.

RECODE educ (4=1) (ELSE=0) INTO two_year_degree_dummy_coded.
EXECUTE.

/* STILL NEED SOME REASONABLE PROXY FOR INCOME OR TREAT AS CONTINUOUS



/* Calculate variable showing whether respondents rated their own knowledge higher than scientists'

IF  (q107 > q108) scientists_knowledge_lower_than_own=1.
EXECUTE.

RECODE scientists_knowledge_lower_than_own (1=1) (ELSE=0).
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


RECODE sample_type (1=1) (2=2) (SYSMIS=3) INTO sample.
EXECUTE.

* Define Variable Properties.
*sample.
VALUE LABELS sample
  1.00 'US March 2021'
  2.00 'RI March 2021'
  3.00 'RI December 2020'.
EXECUTE.


/* Summary statistic: on board with vaccines

IF  (q120 = 1  | q126 = 5) already_vaccinated_or_definitely_will_get_vaccinated=1.
EXECUTE.

RECODE already_vaccinated_or_definitely_will_get_vaccinated (1=1) (SYSMIS=0).
EXECUTE.


/* Combine vaccine intention and vaccine status into a single, 6-point scale where 6 = already been vaccinated (likelihood = 1)

RECODE q126 (1=1) (2=2) (3=3) (4=4) (5=5) (ELSE=0) INTO q126_interim.
EXECUTE.

RECODE q120 (1=6) (ELSE=0) INTO q120_interim.
EXECUTE.

COMPUTE vaccine_intention_including_already_vaccinated=q126_interim + q120_interim.
EXECUTE.



/*  Age brackets of eligibility in RI

RECODE age (75 thru 100=6) (65 thru 74=5) (60 thru 64=4) (50 thru 59=3) (40 thru 49=2) (16 thru 
    39=1) INTO age_ranges_by_eligbility.
EXECUTE.

* Define Variable Properties.
*age_ranges_by_eligbility.
VALUE LABELS age_ranges_by_eligbility
  1.00 '16-39'
  2.00 '40-49'
  3.00 '50-59'
  4.00 '60-64'
  5.00 '65-74'
  6.00 '75+'.
EXECUTE.

/* Create variable showing whether both respondents and people in their networks of friends and family have been vaccinated

IF  (q120 = 1 & q129 = 1) vaccinated_and_friends_family_vaccinated=1.
EXECUTE.

RECODE vaccinated_and_friends_family_vaccinated (1=1) (SYSMIS=0).
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


/* HDC tiers dummy coded


RECODE HDC_tiers (1=1) (ELSE=0) INTO HDC_tier_1_dummy_coded.
EXECUTE.


RECODE HDC_tiers (2=1) (ELSE=0) INTO HDC_tier_2_dummy_coded.
EXECUTE.
