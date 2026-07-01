# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.3180653144257755

load 1JRJ.pdb, 1JRJ
bg_color white
hide everything, 1JRJ
show cartoon, 1JRJ
color grey80, 1JRJ
set cartoon_transparency, 0.1

select worst_residues, 1JRJ and resi 10+11+15+16+24+25+26+27+31+37
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1JRJ and resi 33+2264
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1JRJ and resi 18 and name CA, 1JRJ and resi 32 and name CA  # target=24.697251602404354 current=16.37533163378545
color yellow, pair_00
distance pair_01, 1JRJ and resi 11 and name CA, 1JRJ and resi 33 and name CA  # target=20.34138842209323 current=28.54702671976658
color yellow, pair_01
distance pair_02, 1JRJ and resi 7 and name CA, 1JRJ and resi 30 and name CA  # target=39.675356002010815 current=32.34157575949384
color yellow, pair_02
distance pair_03, 1JRJ and resi 16 and name CA, 1JRJ and resi 29 and name CA  # target=8.926589191595193 current=16.012800276361354
color yellow, pair_03
distance pair_04, 1JRJ and resi 15 and name CA, 1JRJ and resi 25 and name CA  # target=21.994526120810633 current=14.910972671593074
color yellow, pair_04
distance pair_05, 1JRJ and resi 15 and name CA, 1JRJ and resi 36 and name CA  # target=21.505213190567225 current=14.718664579159126
color yellow, pair_05
distance pair_06, 1JRJ and resi 11 and name CA, 1JRJ and resi 23 and name CA  # target=24.84531532107703 current=18.107979623734867
color yellow, pair_06
distance pair_07, 1JRJ and resi 3 and name CA, 1JRJ and resi 13 and name CA  # target=24.586196636093714 current=17.95282375525204
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
