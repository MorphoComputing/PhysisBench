# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.6493896441948523

load 1EGF.pdb, 1EGF
bg_color white
hide everything, 1EGF
show cartoon, 1EGF
color grey80, 1EGF
set cartoon_transparency, 0.1

select worst_residues, 1EGF and resi 1+3+7+8+10+34+38+49+50+51
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1EGF and resi 4+5+21+38
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1EGF and resi 1 and name CA, 1EGF and resi 24 and name CA  # target=18.250628264550112 current=9.441938906486188
color yellow, pair_00
distance pair_01, 1EGF and resi 1 and name CA, 1EGF and resi 22 and name CA  # target=15.41122441637337 current=6.785892670001418
color yellow, pair_01
distance pair_02, 1EGF and resi 1 and name CA, 1EGF and resi 23 and name CA  # target=14.778806655779608 current=6.621050206475706
color yellow, pair_02
distance pair_03, 1EGF and resi 1 and name CA, 1EGF and resi 25 and name CA  # target=19.74860584110124 current=13.612569339583446
color yellow, pair_03
distance pair_04, 1EGF and resi 2 and name CA, 1EGF and resi 22 and name CA  # target=11.607942014311643 current=5.548867782502722
color yellow, pair_04
distance pair_05, 1EGF and resi 1 and name CA, 1EGF and resi 26 and name CA  # target=17.931965690865184 current=12.142209364363767
color yellow, pair_05
distance pair_06, 1EGF and resi 1 and name CA, 1EGF and resi 27 and name CA  # target=18.534084010542802 current=13.419309092648394
color yellow, pair_06
distance pair_07, 1EGF and resi 2 and name CA, 1EGF and resi 24 and name CA  # target=14.820901933443901 current=10.05694282981592
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
