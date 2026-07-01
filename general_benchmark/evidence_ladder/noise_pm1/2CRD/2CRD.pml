# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS | CA RMSD: 0.5943721363459211

load 2CRD.pdb, 2CRD
bg_color white
hide everything, 2CRD
show cartoon, 2CRD
color grey80, 2CRD
set cartoon_transparency, 0.1

select worst_residues, 2CRD and resi 1+5+6+8+11+13+14+20+24+28
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 2CRD and resi 3+7+9
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 2CRD and resi 8 and name CA, 2CRD and resi 33 and name CA  # target=8.014902151164424 current=10.99562183222905
color yellow, pair_00
distance pair_01, 2CRD and resi 5 and name CA, 2CRD and resi 13 and name CA  # target=10.219674340250698 current=12.732553457827594
color yellow, pair_01
distance pair_02, 2CRD and resi 3 and name CA, 2CRD and resi 14 and name CA  # target=7.108146158167984 current=9.384647879699964
color yellow, pair_02
distance pair_03, 2CRD and resi 5 and name CA, 2CRD and resi 34 and name CA  # target=13.185851946991972 current=15.360163853549539
color yellow, pair_03
distance pair_04, 2CRD and resi 15 and name CA, 2CRD and resi 27 and name CA  # target=12.148271741315213 current=14.300989937774075
color yellow, pair_04
distance pair_05, 2CRD and resi 10 and name CA, 2CRD and resi 19 and name CA  # target=16.516063381909298 current=14.435612130443717
color yellow, pair_05
distance pair_06, 2CRD and resi 8 and name CA, 2CRD and resi 18 and name CA  # target=14.293578996507183 current=16.20745882475094
color yellow, pair_06
distance pair_07, 2CRD and resi 9 and name CA, 2CRD and resi 22 and name CA  # target=12.7808980609237 current=10.886040688593885
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
