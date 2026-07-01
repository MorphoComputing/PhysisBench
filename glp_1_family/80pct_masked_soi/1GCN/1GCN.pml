# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 3.4037633350433882

load 1GCN.pdb, 1GCN
bg_color white
hide everything, 1GCN
show cartoon, 1GCN
color grey80, 1GCN
set cartoon_transparency, 0.1

select worst_residues, 1GCN and resi 4+5+6+13+15+16+19+20+24+25
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1GCN and resi 15 and name CA, 1GCN and resi 26 and name CA  # target=16.94681911280751 current=18.673136026350562
color yellow, pair_00
distance pair_01, 1GCN and resi 5 and name CA, 1GCN and resi 16 and name CA  # target=18.803455825141583 current=20.489679037040954
color yellow, pair_01
distance pair_02, 1GCN and resi 4 and name CA, 1GCN and resi 18 and name CA  # target=23.113227349427785 current=24.668233090099477
color yellow, pair_02
distance pair_03, 1GCN and resi 2 and name CA, 1GCN and resi 11 and name CA  # target=18.302561039539693 current=19.759675675006868
color yellow, pair_03
distance pair_04, 1GCN and resi 6 and name CA, 1GCN and resi 20 and name CA  # target=22.049958265718935 current=23.46351151786613
color yellow, pair_04
distance pair_05, 1GCN and resi 8 and name CA, 1GCN and resi 27 and name CA  # target=29.220124494474238 current=30.57699810620602
color yellow, pair_05
distance pair_06, 1GCN and resi 6 and name CA, 1GCN and resi 17 and name CA  # target=18.26353317142546 current=19.51799343476975
color yellow, pair_06
distance pair_07, 1GCN and resi 1 and name CA, 1GCN and resi 22 and name CA  # target=37.641211192078146 current=38.88429936421927
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
