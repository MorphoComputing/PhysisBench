# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.0557060327938688

load 1KX6.pdb, 1KX6
bg_color white
hide everything, 1KX6
show cartoon, 1KX6
color grey80, 1KX6
set cartoon_transparency, 0.1

select worst_residues, 1KX6 and resi 6+17+18+19+20+22+24+25+26+27
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1KX6 and resi 10 and name CA, 1KX6 and resi 26 and name CA  # target=32.34907764250979 current=31.502740409242353
color yellow, pair_00
distance pair_01, 1KX6 and resi 9 and name CA, 1KX6 and resi 25 and name CA  # target=28.909415561342165 current=29.70960665106438
color yellow, pair_01
distance pair_02, 1KX6 and resi 4 and name CA, 1KX6 and resi 21 and name CA  # target=32.12784320094211 current=31.330518158891973
color yellow, pair_02
distance pair_03, 1KX6 and resi 10 and name CA, 1KX6 and resi 23 and name CA  # target=28.74596469048283 current=29.522720521611962
color yellow, pair_03
distance pair_04, 1KX6 and resi 12 and name CA, 1KX6 and resi 27 and name CA  # target=28.02795172322401 current=28.80055632493547
color yellow, pair_04
distance pair_05, 1KX6 and resi 8 and name CA, 1KX6 and resi 23 and name CA  # target=31.75224579127503 current=31.034283494185967
color yellow, pair_05
distance pair_06, 1KX6 and resi 11 and name CA, 1KX6 and resi 26 and name CA  # target=27.89532099905979 current=28.55834369127076
color yellow, pair_06
distance pair_07, 1KX6 and resi 2 and name CA, 1KX6 and resi 25 and name CA  # target=34.157824440732114 current=34.80751190214001
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
