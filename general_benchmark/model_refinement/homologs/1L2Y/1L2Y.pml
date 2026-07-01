# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.6407133678662067

load 1L2Y.pdb, 1L2Y
bg_color white
hide everything, 1L2Y
show cartoon, 1L2Y
color grey80, 1L2Y
set cartoon_transparency, 0.1

select worst_residues, 1L2Y and resi 1+2+3+4+11+12+14+15+16+18
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1L2Y and resi 4 and name CA, 1L2Y and resi 15 and name CA  # target=10.670975198075721 current=11.131008420287722
color yellow, pair_00
distance pair_01, 1L2Y and resi 4 and name CA, 1L2Y and resi 14 and name CA  # target=12.926481398656806 current=13.28624030471937
color yellow, pair_01
distance pair_02, 1L2Y and resi 4 and name CA, 1L2Y and resi 13 and name CA  # target=10.972284009691789 current=11.310846944650741
color yellow, pair_02
distance pair_03, 1L2Y and resi 6 and name CA, 1L2Y and resi 14 and name CA  # target=11.115045291985169 current=11.39402713493677
color yellow, pair_03
distance pair_04, 1L2Y and resi 2 and name CA, 1L2Y and resi 15 and name CA  # target=10.751024952430662 current=11.027136411575034
color yellow, pair_04
distance pair_05, 1L2Y and resi 2 and name CA, 1L2Y and resi 14 and name CA  # target=13.228070055411568 current=13.486721554049591
color yellow, pair_05
distance pair_06, 1L2Y and resi 5 and name CA, 1L2Y and resi 18 and name CA  # target=8.055668504915754 current=7.810362386031111
color yellow, pair_06
distance pair_07, 1L2Y and resi 2 and name CA, 1L2Y and resi 10 and name CA  # target=8.679274918891036 current=8.919566953699922
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
