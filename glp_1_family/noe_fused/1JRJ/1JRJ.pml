# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.0962471934754583

load 1JRJ.pdb, 1JRJ
bg_color white
hide everything, 1JRJ
show cartoon, 1JRJ
color grey80, 1JRJ
set cartoon_transparency, 0.1

select worst_residues, 1JRJ and resi 5+6+10+11+26+28+31+32+33+35
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1JRJ and resi 5+24
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1JRJ and resi 24 and name CA, 1JRJ and resi 34 and name CA  # target=6.104707419859145 current=8.33087448768543
color yellow, pair_00
distance pair_01, 1JRJ and resi 3 and name CA, 1JRJ and resi 21 and name CA  # target=30.713830698282983 current=29.926829964832987
color yellow, pair_01
distance pair_02, 1JRJ and resi 3 and name CA, 1JRJ and resi 24 and name CA  # target=33.340365350180704 current=34.11511732741283
color yellow, pair_02
distance pair_03, 1JRJ and resi 3 and name CA, 1JRJ and resi 18 and name CA  # target=26.259179010870653 current=25.48696146058199
color yellow, pair_03
distance pair_04, 1JRJ and resi 6 and name CA, 1JRJ and resi 26 and name CA  # target=31.375581331472425 current=30.65005870005105
color yellow, pair_04
distance pair_05, 1JRJ and resi 1 and name CA, 1JRJ and resi 23 and name CA  # target=38.01831945482743 current=38.717985851162446
color yellow, pair_05
distance pair_06, 1JRJ and resi 2 and name CA, 1JRJ and resi 32 and name CA  # target=47.03219414988295 current=46.36899219288286
color yellow, pair_06
distance pair_07, 1JRJ and resi 6 and name CA, 1JRJ and resi 21 and name CA  # target=22.843352313817526 current=23.501955248554268
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
