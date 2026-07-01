# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 5.595823053317114

load 1R1F.pdb, 1R1F
bg_color white
hide everything, 1R1F
show cartoon, 1R1F
color grey80, 1R1F
set cartoon_transparency, 0.1

select worst_residues, 1R1F and resi 8+9+10+17+18+25+26+28+34+35
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1R1F and resi 23 and name CA, 1R1F and resi 31 and name CA  # target=6.127754142881542 current=9.439497506809673
color yellow, pair_00
distance pair_01, 1R1F and resi 1 and name CA, 1R1F and resi 31 and name CA  # target=3.6635224040666117 current=6.627451306576818
color yellow, pair_01
distance pair_02, 1R1F and resi 21 and name CA, 1R1F and resi 32 and name CA  # target=5.212492862963047 current=7.850828009649626
color yellow, pair_02
distance pair_03, 1R1F and resi 10 and name CA, 1R1F and resi 24 and name CA  # target=4.893392851656878 current=7.202161702152147
color yellow, pair_03
distance pair_04, 1R1F and resi 21 and name CA, 1R1F and resi 31 and name CA  # target=4.028908588844348 current=6.2998556673321575
color yellow, pair_04
distance pair_05, 1R1F and resi 7 and name CA, 1R1F and resi 28 and name CA  # target=4.893392851656878 current=7.156142331162328
color yellow, pair_05
distance pair_06, 1R1F and resi 5 and name CA, 1R1F and resi 29 and name CA  # target=4.181595931531856 current=6.2271421538282485
color yellow, pair_06
distance pair_07, 1R1F and resi 18 and name CA, 1R1F and resi 33 and name CA  # target=5.790717228239924 current=7.492368506067805
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
