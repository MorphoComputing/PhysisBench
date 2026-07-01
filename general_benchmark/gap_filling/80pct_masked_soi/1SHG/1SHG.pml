# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.5469174012208132

load 1SHG.pdb, 1SHG
bg_color white
hide everything, 1SHG
show cartoon, 1SHG
color grey80, 1SHG
set cartoon_transparency, 0.1

select worst_residues, 1SHG and resi 1+11+13+15+18+23+32+45+48+49
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1SHG and resi 13 and name CA, 1SHG and resi 55 and name CA  # target=27.500000000000004 current=26.332289540920918
color yellow, pair_00
distance pair_01, 1SHG and resi 1 and name CA, 1SHG and resi 13 and name CA  # target=23.520929597626782 current=24.515774683040224
color yellow, pair_01
distance pair_02, 1SHG and resi 32 and name CA, 1SHG and resi 40 and name CA  # target=18.291140884391485 current=19.10870396023484
color yellow, pair_02
distance pair_03, 1SHG and resi 16 and name CA, 1SHG and resi 34 and name CA  # target=12.623238957826842 current=13.337603501343134
color yellow, pair_03
distance pair_04, 1SHG and resi 31 and name CA, 1SHG and resi 47 and name CA  # target=12.818676433275641 current=13.481747446150308
color yellow, pair_04
distance pair_05, 1SHG and resi 13 and name CA, 1SHG and resi 43 and name CA  # target=13.948879334983094 current=13.287669211538432
color yellow, pair_05
distance pair_06, 1SHG and resi 8 and name CA, 1SHG and resi 18 and name CA  # target=7.754343416582196 current=8.384010831217575
color yellow, pair_06
distance pair_07, 1SHG and resi 8 and name CA, 1SHG and resi 27 and name CA  # target=16.604873426119845 current=17.225469225800552
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
