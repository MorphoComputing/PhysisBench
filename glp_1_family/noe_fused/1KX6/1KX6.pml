# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.2095310404173993

load 1KX6.pdb, 1KX6
bg_color white
hide everything, 1KX6
show cartoon, 1KX6
color grey80, 1KX6
set cartoon_transparency, 0.1

select worst_residues, 1KX6 and resi 1+6+7+8+9+10+11+16+18+20
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1KX6 and resi 12 and name CA, 1KX6 and resi 27 and name CA  # target=28.02795172322401 current=28.92652148651585
color yellow, pair_00
distance pair_01, 1KX6 and resi 10 and name CA, 1KX6 and resi 23 and name CA  # target=28.74596469048283 current=29.550975952219943
color yellow, pair_01
distance pair_02, 1KX6 and resi 7 and name CA, 1KX6 and resi 17 and name CA  # target=19.858095357343238 current=20.554802093473942
color yellow, pair_02
distance pair_03, 1KX6 and resi 5 and name CA, 1KX6 and resi 25 and name CA  # target=36.1845836897062 current=35.55454137416634
color yellow, pair_03
distance pair_04, 1KX6 and resi 2 and name CA, 1KX6 and resi 15 and name CA  # target=18.638057763193075 current=19.263310873390854
color yellow, pair_04
distance pair_05, 1KX6 and resi 2 and name CA, 1KX6 and resi 27 and name CA  # target=37.4146452643076 current=36.83601318723798
color yellow, pair_05
distance pair_06, 1KX6 and resi 9 and name CA, 1KX6 and resi 17 and name CA  # target=18.219611658974088 current=17.69753756130562
color yellow, pair_06
distance pair_07, 1KX6 and resi 10 and name CA, 1KX6 and resi 26 and name CA  # target=32.34907764250979 current=31.828275005444063
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
