# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.2464616026612116

load 1KX6.pdb, 1KX6
bg_color white
hide everything, 1KX6
show cartoon, 1KX6
color grey80, 1KX6
set cartoon_transparency, 0.1

select worst_residues, 1KX6 and resi 2+6+7+8+9+10+15+18+22+24
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1KX6 and resi 27+799
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1KX6 and resi 12 and name CA, 1KX6 and resi 21 and name CA  # target=13.484161088242638 current=21.63199774411834
color yellow, pair_00
distance pair_01, 1KX6 and resi 2 and name CA, 1KX6 and resi 10 and name CA  # target=16.48497573842348 current=9.014965259491238
color yellow, pair_01
distance pair_02, 1KX6 and resi 7 and name CA, 1KX6 and resi 21 and name CA  # target=34.333994328226204 current=27.893483513351097
color yellow, pair_02
distance pair_03, 1KX6 and resi 5 and name CA, 1KX6 and resi 17 and name CA  # target=17.743934445536087 current=24.14569378441777
color yellow, pair_03
distance pair_04, 1KX6 and resi 8 and name CA, 1KX6 and resi 23 and name CA  # target=23.465426493175006 current=29.856145986601025
color yellow, pair_04
distance pair_05, 1KX6 and resi 11 and name CA, 1KX6 and resi 24 and name CA  # target=21.352985286177866 current=27.454393492396374
color yellow, pair_05
distance pair_06, 1KX6 and resi 11 and name CA, 1KX6 and resi 27 and name CA  # target=34.941917887444944 current=29.249735634438736
color yellow, pair_06
distance pair_07, 1KX6 and resi 7 and name CA, 1KX6 and resi 23 and name CA  # target=36.45678124239367 current=30.787480778150574
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
