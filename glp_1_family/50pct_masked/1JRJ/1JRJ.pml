# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.9178928197368962

load 1JRJ.pdb, 1JRJ
bg_color white
hide everything, 1JRJ
show cartoon, 1JRJ
color grey80, 1JRJ
set cartoon_transparency, 0.1

select worst_residues, 1JRJ and resi 1+2+8+9+13+17+18+30+36+37
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1JRJ and resi 8 and name CA, 1JRJ and resi 28 and name CA  # target=32.086990987285304 current=30.871614170648826
color yellow, pair_00
distance pair_01, 1JRJ and resi 7 and name CA, 1JRJ and resi 29 and name CA  # target=32.11403726835599 current=30.904438559802784
color yellow, pair_01
distance pair_02, 1JRJ and resi 1 and name CA, 1JRJ and resi 33 and name CA  # target=47.84640455313395 current=48.92966466659009
color yellow, pair_02
distance pair_03, 1JRJ and resi 1 and name CA, 1JRJ and resi 36 and name CA  # target=41.51777113472294 current=40.47484376013517
color yellow, pair_03
distance pair_04, 1JRJ and resi 3 and name CA, 1JRJ and resi 27 and name CA  # target=37.78392890343307 current=38.81882730209213
color yellow, pair_04
distance pair_05, 1JRJ and resi 8 and name CA, 1JRJ and resi 31 and name CA  # target=33.19640082380945 current=34.21836137320787
color yellow, pair_05
distance pair_06, 1JRJ and resi 3 and name CA, 1JRJ and resi 28 and name CA  # target=41.778828994620724 current=40.76026729719026
color yellow, pair_06
distance pair_07, 1JRJ and resi 8 and name CA, 1JRJ and resi 30 and name CA  # target=32.09400327358908 current=31.08793405011546
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
