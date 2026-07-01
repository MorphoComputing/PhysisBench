# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 4.829785508031416

load 1PT4.pdb, 1PT4
bg_color white
hide everything, 1PT4
show cartoon, 1PT4
color grey80, 1PT4
set cartoon_transparency, 0.1

select worst_residues, 1PT4 and resi 1+8+9+11+14+19+20+21+23+24
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1PT4 and resi 4+23
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1PT4 and resi 12 and name CA, 1PT4 and resi 27 and name CA  # target=12.998494233428815 current=5.637154957380672
color yellow, pair_00
distance pair_01, 1PT4 and resi 9 and name CA, 1PT4 and resi 19 and name CA  # target=10.100655934537862 current=5.650512923800034
color yellow, pair_01
distance pair_02, 1PT4 and resi 5 and name CA, 1PT4 and resi 14 and name CA  # target=13.38014530505475 current=9.346439272760568
color yellow, pair_02
distance pair_03, 1PT4 and resi 10 and name CA, 1PT4 and resi 26 and name CA  # target=16.158229408319443 current=12.24701479993894
color yellow, pair_03
distance pair_04, 1PT4 and resi 6 and name CA, 1PT4 and resi 24 and name CA  # target=18.99450701151467 current=15.127918402608904
color yellow, pair_04
distance pair_05, 1PT4 and resi 5 and name CA, 1PT4 and resi 13 and name CA  # target=16.608852672319166 current=13.302274832577934
color yellow, pair_05
distance pair_06, 1PT4 and resi 1 and name CA, 1PT4 and resi 11 and name CA  # target=8.560274166295336 current=6.033061539159788
color yellow, pair_06
distance pair_07, 1PT4 and resi 7 and name CA, 1PT4 and resi 25 and name CA  # target=15.511724163290442 current=13.229000553311323
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
