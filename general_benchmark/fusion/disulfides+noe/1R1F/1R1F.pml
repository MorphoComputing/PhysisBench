# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 6.073569279032962

load 1R1F.pdb, 1R1F
bg_color white
hide everything, 1R1F
show cartoon, 1R1F
color grey80, 1R1F
set cartoon_transparency, 0.1

select worst_residues, 1R1F and resi 1+2+3+8+14+18+25+26+27+28
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1R1F and resi 4 and name CA, 1R1F and resi 30 and name CA  # target=5.448470360024639 current=10.449913061599513
color yellow, pair_00
distance pair_01, 1R1F and resi 1 and name CA, 1R1F and resi 31 and name CA  # target=3.6635224040666117 current=8.038029264036151
color yellow, pair_01
distance pair_02, 1R1F and resi 12 and name CA, 1R1F and resi 22 and name CA  # target=5.410340450052048 current=9.250634365135458
color yellow, pair_02
distance pair_03, 1R1F and resi 9 and name CA, 1R1F and resi 27 and name CA  # target=5.790717228239924 current=9.520468941179875
color yellow, pair_03
distance pair_04, 1R1F and resi 2 and name CA, 1R1F and resi 32 and name CA  # target=5.212492862963047 current=8.810766443875623
color yellow, pair_04
distance pair_05, 1R1F and resi 10 and name CA, 1R1F and resi 24 and name CA  # target=4.893392851656878 current=8.412664281720135
color yellow, pair_05
distance pair_06, 1R1F and resi 2 and name CA, 1R1F and resi 31 and name CA  # target=4.682015823900446 current=8.12756492966252
color yellow, pair_06
distance pair_07, 1R1F and resi 7 and name CA, 1R1F and resi 28 and name CA  # target=4.893392851656878 current=8.154541104878144
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
