# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 4.2247746068492855

load 1HVZ.pdb, 1HVZ
bg_color white
hide everything, 1HVZ
show cartoon, 1HVZ
color grey80, 1HVZ
set cartoon_transparency, 0.1

select worst_residues, 1HVZ and resi 1+2+3+4+7+8+9+10+13+16
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1HVZ and resi 3+8
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1HVZ and resi 1 and name CA, 1HVZ and resi 9 and name CA  # target=19.94800020743144 current=14.792420084193033
color yellow, pair_00
distance pair_01, 1HVZ and resi 6 and name CA, 1HVZ and resi 16 and name CA  # target=13.397061066638866 current=8.855275622518159
color yellow, pair_01
distance pair_02, 1HVZ and resi 4 and name CA, 1HVZ and resi 15 and name CA  # target=8.79542026899863 current=8.023271154998264
color yellow, pair_02
distance pair_03, 1HVZ and resi 3 and name CA, 1HVZ and resi 15 and name CA  # target=6.697087098117435 current=6.265900303942311
color yellow, pair_03
distance pair_04, 1HVZ and resi 2 and name CA, 1HVZ and resi 15 and name CA  # target=4.345073578208196 current=4.056821501356364
color yellow, pair_04
distance pair_05, 1HVZ and resi 6 and name CA, 1HVZ and resi 14 and name CA  # target=10.288848433429157 current=10.044862332854914
color yellow, pair_05
distance pair_06, 1HVZ and resi 3 and name CA, 1HVZ and resi 13 and name CA  # target=5.521119401847383 current=5.7329985538551975
color yellow, pair_06
distance pair_07, 1HVZ and resi 2 and name CA, 1HVZ and resi 12 and name CA  # target=10.189814327988508 current=10.317367641017523
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
