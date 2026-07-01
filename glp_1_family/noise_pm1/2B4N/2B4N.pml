# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.4349279664575978

load 2B4N.pdb, 2B4N
bg_color white
hide everything, 2B4N
show cartoon, 2B4N
color grey80, 2B4N
set cartoon_transparency, 0.1

select worst_residues, 2B4N and resi 3+4+5+8+21+22+25+36+38+39
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 2B4N and resi 15+20+44+96
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 2B4N and resi 22 and name CA, 2B4N and resi 34 and name CA  # target=19.20509861118399 current=22.967167602651656
color yellow, pair_00
distance pair_01, 2B4N and resi 15 and name CA, 2B4N and resi 26 and name CA  # target=13.145546951753339 current=16.33428793942636
color yellow, pair_01
distance pair_02, 2B4N and resi 6 and name CA, 2B4N and resi 33 and name CA  # target=46.06048261279859 current=43.01715771986816
color yellow, pair_02
distance pair_03, 2B4N and resi 14 and name CA, 2B4N and resi 39 and name CA  # target=47.132078992354764 current=44.27022855327788
color yellow, pair_03
distance pair_04, 2B4N and resi 1 and name CA, 2B4N and resi 31 and name CA  # target=42.65034716759114 current=39.875184996806766
color yellow, pair_04
distance pair_05, 2B4N and resi 12 and name CA, 2B4N and resi 34 and name CA  # target=37.97844436148892 current=35.31301284147451
color yellow, pair_05
distance pair_06, 2B4N and resi 7 and name CA, 2B4N and resi 25 and name CA  # target=25.483734442937255 current=28.147360302860143
color yellow, pair_06
distance pair_07, 2B4N and resi 11 and name CA, 2B4N and resi 28 and name CA  # target=28.007749173446694 current=25.42998819536077
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
