# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.8904559301876456

load 1CSP.pdb, 1CSP
bg_color white
hide everything, 1CSP
show cartoon, 1CSP
color grey80, 1CSP
set cartoon_transparency, 0.1

select worst_residues, 1CSP and resi 10+11+12+13+21+37+53+54+55+56
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1CSP and resi 21 and name CA, 1CSP and resi 36 and name CA  # target=27.439787404551062 current=30.856026895850245
color yellow, pair_00
distance pair_01, 1CSP and resi 21 and name CA, 1CSP and resi 35 and name CA  # target=27.381902274027475 current=29.967342844303275
color yellow, pair_01
distance pair_02, 1CSP and resi 21 and name CA, 1CSP and resi 37 and name CA  # target=27.292291864357832 current=29.332350448499174
color yellow, pair_02
distance pair_03, 1CSP and resi 22 and name CA, 1CSP and resi 36 and name CA  # target=27.29720884250637 current=29.243778635757867
color yellow, pair_03
distance pair_04, 1CSP and resi 11 and name CA, 1CSP and resi 21 and name CA  # target=27.110924283382314 current=28.449518189876706
color yellow, pair_04
distance pair_05, 1CSP and resi 22 and name CA, 1CSP and resi 35 and name CA  # target=27.13300492109081 current=28.441017679488333
color yellow, pair_05
distance pair_06, 1CSP and resi 23 and name CA, 1CSP and resi 36 and name CA  # target=27.08866870854849 current=28.299751085545154
color yellow, pair_06
distance pair_07, 1CSP and resi 20 and name CA, 1CSP and resi 36 and name CA  # target=27.111604535450383 current=28.31843106049517
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
