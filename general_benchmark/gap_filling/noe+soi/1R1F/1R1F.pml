# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 3.599848457057322

load 1R1F.pdb, 1R1F
bg_color white
hide everything, 1R1F
show cartoon, 1R1F
color grey80, 1R1F
set cartoon_transparency, 0.1

select worst_residues, 1R1F and resi 3+4+5+17+18+19+21+23+26+34
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1R1F and resi 3
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1R1F and resi 4 and name CA, 1R1F and resi 16 and name CA  # target=6.783968496705101 current=3.2226842387364973
color yellow, pair_00
distance pair_01, 1R1F and resi 1 and name CA, 1R1F and resi 31 and name CA  # target=3.6635224040666117 current=6.938609732257821
color yellow, pair_01
distance pair_02, 1R1F and resi 1 and name CA, 1R1F and resi 35 and name CA  # target=14.112109393450012 current=11.090548696119054
color yellow, pair_02
distance pair_03, 1R1F and resi 20 and name CA, 1R1F and resi 33 and name CA  # target=5.533144452470395 current=8.387583694336184
color yellow, pair_03
distance pair_04, 1R1F and resi 5 and name CA, 1R1F and resi 30 and name CA  # target=6.154433278656084 current=3.4621335002309834
color yellow, pair_04
distance pair_05, 1R1F and resi 2 and name CA, 1R1F and resi 15 and name CA  # target=5.046630120761363 current=7.704175815202236
color yellow, pair_05
distance pair_06, 1R1F and resi 21 and name CA, 1R1F and resi 32 and name CA  # target=5.212492862963047 current=7.6085971330761195
color yellow, pair_06
distance pair_07, 1R1F and resi 7 and name CA, 1R1F and resi 28 and name CA  # target=4.893392851656878 current=7.053131083704618
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
