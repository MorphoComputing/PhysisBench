# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.326003615683588

load 1JRJ.pdb, 1JRJ
bg_color white
hide everything, 1JRJ
show cartoon, 1JRJ
color grey80, 1JRJ
set cartoon_transparency, 0.1

select worst_residues, 1JRJ and resi 1+2+9+10+18+19+26+27+28+33
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1JRJ and resi 17+18+33
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1JRJ and resi 18 and name CA, 1JRJ and resi 32 and name CA  # target=20.164423276354 current=17.30607474416597
color yellow, pair_00
distance pair_01, 1JRJ and resi 15 and name CA, 1JRJ and resi 25 and name CA  # target=18.07590894837798 current=15.259072529895956
color yellow, pair_01
distance pair_02, 1JRJ and resi 11 and name CA, 1JRJ and resi 33 and name CA  # target=26.33354150769781 current=29.149095130363474
color yellow, pair_02
distance pair_03, 1JRJ and resi 7 and name CA, 1JRJ and resi 37 and name CA  # target=20.850032649744485 current=23.62197721721142
color yellow, pair_03
distance pair_04, 1JRJ and resi 16 and name CA, 1JRJ and resi 29 and name CA  # target=14.12737422750188 current=16.795979718243643
color yellow, pair_04
distance pair_05, 1JRJ and resi 3 and name CA, 1JRJ and resi 13 and name CA  # target=19.98971074043517 current=17.353151393086875
color yellow, pair_05
distance pair_06, 1JRJ and resi 2 and name CA, 1JRJ and resi 18 and name CA  # target=31.815083738082773 current=29.320156863364517
color yellow, pair_06
distance pair_07, 1JRJ and resi 7 and name CA, 1JRJ and resi 30 and name CA  # target=35.2566500154525 current=32.79602639091708
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
