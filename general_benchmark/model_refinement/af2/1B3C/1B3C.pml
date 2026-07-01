# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.614777329489611

load 1B3C.pdb, 1B3C
bg_color white
hide everything, 1B3C
show cartoon, 1B3C
color grey80, 1B3C
set cartoon_transparency, 0.1

select worst_residues, 1B3C and resi 28+29+30+31+32+33+50+51+54+59
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1B3C and resi 19 and name CA, 1B3C and resi 60 and name CA  # target=27.32336847671364 current=29.217437766977874
color yellow, pair_00
distance pair_01, 1B3C and resi 21 and name CA, 1B3C and resi 60 and name CA  # target=27.24611915793037 current=28.975889882054872
color yellow, pair_01
distance pair_02, 1B3C and resi 4 and name CA, 1B3C and resi 60 and name CA  # target=15.922166578034611 current=14.717713602193342
color yellow, pair_02
distance pair_03, 1B3C and resi 19 and name CA, 1B3C and resi 61 and name CA  # target=26.902690978390815 current=28.03926569398104
color yellow, pair_03
distance pair_04, 1B3C and resi 2 and name CA, 1B3C and resi 60 and name CA  # target=16.719253580376744 current=15.606210982813035
color yellow, pair_04
distance pair_05, 1B3C and resi 21 and name CA, 1B3C and resi 59 and name CA  # target=26.704600988312325 current=27.789025678384
color yellow, pair_05
distance pair_06, 1B3C and resi 3 and name CA, 1B3C and resi 60 and name CA  # target=15.944939133336986 current=14.862552787115819
color yellow, pair_06
distance pair_07, 1B3C and resi 18 and name CA, 1B3C and resi 60 and name CA  # target=27.102339623255368 current=28.117080731040662
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
