# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.6069531571993877

load 1SHG.pdb, 1SHG
bg_color white
hide everything, 1SHG
show cartoon, 1SHG
color grey80, 1SHG
set cartoon_transparency, 0.1

select worst_residues, 1SHG and resi 23+24+25+31+40+41+42+43+54+55
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1SHG and resi 4 and name CA, 1SHG and resi 52 and name CA  # target=6.689857098340432 current=5.509668743322706
color yellow, pair_00
distance pair_01, 1SHG and resi 17 and name CA, 1SHG and resi 45 and name CA  # target=6.469334928123622 current=5.328351306656659
color yellow, pair_01
distance pair_02, 1SHG and resi 35 and name CA, 1SHG and resi 47 and name CA  # target=6.783912156469457 current=5.661054800080788
color yellow, pair_02
distance pair_03, 1SHG and resi 9 and name CA, 1SHG and resi 19 and name CA  # target=6.4309340081914455 current=5.315924525460325
color yellow, pair_03
distance pair_04, 1SHG and resi 6 and name CA, 1SHG and resi 52 and name CA  # target=6.757433434704978 current=5.652686555550353
color yellow, pair_04
distance pair_05, 1SHG and resi 36 and name CA, 1SHG and resi 47 and name CA  # target=6.806754731998767 current=5.723139568850167
color yellow, pair_05
distance pair_06, 1SHG and resi 3 and name CA, 1SHG and resi 52 and name CA  # target=7.105633077935898 current=6.056188496002699
color yellow, pair_06
distance pair_07, 1SHG and resi 8 and name CA, 1SHG and resi 19 and name CA  # target=6.570861806573619 current=5.589596251298694
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
