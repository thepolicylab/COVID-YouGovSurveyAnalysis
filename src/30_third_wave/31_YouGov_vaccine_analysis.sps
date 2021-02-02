* Encoding: UTF-8.


/* CREATING NEW VARIABLES__________________________________________________________

USE ALL.
COMPUTE filter_$=(inputstate = 44 & time = 1).
VARIABLE LABELS filter_$ 'inputstate = 44 & time = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

WEIGHT BY weight.


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


/* Dummy code Republican

RECODE pid3 (2=1) (ELSE=0) INTO Republican_dummy_coded.
EXECUTE.


/* Dummy code Independent

RECODE pid3 (3=1) (ELSE=0) INTO Independent_dummy_coded.
EXECUTE.


/* Dummy code gender (female or not)

RECODE gender (2=1) (ELSE=0) INTO female_dummy_coded.
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


/* Dummy code race (Black)

RECODE race (2=1) (ELSE=0) INTO Black_dummy_coded.
EXECUTE.


/* Dummy code rack (Latinx)

RECODE race (3=1) (ELSE=0) INTO Latinx_dummy_coded.
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


/* Create costs and benefits indexes

COMPUTE mean_agreement_with_vaccine_benefits=MEAN(q58_1,q58_2,q58_3,q58_4,q58_5,q58_6,q58_7)
    .
EXECUTE.

COMPUTE mean_agreement_with_vaccine_costs=MEAN(q59_1,q59_2,q59_3,q59_4,q59_5,q59_6).
EXECUTE.






/*ANALYSES FOR JOHN FULTON__________________________________________________________________________

USE ALL.
COMPUTE filter_$=(inputstate = 44 & time = 1).
VARIABLE LABELS filter_$ 'inputstate = 44 & time = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

WEIGHT BY weight.


/* n's by core city

FREQUENCIES VARIABLES=core_cities_PVD_split 
  /ORDER=ANALYSIS.


/* n's by SES

FREQUENCIES VARIABLES=SES_coarse
  /ORDER=ANALYSIS.


/* QUESTION: To what extent do core city and SES covary?

CROSSTABS
  /TABLES=core_city_excluding_newport core_city_excluding_Newport_and_noncentral_PVD BY SES_coarse
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

/* ANSWER: To a considerable extent.


/* QUESTION: Are the low SES people just college students and that's why they earn 29,000 or less?

CROSSTABS
  /TABLES=q46 BY SES_coarse
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

/* ANSWER: Seemingly no.


/* Compare cost and benefit scale intercorrelations using Pearson's r and Spearman's rho

CORRELATIONS
  /VARIABLES=q58_1 q58_2 q58_3 q58_4 q58_5 q58_6 q58_7
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.
NONPAR CORR
  /VARIABLES=q58_1 q58_2 q58_3 q58_4 q58_5 q58_6 q58_7
  /PRINT=SPEARMAN TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=q59_1 q59_2 q59_3 q59_4 q59_5 q59_6
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.
NONPAR CORR
  /VARIABLES=q59_1 q59_2 q59_3 q59_4 q59_5 q59_6
  /PRINT=SPEARMAN TWOTAIL NOSIG
  /MISSING=PAIRWISE.

/* OBSERVATION: Correlations are higher with Spearman's rho so calculating reliability using Peasrson's r will not artificially inflate alpha.


/* Calculate Cronbach's alpha for cost and benefit indexes

RELIABILITY
  /VARIABLES=q58_1 q58_2 q58_3 q58_4 q58_5 q58_6 q58_7
  /SCALE('Covid vaccine benefits') ALL
  /MODEL=ALPHA.

RELIABILITY
  /VARIABLES=q59_1 q59_2 q59_3 q59_4 q59_5 q59_6
  /SCALE('Covid vaccine costs') ALL
  /MODEL=ALPHA.


/* Vaccine intention and flu shot likelihood by core city, gender, race, education, party ID, and SES

CROSSTABS
  /TABLES=q1 flu_vaccine_likely_or_already_have BY core_city_excluding_newport core_city_excluding_Newport_and_noncentral_PVD gender race pid3 educ 
    SES_coarse
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.


/* And to follow up, SES without the nonresponders

USE ALL.
COMPUTE filter_$=(inputstate = 44 & time = 1 & SES_coarse ~= 0).
VARIABLE LABELS filter_$ 'inputstate = 44 & time = 1 & SES_coarse ~= 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=q1 flu_vaccine_likely_or_already_have BY SES_coarse
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.


/* And to follow up, gender without the small n responses.

USE ALL.
COMPUTE filter_$=(inputstate = 44 & time = 1 & gender < 3).
VARIABLE LABELS filter_$ 'inputstate = 44 & time = 1 & gender < 3 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=q1 flu_vaccine_likely_or_already_have BY gender
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.


/* Comparing all vaccine costs and benefits questions by core city (yes or no)


USE ALL.
COMPUTE filter_$=(inputstate = 44 & time = 1).
VARIABLE LABELS filter_$ 'inputstate = 44 & time = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


T-TEST GROUPS=core_city_excluding_newport(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q58_1 q58_2 q58_3 q58_4 q58_5 q58_6 q58_7 q59_1 q59_2 q59_3 q59_4 q59_5 q59_6
  /CRITERIA=CI(.95).

T-TEST GROUPS=core_city_excluding_Newport_and_noncentral_PVD(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q58_1 q58_2 q58_3 q58_4 q58_5 q58_6 q58_7 q59_1 q59_2 q59_3 q59_4 q59_5 q59_6
  /CRITERIA=CI(.95).


/* Comparing all vaccine costs and benefits questions by SES


USE ALL.
COMPUTE filter_$=(inputstate = 44 & time = 1 & SES_coarse ~= 0).
VARIABLE LABELS filter_$ 'inputstate = 44 & time = 1 & SES_coarse ~= 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

ONEWAY q58_1 q58_2 q58_3 q58_4 q58_5 q58_6 q58_7 q59_1 q59_2 q59_3 q59_4 q59_5 q59_6 BY SES_coarse
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).


/* Regression with intention to vaccinate as DV as costs and benefits as IVs


USE ALL.
COMPUTE filter_$=(inputstate = 44 & time = 1).
VARIABLE LABELS filter_$ 'inputstate = 44 & time = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q1
  /METHOD=ENTER mean_agreement_with_vaccine_benefits 
    mean_agreement_with_vaccine_costs.


/* Regression to see how core city and SES stack up against other demographics

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q1
  /METHOD=ENTER core_city_excluding_newport low_SES_dummy_coded age female_dummy_coded 
    Black_dummy_coded Latinx_dummy_coded Republican_dummy_coded Independent_dummy_coded 
    No_HS_dummy_coded HS_dummy_coded Some_college_dummy_coded.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q1
  /METHOD=ENTER core_city_excluding_Newport_and_noncentral_PVD low_SES_dummy_coded age female_dummy_coded 
    Black_dummy_coded Latinx_dummy_coded Republican_dummy_coded Independent_dummy_coded 
    No_HS_dummy_coded HS_dummy_coded Some_college_dummy_coded.



/*ANALYSES FOR OUR OWN UNDERSTANDING__________________________________________________________________________

/* Regression with likelihood of getting vaccinated as DV and demographics, percent of friends/family that are going to get vaccinated, and trust in public health scientists' information as IVs

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q1
  /METHOD=ENTER core_city_excluding_newport low_SES_dummy_coded Republican_dummy_coded 
    Independent_dummy_coded female_dummy_coded eighteen_to_twentynine_dummy_coded 
    sixty_and_over_dummy_coded Black_dummy_coded Latinx_dummy_coded q60_1 q26.

/* Same regression but with ideology instead of party ID

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q1
  /METHOD=ENTER core_city_excluding_newport low_SES_dummy_coded ideo5
    Independent_dummy_coded female_dummy_coded eighteen_to_twentynine_dummy_coded 
    sixty_and_over_dummy_coded Black_dummy_coded Latinx_dummy_coded q60_1 q26.



/* Regression with likelihood of getting vaccinated as DV and demographics, percent of friends/family that are going to get vaccinated, trust in public health scientists' information, and costs and benefits as IVs

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q1
  /METHOD=ENTER core_city_excluding_newport low_SES_dummy_coded Republican_dummy_coded 
    Independent_dummy_coded female_dummy_coded eighteen_to_twentynine_dummy_coded 
    sixty_and_over_dummy_coded Black_dummy_coded Latinx_dummy_coded q60_1 q26 q58_1 q58_2 
    q58_3 q58_4 q58_5 q58_6 q58_7 q59_1 q59_2 q59_3 q59_4 q59_5 q59_6.


/* Same regression as above but with ideology instead of party ID

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT q1
  /METHOD=ENTER core_city_excluding_newport low_SES_dummy_coded ideo5 
    Independent_dummy_coded female_dummy_coded eighteen_to_twentynine_dummy_coded 
    sixty_and_over_dummy_coded Black_dummy_coded Latinx_dummy_coded q60_1 q26 q58_1 q58_2 
    q58_3 q58_4 q58_5 q58_6 q58_7 q59_1 q59_2 q59_3 q59_4 q59_5 q59_6.















