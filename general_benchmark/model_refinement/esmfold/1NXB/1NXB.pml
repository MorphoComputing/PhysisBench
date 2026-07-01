# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.6061929951499256

load 1NXB.pdb, 1NXB
bg_color white
hide everything, 1NXB
show cartoon, 1NXB
color grey80, 1NXB
set cartoon_transparency, 0.1

select worst_residues, 1NXB and resi 6+7+8+9+10+11+12+19+45+46
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1NXB and resi 18 and name CA, 1NXB and resi 31 and name CA  # target=27.496519597183607 current=34.90792001733592
color yellow, pair_00
distance pair_01, 1NXB and resi 19 and name CA, 1NXB and resi 31 and name CA  # target=27.492070456505203 current=34.40264263859228
color yellow, pair_01
distance pair_02, 1NXB and resi 18 and name CA, 1NXB and resi 32 and name CA  # target=27.49093898001494 current=33.66931437460457
color yellow, pair_02
distance pair_03, 1NXB and resi 19 and name CA, 1NXB and resi 32 and name CA  # target=27.483550804273964 current=33.4899502183203
color yellow, pair_03
distance pair_04, 1NXB and resi 18 and name CA, 1NXB and resi 33 and name CA  # target=27.48187545051345 current=33.029251471922215
color yellow, pair_04
distance pair_05, 1NXB and resi 19 and name CA, 1NXB and resi 33 and name CA  # target=27.463306390392017 current=32.68077691234192
color yellow, pair_05
distance pair_06, 1NXB and resi 31 and name CA, 1NXB and resi 56 and name CA  # target=27.46040578359074 current=32.307863069531635
color yellow, pair_06
distance pair_07, 1NXB and resi 21 and name CA, 1NXB and resi 31 and name CA  # target=27.466622109626265 current=32.2114729703631
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
