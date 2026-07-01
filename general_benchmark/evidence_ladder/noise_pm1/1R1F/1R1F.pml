# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.6501377294545283

load 1R1F.pdb, 1R1F
bg_color white
hide everything, 1R1F
show cartoon, 1R1F
color grey80, 1R1F
set cartoon_transparency, 0.1

select worst_residues, 1R1F and resi 5+14+17+18+23+26+27+33+34+35
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1R1F and resi 5+19
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1R1F and resi 17 and name CA, 1R1F and resi 34 and name CA  # target=15.636522822517799 current=12.679799898701614
color yellow, pair_00
distance pair_01, 1R1F and resi 18 and name CA, 1R1F and resi 35 and name CA  # target=14.341688002452083 current=11.502442308072482
color yellow, pair_01
distance pair_02, 1R1F and resi 6 and name CA, 1R1F and resi 25 and name CA  # target=11.322849387136596 current=8.550838318754254
color yellow, pair_02
distance pair_03, 1R1F and resi 10 and name CA, 1R1F and resi 19 and name CA  # target=10.528637370619222 current=13.135323704584609
color yellow, pair_03
distance pair_04, 1R1F and resi 7 and name CA, 1R1F and resi 30 and name CA  # target=11.691753900914357 current=9.204958382124646
color yellow, pair_04
distance pair_05, 1R1F and resi 10 and name CA, 1R1F and resi 22 and name CA  # target=9.395961812588837 current=6.9682647053853035
color yellow, pair_05
distance pair_06, 1R1F and resi 2 and name CA, 1R1F and resi 11 and name CA  # target=13.566970951697702 current=11.362566454056651
color yellow, pair_06
distance pair_07, 1R1F and resi 9 and name CA, 1R1F and resi 31 and name CA  # target=17.301885232346514 current=15.132396150832895
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
