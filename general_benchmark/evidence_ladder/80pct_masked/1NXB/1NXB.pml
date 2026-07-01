# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 5.890076846974677

load 1NXB.pdb, 1NXB
bg_color white
hide everything, 1NXB
show cartoon, 1NXB
color grey80, 1NXB
set cartoon_transparency, 0.1

select worst_residues, 1NXB and resi 1+15+18+19+28+44+45+46+47+49
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1NXB and resi 14+19+28+38+51+60
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1NXB and resi 10 and name CA, 1NXB and resi 19 and name CA  # target=27.09749278889218 current=16.613650813100005
color yellow, pair_00
distance pair_01, 1NXB and resi 47 and name CA, 1NXB and resi 58 and name CA  # target=26.28371845350797 current=16.025259839857718
color yellow, pair_01
distance pair_02, 1NXB and resi 47 and name CA, 1NXB and resi 60 and name CA  # target=20.38287475528339 current=10.172803532974948
color yellow, pair_02
distance pair_03, 1NXB and resi 31 and name CA, 1NXB and resi 48 and name CA  # target=13.541437779235741 current=23.670241617350868
color yellow, pair_03
distance pair_04, 1NXB and resi 46 and name CA, 1NXB and resi 57 and name CA  # target=23.429207076806318 current=13.600398604660407
color yellow, pair_04
distance pair_05, 1NXB and resi 9 and name CA, 1NXB and resi 19 and name CA  # target=27.34113524744972 current=17.515872412182514
color yellow, pair_05
distance pair_06, 1NXB and resi 18 and name CA, 1NXB and resi 36 and name CA  # target=23.81331704999812 current=14.056690872135249
color yellow, pair_06
distance pair_07, 1NXB and resi 1 and name CA, 1NXB and resi 36 and name CA  # target=17.687220699321983 current=7.965936024335933
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
