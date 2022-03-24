 * Encoding: UTF-8.

/* This code should be used with data in TPL_Testing_Survey_SixthWave_YouGov_RI.sav


/*________________________________________________________________________________________________________
/* I. VACCINATION STATUS AND INTENTIONS

FILTER OFF.
USE ALL.
EXECUTE.

WEIGHT BY weight.

/* How does our sample compare to other reported vaccination rates? 

FREQUENCIES VARIABLES=vaccinated_yes_or_no q120 q150 q151
  /ORDER=ANALYSIS.


/* Does this differ between parents and non-parents of minors?

WEIGHT BY weight_for_parent_nonparent_comparisons.

CROSSTABS
  /TABLES=vaccinated_yes_or_no BY parent_of_minor
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.


/* How many people have vaccinated their 12-17 year olds or plan to do so?

USE ALL.
COMPUTE filter_$=(parent_of_minor = 1).
VARIABLE LABELS filter_$ 'parent_of_minor = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

WEIGHT BY weight_parents.

FREQUENCIES VARIABLES=q154 q155
  /ORDER=ANALYSIS.


/* What are the reasons why they have not?

FREQUENCIES VARIABLES=q156a_m_1 q156a_m_2 q156a_m_3 q156a_m_4 q156a_m_5 q156a_m_6 q156a_m_8 
    q156a_m_9 q156a_m_10
  /ORDER=ANALYSIS.


/* How many people plan to vaccinate their children under 12?

FREQUENCIES VARIABLES=q157
  /ORDER=ANALYSIS.


/* What are the reasons why they won't?

FREQUENCIES VARIABLES=q158a_m_1 q158a_m_2 q158a_m_3 q158a_m_4 q158a_m_5 q158a_m_6 q158a_m_8 q158a_m_9 q158a_m_10
  /ORDER=ANALYSIS.


/* What are the topline numbers for all parents of minors?

FREQUENCIES VARIABLES=combined_intention_to_vaccinate_children combined_intention_to_vaccinate_unvaccinated_children
  /ORDER=ANALYSIS.


/* To what extent does vaccination status track intentions to vaccinate childrren?

CROSSTABS
  /TABLES=q154 q155 q157 BY vaccinated_yes_or_no
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.


/* Note: Regressions examining demographic predictors of reluctance to vaccinate children are in a separate syntax file:
/* 40_multiple_regressions_vaccinating_children_by_demographics.sps



/*________________________________________________________________________________________________________
/* II. CHILD VACCINE LOGISTICS

USE ALL.
COMPUTE filter_$=(parent_of_minor = 1).
VARIABLE LABELS filter_$ 'parent_of_minor = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

WEIGHT BY weight_parents.


/* Preferred locations & waiting times

FREQUENCIES VARIABLES=q159 q159b q160_1 q160_2 q160_3 q160_4 q160_5 q160_6
  /ORDER=ANALYSIS.


/* For the people who would wait a month a more, what are their preferred venues?

USE ALL.
COMPUTE filter_$=(parent_of_minor = 1 & q159b = 1).
VARIABLE LABELS filter_$ 'parent_of_minor = 1 & q159b = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

WEIGHT BY weight_parents.

FREQUENCIES VARIABLES=q159
  /ORDER=ANALYSIS.


/*________________________________________________________________________________________________________
/*III. MANDATE & POLICY SUPPORT 

FILTER OFF.
USE ALL.
EXECUTE.

WEIGHT BY weight.


/* Overall

FREQUENCIES VARIABLES=q160a_1 q160a_2 q160a_3 q160a_4
  /ORDER=ANALYSIS.
  

/*...and as a function of being a parent

WEIGHT BY weight_for_parent_nonparent_comparisons.

CROSSTABS
  /TABLES=q160a_1 q160a_2 q160a_3 q160a_4 BY parent_of_minor
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.


/* Did question order appreciably affect...
/* risk perceptions?

WEIGHT BY weight.

CROSSTABS
  /TABLES=q162_1 q162_2 q162_3 q162_4 q162_5 q162_6 q162_7 q162_8 q162_9 q163_a q163_b q163_c 
    q163_d q163_e BY mandate_beliefs_before_vaccine_beliefs
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.

T-TEST GROUPS=mandate_beliefs_before_vaccine_beliefs(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q162_1 q162_2 q162_3 q162_4 q162_5 q162_6 q162_7 q162_8 q162_9
  /CRITERIA=CI(.95).


/* factual questions about the clinical trials?

CROSSTABS
  /TABLES= q165_1 q165_2 q165_3 q165_4 q165_5 q165_6 BY mandate_beliefs_before_vaccine_beliefs
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.


/* factual questions about emergency use authorization?

CROSSTABS
  /TABLES= q166_a q166_b q166_c q166_d q166_e BY mandate_beliefs_before_vaccine_beliefs
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.

/* Note: Multiple regressions testing for question order x party ID interactions are in a separate syntax file:
/* 60_multiple_regressions_question_order_by_party_ID_interactions.sps


/*________________________________________________________________________________________________________
/*IV. BELIEFS ABOUT CHILD VACCINES

FILTER OFF.
USE ALL.
EXECUTE.

WEIGHT BY weight.


/* Risk grid

FREQUENCIES VARIABLES=q162_1 q162_2 q162_3 q162_4 q162_5 q162_6 q162_7 q162_8 q162_9
  /ORDER=ANALYSIS.


/* Comparison between adults' and children's vaccines

FREQUENCIES VARIABLES=q163_a q163_b q163_c q163_d q163_e q164
  /ORDER=ANALYSIS.


/* Understanding of the approval process

FREQUENCIES VARIABLES=q165_1 q165_2 q165_3 q165_4 q165_5 q165_6 q166_a q166_b q166_c q166_d 
    q166_e
  /ORDER=ANALYSIS.


/* Beliefs about side effects from other vaccines

FREQUENCIES VARIABLES=q170 
  /ORDER=ANALYSIS.

/* Do reluctant parents have different beliefs about other vaccines' side effects?

USE ALL.
COMPUTE filter_$=(parent_of_minor = 1).
VARIABLE LABELS filter_$ 'parent_of_minor = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

WEIGHT BY weight_parents.

CROSSTABS
  /TABLES=q170 BY definitely_will_vaccinate_underage_children_or_already_has
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.


/*...and as a function of being a parent

FILTER OFF.
USE ALL.
EXECUTE.

WEIGHT BY weight_for_parent_nonparent_comparisons.

CROSSTABS
  /TABLES=q162_1 q162_2 q162_3 q162_4 q162_5 q162_6 q162_7 q162_8 q162_9 BY parent_of_minor
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=q163_a q163_b q163_c q163_d q163_e q164 BY parent_of_minor
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=q165_1 q165_2 q165_3 q165_4 q165_5 q165_6 q166_a q166_b q166_c q166_d q166_e BY parent_of_minor
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=q170 BY parent_of_minor
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.

/* Do reported numbers of children that participated in the Pfizer clinical trials differ by any variables of interest?

/* Being a parent

FILTER OFF.
USE ALL.
EXECUTE.

WEIGHT BY weight_for_parent_nonparent_comparisons.

T-TEST GROUPS=parent_of_minor(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q167
  /CRITERIA=CI(.95).

/* Political ideology

FILTER OFF.
USE ALL.
EXECUTE.

WEIGHT BY weight.

T-TEST GROUPS=party_dummy_coded_republican(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q167
  /CRITERIA=CI(.95).

T-TEST GROUPS=trump_vote_dummy_code(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q167
  /CRITERIA=CI(.95).

/* Being a hesitant parent

USE ALL.
COMPUTE filter_$=(parent_of_minor = 1).
VARIABLE LABELS filter_$ 'parent_of_minor = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

WEIGHT BY weight_parents.

T-TEST GROUPS=definitely_will_vaccinate_underage_children_or_already_has(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q167
  /CRITERIA=CI(.95).



/* Is partisanship driving the lower percentage for the EUA item about conflicts of interest?

WEIGHT BY weight.

FILTER OFF.
USE ALL.
EXECUTE.

CROSSTABS
  /TABLES=q166_a q166_b q166_c q166_d q166_e BY pid3
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.


/* Do we see this in other trust-in-science measures?

WEIGHT BY weight.

FILTER OFF.
USE ALL.
EXECUTE.

CROSSTABS
  /TABLES=q18 q108 scientists_knowledge_lower_than_own BY pid3
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.


/* Do vaccinated parents who won't definitely vaccinate their children believe that children's vaccines are more risky than adult vaccines?


USE ALL.
COMPUTE filter_$=(definitely_will_vaccinate_underage_children_or_already_has = 0).
VARIABLE LABELS filter_$ 'definitely_will_vaccinate_underage_children_or_already_has = 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

WEIGHT BY weight_parents.

CROSSTABS
  /TABLES=q163_a q163_b q163_c q163_d q163_e BY vaccinated_yes_or_no
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.


/*________________________________________________________________________________________________________
/* V. OTHER COVID BELIEFS AND ATTITUDES

FILTER OFF.
USE ALL.
EXECUTE.

WEIGHT BY weight.

/* Overall views of the pandemic

FREQUENCIES VARIABLES=q23_9 q26
  /ORDER=ANALYSIS.


/* Beliefs about the vaccination status of others by group

FREQUENCIES VARIABLES=q168_1 q168_2 q168_3 q168_4 q168_5 q168_6 q168_7
  /ORDER=ANALYSIS.


/* Do we replicate the KFF result suggesting homphily?

WEIGHT BY weight.

CROSSTABS
  /TABLES=q168_1 BY vaccinated_yes_or_no
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.



/* Correlation staircase?

CORRELATIONS
  /VARIABLES=vaccinated_yes_or_no q168_1 q168_2 q168_3 q168_4
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.


/* Talking about vaccination status 

FREQUENCIES VARIABLES=q171 q172 q173_m_1 q173_m_2 q173_m_3 q173_m_4 q173_m_5 q173_m_6 q173_m_7 q173_m_8 q173_m_9 q173_m_10
  /ORDER=ANALYSIS.


/* Do vaccinated people with less vaccinated networks talk about their status less than vaccinated people with more vaccinated networks?

WEIGHT BY weight.

T-TEST GROUPS=self_group_vaccination_status_discrepant(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q171
  /CRITERIA=CI(.95).


/* Death count and risk perceptions

GRAPH
  /HISTOGRAM=q53.

GRAPH
  /HISTOGRAM=q22.
  
GRAPH
  /HISTOGRAM=q111.

GRAPH
  /HISTOGRAM=q112.


/* Beliefs about Delta variant

FREQUENCIES VARIABLES=q175 q176
  /ORDER=ANALYSIS.


/* Knowledge and trust

FREQUENCIES VARIABLES=q18 q107 q108 q169
  /ORDER=ANALYSIS.


/*________________________________________________________________________________________________________
/* VI. BOOSTERS

FREQUENCIES VARIABLES=q174
  /ORDER=ANALYSIS.

CROSSTABS
  /TABLES=q174 BY age_range
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.

/* Note: Regressions examining demographic predictors of willingess to get boosters are in a separate syntax file:
/* 50_multiple_regressions_boosters_by_demographics.sps


/*________________________________________________________________________________________________________
/*VII. TESTING

FREQUENCIES VARIABLES=q177_pre q177 q178 q179
  /ORDER=ANALYSIS.




/*________________________________________________________________________________________________________
/* VIII. DEMOGRAPHICS

FILTER OFF.
USE ALL.
EXECUTE.

FREQUENCIES VARIABLES=gender race educ family_incom_binned_evenly pid3
  /ORDER=ANALYSIS.


/*________________________________________________________________________________________________________
/* IX. CONDITIONAL ANALYSES


USE ALL.
COMPUTE filter_$=(parent_of_minor = 1).
VARIABLE LABELS filter_$ 'parent_of_minor = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

WEIGHT BY weight_parents.


/* Who will get their 5-11 year olds vaccinated?

CROSSTABS
  /TABLES=q157 BY gender race educ pid3 presvote20post vaccinated_yes_or_no 
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.

CORRELATIONS
  /VARIABLES=q157 age
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.


/* Who has vaccinated their 12-17 year olds?

CROSSTABS
  /TABLES=q154 BY gender race educ pid3 presvote20post vaccinated_yes_or_no 
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.

CORRELATIONS
  /VARIABLES=q154 age
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.


/* Combined analysis (all parents of minors)

CROSSTABS
  /TABLES=definitely_will_vaccinate_underage_children_or_already_has combined_intention_to_vaccinate_children BY gender race educ pid3 presvote20post vaccinated_yes_or_no 
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.

CORRELATIONS
  /VARIABLES=definitely_will_vaccinate_underage_children_or_already_has combined_intention_to_vaccinate_children age age
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.


/* What's going on with the parents who are vaccinated but don't want to vaccinate their children?

CROSSTABS
  /TABLES=q162_1 q162_2 q162_3 q162_4 q162_5 q162_6 q162_7 q162_8 q162_9 BY 
    vaccinated_parents_uncertain_about_vaccinating_kids
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.











































