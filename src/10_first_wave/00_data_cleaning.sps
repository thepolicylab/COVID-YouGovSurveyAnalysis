* Encoding: UTF-8.

AUTORECODE VARIABLES=q1 q2 q8_1 q8_2 q8_3 q8_4 q8_5 q8_6 q8_7 q8_8 q8_9 q8_10
  /INTO q1_reverse_coded q2_reverse_coded q8_1_reverse_coded q8_2_reverse_coded q8_3_reverse_coded
    q8_4_reverse_coded q8_5_reverse_coded q8_6_reverse_coded q8_7_reverse_coded q8_8_reverse_coded
    q8_9_reverse_coded q8_10_reverse_coded
  /DESCENDING
  /PRINT.

RECODE q14x_1 q14x_2 q14x_3 q14x_4 q14x_5 q14x_6 q14x_7 (1=1) (2=0) (3=0) (4=0) (5=0) (6=0) (7=0)
    INTO q14x_1_first q14x_2_first q14x_3_first q14x_4_first q14x_5_first q14x_6_first q14x_7_first.
EXECUTE.

COMPUTE Age=2020 - birthyr.
EXECUTE.

RECODE q1 (1=1) (2=1) (3=1) (4=0) (5=0) (6=0) INTO willingness_split.
EXECUTE.

RECODE newsint (7=SYSMIS) (1=4) (2=3) (3=2) (4=1) INTO newsint_reverse_coded.
EXECUTE.
