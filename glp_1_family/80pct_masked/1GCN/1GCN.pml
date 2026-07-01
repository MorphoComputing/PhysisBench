# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.6634117979457153

load 1GCN.pdb, 1GCN
bg_color white
hide everything, 1GCN
show cartoon, 1GCN
color grey80, 1GCN
set cartoon_transparency, 0.1

select worst_residues, 1GCN and resi 1+6+7+8+11+15+16+19+23+24
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1GCN and resi 2 and name CA, 1GCN and resi 21 and name CA  # target=32.7008976228241 current=33.58348653195895
color yellow, pair_00
distance pair_01, 1GCN and resi 1 and name CA, 1GCN and resi 22 and name CA  # target=37.641211192078146 current=38.27047543242909
color yellow, pair_01
distance pair_02, 1GCN and resi 4 and name CA, 1GCN and resi 18 and name CA  # target=23.113227349427785 current=23.650467223545075
color yellow, pair_02
distance pair_03, 1GCN and resi 1 and name CA, 1GCN and resi 21 and name CA  # target=37.37993419335209 current=36.902865271037605
color yellow, pair_03
distance pair_04, 1GCN and resi 2 and name CA, 1GCN and resi 20 and name CA  # target=32.37492050513676 current=31.925947723096286
color yellow, pair_04
distance pair_05, 1GCN and resi 1 and name CA, 1GCN and resi 17 and name CA  # target=31.681349449037523 current=31.240278224973157
color yellow, pair_05
distance pair_06, 1GCN and resi 7 and name CA, 1GCN and resi 23 and name CA  # target=26.723134359810352 current=26.333151255442193
color yellow, pair_06
distance pair_07, 1GCN and resi 11 and name CA, 1GCN and resi 26 and name CA  # target=23.162688087647325 current=23.544939192368897
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
