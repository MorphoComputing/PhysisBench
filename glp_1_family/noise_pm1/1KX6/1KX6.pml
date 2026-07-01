# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.8591946517271051

load 1KX6.pdb, 1KX6
bg_color white
hide everything, 1KX6
show cartoon, 1KX6
color grey80, 1KX6
set cartoon_transparency, 0.1

select worst_residues, 1KX6 and resi 1+2+4+5+16+17+19+22+25+27
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1KX6 and resi 8+19
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1KX6 and resi 17 and name CA, 1KX6 and resi 25 and name CA  # target=9.422544673613604 current=12.0934943690637
color yellow, pair_00
distance pair_01, 1KX6 and resi 12 and name CA, 1KX6 and resi 21 and name CA  # target=18.65147852477429 current=21.31895568362257
color yellow, pair_01
distance pair_02, 1KX6 and resi 7 and name CA, 1KX6 and resi 21 and name CA  # target=29.94061108305494 current=27.4886768234667
color yellow, pair_02
distance pair_03, 1KX6 and resi 2 and name CA, 1KX6 and resi 23 and name CA  # target=35.953319945327465 current=33.75811165366972
color yellow, pair_03
distance pair_04, 1KX6 and resi 11 and name CA, 1KX6 and resi 24 and name CA  # target=25.631404108799206 current=27.790927421256033
color yellow, pair_04
distance pair_05, 1KX6 and resi 5 and name CA, 1KX6 and resi 17 and name CA  # target=21.69006112758478 current=23.800660030617465
color yellow, pair_05
distance pair_06, 1KX6 and resi 8 and name CA, 1KX6 and resi 23 and name CA  # target=28.475319306855244 current=30.482514274771404
color yellow, pair_06
distance pair_07, 1KX6 and resi 11 and name CA, 1KX6 and resi 27 and name CA  # target=31.56872883190799 current=29.573196355893984
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
