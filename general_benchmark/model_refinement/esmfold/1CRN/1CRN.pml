# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 6.615799896071604

load 1CRN.pdb, 1CRN
bg_color white
hide everything, 1CRN
show cartoon, 1CRN
color grey80, 1CRN
set cartoon_transparency, 0.1

select worst_residues, 1CRN and resi 9+10+16+17+18+40+41+42+43+44
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1CRN and resi 5+16+30+58+88
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1CRN and resi 6 and name CA, 1CRN and resi 44 and name CA  # target=22.367340530919044 current=11.634518332247639
color yellow, pair_00
distance pair_01, 1CRN and resi 5 and name CA, 1CRN and resi 44 and name CA  # target=19.264061880923016 current=8.578630004272156
color yellow, pair_01
distance pair_02, 1CRN and resi 6 and name CA, 1CRN and resi 43 and name CA  # target=19.99938716774467 current=10.533702974554297
color yellow, pair_02
distance pair_03, 1CRN and resi 5 and name CA, 1CRN and resi 43 and name CA  # target=16.96393749539924 current=7.842784309935991
color yellow, pair_03
distance pair_04, 1CRN and resi 4 and name CA, 1CRN and resi 44 and name CA  # target=18.15956778477315 current=9.131224098496741
color yellow, pair_04
distance pair_05, 1CRN and resi 6 and name CA, 1CRN and resi 42 and name CA  # target=18.933195122249426 current=11.500965753679509
color yellow, pair_05
distance pair_06, 1CRN and resi 4 and name CA, 1CRN and resi 43 and name CA  # target=15.985990654821233 current=8.918505152067654
color yellow, pair_06
distance pair_07, 1CRN and resi 19 and name CA, 1CRN and resi 42 and name CA  # target=9.617321488085983 current=16.592226981486185
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
