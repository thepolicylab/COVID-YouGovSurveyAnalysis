* Encoding: UTF-8.



/* Make missing values into zeroes in selected-or-not variables

RECODE q4_1 q4_2 q4_3 q4_4 q4_5 (1=1) (SYSMIS=0).
EXECUTE.


RECODE q114_1 q114_2 q114_3 q114_4 q114_5 q114_6 q56_1 q56_2 q56_3 q56_4 q56_5 q56_6 q56_7 q56_8 
    q56_9 q56_10 q56_11 q56_12 (1=1) (SYSMIS=0).
EXECUTE.



/* Create variable indicating message condition (1 = for your family, 2 = for your community)

RECODE q115_family (SYSMIS=2) (ELSE=1) INTO q115_treat.
EXECUTE.

* Define Variable Properties.
*message_condition.
VALUE LABELS q115_treat
  1.00 'Family'
  2.00 'Community'.
EXECUTE.


/* Create variable indicating question order condition (1 = before, 2 = after)
/* KEVIN: These weird variable names indicate which survey flow a respondent saw in Qualtrics. 
/* The ones ending _20 and _47 are the original order (aka what we're now calling the "after" condition) while the other two are the new order (the "before" condition)

RECODE FL_17_DO_FL_20 FL_17_DO_FL_34 FL_17_DO_FL_47 FL_17_DO_FL_59 (1=1) (SYSMIS=0).
EXECUTE.

COMPUTE q60_treat=FL_17_DO_FL_34 + FL_17_DO_FL_59.
EXECUTE.

RECODE q60_treat (1=1) (0=2).
EXECUTE.

* Define Variable Properties.
*question_order_condition.
VALUE LABELS q60_treat
  1.00 "others' intentions before own intention"
  2.00 "others' intentions after own intention".
EXECUTE.


/* Create single vaccine timing interest variable

RECODE q115_family q115_community (1=1) (2=0) (SYSMIS=0).
EXECUTE.

COMPUTE vaccine_timing_interest=q115_family + q115_community.
EXECUTE.

* Define Variable Properties.
*vaccine_timing_interest.
VALUE LABELS vaccine_timing_interest
  .00 'Did not click on list'
  1.00 'Clicked on list'.
EXECUTE.





