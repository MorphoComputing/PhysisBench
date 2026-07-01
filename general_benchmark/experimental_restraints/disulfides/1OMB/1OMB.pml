# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 5.961083058955442

load 1OMB.pdb, 1OMB
bg_color white
hide everything, 1OMB
show cartoon, 1OMB
color grey80, 1OMB
set cartoon_transparency, 0.1

select worst_residues, 1OMB and resi 1+9+10+11+17+18+20+28+29+33
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1OMB and resi 15 and name CA, 1OMB and resi 32 and name CA  # target=5.526827568351721 current=5.822272067966491
color yellow, pair_00
distance pair_01, 1OMB and resi 8 and name CA, 1OMB and resi 21 and name CA  # target=5.526827568351721 current=5.459823389569145
color yellow, pair_01

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
