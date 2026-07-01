# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.16292403287470558

load 1L2Y.pdb, 1L2Y
bg_color white
hide everything, 1L2Y
show cartoon, 1L2Y
color grey80, 1L2Y
set cartoon_transparency, 0.1

select worst_residues, 1L2Y and resi 1+2+3+6+7+13+14+16+17+18
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1L2Y and resi 6 and name CA, 1L2Y and resi 17 and name CA  # target=8.535169749112098 current=8.648447578193748
color yellow, pair_00
distance pair_01, 1L2Y and resi 7 and name CA, 1L2Y and resi 16 and name CA  # target=13.242634762995467 current=13.16832461806931
color yellow, pair_01
distance pair_02, 1L2Y and resi 7 and name CA, 1L2Y and resi 17 and name CA  # target=11.837227849612786 current=11.763408653179944
color yellow, pair_02
distance pair_03, 1L2Y and resi 4 and name CA, 1L2Y and resi 16 and name CA  # target=12.105356942292602 current=12.037770263249719
color yellow, pair_03
distance pair_04, 1L2Y and resi 8 and name CA, 1L2Y and resi 18 and name CA  # target=12.675123246295298 current=12.61534882177818
color yellow, pair_04
distance pair_05, 1L2Y and resi 9 and name CA, 1L2Y and resi 18 and name CA  # target=13.332649990317371 current=13.2738448326798
color yellow, pair_05
distance pair_06, 1L2Y and resi 6 and name CA, 1L2Y and resi 15 and name CA  # target=10.24599878144874 current=10.303160584845156
color yellow, pair_06
distance pair_07, 1L2Y and resi 2 and name CA, 1L2Y and resi 14 and name CA  # target=14.665906042092663 current=14.721914066952893
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
