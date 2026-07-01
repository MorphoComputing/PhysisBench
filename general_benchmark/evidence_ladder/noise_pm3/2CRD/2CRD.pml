# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.133161494680009

load 2CRD.pdb, 2CRD
bg_color white
hide everything, 2CRD
show cartoon, 2CRD
color grey80, 2CRD
set cartoon_transparency, 0.1

select worst_residues, 2CRD and resi 1+6+11+17+19+20+24+25+30+32
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 2CRD and resi 34+209
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 2CRD and resi 11 and name CA, 2CRD and resi 25 and name CA  # target=10.7340521231834 current=3.7999998278592426
color yellow, pair_00
distance pair_01, 2CRD and resi 13 and name CA, 2CRD and resi 32 and name CA  # target=15.775538634320977 current=9.015334288498511
color yellow, pair_01
distance pair_02, 2CRD and resi 17 and name CA, 2CRD and resi 32 and name CA  # target=15.679743591757408 current=8.937480778954427
color yellow, pair_02
distance pair_03, 2CRD and resi 11 and name CA, 2CRD and resi 30 and name CA  # target=15.339375283771306 current=8.775217375052993
color yellow, pair_03
distance pair_04, 2CRD and resi 5 and name CA, 2CRD and resi 34 and name CA  # target=9.480708983192992 current=15.942398823094756
color yellow, pair_04
distance pair_05, 2CRD and resi 17 and name CA, 2CRD and resi 30 and name CA  # target=19.150163369718932 current=12.795023015487455
color yellow, pair_05
distance pair_06, 2CRD and resi 8 and name CA, 2CRD and resi 18 and name CA  # target=11.231877042622092 current=17.312733097538366
color yellow, pair_06
distance pair_07, 2CRD and resi 8 and name CA, 2CRD and resi 33 and name CA  # target=6.159817545729821 current=12.069128336984765
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
