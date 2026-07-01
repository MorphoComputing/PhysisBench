# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.6764015434061595

load 1UBQ.pdb, 1UBQ
bg_color white
hide everything, 1UBQ
show cartoon, 1UBQ
color grey80, 1UBQ
set cartoon_transparency, 0.1

select worst_residues, 1UBQ and resi 8+9+36+38+39+47+61+72+73+74
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1UBQ and resi 62 and name CA, 1UBQ and resi 74 and name CA  # target=27.49186209902813 current=34.84546029456229
color yellow, pair_00
distance pair_01, 1UBQ and resi 17 and name CA, 1UBQ and resi 74 and name CA  # target=27.484377274703302 current=33.80175987943275
color yellow, pair_01
distance pair_02, 1UBQ and resi 18 and name CA, 1UBQ and resi 74 and name CA  # target=27.484615797711122 current=33.77225234210434
color yellow, pair_02
distance pair_03, 1UBQ and resi 61 and name CA, 1UBQ and resi 74 and name CA  # target=27.48387227964096 current=33.69833898862882
color yellow, pair_03
distance pair_04, 1UBQ and resi 19 and name CA, 1UBQ and resi 74 and name CA  # target=27.4815835966556 current=33.55419343998461
color yellow, pair_04
distance pair_05, 1UBQ and resi 1 and name CA, 1UBQ and resi 74 and name CA  # target=27.47755917259891 current=33.30453978322055
color yellow, pair_05
distance pair_06, 1UBQ and resi 63 and name CA, 1UBQ and resi 74 and name CA  # target=27.475759204446675 current=33.1490788669776
color yellow, pair_06
distance pair_07, 1UBQ and resi 56 and name CA, 1UBQ and resi 74 and name CA  # target=27.471529599647017 current=32.66297782052429
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
