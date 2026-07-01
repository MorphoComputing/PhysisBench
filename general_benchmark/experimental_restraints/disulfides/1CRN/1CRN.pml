# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 6.276305508628923

load 1CRN.pdb, 1CRN
bg_color white
hide everything, 1CRN
show cartoon, 1CRN
color grey80, 1CRN
set cartoon_transparency, 0.1

select worst_residues, 1CRN and resi 18+19+20+21+23+28+35+41+42+43
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1CRN and resi 2 and name CA, 1CRN and resi 39 and name CA  # target=5.526827568351721 current=6.804910598424782
color yellow, pair_00
distance pair_01, 1CRN and resi 3 and name CA, 1CRN and resi 31 and name CA  # target=5.526827568351721 current=6.452968487717895
color yellow, pair_01
distance pair_02, 1CRN and resi 15 and name CA, 1CRN and resi 25 and name CA  # target=5.526827568351721 current=5.657255327222107
color yellow, pair_02

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
