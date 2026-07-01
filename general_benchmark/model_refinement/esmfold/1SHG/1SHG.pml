# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.30143570190439634

load 1SHG.pdb, 1SHG
bg_color white
hide everything, 1SHG
show cartoon, 1SHG
color grey80, 1SHG
set cartoon_transparency, 0.1

select worst_residues, 1SHG and resi 13+14+28+41+42+43+45+49+50+55
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1SHG and resi 3 and name CA, 1SHG and resi 54 and name CA  # target=5.051332105862291 current=4.3128937560532075
color yellow, pair_00
distance pair_01, 1SHG and resi 7 and name CA, 1SHG and resi 21 and name CA  # target=5.144143211347675 current=4.41037945630927
color yellow, pair_01
distance pair_02, 1SHG and resi 16 and name CA, 1SHG and resi 46 and name CA  # target=5.146901732084143 current=4.4163013414348455
color yellow, pair_02
distance pair_03, 1SHG and resi 37 and name CA, 1SHG and resi 46 and name CA  # target=5.1834213930034005 current=4.462037216513618
color yellow, pair_03
distance pair_04, 1SHG and resi 2 and name CA, 1SHG and resi 26 and name CA  # target=5.357982585791249 current=4.658865219998864
color yellow, pair_04
distance pair_05, 1SHG and resi 8 and name CA, 1SHG and resi 20 and name CA  # target=5.092596935756701 current=4.3951550598334155
color yellow, pair_05
distance pair_06, 1SHG and resi 15 and name CA, 1SHG and resi 55 and name CA  # target=22.836997104017087 current=23.53436625013352
color yellow, pair_06
distance pair_07, 1SHG and resi 10 and name CA, 1SHG and resi 18 and name CA  # target=5.183704162360457 current=4.5162021806557195
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
