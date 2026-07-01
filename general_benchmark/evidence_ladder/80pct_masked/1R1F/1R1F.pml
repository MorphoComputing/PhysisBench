# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.7056505865273697

load 1R1F.pdb, 1R1F
bg_color white
hide everything, 1R1F
show cartoon, 1R1F
color grey80, 1R1F
set cartoon_transparency, 0.1

select worst_residues, 1R1F and resi 3+5+6+8+10+21+25+26+32+34
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1R1F and resi 3
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1R1F and resi 15 and name CA, 1R1F and resi 26 and name CA  # target=18.38335590625577 current=14.497411165468474
color yellow, pair_00
distance pair_01, 1R1F and resi 3 and name CA, 1R1F and resi 21 and name CA  # target=10.609932573910271 current=8.24611650305541
color yellow, pair_01
distance pair_02, 1R1F and resi 4 and name CA, 1R1F and resi 21 and name CA  # target=10.1663467538162 current=7.860278006312554
color yellow, pair_02
distance pair_03, 1R1F and resi 6 and name CA, 1R1F and resi 21 and name CA  # target=9.19944242071631 current=7.18762975514854
color yellow, pair_03
distance pair_04, 1R1F and resi 4 and name CA, 1R1F and resi 23 and name CA  # target=12.015692188457589 current=10.25428988075348
color yellow, pair_04
distance pair_05, 1R1F and resi 17 and name CA, 1R1F and resi 34 and name CA  # target=13.262986973908719 current=14.987379084732877
color yellow, pair_05
distance pair_06, 1R1F and resi 8 and name CA, 1R1F and resi 34 and name CA  # target=25.59033554180892 current=24.174262844965284
color yellow, pair_06
distance pair_07, 1R1F and resi 20 and name CA, 1R1F and resi 34 and name CA  # target=9.338663049215882 current=10.668222501700626
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
