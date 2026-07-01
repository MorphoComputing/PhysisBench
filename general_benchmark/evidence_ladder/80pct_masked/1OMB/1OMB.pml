# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 4.634551519282073

load 1OMB.pdb, 1OMB
bg_color white
hide everything, 1OMB
show cartoon, 1OMB
color grey80, 1OMB
set cartoon_transparency, 0.1

select worst_residues, 1OMB and resi 4+7+10+11+12+13+19+28+31+33
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1OMB and resi 5
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1OMB and resi 11 and name CA, 1OMB and resi 31 and name CA  # target=13.55551364256898 current=5.851048944418529
color yellow, pair_00
distance pair_01, 1OMB and resi 13 and name CA, 1OMB and resi 21 and name CA  # target=10.356740786178829 current=5.227330074984576
color yellow, pair_01
distance pair_02, 1OMB and resi 12 and name CA, 1OMB and resi 23 and name CA  # target=14.379424897184034 current=9.652362970500763
color yellow, pair_02
distance pair_03, 1OMB and resi 13 and name CA, 1OMB and resi 24 and name CA  # target=17.91293443638308 current=13.697881596981043
color yellow, pair_03
distance pair_04, 1OMB and resi 11 and name CA, 1OMB and resi 22 and name CA  # target=13.283770228116158 current=9.791034896764563
color yellow, pair_04
distance pair_05, 1OMB and resi 14 and name CA, 1OMB and resi 24 and name CA  # target=16.95268660891691 current=13.472823121965805
color yellow, pair_05
distance pair_06, 1OMB and resi 6 and name CA, 1OMB and resi 30 and name CA  # target=8.508612560176545 current=11.470400607849369
color yellow, pair_06
distance pair_07, 1OMB and resi 6 and name CA, 1OMB and resi 19 and name CA  # target=11.123837090408022 current=8.404149101516477
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
