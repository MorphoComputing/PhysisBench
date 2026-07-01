# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 3.6301090465508503

load 2YXF.pdb, 2YXF
bg_color white
hide everything, 2YXF
show cartoon, 2YXF
color grey80, 2YXF
set cartoon_transparency, 0.1

select worst_residues, 2YXF and resi 1+14+15+16+17+18+51+53+59+97
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 2YXF and resi 256
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 2YXF and resi 1 and name CA, 2YXF and resi 31 and name CA  # target=24.78187871958683 current=14.029884300356576
color yellow, pair_00
distance pair_01, 2YXF and resi 1 and name CA, 2YXF and resi 60 and name CA  # target=20.66850297659099 current=10.007604115118445
color yellow, pair_01
distance pair_02, 2YXF and resi 1 and name CA, 2YXF and resi 59 and name CA  # target=18.606921153606503 current=8.389367423154011
color yellow, pair_02
distance pair_03, 2YXF and resi 1 and name CA, 2YXF and resi 29 and name CA  # target=18.848846788904925 current=8.663199648953466
color yellow, pair_03
distance pair_04, 2YXF and resi 1 and name CA, 2YXF and resi 30 and name CA  # target=22.061664740806194 current=11.896391012641793
color yellow, pair_04
distance pair_05, 2YXF and resi 1 and name CA, 2YXF and resi 32 and name CA  # target=26.694746425732163 current=17.05623068077099
color yellow, pair_05
distance pair_06, 2YXF and resi 58 and name CA, 2YXF and resi 75 and name CA  # target=27.499694136871643 current=37.080979938929865
color yellow, pair_06
distance pair_07, 2YXF and resi 1 and name CA, 2YXF and resi 86 and name CA  # target=27.330728857294655 current=17.853706148030067
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
