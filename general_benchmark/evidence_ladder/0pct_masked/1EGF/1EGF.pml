# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.06450918419414549

load 1EGF.pdb, 1EGF
bg_color white
hide everything, 1EGF
show cartoon, 1EGF
color grey80, 1EGF
set cartoon_transparency, 0.1

select worst_residues, 1EGF and resi 7+9+23+35+40+44+45+47+48+51
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1EGF and resi 8 and name CA, 1EGF and resi 51 and name CA  # target=27.499850325904895 current=31.195367334488072
color yellow, pair_00
distance pair_01, 1EGF and resi 7 and name CA, 1EGF and resi 51 and name CA  # target=27.499334048871805 current=30.333241599654396
color yellow, pair_01
distance pair_02, 1EGF and resi 8 and name CA, 1EGF and resi 48 and name CA  # target=27.499263064639706 current=30.328172383070275
color yellow, pair_02
distance pair_03, 1EGF and resi 7 and name CA, 1EGF and resi 48 and name CA  # target=27.497611262110393 current=29.643665295488802
color yellow, pair_03
distance pair_04, 1EGF and resi 8 and name CA, 1EGF and resi 47 and name CA  # target=27.49691522752473 current=29.549564243442816
color yellow, pair_04
distance pair_05, 1EGF and resi 7 and name CA, 1EGF and resi 47 and name CA  # target=27.4941035660028 current=29.172592895679227
color yellow, pair_05
distance pair_06, 1EGF and resi 10 and name CA, 1EGF and resi 51 and name CA  # target=27.490101855004202 current=28.850851151374307
color yellow, pair_06
distance pair_07, 1EGF and resi 9 and name CA, 1EGF and resi 51 and name CA  # target=27.489564208558058 current=28.828775683891283
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
