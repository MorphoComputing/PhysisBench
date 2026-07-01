# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.6413702724345943

load 1CRN.pdb, 1CRN
bg_color white
hide everything, 1CRN
show cartoon, 1CRN
color grey80, 1CRN
set cartoon_transparency, 0.1

select worst_residues, 1CRN and resi 4+6+9+10+18+22+37+41+42+44
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1CRN and resi 6 and name CA, 1CRN and resi 29 and name CA  # target=10.782540036021771 current=11.840730877163768
color yellow, pair_00
distance pair_01, 1CRN and resi 34 and name CA, 1CRN and resi 43 and name CA  # target=10.881953219637035 current=11.57487173870748
color yellow, pair_01
distance pair_02, 1CRN and resi 6 and name CA, 1CRN and resi 18 and name CA  # target=20.149190359452962 current=20.79170406327036
color yellow, pair_02
distance pair_03, 1CRN and resi 7 and name CA, 1CRN and resi 33 and name CA  # target=16.817929790867176 current=17.45742605430306
color yellow, pair_03
distance pair_04, 1CRN and resi 2 and name CA, 1CRN and resi 34 and name CA  # target=7.666459724450365 current=8.301572649327277
color yellow, pair_04
distance pair_05, 1CRN and resi 4 and name CA, 1CRN and resi 13 and name CA  # target=13.538136618120525 current=12.907899537371895
color yellow, pair_05
distance pair_06, 1CRN and resi 5 and name CA, 1CRN and resi 24 and name CA  # target=17.490120578409808 current=18.09077376545784
color yellow, pair_06
distance pair_07, 1CRN and resi 22 and name CA, 1CRN and resi 43 and name CA  # target=15.639999073218016 current=16.169888820616546
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
