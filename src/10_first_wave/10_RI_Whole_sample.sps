* Encoding: UTF-8.

WEIGHT BY weight.

FREQUENCIES VARIABLES=q1 q2
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=q3 q4 q5
  /HISTOGRAM
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=q8_1 q8_2 q8_3 q8_4 q8_5 q8_6 q8_7 q8_8 q8_9 q8_10 q9
  /ORDER=ANALYSIS.

T-TEST GROUPS=willingness_split(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=q8_1_reverse_coded q8_2_reverse_coded q8_3_reverse_coded q8_4_reverse_coded
    q8_5_reverse_coded q8_6_reverse_coded q8_7_reverse_coded q8_8_reverse_coded q8_9_reverse_coded
    q8_10_reverse_coded q9
  /CRITERIA=CI(.95).

FREQUENCIES VARIABLES=q14x_1_first q14x_2_first q14x_3_first q14x_4_first q14x_5_first q14x_6_first
    q14x_7_first
  /ORDER=ANALYSIS.