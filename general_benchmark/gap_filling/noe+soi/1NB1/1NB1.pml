# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.8851542479548864

load 1NB1.pdb, 1NB1
bg_color white
hide everything, 1NB1
show cartoon, 1NB1
color grey80, 1NB1
set cartoon_transparency, 0.1

select worst_residues, 1NB1 and resi 1+7+8+10+12+13+16+17+19+27
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1NB1 and resi 6
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1NB1 and resi 3 and name CA, 1NB1 and resi 21 and name CA  # target=3.711689012941624 current=6.781458907836496
color yellow, pair_00
distance pair_01, 1NB1 and resi 7 and name CA, 1NB1 and resi 16 and name CA  # target=6.243361362394886 current=9.14560201339433
color yellow, pair_01
distance pair_02, 1NB1 and resi 6 and name CA, 1NB1 and resi 18 and name CA  # target=6.438814307639179 current=9.007334179462385
color yellow, pair_02
distance pair_03, 1NB1 and resi 3 and name CA, 1NB1 and resi 19 and name CA  # target=5.790717228239924 current=3.6500350690395678
color yellow, pair_03
distance pair_04, 1NB1 and resi 4 and name CA, 1NB1 and resi 21 and name CA  # target=4.3412285601786795 current=6.288470954035215
color yellow, pair_04
distance pair_05, 1NB1 and resi 15 and name CA, 1NB1 and resi 25 and name CA  # target=6.452246554221226 current=8.304888712257183
color yellow, pair_05
distance pair_06, 1NB1 and resi 1 and name CA, 1NB1 and resi 27 and name CA  # target=4.839901528701486 current=6.60923907319971
color yellow, pair_06
distance pair_07, 1NB1 and resi 14 and name CA, 1NB1 and resi 23 and name CA  # target=4.03399379435194 current=5.7233667805786235
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
